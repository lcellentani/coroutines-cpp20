#include <atomic>
#include <cassert>
#include <chrono>
#include <coroutine>
#include <exception>
#include <functional>
#include <initializer_list>
#include <iostream>
#include <latch>
#include <memory>
#include <mutex>
#include <queue>
#include <stop_token>
#include <string>
#include <thread>
#include <unordered_map>
#include <unordered_set>
#include <vector>

// ── CancellationException ─────────────────────────────────────────────────────
struct CancellationException {};

// ── WorkQueue ─────────────────────────────────────────────────────────────────
struct WorkQueue {
    std::mutex mutex_;
    std::condition_variable cv_;
    std::queue<std::coroutine_handle<>> items_;
    bool done_ = false;

    void push(std::coroutine_handle<> h) {
        { std::lock_guard lock(mutex_); items_.push(h); }
        cv_.notify_one();
    }

    // Returns false when queue is shut down and empty
    bool pop(std::coroutine_handle<>& out) {
        std::unique_lock lock(mutex_);
        cv_.wait(lock, [&]{ return !items_.empty() || done_; });
        if (items_.empty()) {
            return false;
        }

        out = items_.front();
        items_.pop();
        return true;
    }

    void shutdown() {
        { std::lock_guard lock(mutex_); done_ = true; }
        cv_.notify_all();
    }
};

// ── TaskId ────────────────────────────────────────────────────────────────────
using TaskId = std::string;

// ── TaskRunner (forward declaration) ─────────────────────────────────────────
class TaskRunner;

// ── Task<T> ───────────────────────────────────────────────────────────────────
template<typename T>
struct Task {
    struct promise_type {
        TaskRunner* runner_ = nullptr;
        TaskId id_;

        Task get_return_object() {
            return Task{std::coroutine_handle<promise_type>::from_promise(*this)};         
        }

        std::suspend_always initial_suspend() { return {}; }

        auto final_suspend() noexcept;

        void unhandled_exception() {
            auto ex = std::current_exception();
            try {
                std::rethrow_exception(ex);
            } catch (const CancellationException&) {
            } catch (...) {
                std::terminate();
            }
        }

        void return_void() {}
    };

    std::coroutine_handle<promise_type> handle_;

    void set_runner(TaskRunner* runner, TaskId id) {
        handle_.promise().runner_ = runner;
        handle_.promise().id_ = id;
    }

    explicit Task(std::coroutine_handle<promise_type> h) : handle_(h) {}
    ~Task() {
        if (handle_) {
            handle_.destroy();
            handle_ = {};
        }
    }

    // Non-copyable
    Task(const Task&) = delete;
    Task& operator=(const Task&) = delete;

    Task(Task&& other) noexcept : handle_(other.handle_) {
        other.handle_ = {};
    }
    
    Task& operator=(Task&& other) noexcept {
        if (this != &other) {
            if (handle_) {
                handle_.destroy();
            }
            handle_ = other.handle_;
            other.handle_ = {};
        }
        return *this;
    }
};

// ── WaitFor awaitable ( declaration) ──────────────────────────────────────────────
struct WaitFor {
    TaskRunner& runner_;
    TaskId id_;
    std::stop_token stop_token_;

    bool await_ready();

    std::coroutine_handle<> await_suspend(std::coroutine_handle<> handle) noexcept;

    void await_resume();
};

// ── WaitForAll awaitable ( declaration) ───────────────────────────────────────────
struct WaitForAll {
    TaskRunner& runner_;
    std::vector<TaskId> ids_;
    mutable std::atomic<int> counter;
    std::stop_token stop_token_;

    WaitForAll(TaskRunner& runner, std::vector<TaskId> ids, int count, std::stop_token stop_token)
        : runner_(runner), ids_(std::move(ids)), counter(count + 1), stop_token_(stop_token) {} // +1 sentinel held by await_suspend

    bool await_ready();

    std::coroutine_handle<> await_suspend(std::coroutine_handle<> handle) noexcept;

    void await_resume();
};

// ── TaskRunner (full definition) ──────────────────────────────────────────────
class TaskRunner {
public:
    TaskId add(std::string name, Task<void> task) {
        auto& stored = tasks_.emplace(name, std::move(task)).first->second;
        stored.set_runner(this, name);
        return name;
    }

    // Returns true if already complete (caller should resume immediately), false if registered (caller should not resume).
    bool try_register_waiter(TaskId id, std::coroutine_handle<> handle) {
        std::lock_guard<std::mutex> lock(state_mutex_);
        if (completed_.count(id)) {
            return true;
        }
        coro_waiters_[id].push_back(handle);
        return false;
    }

    bool try_register_waiter(TaskId id, std::function<void()> callback) {
        std::lock_guard<std::mutex> lock(state_mutex_);
        if (completed_.count(id)) {
            return true;
        }
        callback_waiters_[id].push_back(callback);
        return false;
    }

    WaitFor wait_for(TaskId id) {
        return WaitFor{ *this, id, get_stop_token() };
    }

    WaitForAll wait_for_all(std::vector<TaskId> deps) {
        int count = static_cast<int>(deps.size());
        return WaitForAll(*this, std::move(deps), count, get_stop_token());
    }

    void mark_complete(TaskId id) {
        std::vector<std::coroutine_handle<>> waiters_list {};
        std::vector<std::function<void()>> callbacks_list {};
        {
            std::lock_guard<std::mutex> lock(state_mutex_);
            completed_.emplace(id);

            waiters_list = std::move(coro_waiters_[id]);
            callbacks_list = std::move(callback_waiters_[id]);
        }
        for(auto handle : waiters_list) {
            post(handle);
        }
        for(auto callback : callbacks_list) {
            callback();
        }

        if (latch_) {
            latch_->count_down();
        }
    }

    bool is_complete(TaskId id) const {
        std::lock_guard<std::mutex> lock(state_mutex_);
        return completed_.count(id);
    }

    void run_all() {
        latch_ = std::make_unique<std::latch>(tasks_.size());

        // 1. Spin up worker threads — each loops on the queue until shutdown
        int thread_count = std::max(1u, std::thread::hardware_concurrency());
        workers_.reserve(thread_count);
        for(int i = 0; i < thread_count; ++i) {
            workers_.emplace_back([this] {
                std::coroutine_handle<> handle;
                while(queue_.pop(handle)) {
                    handle.resume();
                }
            });
        }
        
        // 2. Post initial handles — this is what starts all tasks
        for (auto& [id, task] : tasks_) {
            post(task.handle_);
        }

        // 3. Wait for all tasks to call mark_complete
        latch_->wait();

        // 4. Drain and shut down
        queue_.shutdown();
        for(auto& thread : workers_) {
            thread.join();
        }
    }

    void post(std::coroutine_handle<> handle) {
        queue_.push(handle);
    }

    void cancel() {
        stop_source_.request_stop();
    }
    std::stop_token get_stop_token() const {
        return stop_source_.get_token();
    }

private:
    WorkQueue queue_;
    std::vector<std::thread> workers_;
    std::unique_ptr<std::latch> latch_;

    std::unordered_map<TaskId, Task<void>> tasks_;

    std::unordered_map<TaskId, std::vector<std::coroutine_handle<>>> coro_waiters_;
    std::unordered_map<TaskId, std::vector<std::function<void()>>> callback_waiters_;
    std::unordered_set<TaskId> completed_;

    mutable std::mutex state_mutex_;

    std::stop_source stop_source_;
};

// ── Task<T> (full definition) ─────────────────────────────────────────────────

template<typename T>
inline auto Task<T>::promise_type::final_suspend() noexcept {
    struct FinalAwaiter {
        bool await_ready() const noexcept { return false; }
        void await_suspend(std::coroutine_handle<promise_type> h) noexcept {
            if (h.promise().runner_)
                h.promise().runner_->mark_complete(h.promise().id_);
        }
        void await_resume() const noexcept {}
    };
    return FinalAwaiter{};
}

// ── WaitFor awaitable (full definition) ───────────────────────────────────────

bool WaitFor::await_ready() {
    if (stop_token_.stop_requested()) {
        throw CancellationException{};
    }
    return runner_.is_complete(id_);
}

std::coroutine_handle<> WaitFor::await_suspend(std::coroutine_handle<> handle) noexcept {
    if (runner_.try_register_waiter(id_, handle)) {
        return handle;
    }
    return std::noop_coroutine();
}

void WaitFor::await_resume() {
    if (stop_token_.stop_requested()) {
        throw CancellationException{};
    }
}

// ── WaitForAll awaitable (full definition) ────────────────────────────────────

bool WaitForAll::await_ready() {
    if (stop_token_.stop_requested()) {
        throw CancellationException{};
    }

    for (auto id : ids_) {
        if (!runner_.is_complete(id)) {
            return false;
        }
    }
    return true;
}

std::coroutine_handle<> WaitForAll::await_suspend(std::coroutine_handle<> handle) noexcept {
    for (const auto& id : ids_) {
        auto cb = [this, handle] {
            if (--counter == 0) {
                runner_.post(handle);
            }
        };
        if (runner_.try_register_waiter(id, cb)) {
            --counter;
        }
    }
    // Release the sentinel token. If this brings counter to 0, all deps were already
    // complete (synchronously or via callbacks that raced us) — we own the resume.
    // If counter > 0, at least one callback is still pending and will eventually see 0.
    if (--counter == 0) {
        return handle;
    }
    return std::noop_coroutine();
}

void WaitForAll::await_resume() {
    if (stop_token_.stop_requested()) {
        throw CancellationException{};
    }
}

// ── Demo coroutines ───────────────────────────────────────────────────────────

Task<void> build_material_atomic(TaskRunner& runner, std::vector<TaskId> deps, std::function<void(const std::string& msg)>& log) {
    log("[build_material_atomic] waiting for deps " + std::to_string(deps.size()));
    
    // Option B - atomic counter
    co_await runner.wait_for_all(deps);

    log("[build_material_atomic] starting");
    std::this_thread::sleep_for(std::chrono::milliseconds{100});
    log("[build_material_atomic] done");
}

Task<void> build_material_sequence(TaskRunner& runner, std::vector<TaskId> deps, std::function<void(const std::string& msg)>& log) {
    log("[build_material_sequence] waiting for deps " + std::to_string(deps.size()));
    
    // Option A - awaits each dep in sequence
    for (auto id : deps) {
        co_await runner.wait_for(id);
    }

    log("[build_material_sequence] starting");
    std::this_thread::sleep_for(std::chrono::milliseconds{100});
    log("[build_material_sequence] done");
}

Task<void> load_albedo([[maybe_unused]] TaskRunner& runner, std::function<void(const std::string& msg)>& log) {
    log("[load_albedo] starting");
    std::this_thread::sleep_for(std::chrono::milliseconds{100});
    log("[load_albedo] done");

    co_return;
}

Task<void> load_normal([[maybe_unused]] TaskRunner& runner, std::function<void(const std::string& msg)>& log) {
    log("[load_normal] starting");
    std::this_thread::sleep_for(std::chrono::milliseconds{60});
    log("[load_normal] done");

    co_return;
}

Task<void> load_roughness([[maybe_unused]] TaskRunner& runner, std::function<void(const std::string& msg)>& log) {
    log("[load_roughness] starting");
    std::this_thread::sleep_for(std::chrono::milliseconds{120});
    log("[load_roughness] done");
    
    co_return;
}

// ── main ──────────────────────────────────────────────────────────────────────

int main() {
    TaskRunner runner;

    auto t0 = std::chrono::steady_clock::now();

    std::function<long long()> ms = [&] {
        return std::chrono::duration_cast<std::chrono::milliseconds>(
            std::chrono::steady_clock::now() - t0).count();
    };
    std::mutex cout_mutex;
    std::function<void(const std::string& msg)> log = [&](const std::string& msg) {
        std::lock_guard lock(cout_mutex);
        std::cout << "[" << ms() << "ms] " << msg << "\n";
    };

    auto id_load_albedo = runner.add("load_albedo", load_albedo(runner, log));
    auto id_load_normal = runner.add("load_normal", load_normal(runner, log));
    auto id_load_roughness = runner.add("load_roughness", load_roughness(runner, log));
    //auto id_build_material = runner.add("build_material", build_material_sequence(runner, {id_load_albedo, id_load_normal, id_load_roughness}, log));
    auto id_build_material = runner.add("build_material", build_material_atomic(runner, {id_load_albedo, id_load_normal, id_load_roughness}, log));

    std::thread canceller([&runner, &log] {
        std::this_thread::sleep_for(std::chrono::milliseconds{80});
        log("[canceller] requesting stop");
        runner.cancel();
    });

    runner.run_all();

    canceller.join();

    std::cout << "[main] all tasks completed\n";

    return 0;
}
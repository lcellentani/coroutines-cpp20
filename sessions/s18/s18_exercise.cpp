#include <cassert>
#include <chrono>
#include <coroutine>
#include <iostream>
#include <mutex>
#include <string>
#include <thread>
#include <unordered_map>
#include <unordered_set>
#include <vector>

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
            std::terminate();
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

// ── WaitFor awaitable ─────────────────────────────────────────────────────────
struct WaitFor {
    TaskRunner& runner_;
    TaskId id_;

    bool await_ready() noexcept;

    void await_suspend(std::coroutine_handle<> h) noexcept;

    void await_resume() noexcept {}
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
        waiters_[id].push_back(handle);
        return false;
    }

    WaitFor wait_for(TaskId id) {
        return WaitFor{ *this, id };
    }

    void mark_complete(TaskId id) {
        std::vector<std::coroutine_handle<>> waiters_list {};
        {
            std::lock_guard<std::mutex> lock(state_mutex_);
            completed_.emplace(id);

            waiters_list = std::move(waiters_[id]);
        }
        for(auto handle : waiters_list) {
            handle.resume();
        }
    }

    bool is_complete(TaskId id) const {
        std::lock_guard<std::mutex> lock(state_mutex_);
        return completed_.count(id);
    }

    void run_all() {
        std::vector<std::thread> threads;
        for(auto& [id, task] : tasks_) {
            threads.emplace_back([&task]{task.handle_.resume();});
        }
        for(auto& thread : threads) {
            thread.join();
        }
    }

private:
    std::unordered_map<TaskId, Task<void>> tasks_;

    std::unordered_map<TaskId, std::vector<std::coroutine_handle<>>> waiters_;
    std::unordered_set<TaskId> completed_;

    mutable std::mutex state_mutex_;
};

// ── Task<T> ───────────────────────────────────────────────────────────────────

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

// ── WaitFor awaitable ─────────────────────────────────────────────────────────

bool WaitFor::await_ready() noexcept {
    return runner_.is_complete(id_);
}

void WaitFor::await_suspend(std::coroutine_handle<> handle) noexcept {
    if (!runner_.try_register_waiter(id_, handle)) {
        return;
    }
    handle.resume();
}

// ── Demo coroutines ───────────────────────────────────────────────────────────

Task<void> load_texture([[maybe_unused]] TaskRunner& runner) {
    std::cout << "[load_texture] starting\n";
    std::this_thread::sleep_for(std::chrono::milliseconds{100});
    std::cout << "[load_texture] done\n";

    co_return;
}

Task<void> decompress(TaskRunner& runner, TaskId dep) {
    std::cout << "[decompress] waiting for " << dep << "\n";
    co_await runner.wait_for(dep);

    std::cout << "[decompress] starting\n";
    std::this_thread::sleep_for(std::chrono::milliseconds{50});
    std::cout << "[decompress] done\n";
}

Task<void> generate_mips(TaskRunner& runner, TaskId dep) {
    std::cout << "[generate_mips] waiting for " << dep << "\n";
    co_await runner.wait_for(dep);

    std::cout << "[generate_mips] starting\n";
    std::this_thread::sleep_for(std::chrono::milliseconds{30});
    std::cout << "[generate_mips] done\n";
}

// ── main ──────────────────────────────────────────────────────────────────────

int main() {
    TaskRunner runner;

    auto id_load = runner.add("load_texture", load_texture(runner));
    auto id_decompress = runner.add("decompress", decompress(runner, id_load));
    auto id_mips = runner.add("generate_mips", generate_mips(runner, id_decompress));

    runner.run_all();

    std::cout << "[main] all tasks completed\n";

    return 0;
}
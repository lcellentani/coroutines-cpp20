#include <coroutine>
#include <iostream>
#include <functional>
#include <latch>
#include <mutex>
#include <queue>
#include <thread>
#include <vector>

class ThreadPool {
public:
    explicit ThreadPool(size_t thread_count) {
        for(size_t i = 0; i < thread_count; ++i) {
            workers_.emplace_back([this] {
                while (true) {
                    std::coroutine_handle<> task;
                    {
                        std::unique_lock lock(mutex_);
                        cv_.wait(lock, [this] { return stop_ || !queue_.empty(); });
                        if (stop_ && queue_.empty()) return;
                        task = queue_.front();
                        queue_.pop();
                    }
                    std::cout << "Worker thread " << std::this_thread::get_id() << " executing task\n";
                    task.resume();    
                }
            });
        }
    }

    ~ThreadPool() {
        {
            std::unique_lock lock(mutex_);
            stop_ = true;
        }
        cv_.notify_all();
        for (auto& worker : workers_) {
            worker.join();
        }
    }

    void dispatch(std::coroutine_handle<> task) {
        {
            std::unique_lock lock(mutex_);
            queue_.push(task);
        }
        cv_.notify_one();
    }

private:
    std::vector<std::thread> workers_;
    std::queue<std::coroutine_handle<>> queue_;
    std::mutex mutex_;
    std::condition_variable cv_;
    bool stop_ = false;
};

struct ScheduleOn {
    ThreadPool& pool;

    bool await_ready() const noexcept { return false; }

    void await_suspend(std::coroutine_handle<> h) {
        std::cout << "Scheduling on thread pool: thread " << std::this_thread::get_id() << "\n";
        pool.dispatch(h);
    }

    void await_resume() const noexcept {
    }
};

struct Task {
    struct promise_type {
        std::function<void()> on_complete;

        auto get_return_object() {
            return Task{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        auto final_suspend() noexcept {
            struct FinalAwaiter {
                bool await_ready() const noexcept { return false; }
                void await_suspend(std::coroutine_handle<promise_type> h) noexcept {
                    if (h.promise().on_complete) {
                        h.promise().on_complete();
                    }
                }
                void await_resume() const noexcept {}
            };
            return FinalAwaiter{};
        }

        void return_void() {}

        void unhandled_exception() {
            std::terminate();
        }
    };

    std::coroutine_handle<promise_type> handle;

    explicit Task(std::coroutine_handle<promise_type> h) : handle(h) {}
    ~Task() { if (handle) handle.destroy(); }

    // Non-copyable
    Task(const Task&) = delete;
    Task& operator=(const Task&) = delete;

    Task(Task&& other) noexcept : handle(other.handle) {
        other.handle = nullptr;
    }
    Task& operator=(Task&& other) noexcept {
        if (this != &other) {
            if (handle) {
                handle.destroy();
            }
            handle = other.handle;
            other.handle = nullptr;
        }
        return *this;
    }
};

ThreadPool pool(4);

Task work() {
    std::cout << "Start: thread " << std::this_thread::get_id() << "\n";

    co_await ScheduleOn{ pool };  // Switch to thread pool

    std::cout << "After switch: thread " << std::this_thread::get_id() << "\n";
}

int main() {
    std::cout << "Main thread: " << std::this_thread::get_id() << "\n";

    std::latch done(4);

    std::vector<Task> tasks;
    tasks.reserve(4);

    for(int i = 0; i < 4; i++) {
        Task& task = tasks.emplace_back(work());
        task.handle.promise().on_complete = [&done] { done.count_down(); };
        task.handle.resume();
    }

    done.wait();

    std::cout << "Main thread continues: " << std::this_thread::get_id() << "\n";
    return 0;
}
#include <coroutine>
#include <iostream>
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
        std::latch* completion = nullptr;

        auto get_return_object() {
            return Task{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        auto final_suspend() noexcept {
            struct FinalAwaiter {
                bool await_ready() const noexcept { return false; }
                void await_suspend(std::coroutine_handle<promise_type> h) noexcept {
                    if (h.promise().completion) {
                        h.promise().completion->count_down();
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

    Task t1 = work();
    t1.handle.promise().completion = &done;
    t1.handle.resume();

    Task t2 = work();
    t2.handle.promise().completion = &done;
    t2.handle.resume();

    Task t3 = work();
    t3.handle.promise().completion = &done;
    t3.handle.resume();

    Task t4 = work();
    t4.handle.promise().completion = &done;
    t4.handle.resume();

    done.wait();

    std::cout << "Main thread continues: " << std::this_thread::get_id() << "\n";
    return 0;
}
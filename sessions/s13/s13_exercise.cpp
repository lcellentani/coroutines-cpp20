#include <chrono>
#include <coroutine>
#include <functional>
#include <iostream>
#include <latch>
#include <thread>

struct Sleep {
    std::chrono::milliseconds duration;

    bool await_ready() const noexcept {
        return false;
    }

    void await_suspend(std::coroutine_handle<> handle) {
        std::thread([handle, duration = this->duration]() {
            std::this_thread::sleep_for(duration);
            handle.resume();
        }).detach();
    }

    void await_resume() const noexcept {
    }
};

struct Task {
    struct promise_type {
        std::function<void()> on_complete;

        auto get_return_object() {
            return Task{std::coroutine_handle<promise_type>::from_promise(*this)};
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
    ~Task() {
        if (handle)
            handle.destroy();
    }

    // Non-copyable
    Task(const Task&) = delete;
    Task& operator=(const Task&) = delete;

    Task(Task&& other) noexcept : handle(other.handle) {
        other.handle = {};
    }
    
    Task& operator=(Task&& other) noexcept {
        if (this != &other) {
            if (handle) {
                handle.destroy();
            }
            handle = other.handle;
            other.handle = {};
        }
        return *this;
    }
};

Task run(std::latch* completion_latch) {
    auto before = std::chrono::steady_clock::now();
    std::cout << "[coroutine] going to sleep\n";

    co_await Sleep { std::chrono::milliseconds{200} };

    auto after = std::chrono::steady_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(after - before);
    std::cout << "[coroutine] woke up after " << elapsed.count() << "ms\n";

    co_return;
}

int main() {
    std::cout << "[main] launching coroutine\n";
   
    std::latch done(1);

    Task t = run(&done);
    t.handle.promise().on_complete = [&done] { done.count_down(); };
    t.handle.resume();

    std::cout << "[main] done, waiting for coroutine to finish...\n";
    done.wait();
    std::cout << "[main] coroutine finished, exiting main.\n";

    return 0;
}
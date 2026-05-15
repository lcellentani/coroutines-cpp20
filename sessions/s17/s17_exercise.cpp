#include <chrono>
#include <coroutine>
#include <exception>
#include <functional>
#include <iostream>
#include <latch>
#include <stop_token>
#include <thread>

struct CancellationException {};

struct CheckCancellation {
    std::stop_token token;

    bool await_ready() const noexcept {
        return false;
    }

    void await_suspend(std::coroutine_handle<> handle) {
        if (token.stop_requested()) {
            throw CancellationException{};
        }
        handle.resume();
    }

    void await_resume() const noexcept {}
};

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

    void await_resume() const noexcept {}
};

struct Task {
    struct promise_type {
        std::function<void()> on_complete;
        std::exception_ptr stored_exception;

        auto get_return_object() {
            return Task{std::coroutine_handle<promise_type>::from_promise(*this)};
        }
		
        std::suspend_always initial_suspend() { 
            return {}; 
        }
        
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
            stored_exception = std::current_exception();
            try {
                std::rethrow_exception(stored_exception);
            } catch (const CancellationException&) {
                std::cout << "[Task]: cancelled\n";
            } catch (...) {}
        }

        void result() {
            if (stored_exception) {
                std::rethrow_exception(stored_exception);
            }
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

    void get() {
        handle.promise().result();
    }
};

Task count_to(std::stop_token token, int n) {
    for (int i = 0; i < n; ++i) {
        co_await CheckCancellation{token};
        std::cout << "[count_to]: step " << i << '\n';
        co_await Sleep{std::chrono::milliseconds{100}};
    }

    std::cout << "[count_to]: done\n";

    co_return;
}

Task run_with_timeout(std::stop_source& source, int ms_delay) {
    std::cout << "[run_with_timeout]: starting timeout for " << ms_delay << "ms\n";
    co_await Sleep{std::chrono::milliseconds{ms_delay}};
    std::cout << "[run_with_timeout]: requesting stop after " << ms_delay << "ms\n";
    
    source.request_stop();

    co_return;
}

int main() {
    std::cout << "[main] launching coroutine\n";

    {
        std::latch done(2);

        std::stop_source source;
        std::stop_token token = source.get_token();

        Task counter_task = count_to(token, 5);
        counter_task.handle.promise().on_complete = [&done] { done.count_down(); };
        
        Task timeout_task = run_with_timeout(source, 200); // Timeout after 100ms
        timeout_task.handle.promise().on_complete = [&done] { done.count_down(); };

        try {
            counter_task.handle.resume();
        } catch (const std::exception& ex) {
            std::cout << "[main] Caught exception from counter_task: " << ex.what() << '\n';
            counter_task.handle = nullptr;
        }
        try {
            timeout_task.handle.resume();
        } catch (const std::exception& ex) {
            std::cout << "[main] Caught exception from timeout_task: " << ex.what() << '\n';
            timeout_task.handle = nullptr;
        }

        std::cout << "[main] Waiting for coroutines to finish...\n";
        done.wait();
        std::cout << "[main] Coroutines finished.\n";
    }

    std::cout << "[main] coroutine finished, exiting main.\n";

    return 0;
}
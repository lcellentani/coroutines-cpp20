#include <coroutine>
#include <string>
#include "logger.h"

struct ReadyAwaitable {
    bool await_ready() const {
        Logger::get_instance().log("[ReadyAwaitable] await_ready: (true)");
        return true;
    }

    void await_suspend(std::coroutine_handle<>) const noexcept {
        Logger::get_instance().log("[ReadyAwaitable] await_suspend: (not suspending)");
    }

    int await_resume() const {
        Logger::get_instance().log("[ReadyAwaitable] await_resume: (42)");
        return 42;
    }
};

struct DeferredAwaitable {
    bool await_ready() const {
        Logger::get_instance().log("[DeferredAwaitable] await_ready: (false)");
        return false;
    }

    void await_suspend(std::coroutine_handle<> handle) const {
        Logger::get_instance().log("[DeferredAwaitable] await_suspend: (suspending)");
        handle.resume();
    }

    std::string await_resume() const {
        constexpr auto message = "resumed by DeferredAwaitable";
        Logger::get_instance().log("[DeferredAwaitable] await_resume: ", message);
        return message;
    }
};   

struct Task {
    struct promise_type {
        auto get_return_object() {
            return Task{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }

        void return_void() {}

        void unhandled_exception() {}
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle {};

    Task(Handle h) : handle(h) {}
    ~Task() {
        if (handle) {
            handle.destroy();
            handle = nullptr;
        }
    }

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

    bool next() {
        if (!handle || handle.done()) {
            return false;
        }

        handle.resume();

        return !handle.done();
    }
};

Task custom_awaitable() {
    int result = co_await ReadyAwaitable{};
    Logger::get_instance().log("Result from custom awaitable: " + std::to_string(result));

    std::string message = co_await DeferredAwaitable{};
    Logger::get_instance().log("Message from custom awaitable: " + message);
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto awaitable_gen = custom_awaitable();
        while (awaitable_gen.next()) {
            // No values to process, just waiting for completion
        }
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
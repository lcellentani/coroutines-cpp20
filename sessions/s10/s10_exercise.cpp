#include <coroutine>
#include <string>
#include "logger.h"

struct ValueAwaiter {
    int value;

    bool await_ready() const noexcept { return true; }
            
    int await_resume() const noexcept { return value; }

    void await_suspend(std::coroutine_handle<>) const noexcept {} // never called: await_ready = true
};

struct TimedResult {
    std::string label;
    int value;

    const std::string& get_label() const { return label; }

    ValueAwaiter operator co_await() {
        return ValueAwaiter{ value };
    }
};

struct Delay {
    int ms;
};

struct Awaiter {
    int ms;

    bool await_ready() const noexcept { return false; }
                
    void await_suspend(std::coroutine_handle<> h) const noexcept {
        Logger::get_instance().log("[Awaiter] await_suspend - resuming synchronously");
        h.resume();
    }

    int await_resume() const noexcept {
        Logger::get_instance().log("[Awaiter] await_resume - returning ", ms);
        return ms;
    }
};

auto operator co_await(Delay d) {
    return Awaiter{ d.ms };
}

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

    bool next() {
        if (!handle || handle.done()) {
            return false;
        }

        handle.resume();

        return !handle.done();
    }
};

Task run() {
    TimedResult r { "frame budget", 16 };
    int ms = co_await r;
    Logger::get_instance().log(r.get_label(), ": ", ms, "ms");
}

Task delay() {
    int actual = co_await Delay{33};
    Logger::get_instance().log("Delayed by ", actual, "ms");
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto t = run();
        while (t.next()) {}
    }

    {
        auto t = delay();
        while (t.next()) {}
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
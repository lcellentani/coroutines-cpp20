Here is the code for Task 1:

```cpp
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

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto t = run();
        while (t.next()) {}
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

This is the output of the above code:

```
[1] Entering main...
[2] frame budget: 16ms
[3] Exiting main...
```
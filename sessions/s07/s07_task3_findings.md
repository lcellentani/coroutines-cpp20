This is  the code for Task 3 where I check the full eager coroutine type (initial_suspend returns suspend_never and final_suspend returns suspend_never).

```cpp
#include <coroutine>
#include <exception>

#include "logger.h"

struct Task {
    struct promise_type {
        std::exception_ptr stored_exception;

        Task get_return_object() {
            Logger::get_instance().log("Calling get_return_object in promise.");
            return Task{ Handle::from_promise(*this) };
        }

        std::suspend_never initial_suspend() {
            Logger::get_instance().log("Calling initial_suspend in promise: suspend_never.");
            return std::suspend_never{};
        }

        std::suspend_never final_suspend() noexcept {
            Logger::get_instance().log("Calling final_suspend in promise: suspend_never.");
            return std::suspend_never{};
        }

       void return_void() {}
       
       void unhandled_exception() {
        Logger::get_instance().log("Unhandled exception caught in coroutine, storing it in promise...");
            stored_exception = std::current_exception();
       }

       void result() {
            Logger::get_instance().log("Checking for stored exception in promise...");
            if (stored_exception) {
                Logger::get_instance().log("About to rethrow exception from coroutine...");
                std::rethrow_exception(stored_exception);
            }
       }
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle;

    explicit Task(Handle h) : handle(h) {}
    ~Task() {
        //if (handle) {
        //    handle.destroy();
        //    handle = nullptr;
        //}
    }

    void get() {
        handle.promise().result();
    }
};

Task example_coroutine() {    
    Logger::get_instance().log("First line of coroutine body.");
    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto task = example_coroutine();
        log.log("Back in main after calling coroutine...");

        // Frame is gone. What does the runtime give us?
        bool is_done = task.handle.done();
        log.log("handle.done() = ", std::boolalpha, is_done);
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

This is the output
```
[1] Entering main...
[2] Calling get_return_object in promise.
[3] Calling initial_suspend in promise: suspend_never.
[4] First line of coroutine body.
[5] Calling final_suspend in promise: suspend_never.
[6] Back in main after calling coroutine...
[7] handle.done() = false
[8] Exiting main...
```

As expected the coroutine executes fully before returning to main. The final_suspend is never reached because the coroutine frame is destroyed immediately after the coroutine body finishes executing. The handle.done() returned false on freed memory — not because the coroutine is still running, but because the allocator hadn't overwritten the frame yet; the result is meaningless and any code that acts on it has silent UB.

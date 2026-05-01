This is the code for Task 1 where I check the lazy coroutine type (initial_suspend and final_suspend return both suspend_always).

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

        std::suspend_always initial_suspend() {
            Logger::get_instance().log("Calling initial_suspend in promise: suspend_always.");
            return std::suspend_always{};
        }

        std::suspend_always final_suspend() noexcept {
            Logger::get_instance().log("Calling final_suspend in promise: suspend_always.");
            return std::suspend_always{};
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
        if (handle) {
            handle.destroy();
            handle = nullptr;
        }
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
        log.log("About to call coroutine...");
        auto task = example_coroutine();
        log.log("Back in main, task constructed.");
        
        task.handle.resume();
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

This is the output of the above code:

```
[1] Entering main...
[2] About to call coroutine...
[3] Calling get_return_object in promise.
[4] Calling initial_suspend in promise: suspend_always.
[5] Back in main, task constructed.
[6] First line of coroutine body.
[7] Calling final_suspend in promise: suspend_always.
[8] Exiting main...
```

As expected the controls return to the main before executing the first line of the coroutine body, which confirms that both initial_suspend and final_suspend return suspend_always.

---

This is the code for Task 2 where I check the combination initial_suspend returning suspend_never and final_suspend returning suspend_always.

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

        std::suspend_always final_suspend() noexcept {
            Logger::get_instance().log("Calling final_suspend in promise: suspend_always.");
            return std::suspend_always{};
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
        if (handle) {
            handle.destroy();
            handle = nullptr;
        }
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
        log.log("About to call coroutine...");
        auto task = example_coroutine();
        log.log("Back in main after calling coroutine...");
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

This is the output of the above code:

```
[1] Entering main...
[2] About to call coroutine...
[3] Calling get_return_object in promise.
[4] Calling initial_suspend in promise: suspend_never.
[5] First line of coroutine body.
[6] Calling final_suspend in promise: suspend_always.
[7] Back in main after calling coroutine...
[8] Exiting main...
```

As expected I had to avoid storing the handle and calling resume because the coroutine body is executed immediately after the get_return_object call, which confirms that initial_suspend returns suspend_never. The final_suspend still returns suspend_always as expected.

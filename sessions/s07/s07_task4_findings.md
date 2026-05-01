This is the code for Task 4 where I store the execption and calling the getter to rethrow the exception and catch it in the main method.

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
            return {};
        }

        std::suspend_always final_suspend() noexcept {
            Logger::get_instance().log("Calling final_suspend in promise: suspend_always.");
            return {};
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

    throw std::runtime_error("An error occurred in the coroutine!");

    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        log.log("About to call coroutine...");
        auto task = example_coroutine();
        log.log("Back in main after calling coroutine...");

        task.handle.resume();

        try {
            log.log("About to call task.get() to retrieve result from coroutine...");
            task.get();
        } catch (const std::exception& ex) {
            log.log("Caught exception from coroutine in main: ", ex.what());
        }
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
[5] Back in main after calling coroutine...
[6] First line of coroutine body.
[7] Unhandled exception caught in coroutine, storing it in promise...
[8] Calling final_suspend in promise: suspend_always.
[9] About to call task.get() to retrieve result from coroutine...
[10] Checking for stored exception in promise...
[11] About to rethrow exception from coroutine...
[12] Caught exception from coroutine in main: An error occurred in the coroutine!
[13] Exiting main...
```

Output reflect the flow of execution, showing when the coroutine is called, when the exception is thrown and stored, and when it is rethrown and caught in the main function.

---

This is the code where I call std::terminate() in the unhandled_exception method instead of storing the exception and rethrowing it later.

```cpp
#include <coroutine>
#include <exception>

#include "logger.h"

struct Task {
    struct promise_type {
        //std::exception_ptr stored_exception;

        Task get_return_object() {
            Logger::get_instance().log("Calling get_return_object in promise.");
            return Task{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() {
            Logger::get_instance().log("Calling initial_suspend in promise: suspend_always.");
            return {};
        }

        std::suspend_always final_suspend() noexcept {
            Logger::get_instance().log("Calling final_suspend in promise: suspend_always.");
            return {};
        }

       void return_void() {}
       
       void unhandled_exception() {
            Logger::get_instance().log("Unhandled exception caught in coroutine, terminating...");
            //stored_exception = std::current_exception();
            std::terminate();
       }

       /*void result() {
            Logger::get_instance().log("Checking for stored exception in promise...");
            if (stored_exception) {
                Logger::get_instance().log("About to rethrow exception from coroutine...");
                std::rethrow_exception(stored_exception);
            }
       }*/
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

    //void get() {
    //    handle.promise().result();
    //}
};

Task example_coroutine() {    
    Logger::get_instance().log("First line of coroutine body.");

    throw std::runtime_error("An error occurred in the coroutine!");

    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        try {
            log.log("About to call coroutine...");
            auto task = example_coroutine();
            log.log("Back in main after calling coroutine...");

            task.handle.resume();
            
            //log.log("About to call task.get() to retrieve result from coroutine...");
            //task.get();
        } catch (const std::exception& ex) {
            log.log("Caught exception from coroutine in main: ", ex.what());
        }
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

I'm hitting an exception and I'm not sure how to catch it in the main, if it's possible.

---

This is the code where I re-throw the exception in the unhandled_exception method and catch it in the main method.

```cpp
#include <coroutine>
#include <exception>

#include "logger.h"

struct Task {
    struct promise_type {
        Task get_return_object() {
            Logger::get_instance().log("Calling get_return_object in promise.");
            return Task{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() {
            Logger::get_instance().log("Calling initial_suspend in promise: suspend_always.");
            return {};
        }

        std::suspend_always final_suspend() noexcept {
            Logger::get_instance().log("Calling final_suspend in promise: suspend_always.");
            return {};
        }

       void return_void() {}
       
       void unhandled_exception() {
            Logger::get_instance().log("Unhandled exception caught in coroutine, terminating...");
            throw;
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
};

Task example_coroutine() {    
    Logger::get_instance().log("First line of coroutine body.");

    throw std::runtime_error("An error occurred in the coroutine!");

    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        log.log("About to call coroutine...");
        auto task = example_coroutine();
        log.log("Back in main after calling coroutine...");

        try {
            task.handle.resume();
        } catch (const std::exception& ex) {
            log.log("Caught exception from coroutine in main: ", ex.what());
            task.handle = nullptr; // prevent destructor from trying to resume/destroy the coroutine
        }
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

I need to clean up the handle before the Task destructor is called, otherwise it will try to resume/destroy the coroutine which will lead to undefined behavior since the exception has already been thrown and the coroutine is in an invalid state. By setting the handle to nullptr, we prevent the destructor from trying to access the coroutine after an exception has been thrown.
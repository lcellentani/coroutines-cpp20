This is the code for Task 1 where I check the lazy coroutine type.

```cpp
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
    auto& log = Logger::get_instance();
    log.log("Inside coroutine...");

    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto task = example_coroutine();
        task.handle.resume();
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```
The following is the output of the above code:
```
[1] Entering main...
[2] Calling get_return_object in promise.
[3] Calling initial_suspend in promise: suspend_always.
[4] Inside coroutine...
[5] Calling final_suspend in promise: suspend_always.
[6] Exiting main...
```

---

This is the code for Task 1 where I check the combination of initial_suspend that immediately executes and final_suspend that way for handle to go out of scope and destroy the coroutine. I had to comment out the call to resume to avoid Segfault.

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
    auto& log = Logger::get_instance();
    log.log("Inside coroutine...");

    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto task = example_coroutine();
        //task.handle.resume();
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

The following is the output of the above code:
```
[1] Entering main...
[2] Calling get_return_object in promise.
[3] Calling initial_suspend in promise: suspend_never.
[4] Inside coroutine...
[5] Calling final_suspend in promise: suspend_always.
[6] Exiting main...
```

---

This is the code for Task 1 where I tested eager coroutine with initial_suspend and final_suspend both set to suspend_never. I had to comment out the code in the destructor to avoid Segfault.

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
    auto& log = Logger::get_instance();
    log.log("Inside coroutine...");

    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        example_coroutine();
        //auto task = example_coroutine();
        //task.handle.resume();
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```

The following is the output of the above code:
```
[1] Entering main...
[2] Calling get_return_object in promise.
[3] Calling initial_suspend in promise: suspend_never.
[4] Inside coroutine...
[5] Calling final_suspend in promise: suspend_never.
[6] Exiting main...
```

---

This is the code for Task 1 where I tested combination of initial_suspend returning suspend_always and final_suspend returning suspend_never. As expected I need to call resume to execute the coroutine but I need to avoid any reference to handle in destructor to avoid Segfault.

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
    auto& log = Logger::get_instance();
    log.log("Inside coroutine...");

    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto task = example_coroutine();
        task.handle.resume();
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
```
The following is the output of the above code:
```
[1] Entering main...
[2] Calling get_return_object in promise.
[3] Calling initial_suspend in promise: suspend_always.
[4] Inside coroutine...
[5] Calling final_suspend in promise: suspend_never.
[6] Exiting main...
```


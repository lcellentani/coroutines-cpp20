#include <coroutine>
#include <exception>

#include "logger.h"

struct Task {
    struct promise_type {
        std::exception_ptr stored_exception;

        Task get_return_object() {
            return Task{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() {
            return std::suspend_always{};
        }

        std::suspend_always final_suspend() noexcept {
            return std::suspend_always{};
        }

       void return_void() {}
       
       void unhandled_exception() {
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

    throw std::runtime_error("An error occurred in the coroutine!");

    co_return; // required: makes this a coroutine
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto task = example_coroutine();
        task.handle.resume();
        
        try {
            task.get();
        } catch (const std::exception& ex) {
            log.log("Caught exception from coroutine: ", ex.what());
        }
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
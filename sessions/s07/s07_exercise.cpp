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
#include <coroutine>
#include <iostream>

#include "logger.h"

template <typename T>
struct Generator {
    struct promise_type {
        T current_value;

        Generator get_return_object() {
            return Generator{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() {
            return std::suspend_always{};
        }

        std::suspend_always final_suspend() noexcept {
            return std::suspend_always{};
        }

        std::suspend_always yield_value(T value) {
            current_value = value;
            return std::suspend_always{};
        }

        void return_void() {}

        void unhandled_exception() {}

        void* operator new(std::size_t size) {
            void* ptr = ::operator new(size);
            return ptr;
        }

        void operator delete(void* ptr, std::size_t size) {
            ::operator delete(ptr);
        }
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle;

    explicit Generator(Handle h) : handle(h) {}
    ~Generator() {
        if (handle) {
            Logger::get_instance().log("Before destroying handle, current_value = ", handle.promise().current_value);
            handle.destroy();
            handle = nullptr;
        }
    }

    bool next() {
        if (!handle || handle.done())
            return false;

        {
            Logger::ScopeIndent _;
            Logger::get_instance().log("Generator::address before resume() = ", handle.address());

            handle.resume();

            Logger::get_instance().log("Generator::address after resume() = ", handle.address());
        }

         if (handle.done())
                Logger::get_instance().log("Generator is done, current_value = ", handle.promise().current_value);

        return !handle.done();
    }

    T value() const {
        return handle.promise().current_value;
    }
};

Generator<int> counter(int from, int to) {
    Logger::get_instance().log("counter generator started");

    for (int i = from; i <= to; ++i) {
        co_yield i;
        Logger::get_instance().log("after yield ", i);
    }

    Logger::get_instance().log("counter generator finished");
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");
    
    log.log("first coroutine...");
    {
        Logger::ScopeIndent _;

        auto counter_gen = counter(1, 5);

        while(counter_gen.next()) {
            log.log("Current value from generator: ", counter_gen.value());
        }
    }

    log.log("second coroutine...");

    {
        Logger::ScopeIndent _;
        
        auto counter_gen = counter(1, 5);
     
        void* raw = counter_gen.handle.address();
        std::coroutine_handle<Generator<int>::promise_type> handle_typed = std::coroutine_handle<Generator<int>::promise_type>::from_address(raw);

        while (!handle_typed.done()) {
            handle_typed.resume();
            if (!handle_typed.done()) {
                log.log("value must be read via the typed handle — erased has no access to the promise - current_value = ", handle_typed.promise().current_value);
            }
        }
    }

    log.log("Exiting main...");

    log.dump();

    return 0;
}
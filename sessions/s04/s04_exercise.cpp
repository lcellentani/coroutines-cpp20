#include <coroutine>
#include "logger.h"

template <typename T>
struct Generator {
    struct promise_type {
        T current_value;

        Generator get_return_object() {
            Logger::ScopeIndent _;
            Logger::get_instance().log("promise_type::get_return_object() called");
            return Generator{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() {
            Logger::ScopeIndent _;
            Logger::get_instance().log("promise_type::initial_suspend() called");
            return std::suspend_always{};
        }

        std::suspend_always final_suspend() noexcept {
            Logger::ScopeIndent _;
            Logger::get_instance().log("promise_type::final_suspend() called");
            return std::suspend_always{};
        }

        std::suspend_always yield_value(T value) {
            Logger::ScopeIndent _;
            current_value = value;
            Logger::get_instance().log("promise_type::yield_value() called with value = ", value);
            return std::suspend_always{};
        }

        void return_void() {
            Logger::ScopeIndent _;
            Logger::get_instance().log("promise_type::return_void() called");
        }

        void unhandled_exception() {}

        void* operator new(std::size_t size) {
            void* ptr = ::operator new(size);
            Logger::get_instance().log("frame allocated ", size, " bytes at ", ptr);
            return ptr;
        }

        void operator delete(void* ptr, std::size_t size) {
            Logger::get_instance().log("frame freed ", size, " bytes at ", ptr);
            ::operator delete(ptr);
        }
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle;

    explicit Generator(Handle h) : handle(h) {
        Logger::get_instance().log("Generator constructor called");
    }
    ~Generator() {
        Logger::get_instance().log("Generator destructor called");
        if (handle) handle.destroy();
    }

    bool next() {
        if (!handle || handle.done()) return false;
        handle.resume();
        Logger::get_instance().log("Generator::next() called - done? ", std::boolalpha, handle.done());
        return !handle.done();
    }

    T value() const {
        Logger::get_instance().log("Generator::value() called with value() = ", handle.promise().current_value);
        return handle.promise().current_value;
    }
};

Generator<int> counter(int from) {
    Logger::get_instance().log("counter generator started");

    co_yield from;
    Logger::get_instance().log("after first yield");
    co_yield from + 1;
    Logger::get_instance().log("after second yield");
    co_yield from + 2;
    Logger::get_instance().log("after third yield");

    Logger::get_instance().log("counter generator finished");
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        Logger::ScopeIndent _;
        log.log("Entering block...");

        auto counter_gen = counter(2);

        while (counter_gen.next()) {
            counter_gen.value();
        }

        log.log("Exiting block...");
    }

    log.log("Exiting main...");

    log.dump();

    return 0;
}
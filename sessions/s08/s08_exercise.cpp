#include <coroutine>
#include <exception>
#include "logger.h"

template <typename T>
struct Generator {
    struct promise_type {
        T current_value;

        auto get_return_object() {
            return Generator{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }

        std::suspend_always yield_value(T value) {
            current_value = value;
            return {};
        }

        void return_void() {}

        void unhandled_exception() {
            throw;
        }
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle {};

    Generator(Handle h) : handle(h) {}
    ~Generator() {
        if (handle) {
            handle.destroy();
            handle = nullptr;
        }
    }

    Generator(const Generator&) = delete;
    Generator& operator=(const Generator&) = delete;

    Generator(Generator&& other) noexcept : handle(other.handle) {
        other.handle = nullptr;
    }
    Generator& operator=(Generator&& other) noexcept {
        if (this != &other) {
            if (handle) {
                handle.destroy();
            }
            handle = other.handle;
            other.handle = nullptr;
        }
        return *this;
    }

    bool next() {
        if (!handle || handle.done()) {
            return false;
        }

        try {
            handle.resume();
        } catch (...) {
            handle = nullptr;
            throw;
        }

        return !handle.done();
    }

    const T& value() {
        return handle.promise().current_value;
    }
};


Generator<int> range(int from, int to) {
    for (int i = from; i < to; ++i) {
        co_yield i;
    }
}

Generator<int> fibonacci(int n) {
    int a = 0, b = 1;
    for (int i = 0; i < n; ++i) {
        co_yield a;
        int next = a + b;
        a = b;
        b = next;
    }
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        auto gen_int = range(1, 6);
        while (gen_int.next()) {
            log.log("Generated value: " + std::to_string(gen_int.value()));
        }
    }

    log.log("-------------------------------------------------------------");

    {
        auto gen_fib = fibonacci(10);
        while (gen_fib.next()) {
            log.log("Fibonacci value: " + std::to_string(gen_fib.value()));
        }
    }
    
    log.log("Exiting main...");

    log.dump();

    return 0;
}
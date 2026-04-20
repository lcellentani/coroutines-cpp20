#include <cassert>
#include <coroutine>
#include <iostream>
#include <sstream>
#include <optional>

template<typename T>
struct Generator {
    struct promise_type {
        T current_value;
        std::optional<std::string> final_message;

        Generator get_return_object() {
            return Generator{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }
        std::suspend_always yield_value(T value) {
            current_value = value;
            std::cout << "[promise] yielding: " << current_value << "\n";
            return std::suspend_always{}; // pull model: always suspend, caller drives resumption
        }

       void return_value(std::string value) {
           final_message = value;
        }
        void unhandled_exception() {}
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle;

    explicit Generator(Handle h) : handle(h) {}
    ~Generator() {
        if (handle) handle.destroy();
    }

    bool next() {
        if (!handle || handle.done()) return false;
        handle.resume();  // ← resumes the coroutine from its last suspension point
        return !handle.done();
    }

    T value() const {
        return handle.promise().current_value;
    }

    std::string summary() const {
        assert(handle.done() && "summary() called before coroutine finished");
        return handle.promise().final_message.value();
    }
};

Generator<int> fibonacci(int start, int end) {
    int a = 0;
    int b = 1;

    int count = 0;
    while (a <= end) {
        if (a >= start) {
            count++;
            co_yield a; // yield Fibonacci numbers within the specified range
        }
        int next = a + b;
        a = b;
        b = next;
    }
    std::stringstream ss;
    ss << "Done: yielded " << count << " values";
    co_return ss.str();
}

Generator<std::string> summarize(int n) {
    co_await std::suspend_never{};

    for (int i = 0; i < n; ++i) {
        co_yield "Processing item " + std::to_string(i);
    }
    co_return "All items processed";
}

int main() {
    auto fib_gen = fibonacci(1, 8);
    while (fib_gen.next()) {
        std::cout << fib_gen.value() << std::endl; // prints Fibonacci numbers up to 100
    }
    std::cout << fib_gen.summary() << "\n"; // only valid here — after the loop

    auto summary_gen = summarize(5);
    while (summary_gen.next()) {
        std::cout << summary_gen.value() << std::endl; // prints processing messages
    }
    std::cout << summary_gen.summary() << "\n";
    return 0;
}
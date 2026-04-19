#include <coroutine>
#include <iostream>

struct SimpleGenerator {
    struct promise_type {
        long long current_value;

        SimpleGenerator get_return_object() {
            return SimpleGenerator{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }
        std::suspend_always yield_value(long long value) {
            current_value = value;
            return {}; // suspend after storing the value
        }

        void return_void() {}
        void unhandled_exception() {}
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle;

    explicit SimpleGenerator(Handle h) : handle(h) {}
    ~SimpleGenerator() {
        if (handle) handle.destroy();
    }

    bool next() {
        if (!handle || handle.done()) return false;
        handle.resume();  // ← resumes the coroutine from its last suspension point
        return !handle.done();
    }

    long long value() const {
        return handle.promise().current_value;
    }
};

// THE COROUTINE. This looks like a normal function, but it isn't.
// The compiler transforms it because of co_yield.
SimpleGenerator count_up(int from, int to) {
    for (int i = from; i <= to; ++i) {
        co_yield i; // ← suspend here, hand value to caller
                          // execution resumes at the NEXT iteration when next() is called
    }
    // implicit co_return at the end
}

std::pair<long long, long long> fibonacci_state_at(int index) {
    long long a = 0;
    long long b = 1;
    for (int i = 0; i < index; ++i) {
         long long next = a + b;
         a = b;
         b = next;
    }

    return {a, b};
}

SimpleGenerator fibonacci(long long a, long long b, long long end) {
    while (a <= end) {
        co_yield a; // yield Fibonacci numbers within the specified range

        long long next = a + b;
        a = b;
        b = next;
    }
}

int main() {
    auto generator = count_up(1, 5);
    while (generator.next()) {
        std::cout << generator.value() << "\n"; // prints 1, then 2, ..., up to 5
    }

    std::cout << "------------------------------------------" << std::endl;

    auto [fib_a, fib_b] = fibonacci_state_at(4);
    auto fib_gen = fibonacci(fib_a, fib_b, 100);
    while (fib_gen.next()) {
        std::cout << fib_gen.value() << "\n"; // prints Fibonacci numbers up to 100
    }
    return 0;
}
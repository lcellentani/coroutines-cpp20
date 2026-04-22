#include <coroutine>
#include <iostream>
#include <string>

template <typename T>
struct Generator {
    struct promise_type {
        T current_value;

        Generator get_return_object() {
            return Generator{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }
        std::suspend_always yield_value(T value) {
            current_value = value;
            return std::suspend_always{};
        }

        void return_void() {}

        void unhandled_exception() {}

        void* operator new(std::size_t size) {
            void* ptr = ::operator new(size);
            std::cout << "[frame] allocated " << size << " bytes at " << ptr << "\n";
            return ptr;
        }

        void operator delete(void* ptr, std::size_t size) {
            std::cout << "[frame] freed " << size << " bytes at " << ptr << "\n";
            ::operator delete(ptr);
        }
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle;

    explicit Generator(Handle h) : handle(h) {}
    ~Generator() {
        if (handle) handle.destroy();
    }

     bool next() {
        if (!handle || handle.done()) return false;
        handle.resume();
        return !handle.done();
     }

     T value() const {
        return handle.promise().current_value;
     }
};

Generator<int> single_local() {
    std::cout << "[single_local]: Starting work...\n";
    co_yield 1;
}

Generator<int> multi_local() {
    int i1 = 42;
    int i2 = 99;
    int i3 = 123;
    int i4 = 456;
    int i5 = 789;
    std::cout << "[multi_local]: Starting work...\n";
    co_yield 1;

    std::cout << "[multi_local]: resuming work...\n";
    co_yield (i1 + i2 + i3 + i4 + i5);
}

Generator<int> dangling_param(const std::string& s) {
    co_yield 1;
    std::cout << "[dangling_param]: Starting work with string: " << s << "\n";
    co_yield s.size();
}

int main() {
    std::cout << "------------------------------------------------------------------\n";
    auto single_gen = single_local();
    auto multi_gen = multi_local();

    std::cout << "[main] generators created\n";

    single_gen.next();
    std::cout << "[main] got value from single_local: " << single_gen.value() << "\n";

    while(multi_gen.next()) {
        std::cout << "[main] got value from multi_local: " << multi_gen.value() << "\n";
    }

    std::cout << "[main] loop done, gen going out of scope\n";

    std::cout << "\n------------------------------------------------------------------\n";
    std::cout << "Testing dangling_param with a temporary string...\n";
    auto dangling_gen = dangling_param(std::string{"temporary string"});

    dangling_gen.next();
    dangling_gen.next();

    return 0;
}
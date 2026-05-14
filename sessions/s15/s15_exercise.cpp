#include <coroutine>
#include <iostream>

struct Task {
    struct promise_type {
        Task get_return_object() {
            return Task{std::coroutine_handle<promise_type>::from_promise(*this)};
        }

        std::suspend_never initial_suspend() {
            return {};
        }

        std::suspend_never final_suspend() noexcept {
            return {};
        }

        void unhandled_exception() {
            std::terminate();
        }

        void return_void() {}
    };

    std::coroutine_handle<promise_type> handle;

    explicit Task(std::coroutine_handle<promise_type> handle) : handle(handle) {}
};

Task simple() {
    std::cout << "simple() running...\n";
    co_return;
}

//std::coroutine_handle<> g_handle;

int main() {
    std::cout << "Calling simple()...\n";
   
    simple();

    //Task t2 = simple();
    //g_handle = t2.handle;
    //g_handle.resume();

    std::cout << "Done.\n";

    return 0;
}
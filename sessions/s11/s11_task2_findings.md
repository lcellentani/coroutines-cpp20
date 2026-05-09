The following is the code snippet for Task 1

```cpp
#include <coroutine>
#include "logger.h"

struct NaiveAwaitable {
    std::coroutine_handle<> target;

    bool await_ready() const noexcept { return false; }

    void await_suspend(std::coroutine_handle<> /*caller*/) const noexcept {
        Logger::get_instance().log("[NaiveAwaitable] await_suspend - resuming target coroutine");
        target.resume();
    }

    void await_resume() const noexcept {
        Logger::get_instance().log("[NaiveAwaitable] await_resume - completed");
    }
};

struct SymmetricAwaitable {
    std::coroutine_handle<> target;

    bool await_ready() const noexcept { return false; }

    std::coroutine_handle<> await_suspend(std::coroutine_handle<> /*caller*/) const noexcept {
        Logger::get_instance().log("[SymmetricAwaitable] await_suspend - swapping caller and target");
        return target;  // Return the target to be resumed, caller will be suspended
    }

    void await_resume() const noexcept {
        Logger::get_instance().log("[SymmetricAwaitable] await_resume - completed");
    }
};

struct Task {
    struct promise_type {
        auto get_return_object() {
            return Task{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        std::suspend_never final_suspend() noexcept { return {}; }

       void return_void() {}

        void unhandled_exception() {
            Logger::get_instance().log("[promise_type] unhandled_exception - terminating");
            std::terminate();
        }
    };

    std::coroutine_handle<promise_type> handle;

    explicit Task(std::coroutine_handle<promise_type> h) : handle(h) {}
    ~Task() { if (handle) handle.destroy(); }

        // Non-copyable
    Task(const Task&) = delete;
    Task& operator=(const Task&) = delete;
};

Task chain(int depth, int max_depth) {
    Logger::get_instance().log("[chain] depth: ", depth);

    if (depth % 1000 == 0)
        std::cout << "depth: " << depth << "\n" << std::flush;  // flush immediately, bypass logger

    if (depth < max_depth) {
        Task next = chain(depth + 1, max_depth);
        auto raw = next.handle;
        next.handle = {};  // Release ownership — frame self-destructs via suspend_never, prevent double-free
        co_await SymmetricAwaitable{ raw };
    }
    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        Task t = chain(0, 10000);
        t.handle.resume();
    }

    log.log("Exiting main...");
    log.dump();
    return 0;
}

```

The output when max_depth is set to 10000 will be:
```
...
[19992] [chain] depth: 9995
[19993] [SymmetricAwaitable] await_suspend - swapping caller and target
[19994] [chain] depth: 9996
[19995] [SymmetricAwaitable] await_suspend - swapping caller and target
[19996] [chain] depth: 9997
[19997] [SymmetricAwaitable] await_suspend - swapping caller and target
[19998] [chain] depth: 9998
[19999] [SymmetricAwaitable] await_suspend - swapping caller and target
[20000] [chain] depth: 9999
[20001] [SymmetricAwaitable] await_suspend - swapping caller and target
[20002] [chain] depth: 10000
[20003] Exiting main...
```
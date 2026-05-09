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

struct Task {
    struct promise_type {
        auto get_return_object() {
            return Task{ std::coroutine_handle<promise_type>::from_promise(*this) };
        }

        std::suspend_always initial_suspend() { return {}; }
        std::suspend_always final_suspend() noexcept { return {}; }

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
    if (depth < max_depth) {
        Task next = chain(depth + 1, max_depth);
        co_await NaiveAwaitable{ next.handle };
    }
    co_return;
}

int main() {
    auto& log = Logger::get_instance();
    log.log("Entering main...");

    {
        Task t = chain(0, 10);
        t.handle.resume();
    }

    log.log("Exiting main...");
    log.dump();
    return 0;
}
```

The output when max_depth is set to 10 will be:
```
[1] Entering main...
[2] [chain] depth: 0
[3] [NaiveAwaitable] await_suspend - resuming target coroutine
[4] [chain] depth: 1
[5] [NaiveAwaitable] await_suspend - resuming target coroutine
[6] [chain] depth: 2
[7] [NaiveAwaitable] await_suspend - resuming target coroutine
[8] [chain] depth: 3
[9] [NaiveAwaitable] await_suspend - resuming target coroutine
[10] [chain] depth: 4
[11] [NaiveAwaitable] await_suspend - resuming target coroutine
[12] [chain] depth: 5
[13] [NaiveAwaitable] await_suspend - resuming target coroutine
[14] [chain] depth: 6
[15] [NaiveAwaitable] await_suspend - resuming target coroutine
[16] [chain] depth: 7
[17] [NaiveAwaitable] await_suspend - resuming target coroutine
[18] [chain] depth: 8
[19] [NaiveAwaitable] await_suspend - resuming target coroutine
[20] [chain] depth: 9
[21] [NaiveAwaitable] await_suspend - resuming target coroutine
[22] [chain] depth: 10
[23] Exiting main...
```
## What we're building
An async task runner that can execute multiple interdependent coroutines concurrently.
That word "interdependent" is the hard part. Concurrent coroutines that are independent is just "run multiple coroutines and wait for all." Interdependence means: task B can declare that it depends on task A, and the runner enforces that B doesn't start until A is complete.
In game engine terms: this is a job graph. You have it in Frostbite. Asset decompression depends on I/O completion. Shadow rendering depends on depth prepass. The scheduler respects those edges.

### 1. How does a task declare its dependencies?
The coroutine expresses its own dependencies. The runner doesn't need to know the graph topology upfront.

### 2. How does the runner drive execution?
One thread per task keeps the scheduler logic simple so we can focus on the coroutine design.

### 3. What does a task's return type look like?
The runner holds a map from task_id → task_handle. When a task completes, it notifies any waiting coroutines.

## The components we need to build
| Component | What it does |
|--------|---------|
| `TaskId` | An identifier for a registered task — probably just a string or integer |
| `TaskRunner` | An identifier for a registered task — probably just a string or integer |
| `WaitFor` awaitable | Returned by `runner.wait_for(id)` — suspends the caller until the target task completes |
| `Task<void>` | Already built in S13 — reuse with minimal changes |
| Completion signalling | When a task finishes, it must wake up all coroutines waiting on it |

## TaskRunner Design
```cpp
class TaskRunner {
public:
    TaskId add(std::string name, Task<void> task);

    // Returns true if already complete (caller should resume immediately), false if registered (caller should not resume).
    bool try_register_waiter(TaskId id, std::coroutine_handle<> handle);
    WaitFor wait_for(TaskId id);

    void mark_complete(TaskId id);
    bool is_complete(TaskId id) const;

    void run_all();

private:
    std::unordered_map<TaskId, Task<void>> tasks_;

    std::unordered_map<TaskId, std::vector<std::coroutine_handle<>>> waiters_;
    std::unordered_set<TaskId> completed_;

    std::mutex state_mutex_;
};
```

## WaitFor awaitable Design
```cpp
struct WaitFor {
    TaskRunner& runner;
    TaskId id;

    bool await_ready() const noexcept {
        return runner.is_complete(id);
    }

    void await_suspend(std::coroutine_handle<> handle) {
        if (!runner.try_register_waiter(id, handle))
            handle.resume();
    }

    void await_resume() const noexcept {}
};
```
## Walk through the full sequence of events from "task A finishes" to "task B resumes." Step by step.

1. **Task B Suspends**: Task B executes `co_await runner.wait_for(id_a)`. Because Task A isn't done, `await_ready` returns `false`. `await_suspend` is called, Task B’s handle is pushed into `waiters_[id_a]`, and Task B goes dormant.
2. **Task A Reaches the End**: Task A finishes its logic and hits a `co_return` or the closing brace. The compiler transforms this into a call to `promise.final_suspend()`.
3. **The Signal**: Task A's `promise_type` needs a way to talk back to the `TaskRunner`. In `final_suspend`, the promise should return a custom `FinalAwaiter`. This awaiter's `await_suspend` method will call `runner.mark_complete(id_a)`.
4. **The Runner Updates State**: Inside TaskRunner::mark_complete(id_a): (a) it adds `id_a` to the `completed_` set. (b) it looks into the `waiters_ map` for `id_a`.
5. **Notification**: The runner finds the list of handles waiting on Task A (which includes Task B). It iterates through this list. For each handle, it triggers resumption calling handle.resume().
6. **Task B Wakes Up**: Task B's handle is resumed. Execution returns to the `WaitFor` awaitable. Since `await_suspend` has already finished, Task B proceeds directly to `await_resume()`.
7. **Task B Continues**: Task B's `await_resume` (which returns void) finishes, and Task B continues executing the line of code immediately following the `co_await` call.

## Thread safety question: We have multiple coroutines potentially accessing runner.waiters_ concurrently. Do we need a mutex? Where?

The TaskRunner holds a mutex too coordinate access to `waiters_` map and `completed_` set.

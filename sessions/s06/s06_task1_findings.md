# 1. removed unhandled_exception()

C:/DEV/coroutines-cpp20/sessions/s06/s06_exercise.cpp:37:6: error: 'promise_type' is required to declare the member 'unhandled_exception()'
   37 | Task example_coroutine() {
      |      ^
C:/DEV/coroutines-cpp20/sessions/s06/s06_exercise.cpp:7:12: note: 'promise_type' defined here
    7 |     struct promise_type {
      |            ^
1 error generated.
ninja: build stopped: subcommand failed.

# 2. removed return_void()

C:/DEV/coroutines-cpp20/sessions/s06/s06_exercise.cpp:40:5: error: no member named 'return_void' in 'Task::promise_type'
   40 |     co_return;
      |     ^~~~~~~~~
1 error generated.

# 3. removed final_suspend()

C:/DEV/coroutines-cpp20/sessions/s06/s06_exercise.cpp:37:6: error: no member named 'final_suspend' in 'Task::promise_type'
   37 | Task example_coroutine() {
      |      ^~~~~~~~~~~~~~~~~
1 error generated.

# 4. removed initial_suspend()

C:/DEV/coroutines-cpp20/sessions/s06/s06_exercise.cpp:37:6: error: no member named 'initial_suspend' in 'Task::promise_type'
   37 | Task example_coroutine() {
      |      ^~~~~~~~~~~~~~~~~
1 error generated.

# 5. removed get_return_object()

C:/DEV/coroutines-cpp20/sessions/s06/s06_exercise.cpp:37:6: error: no member named 'get_return_object' in 'Task::promise_type'
   37 | Task example_coroutine() {
      |      ^~~~~~~~~~~~~~~~~
1 error generated.
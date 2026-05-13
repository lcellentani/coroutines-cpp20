# C++20 Coroutines — Learning Track
> **Project file.** Load this at the start of every session to establish context. Append a session log entry at the end after each session.

---

## 🎯 Course Objective

Demystify C++20 Coroutines through progressive, hands-on lessons — moving from conceptual understanding of suspension points to implementing custom coroutine types and integrating them with asynchronous I/O.

**Target audience:** Ludovico Cellentani — Technical Director at EA / Frostbite, 25+ years of C++ experience, game engine background.  
**Assumed baseline:** Deep familiarity with C++ (templates, move semantics, memory model), solid understanding of async patterns (threads, callbacks, futures), game engine architecture.  
**What this course is NOT:** An intro to C++. We skip basics and go straight to the interesting parts.

---

## 📐 Pedagogical Contract

- **No hand-holding.** Explanations are direct and precise.
- **Analogies first, mechanics second.** A good mental model beats a wall of spec text.
- **Every concept earns a working exercise.** Theory without code is trivia.
- **Game engine context.** Where possible, examples and exercises are grounded in game dev reality (frame loops, asset streaming, job systems).
- **English corrections are welcome.** Flag awkward phrasing, suggest better alternatives, stay constructive.

---

## ⏱️ Session Structure & Pace

**Target duration:** 45–60 minutes of focused work per session.  
**Throughput:** One curriculum row per session — one topic, one exercise.  
**Exception:** Phase 4 topics are broader. The capstone (4.5) spans 2–3 sessions.  
**Estimated total:** ~20 sessions to complete the full course (S01–S20).

### Standard session flow

| Step | Activity | Time |
|------|----------|------|
| 1 | Load this file, confirm resume point from session log | 2 min |
| 2 | Concept explanation with analogy | ~10 min |
| 3 | Code walkthrough — annotated example | ~10 min |
| 4 | Exercise — your own implementation at keyboard | ~25–30 min |
| 5 | Debrief, Q&A, update session log | ~5 min |

### Ground rules
- **If the concept isn't solid, we don't move to the exercise.** Ask questions. Push back. The schedule is a guide, not a contract.
- **Paste your exercise code into the chat.** Review and feedback are part of the session, not optional extras.
- **If a session runs long, we stop at a clean boundary** — end of concept explanation or end of exercise — never mid-thought. The log records exactly where to resume.

---

## 💾 Context Management

Claude has no memory between chats. This section defines how to maintain continuity across chats within a session and across sessions.

### Default: one chat per session (Strategy A)

For most sessions, one chat is enough. Open a new chat, paste this project file, add one orientation line, and go:

> *"We are on session S03. The concept was explained last time. We are starting the exercise."*

That single line, combined with the session log below, gives Claude everything it needs. Close the chat only after updating the session log.

---

### Interrupted session: snapshot file (Strategy B)

If a session is cut short unexpectedly, write a brief snapshot before closing. Paste both this project file and the snapshot at the start of the next chat.

**Snapshot template:**
```markdown
## Session Snapshot — S[N] (interrupted)
**Stopped at:** [e.g. "analogy section, before code walkthrough"]
**Open questions:** [anything raised but not yet answered]
**Next chat should:** [one line instruction]

// Any relevant code in progress
```

Use this only when needed. Don't generate snapshots routinely.

---

### Multi-chat lesson: lesson file (Strategy C)

For sessions that deliberately span multiple chats — the capstone (S18–S20) and any Phase 4 session that runs long by design — maintain a dedicated lesson file. Open each chat with both this project file and the lesson file.

**Lesson file template:**
```markdown
## Lesson S[N] — [Title]
**Chat 1 completed:** [what was done]
**Chat 2 completed:** [what was done]
**Current code state:**
// Full current implementation here

**Next chat:** [specific starting point and goal]
**Open threads:** [unresolved questions or design decisions]
```

Update the lesson file at the end of each chat within the lesson. When the lesson is complete, its summary moves into the session log below and the lesson file is retired.

---

### Quick reference

| Situation | Strategy | Files to load |
|-----------|----------|---------------|
| Normal session start | A | Project file + one orientation line |
| Resuming an interrupted session | B | Project file + snapshot file |
| Multi-chat lesson (capstone) | C | Project file + lesson file |

---

## 🗺️ Curriculum Map

### Phase 1 — The Foundation: Conceptual Mapping
*Goal: Build a rock-solid mental model before touching any coroutine machinery.*

| # | Topic | Session | Status |
|---|-------|---------|--------|
| 1.1 | What is a coroutine? The "bookmarkable function" mental model | S01 | ✅ Completed |
| 1.2 | The three keywords: `co_await`, `co_yield`, `co_return` | S02 | ✅ Completed |
| 1.3 | Stack frames vs. coroutine frames — where does the state live? | S03 | ✅ Completed |
| 1.4 | **Exercise:** Trace the execution flow of a basic generator | S04 | ✅ Completed |

---

### Phase 2 — The Plumbing: The Promise Object
*Goal: Understand the machinery the compiler generates. No more magic boxes.*

| # | Topic | Session | Status |
|---|-------|---------|--------|
| 2.1 | `std::coroutine_handle<>` — a pointer to a suspended coroutine | S05 | ✅ Completed |
| 2.2 | The `promise_type` contract: what the compiler expects from you | S06 | ✅ Completed |
| 2.3 | Lifecycle methods: `get_return_object`, `initial_suspend`, `final_suspend`, `unhandled_exception` | S07 | ✅ Completed |
| 2.4 | **Exercise:** Build `Generator<T>` from scratch — yields a sequence of integers | S08 | ✅ Completed |

---

### Phase 3 — The Awaitable Pattern
*Goal: Shift focus from the coroutine to the objects it awaits. This is where real power lies.*

| # | Topic | Session | Status |
|---|-------|---------|--------|
| 3.1 | The `Awaitable` concept: `await_ready`, `await_suspend`, `await_resume` | S09 | ✅ Completed |
| 3.2 | `await_suspend` return types — void, bool, and handle (symmetric transfer) | S10 | ✅ Completed |
| 3.3 | Symmetric transfer and tail-call optimization — avoiding stack overflow | S11 | ✅ Completed |
| 3.4 | Thread switching via `await_suspend` | S12 | ✅ Completed |
| 3.5 | **Exercise:** Build a `Sleep` awaitable — suspend and resume after a timer | S13 | ✅ Completed |

---

### Phase 4 — Practical Integration & Performance
*Goal: Ship something real. Understand the costs and how to control them.*

| # | Topic | Session | Status |
|---|-------|---------|--------|
| 4.1 | Integrating with event loops — libuv and Asio patterns | S14 | ✅ Completed |
| 4.2 | HALO — Heap Allocation Elision Optimization: what it is and when it fails | S15 | ⬜ Not started |
| 4.3 | Memory management: coroutine frame size, custom allocators | S16 | ⬜ Not started |
| 4.4 | Cancellation patterns — cooperative cancellation without UB | S17 | ⬜ Not started |
| 4.5 | **Capstone:** Async task runner — concurrent interdependent coroutines | S18–S20 | ⬜ Not started |

---

## 📋 Session Log

> Each session appends one entry here. Format: date, topics covered, exercises completed, key takeaways, next session starting point.

---

### S00 — Environment Setup
**Date:** 2026-04-18
**Type:** Setup session — no curriculum content covered

**Completed:**
- Designed and created this project file — objective, pedagogical contract, session structure, context management strategies
- Defined the full curriculum map with session numbering (S01–S20)
- Created the CMake project structure: root `CMakeLists.txt`, `cmake/session.cmake` helper, session stubs S01–S04
- Verified full toolchain on Windows: CMake 4.3.1, Clang 22.1.3 (MSVC backend), Ninja 1.13.2, Git 2.53.0
- Confirmed C++20 coroutines compile and run correctly (`s01_exercise.exe` prints expected output)
- Established Git Bash as the default terminal in VS Code

**Key decisions:**
- One chat per session as the default (Strategy A); snapshot and lesson files on demand only
- Git Bash preferred over PowerShell — Unix commands work as documented, no translation needed
- Ninja chosen as the CMake generator — faster and simpler than MSBuild on Windows
- Clang targeting the MSVC backend (`x86_64-pc-windows-msvc`) — correct and expected for LLVM on Windows

**Nothing left open.**

**Next session:** S01 — *What is a coroutine? The "bookmarkable function" mental model.*
Load this project file and paste: `"Starting S01 from the beginning."`

---

### S01 — What is a coroutine? The "bookmarkable function" mental model
**Date:** 2026-04-19
**Curriculum:** 1.1 (conceptual mapping + keyword overview)
**Status:** ✅ Complete

**Completed:**
- Coroutine mental model: state survives suspension, frame lives on the heap
- The three keywords: `co_yield`, `co_await`, `co_return` — inference rule
- Built `SimpleGenerator` with correct `next()` guard and `const value()`
- Implemented `fibonacci()` coroutine with range parameters
- Investigated Option 3: `fibonacci_state_at(int index)` as a plain function
- Fixed index-as-value bug in first `fibonacci_state_at` attempt
- Wired up `fibonacci_state_at` + `fibonacci` coroutine cleanly in `main()`

**Key takeaways:**
- A function becomes a coroutine by inference — no keyword, just `co_yield`/`co_await`/`co_return` in the body
- Coroutine local state lives in a heap-allocated frame, survives every suspension
- If a helper function never needs to suspend, it should be a plain function — not a coroutine
- Coroutines should express flow, not policy — push starting-state decisions to the caller

**Next session:** S02 — The three keywords in depth: co_await, co_yield, co_return
Load project file and paste: `"Starting S02 from the beginning."`

---

### S02 — The Three Keywords: co_await, co_yield, co_return
**Date:** 2026-04-20
**Curriculum:** 1.2
**Status:** ✅ Complete

**Completed:**
- Explained the three keywords: `co_yield` (outbound pause), `co_await` (inbound pause), `co_return` (exit)
- Covered the `co_yield` desugaring: `co_yield` expr → `co_await` `promise.yield_value(expr)`
- Covered the compiler transformation: suspended coroutine as a state machine with a heap-allocated frame
- Task 1: instrumented yield_value with logging — pull model interleaving made visible
- Task 2: switched from `return_void` to `return_value(std::string)`; stored final message in promise via `std::optional`; exposed via `summary()` with `assert(handle.done())` guard
- Task 3: generalised `SimpleGenerator` into `Generator<T>`; implemented `summarize()` using all three keywords; confirmed `co_await` `std::suspend_never{}` is a runtime no-op

**Key takeaways:**
- `co_yield` desugars to `co_await` on the promise — yield behavior is fully user-defined
- `co_await` suspend_never: `await_ready()` returns true, suspension is skipped entirely, no control transfer
- `std::optional` used as "not yet set" sentinel has a design smell: callers cannot distinguish "not finished" from "no value"; assert on `handle.done()` is the right guard
- `Generator<T>` hardcodes TReturn as `std::string` — a second template parameter TReturn would make it fully general
- Dead code (`SimpleGenerator`) should be deleted once superseded

**Next session:** S03 — Stack frames vs. coroutine frames: where does the state live?
Load project file and paste: `"Starting S03 from the beginning."`

---

### S03 — Stack frames vs. coroutine frames — where does the state live?
**Date:** 2026-04-22
**Curriculum:** 1.3
**Status:** ✅ Complete

**Completed:**
- Explained the difference between stack frames and coroutine frames, exploring how functions and coroutines handle context allocation differently.
- Contrasted the stack model and the heap model to see in practice where functions and coroutines diverge in context management.
- Explored the conceptual model the compiler generates when transforming a coroutine into a heap-allocated state machine.
- Task 1: Tracked frame allocation and deallocation timing by overriding `operator new`/`operator delete` on the promise type. Confirmed the frame is allocated at coroutine construction and freed only at `handle.destroy()`, decoupled from any call stack lifetime.
- Task 2: Verified in practice how frame size grows in relation to the presence or absence of locals that survive a suspension point.
- Task 3: Reproduced the dangling reference trap — passing a const ref to a temporary that is destroyed before the coroutine resumes. Observed silent UB (empty string output) in a Debug build.

**Key takeaways:**
- The heap is the mechanism; `handle.destroy()` is the policy. The RAII destructor enforces that policy. The call stack that created the coroutine has no claim on when the frame dies.
- Locals that cross a suspension point are promoted into the coroutine frame and cost frame space. Locals that don't cross a suspension point may remain on the stack (compiler-dependent; more likely in optimized builds).
- LIFO destruction order applies to the `Generator` handles in `main()` — last constructed, first destroyed — because they are ordinary local variables. This is standard C++, not a coroutine-specific rule.
- Coroutine parameters need special attention when references are involved. What is copied into the frame is the reference itself, not the referent. If the referent's lifetime ends while the coroutine is suspended, the reference dangles. Fix: take by value so the frame owns the data.

**Next session:** S04 — Exercise: Trace the execution flow of a basic generator
Load project file and paste: `"Starting S04 from the beginning."`

---

### S04 — **Exercise:** Trace the execution flow of a basic generator
**Date:** 2026-04-25
**Curriculum:** 1.4
**Status:** ✅ Complete

**Completed:**
- Instrumented `Generator<T>` at every meaningful lifecycle point: `operator new`/`operator delete`, `get_return_object`, `initial_suspend`, `yield_value`, `return_void`, `final_suspend`, `next()`, `value()`, and the `Generator` constructor/destructor.
- Added a deferred `Logger` singleton that accumulates entries and dumps them in order at the end of `main()`, giving a clean chronological trace without interleaved `cout` noise.
- Iterated on `main()` to add `value()` calls and coroutine-body log entries (`after first yield`, etc.), making the caller/coroutine ping-pong fully visible.
- Answered all four debrief questions from the trace.

**Key takeaways:**
- Frame allocation and `get_return_object` are compiler-generated preamble that run before the `Generator` object lands in `main()`. The sequence is visible in the log (allocate → `get_return_object` → constructor) but there is no observable gap a caller can exploit.
- `initial_suspend` is not part of the coroutine body. It is promise preamble. The body's first instruction only executes on the first explicit `resume()` call. This is the lazy model; `suspend_never` would be eager.
- When `handle.resume()` is called, the thread enters the coroutine and runs until the next suspension point. `yield_value` fires inside that run, before control returns to `next()`. The caller is blocked for the entire duration.
- The frame outlives the pump loop. `final_suspend` returning `suspend_always` keeps the coroutine suspended rather than self-destructing. The RAII destructor in `~Generator()` is the sole trigger for `handle.destroy()` and the subsequent frame deallocation.

**Next session:** S05 — `std::coroutine_handle<>`: a pointer to a suspended coroutine.
Load project file and paste: `"Starting S05 from the beginning."`

---

### S05 — `std::coroutine_handle<>`: a pointer to a suspended coroutine
**Date:** 2026-04-28
**Curriculum:** 2.1
**Status:** ✅ Complete

**Completed:**

- Explained `coroutine_handle<P>` as a non-owning typed pointer to a coroutine frame — no refcounting, no destructor logic, explicit ownership required.
- Covered the type family: `coroutine_handle<P>` (typed, `.promise()` available) vs `coroutine_handle<void>` (type-erased, drive-only).
- Covered the full operation set: `resume()`, `done()`, `destroy()`, `promise()`, `address()`, `from_promise()`, `from_address()`, and `operator bool`.
- Explained the compiler frame layout: two function pointers (`__resume_fn`, `__destroy_fn`) plus the promise plus promoted locals — `coroutine_handle` is just a pointer to that struct.
- Introduced `noop_coroutine()` — filed for S10–S11 (symmetric transfer).
- Q1: Confirmed handle address is stable across `resume()` calls — the frame is a pinned heap allocation.
- Q2: Confirmed promise is accessible after `done()` but before `destroy()`. Demonstrated post-destroy read returns MSVC debug fill pattern (`0xDDDDDDDD`) — UB in production. Fixed by nulling the handle after `destroy()`.
- Q3: Constructed `coroutine_handle<void>` via implicit conversion. Confirmed address equality. Used typed handle for value access, erased handle for driving — demonstrated the capability split at the type level.
- Part 2: Full `address()` → `void*` → `from_address()` → typed handle round-trip. Drove the generator entirely from the reconstructed handle. Flagged dual-handle ownership risk — two handles to one frame, one must be the sole destroyer.

**Key takeaways:**

- `coroutine_handle` is a `void*` with typed operations — same size, same cost, no hidden machinery.
- Type erasure to `coroutine_handle<void>` removes `.promise()` at compile time. The frame is unchanged; you've only discarded the type needed to interpret it.
- `from_address()` reconstructs a fully capable typed handle from a raw pointer — the async callback pattern in miniature.
- Ownership is not enforced by the type. Two handles to the same frame is valid but dangerous. Designate one owner; treat all others as borrowed.
- Safe preconditions: `resume()` requires suspended and not done; `destroy()` requires suspended (including at `final_suspend`). Violating either is UB.

**Next session:** S06 — The promise_type contract: what the compiler expects from you.
Load project file and paste: `"Starting S06 from the beginning."`

---

### S06 — The `promise_type` contract: what the compiler expects from you
**Date:** 2026-04-29
**Curriculum:** 2.2
**Status:** ✅ Complete

**Completed:**

- Explored the `promise_type` concept and its role in the coroutine model: the interface between the caller-facing wrapper type and the compiler-generated state machine.
- Examined the compiler-generated coroutine transform in detail to understand at which point each `promise_type` method is invoked.
- Covered the full `promise_type` interface: `get_return_object()`, `initial_suspend()`, `final_suspend()`, `return_void()`/`return_value()`, `unhandled_exception()`, `yield_value()`, and the optional extensions (`operator new`/`delete`, `await_transform`).
- Task 1: Removed each required method one at a time and documented the compiler errors. Observed that `initial_suspend`, `final_suspend`, and `get_return_object` are validated at the function signature — before the body runs — while `return_void` is flagged at the `co_return` call site. `unhandled_exception` produces a distinct "required to declare" diagnostic because it is structural rather than a direct call-site lookup.
- Task 2: Swapped `final_suspend` between `suspend_always` and `suspend_never` to observe the ownership and lifetime implications. Confirmed that `suspend_never` causes the frame to be deleted synchronously inside the coroutine before it returns to the caller, leaving the wrapper holding a dangling handle. Demonstrated the resulting UB via segfault and log trace. Attempted AddressSanitizer but hit a Windows CRT mismatch issue (`_ITERATOR_DEBUG_LEVEL`); segfault and log trace were sufficient evidence.
- Task 3: Implemented `unhandled_exception` to store the exception via `std::current_exception()`, and exposed a `get()` method on the wrapper type to rethrow it at the call site. Verified the full exception round-trip: throw inside coroutine → captured in promise → rethrown in `main` → caught and logged correctly.
- Discovered that removing `co_return` from a coroutine body that contains no other coroutine keywords silently demotes the function to a regular function. The exception then propagates directly up the call stack instead of being routed through `unhandled_exception`.

**Key takeaways:**

- `promise_type` is the interface between two distinct consumers: the caller (via the wrapper type) and the compiler (via the generated state machine). Neither talks directly to the other — the promise mediates.
- `suspend_never` at `final_suspend` transfers frame ownership back to the coroutine itself, which deletes it immediately. Any handle held by the caller 
  after this point is dangling. `suspend_always` keeps the frame alive and makes the RAII destructor the sole cleanup point — the correct pattern for handle-based coroutine types.
- The `if (handle)` guard in a destructor does not protect against use-after-free. `operator bool` on a `coroutine_handle` checks for a non-null pointer, not for a live frame.
- Exception propagation across coroutine boundaries does not follow the normal stack-unwinding model. The compiler wraps the coroutine body in a try/catch; `unhandled_exception` is the catch handler. Storing via `std::exception_ptr` and rethrowing at the call site is the standard pattern.
- A function body must contain at least one coroutine keyword (`co_await`, `co_yield`, `co_return`) to be treated as a coroutine by the compiler. Without one, the function is a normal function — no promise, no frame, no `unhandled_exception` routing. An unreachable `co_return` at the end of a throwing coroutine is the standard idiom to preserve coroutine status.
- In game development, exceptions are typically disabled (`-fno-exceptions`) due to binary size overhead, unpredictable latency, and real-time constraints. In production coroutine code, `std::exception_ptr` would likely be replaced by an error code or `std::variant<T, Error>`.

**Next session:** S07 — Lifecycle methods: `get_return_object`, 
`initial_suspend`, `final_suspend`, `unhandled_exception`.
Load project file and paste: `"Starting S07 from the beginning."`

---

### S07 — Lifecycle methods: `get_return_object`, `initial_suspend`, `final_suspend`, `unhandled_exception`
**Date:** 2026-05-01
**Curriculum:** 2.3
**Status:** ✅ Complete

**Completed:**

- Deep-dived all four lifecycle methods: timing, design space, and consequences of each choice.
- Ran all four combinations of `initial_suspend` / `final_suspend`, confirmed execution order empirically with an instrumented logger.
- Task 2: Isolated the eager vs. lazy distinction — confirmed "First line of coroutine body" flips relative to "Back in main" depending solely on `initial_suspend` return value.
- Task 3: Observed `handle.done()` returning `false` on a freed frame. Confirmed this is silent UB — the allocator hadn't overwritten the memory yet, producing a plausible but meaningless result.
- Task 4: Implemented all three `unhandled_exception` strategies. Strategy 1 (store + rethrow): clean lifecycle, `final_suspend` reached, RAII destructor fires safely. Strategy 2 (`std::terminate()`): confirmed it cannot be caught — hard process abort, not an exception. Strategy 3 (`throw;`): exception surfaces at `resume()` call site but `final_suspend` is never reached; frame is in indeterminate state; handle must be nulled in the catch block before destructor fires.

**Key takeaways:**

- `get_return_object` runs before the body. The wrapper must be constructable in a not-yet-started state.
- `initial_suspend` and `final_suspend` are coupled decisions. Safe default for handle-owning wrappers: `suspend_always` / `suspend_always`.
- `handle.done()` on a freed frame returns garbage without crashing — the silent wrong-answer form of UB.
- `throw;` in `unhandled_exception` skips `final_suspend`. Any cleanup or signalling that `final_suspend` would have done is silently lost.
- `std::terminate()` bypasses the entire exception mechanism. It is the correct choice when exceptions are disabled or when the condition represents a hard contract violation.

**Next session:** S08 — Build `Generator<T>` from scratch — yields a sequence of integers.
Load project file and paste: `"Starting S08 from the beginning."`

---

### S08 — Exercise: Build `Generator<T>` from scratch
**Date:** 2026-05-02
**Curriculum:** 2.4
**Status:** ✅ Complete

**Completed:**
- Implemented `Generator<T>` from scratch with no scaffolding: full `promise_type`, move-only wrapper, lazy initial suspend, `suspend_always` at final suspend, RAII frame ownership.
- Implemented `range(int from, int to)` — half-open `[from, to)` range — and `fibonacci(int n)` — first n Fibonacci numbers.
- Applied two post-review fixes: `value()` changed from `T` to `const T&`; `next()` wrapped in `try/catch(...)` to null the handle before rethrowing on exception, preventing double-free when `throw;` in `unhandled_exception` skips `final_suspend`.
- Verified range boundary with `range(1, 6)` → confirmed half-open semantics were correct by design, not coincidence.

**Key takeaways:**
- `throw;` in `unhandled_exception` frees the frame before the exception reaches the caller. The destructor's `if (handle)` guard gives false safety — it checks for null, not liveness. The fix is to null the handle proactively in the catch block inside `next()`.
- `catch (const std::exception&)` is wrong for cleanup handlers. Use `catch (...)` when the goal is intercept-cleanup-rethrow, not inspection.
- The double-free bug only manifests on the exception path — the normal path looks correct. Bugs that require two simultaneous code paths to reason about are the ones that survive code review.
- `const T&` is the right return type for `value()` — avoids a copy on every call; the referent is stable until the next `next()` invocation.

**Next session:** S09 — The Awaitable concept: `await_ready`, `await_suspend`, `await_resume`.
Load project file and paste: `"Starting S09 from the beginning."`

---

### S09 — The Awaitable Pattern: `await_ready`, `await_suspend`, `await_resume`
**Date:** 2026-05-03
**Curriculum:** 3.1
**Status:** ✅ Complete

**Completed:**
- Covered the three awaitable methods: `await_ready`, `await_suspend`, `await_resume` — their call order, return type variants for `await_suspend` (`void`, `bool`, `coroutine_handle<>`), and the role of each.
- Task 1: Implemented `ReadyAwaitable` — `await_ready` returns `true`, suspension skipped entirely, `await_resume` fires inline. Confirmed via log trace that `await_suspend` never appears in output. Also refactored the coroutine wrapper from `Generator<T>` to a proper `Task` type unprompted.
- Task 2: Implemented `DeferredAwaitable` — `await_ready` returns `false`, `await_suspend` calls `handle.resume()` synchronously, producing a round-trip on the same call stack. Confirmed via log trace: `await_resume` fires nested inside `await_suspend` before it returns.

**Key takeaways:**
- `await_ready = true` bypasses suspension entirely. `await_resume` is still called — it is always the final step of a `co_await` expression, suspension or not. It is the only method that can produce a value from an awaitable.
- `await_suspend` with a `void` return and an internal `handle.resume()` call produces a synchronous round-trip. The coroutine resumes and runs to its next suspension point before `await_suspend` returns. This nests frames on the caller's stack — the problem symmetric transfer solves.
- Symmetric transfer (`await_suspend` returning `coroutine_handle<>`) makes the resume a tail call, keeping stack depth constant regardless of chain length. Critical for job systems with deep coroutine dependencies.
- `await_resume`'s return type is the type of the entire `co_await` expression. The caller captures it as a normal value.

**Next session:** S10 — `operator co_await` and the Awaiter vs. Awaitable distinction.
Load project file and paste: `"Starting S10 from the beginning."`

---

### S10 — `operator co_await` and the Awaiter vs. Awaitable distinction
**Date:** 2026-05-05
**Curriculum:** 3.2
**Status:** ✅ Complete

**Completed:**
- Covered the Awaiter vs. Awaitable distinction: an awaiter implements the three methods directly; an awaitable is any object from which an awaiter can be obtained via `operator co_await` (member or free function) or `await_transform` on the promise.
- Covered the compiler's `co_await` lookup chain: `await_transform` → free `operator co_await` → member `operator co_await` → expr is the awaiter directly.
- Task 1: Implemented `TimedResult` with a member `operator co_await()` returning a `ValueAwaiter`. Confirmed `await_suspend` is never called when `await_ready = true` — absent from trace. Learned that Clang requires all three awaiter methods at compile time regardless of runtime reachability; empty `await_suspend` with a comment is the correct pattern.
- Task 2: Implemented `Delay` as pure data with no methods. Wrote a free function `operator co_await(Delay)` returning an `Awaiter` that suspends and resumes synchronously. Confirmed via log trace: `await_suspend` fires, calls `h.resume()` synchronously, `await_resume` fires nested inside it before `await_suspend` returns, coroutine body completes, then `await_suspend` unwinds.

**Key takeaways:**
- The awaiter interface is structural and fully validated at compile time. All three methods are required even when `await_ready = true` makes `await_suspend` dead code. Clang enforces this strictly.
- `operator co_await` as a free function lets you make any type awaitable without modifying it. The type is pure data; the suspension mechanics live entirely outside it.
- The synchronous round-trip pattern (`await_ready = false` + `h.resume()` inside `await_suspend`) nests the coroutine's continuation inside the `await_suspend` call frame. The log sequence makes this visible: suspend → resume → resume-body → unwind.
- `await_transform` on the promise is the intercept point for executor frameworks — every `co_await` in a coroutine goes through it. Deferred to Phase 4.

**Next session:** S11 —  Symmetric transfer and tail-call optimization — avoiding stack overflow.
Load project file and paste: `"Starting S11 from the beginning."`

---

### S11 — Symmetric Transfer and Tail-Call Optimization
**Date:** 2026-05-09
**Curriculum:** 3.3
**Status:** ✅ Complete

**Completed:**
- Explained the stack overflow problem with void `await_suspend` + `handle.resume()`: stack depth is O(N) proportional to chain length.
- Part 1: Confirmed empirically — naive chain of 10k coroutines crashes between depth 2000–3000 on Windows default stack. Used `std::cout` + flush to pinpoint the crash depth since the buffered logger never gets to `dump()`.
- Part 2: Rewrote `NaiveAwaitable` → `SymmetricAwaitable` returning `coroutine_handle<>` from `await_suspend`. Same 10k chain completes cleanly. Log confirms `await_suspend` returns before the next depth executes — O(1) stack depth throughout.
- Identified latent double-free UB: `suspend_never` causes frame self-destruction, but Task destructor also calls `handle.destroy()`. Fix: null the handle before `co_await` to release ownership.
- Introduced `noop_coroutine()` as the safe sentinel when there is no continuation to transfer to.

**Key takeaways:**
- void `await_suspend` calling `handle.resume()` nests frames — stack grows with chain length.
- Returning `coroutine_handle<>` from `await_suspend` makes resume a tail call — current frame unwinds before target starts. Stack depth stays constant.
- `suspend_never` + owning handle = double-free. Always release ownership before symmetric transfer if the frame will self-destruct.
- `noop_coroutine()` is the null sentinel for symmetric transfer — safe to "resume" (does nothing), prevents UB from returning `nullptr`.

**Next session:** S12 — Thread switching via `await_suspend`.
Load project file and paste: `"Starting S12 from the beginning."`

---

### S12 — Thread Switching via await_suspend
**Date:** 2026-05-10
**Curriculum:** 3.4
**Status:** ✅ Complete

**Completed:**
- Explained the thread-switching pattern: `await_suspend` receives the handle and dispatches it to a thread pool instead of calling `resume()` directly. The current thread walks away; whoever calls `resume()` on the handle runs the continuation.
- Built a `ThreadPool` (4 workers) storing `coroutine_handle<>` in a queue and calling `resume()` on worker threads.
- Built `ScheduleOn` awaitable: `await_ready = false` always, `await_suspend` dispatches the handle to the pool and returns void.
- Fixed the `Task` destructor segfault: root cause was `main()` exiting while the coroutine frame was still live on a pool thread. Fix: custom `FinalAwaiter` in `final_suspend` that signals a `std::latch` before the frame goes quiet; main blocks on `done.wait()` before `Task` destructors fire.
- Scaled to 4 concurrent tasks with `std::latch(4)`. Output confirmed each task resumes on a different worker thread.

**Key takeaways:**
- The thread-switch pattern inverts the S09/S10 pattern: `await_suspend` passes the handle out instead of calling `resume()` on it. No nested frames, no synchronous round-trip.
- `final_suspend` as a custom `FinalAwaiter` (not `suspend_always`) is the correct hook for signaling completion — it fires after the coroutine body ends but before the frame is destroyed.
- `std::latch` is the right primitive for "wait for N coroutines to complete."
- `Task` destructor calling `handle.destroy()` is safe only if the owner outlives execution. Move semantics (nulling the source handle) is the fix for transferable ownership — not yet implemented.
- `std::cout` across threads without a mutex is a data race; interleaved output is the visible symptom.

**Next session: S13** — Build a Sleep awaitable: suspend and resume after a timer.
Load project file and paste: `"Starting S13 from the beginning."`

---

### S13 — Build a `Sleep` Awaitable
**Date:** 2026-05-13
**Curriculum:** 3.5
**Status:** ✅ Complete

**Completed:**
- Built a `Sleep` awaitable (Option A): `await_suspend` detaches a `std::thread` that sleeps for the duration then calls `handle.resume()`. Duration and handle captured by value — correct lifetime.
- v1 used promise constructor injection to pass the `std::latch*` directly from the coroutine parameter list into `promise_type`. Works, but couples the promise to the coroutine's signature.
- v2 switched to `on_complete` callback (S12 pattern) + `suspend_never` in `initial_suspend`. Cleaner decoupling; no manual `resume()` in main.
- Identified the latent race in `suspend_never` + post-construction callback wiring: if the coroutine completes synchronously before `on_complete` is set, the latch never counts down and main hangs. Not live here due to `Sleep` always suspending, but the pattern is fragile. Fix: `suspend_always` + set callback + manual `resume()` guarantees a setup window.
- Discussed Option B (single `TimerQueue` background thread): `await_suspend` registers `{wake_time, handle}` into the queue; background thread uses `wait_until` on a condition variable, wakes on the earliest entry, fires expired handles. Notify required when a new entry is earlier than the current head. Callback layer is optional — exists only to decouple the queue from `coroutine_handle`. Full implementation deferred to Phase 4.

**Key takeaways:**
- `await_suspend` detaching a thread is the minimal correct implementation of time-based resumption. Handle and duration must be captured by value — the `Sleep` temporary is gone by the time the thread wakes.
- `suspend_never` is eager: the coroutine starts executing before the caller finishes setup. Safe only when all suspension points are guaranteed to be asynchronous. `suspend_always` is the defensive choice when setup must precede execution.
- Promise constructor injection from coroutine parameters is a real C++ feature, not a hack — but it tightly couples `promise_type` to the coroutine signature. The `on_complete` callback is more flexible.
- Option A (one thread per sleep) vs Option B (shared `TimerQueue`) is a resource trade-off: O(N) threads vs O(1) thread with a priority queue. Real schedulers (Asio, libuv) are Option B.

**Next session: S14** —  Integrating with event loops — Asio patterns.
Load project file and paste: `"Starting S14 from the beginning."`

---

### S14 —  Integrating with Event Loops: Asio Patterns
**Date:** 2026-05-13
**Curriculum:** 4.1
**Status:** ✅ Complete

**Completed:**
- Set up standalone Asio 1.36.0 as a header-only dependency inside the project (`libs/asio-1.36.0/`).
- Fixed CMake `asio` INTERFACE target: added `_WIN32_WINNT=0x0601` and `-Wno-language-extension-token` (Clang + MSVC `__try` extension) to eliminate all warnings. Fixed ordering bug — `target_compile_options` must follow add_library.
- Added `NEEDS_ASIO` flag to S14's `CMakeLists.txt` to link the `asio` target.
- Built a two-coroutine program: `worker(name, delay)` uses `co_await asio::this_coro::executor` to retrieve the executor, creates a `steady_timer`, and `co_awaits` it via `asio::use_awaitable`. Both workers launched concurrently via `co_spawn` with `asio::detached`. `io.run()` serves as the natural join point — no `std::latch`, no manual `resume()`.
- Output confirmed correct concurrency: A and B both start before either resumes; B (100ms) wakes before A (200ms) regardless of launch order.

**Key takeaways:**
- `co_await asio::this_coro::executor` is the idiomatic way to get the executor inside an Asio coroutine — no need to pass `io_context` as a parameter.
- `asio::use_awaitable` is a completion token that converts Asio's callback-based async ops into awaitables. It does exactly what `Sleep::await_suspend` did in S13 — captures the handle, wires it to a callback — but as production infrastructure.
- `io.run()` blocks until all posted work is done. It replaces all manual lifetime management from Phases 2–3.
- A single `io_context` thread can drive multiple concurrent coroutines. Concurrency here is interleaving at suspension points, not parallelism.
- `asio::awaitable<T>` uses `await_transform` internally to bind every `co_await` to the executor — the mechanism that ensures all resumptions happen on the `io_context` thread. Full details deferred to the capstone.

**Next session: S15** —  HALO: Heap Allocation Elision Optimization — what it is and when it fails.
Load project file and paste: `"Starting S15 from the beginning."`

---

## 🔧 Reference: Status Legend

| Symbol | Meaning |
|--------|---------|
| ⬜ | Not started |
| 🔄 | In progress |
| ✅ | Complete |
| ⚠️ | Needs revisit |

---

## 📎 Appendix: Compiler & Tooling Setup

### Verified environment (Windows)

| Tool | Version | Notes |
|------|---------|-------|
| CMake | 4.3.1 | Kitware |
| Clang | 22.1.3 | LLVM for Windows, target `x86_64-pc-windows-msvc` |
| Ninja | 1.13.2 | Build system generator |
| Git | 2.53.0 | Windows build |
| Terminal | Git Bash (in VS Code) | Gives Unix commands on Windows |
| Editor | VS Code | Extensions: C/C++, clangd, CMake Tools |

**Standard configure + build commands (Git Bash):**
```bash
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=clang++ -G Ninja
cmake --build build
./build/sessions/sNN/sNN_exercise.exe
```

**Compile commands for clangd (run once after configure):**
```bash
ln -s build/compile_commands.json compile_commands.json
```

**To wipe and reconfigure from scratch:**
```bash
rm -rf build
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_COMPILER=clang++ -G Ninja
```

**Minimum requirements (for reference):**
- GCC 11+ or Clang 14+ or MSVC 19.28+
- CMake 3.22+
- No external libraries required for Phases 1–3
- Phase 4 exercises use Asio (header-only, standalone) — enable with `-DENABLE_ASIO=ON -DASIO_ROOT=/path/to/asio`

**Toolchain sanity check — expected output from `sessions/s01/s01_exercise.exe`:**
```
[main] Before coroutine
[coroutine] Hello from inside a coroutine
[main] After coroutine
```
If this prints, C++20 coroutines are compiling and running correctly on your machine.

---

## 📎 Appendix: Key Vocabulary

> A living glossary. Updated as new terms are introduced.

| Term | One-line definition |
|------|---------------------|
| **Coroutine frame** | Heap-allocated block holding a suspended coroutine's local variables and resumption point |
| **Promise object** | User-defined type embedded in the coroutine frame; controls coroutine behavior at key lifecycle points |
| **`coroutine_handle`** | Non-owning pointer to a coroutine frame; used to resume or destroy the coroutine |
| **Awaitable** | Any object implementing `await_ready`, `await_suspend`, `await_resume` |
| **Symmetric transfer** | Resuming another coroutine directly from `await_suspend` without returning to the caller's stack — prevents unbounded stack growth |
| **HALO** | Heap Allocation Elision Optimization — compiler optimization that eliminates coroutine frame allocation when the frame lifetime is statically knowable |
| **`initial_suspend`** | Controls whether the coroutine suspends immediately on entry (lazy) or runs until the first `co_await` (eager) |
| **`final_suspend`** | Controls whether the coroutine suspends before destroying itself — critical for safe handle-based resumption patterns |

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
| 1.2 | The three keywords: `co_await`, `co_yield`, `co_return` | S02 | ✅ Not started |
| 1.3 | Stack frames vs. coroutine frames — where does the state live? | S03 | ⬜ Not started |
| 1.4 | **Exercise:** Trace the execution flow of a basic generator | S04 | ⬜ Not started |

---

### Phase 2 — The Plumbing: The Promise Object
*Goal: Understand the machinery the compiler generates. No more magic boxes.*

| # | Topic | Session | Status |
|---|-------|---------|--------|
| 2.1 | `std::coroutine_handle<>` — a pointer to a suspended coroutine | S05 | ⬜ Not started |
| 2.2 | The `promise_type` contract: what the compiler expects from you | S06 | ⬜ Not started |
| 2.3 | Lifecycle methods: `get_return_object`, `initial_suspend`, `final_suspend`, `unhandled_exception` | S07 | ⬜ Not started |
| 2.4 | **Exercise:** Build `Generator<T>` from scratch — yields a sequence of integers | S08 | ⬜ Not started |

---

### Phase 3 — The Awaitable Pattern
*Goal: Shift focus from the coroutine to the objects it awaits. This is where real power lies.*

| # | Topic | Session | Status |
|---|-------|---------|--------|
| 3.1 | The `Awaitable` concept: `await_ready`, `await_suspend`, `await_resume` | S09 | ⬜ Not started |
| 3.2 | `await_suspend` return types — void, bool, and handle (symmetric transfer) | S10 | ⬜ Not started |
| 3.3 | Symmetric transfer and tail-call optimization — avoiding stack overflow | S11 | ⬜ Not started |
| 3.4 | Thread switching via `await_suspend` | S12 | ⬜ Not started |
| 3.5 | **Exercise:** Build a `Sleep` awaitable — suspend and resume after a timer | S13 | ⬜ Not started |

---

### Phase 4 — Practical Integration & Performance
*Goal: Ship something real. Understand the costs and how to control them.*

| # | Topic | Session | Status |
|---|-------|---------|--------|
| 4.1 | Integrating with event loops — libuv and Asio patterns | S14 | ⬜ Not started |
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
- The three keywords: co_yield, co_await, co_return — inference rule
- Built SimpleGenerator with correct next() guard and const value()
- Implemented fibonacci() coroutine with range parameters
- Investigated Option 3: fibonacci_state_at(int index) as a plain function
- Fixed index-as-value bug in first fibonacci_state_at attempt
- Wired up fibonacci_state_at + fibonacci coroutine cleanly in main()

**Key takeaways:**
- A function becomes a coroutine by inference — no keyword, just co_yield/co_await/co_return in the body
- Coroutine local state lives in a heap-allocated frame, survives every suspension
- If a helper function never needs to suspend, it should be a plain function — not a coroutine
- Coroutines should express flow, not policy — push starting-state decisions to the caller

**Next session:** S02 — The three keywords in depth: co_await, co_yield, co_return
Load project file and paste: "Starting S02 from the beginning."

---

### S02 — The Three Keywords: co_await, co_yield, co_return
**Date:** 2026-04-20
**Curriculum:** 1.2
**Status:** ✅ Complete

**Completed:**
- Explained the three keywords: co_yield (outbound pause), co_await (inbound pause), co_return (exit)
- Covered the co_yield desugaring: co_yield expr → co_await promise.yield_value(expr)
- Covered the compiler transformation: suspended coroutine as a state machine with a heap-allocated frame
- Task 1: instrumented yield_value with logging — pull model interleaving made visible
- Task 2: switched from return_void to return_value(std::string); stored final message in promise via std::optional; exposed via summary() with assert(handle.done()) guard
- Task 3: generalised SimpleGenerator into Generator<T>; implemented summarize() using all three keywords; confirmed co_await std::suspend_never{} is a runtime no-op

**Key takeaways:**
- co_yield desugars to co_await on the promise — yield behavior is fully user-defined
- co_await suspend_never: await_ready() returns true, suspension is skipped entirely, no control transfer
- std::optional used as "not yet set" sentinel has a design smell: callers cannot distinguish "not finished" from "no value"; assert on handle.done() is the right guard
- Generator<T> hardcodes TReturn as std::string — a second template parameter TReturn would make it fully general
- Dead code (SimpleGenerator) should be deleted once superseded

**Next session:** S03 — Stack frames vs. coroutine frames: where does the state live?
Load project file and paste: "Starting S03 from the beginning."

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

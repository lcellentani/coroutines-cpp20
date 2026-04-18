# C++20 Coroutines — Course Repository

Companion repository for the C++20 Coroutines learning track.
One executable per session. Build them individually or all at once.

## Requirements

- CMake 3.22+
- GCC 11+, Clang 14+, or MSVC 19.28+
- C++20 support
- Asio (optional, required for Phase 4 — see below)

## Build

```bash
cmake -B build -DCMAKE_BUILD_TYPE=Debug
cmake --build build

# Run a specific session
./build/sessions/s01/s01_exercise
```

## Build with Asio (Phase 4)

```bash
cmake -B build -DENABLE_ASIO=ON -DASIO_ROOT=/path/to/asio
cmake --build build
```

## Adding a new session

1. Create `sessions/sNN/` with a `CMakeLists.txt` and `main.cpp`
2. Uncomment (or add) `add_subdirectory(sessions/sNN)` in the root `CMakeLists.txt`
3. Build

## Structure

```
.
├── CMakeLists.txt          # Root — global settings, Asio config, subdirectories
├── cmake/
│   └── session.cmake       # add_session() helper function
├── sessions/
│   ├── s01/
│   │   ├── CMakeLists.txt
│   │   └── main.cpp        # Your exercise implementation
│   ├── s02/
│   │   └── ...
│   └── ...
└── README.md
```

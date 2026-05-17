cmake_minimum_required(VERSION 3.22)
project(cpp20_coroutines_course CXX)

# ---------------------------------------------------------------------------
# Global settings
# ---------------------------------------------------------------------------
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Export compile commands for clangd / IDE support
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# ---------------------------------------------------------------------------
# Compiler warnings
# ---------------------------------------------------------------------------
add_library(course_warnings INTERFACE)
target_compile_options(course_warnings INTERFACE
    $<$<CXX_COMPILER_ID:GNU,Clang>:
        -Wall -Wextra -Wpedantic
        -Wno-unused-parameter
    >
    $<$<CXX_COMPILER_ID:MSVC>:
        /W4 /permissive-
    >
)

# ---------------------------------------------------------------------------
# Optional: Asio (header-only, standalone — required from Phase 4 onwards)
# Set ASIO_ROOT on the cmake command line if not in a standard path:
#   cmake -DASIO_ROOT=/path/to/asio/include ..
# ---------------------------------------------------------------------------
option(ENABLE_ASIO "Enable Asio for Phase 4 sessions" OFF)

if(ENABLE_ASIO)
    find_path(ASIO_INCLUDE_DIR asio.hpp
        HINTS ${ASIO_ROOT} ENV ASIO_ROOT
        PATH_SUFFIXES include
    )
    if(NOT ASIO_INCLUDE_DIR)
        message(FATAL_ERROR
            "Asio not found. Install standalone Asio or set -DASIO_ROOT=/path/to/asio")
    endif()

    add_library(asio INTERFACE)
    target_include_directories(asio INTERFACE ${ASIO_INCLUDE_DIR})
    target_compile_definitions(asio INTERFACE
        ASIO_STANDALONE
        _WIN32_WINNT=0x0601
    )
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        target_compile_options(asio INTERFACE -Wno-language-extension-token)
    endif()


    message(STATUS "Asio found: ${ASIO_INCLUDE_DIR}")
endif()

# ---------------------------------------------------------------------------
# Optional: AddressSanitizer
# ---------------------------------------------------------------------------
option(ENABLE_ASAN "Enable AddressSanitizer" OFF)

if(ENABLE_ASAN)
    if(NOT CMAKE_CXX_COMPILER_ID MATCHES "Clang|GNU")
        message(FATAL_ERROR "ENABLE_ASAN requires Clang or GCC")
    endif()
    add_compile_options(-fsanitize=address -fno-omit-frame-pointer)
    if(WIN32)
        # -static-libsan is unsupported on Windows/MSVC target; ASan is
        # delivered as clang_rt.asan_dynamic-x86_64.dll — add LLVM bin to PATH.
        add_link_options(-fsanitize=address)
        # ASAN hooks malloc/free but NOT the MSVC debug CRT's _malloc_dbg/_free_dbg.
        # Using /MDd causes false "bad-free" reports when STL static destructors run
        # at process exit. Force the release CRT (/MD) so all allocations go through
        # plain malloc/free that ASAN can track.
        set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreadedDLL")
        message(STATUS "ASan enabled (Windows): forcing /MD (release CRT) to avoid "
            "debug-heap conflicts. Add LLVM bin to PATH for clang_rt.asan_dynamic-x86_64.dll.")
    else()
        add_link_options(-fsanitize=address -static-libsan)
    endif()
endif()

# ---------------------------------------------------------------------------
# Add include path for common utility headers
include_directories(common)

# ---------------------------------------------------------------------------
# Sessions
# ---------------------------------------------------------------------------
add_subdirectory(sessions/s01)
add_subdirectory(sessions/s02)
add_subdirectory(sessions/s03)
add_subdirectory(sessions/s04)
add_subdirectory(sessions/s05)
add_subdirectory(sessions/s06)
add_subdirectory(sessions/s07)
add_subdirectory(sessions/s08)
add_subdirectory(sessions/s09)
add_subdirectory(sessions/s10)
add_subdirectory(sessions/s11)
add_subdirectory(sessions/s12)
add_subdirectory(sessions/s13)
add_subdirectory(sessions/s14)
add_subdirectory(sessions/s15)
add_subdirectory(sessions/s16)
add_subdirectory(sessions/s17)
add_subdirectory(sessions/s18)
add_subdirectory(sessions/s19)
add_subdirectory(sessions/s20)





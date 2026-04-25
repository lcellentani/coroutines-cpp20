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
    target_compile_definitions(asio INTERFACE ASIO_STANDALONE)
    message(STATUS "Asio found: ${ASIO_INCLUDE_DIR}")
endif()

# ---------------------------------------------------------------------------
# Sessions
# ---------------------------------------------------------------------------
add_subdirectory(sessions/s01)
add_subdirectory(sessions/s02)
add_subdirectory(sessions/s03)
add_subdirectory(sessions/s04)
# add_subdirectory(sessions/s05)   # uncomment as sessions are added

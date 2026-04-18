# ---------------------------------------------------------------------------
# add_session(TARGET <n> SOURCES <files...> [NEEDS_ASIO])
#
# Convenience wrapper that creates a session executable with consistent
# flags. Call from each session's CMakeLists.txt.
#
# Example:
#   include(${PROJECT_SOURCE_DIR}/cmake/session.cmake)
#   add_session(TARGET s01_hello_coroutine SOURCES main.cpp)
# ---------------------------------------------------------------------------
function(add_session)
    cmake_parse_arguments(ARG "NEEDS_ASIO" "TARGET" "SOURCES" ${ARGN})

    if(NOT ARG_TARGET)
        message(FATAL_ERROR "add_session: TARGET is required")
    endif()
    if(NOT ARG_SOURCES)
        message(FATAL_ERROR "add_session: SOURCES is required")
    endif()

    add_executable(${ARG_TARGET} ${ARG_SOURCES})
    target_link_libraries(${ARG_TARGET} PRIVATE course_warnings)

    if(ARG_NEEDS_ASIO)
        if(NOT ENABLE_ASIO)
            message(WARNING
                "${ARG_TARGET} requires Asio. Reconfigure with -DENABLE_ASIO=ON")
        else()
            target_link_libraries(${ARG_TARGET} PRIVATE asio)
        endif()
    endif()

    set_target_properties(${ARG_TARGET} PROPERTIES FOLDER "sessions")
endfunction()

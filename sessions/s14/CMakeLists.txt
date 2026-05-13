include(${PROJECT_SOURCE_DIR}/cmake/session.cmake)

add_session(
    TARGET  s14_exercise
    SOURCES s14_exercise.cpp
    NEEDS_ASIO
)

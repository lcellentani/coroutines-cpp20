include(${PROJECT_SOURCE_DIR}/cmake/session.cmake)

add_session(
    TARGET  s15_exercise
    SOURCES s15_exercise.cpp
    NEEDS_ASIO
)

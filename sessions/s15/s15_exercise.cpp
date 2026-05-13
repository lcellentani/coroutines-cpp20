#include <asio.hpp>
#include <asio/co_spawn.hpp>
#include <asio/use_awaitable.hpp>
#include <asio/steady_timer.hpp>
#include <asio/detached.hpp>
#include <iostream>


int main() {
    asio::io_context io;

    std::cout << "[main] io_context created\n";
   
    std::cout << "[main] coroutine finished, exiting main.\n";

    return 0;
}
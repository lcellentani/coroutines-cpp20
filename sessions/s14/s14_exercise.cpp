#include <asio.hpp>
#include <asio/co_spawn.hpp>
#include <asio/use_awaitable.hpp>
#include <asio/steady_timer.hpp>
#include <asio/detached.hpp>
#include <iostream>
#include <chrono>
#include <string>

using namespace std::chrono_literals;

asio::awaitable<void> worker(std::string name, std::chrono::milliseconds delay) {
    auto executor = co_await asio::this_coro::executor;

    std::cout << name << " sleeping for " << delay << "\n";

    asio::steady_timer timer(executor, delay);
    co_await timer.async_wait(asio::use_awaitable);

    std::cout << name << " resumes after " << delay << "\n";
}

int main() {
    asio::io_context io;

    std::cout << "[main] io_context created\n";
   
    asio::co_spawn(io, worker("A", 200ms), asio::detached);
    asio::co_spawn(io, worker("B", 100ms), asio::detached);

    io.run();
    
    std::cout << "[main] coroutine finished, exiting main.\n";

    return 0;
}
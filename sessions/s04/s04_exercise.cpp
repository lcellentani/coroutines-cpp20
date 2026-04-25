#include <coroutine>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

class Logger final {
public:
    static Logger& get_instance() {
        static Logger _instance;
        return _instance;
    }

    Logger() = default;
    ~Logger() = default;

    Logger& operator=(const Logger&) = delete;
    Logger(const Logger&) = delete;

    void log(const std::string& message) {
        logs.push_back(message);
    }

    void dump() const {
        int counter = 0;
        for (const auto& log : logs) {
            std::cout << "[" << ++counter << "] " << log << "\n";
        }
    }

private:
    std::vector<std::string> logs;
};

template <typename T>
struct Generator {
    struct promise_type {
        T current_value;

        Generator get_return_object() {
            Logger::get_instance().log({"promise_type::get_return_object() called"});
            return Generator{ Handle::from_promise(*this) };
        }

        std::suspend_always initial_suspend() {
            {
                Logger::get_instance().log({"promise_type::initial_suspend() called"});
            }
            return std::suspend_always{};
        }
        std::suspend_always final_suspend() noexcept {
            {
                Logger::get_instance().log({"promise_type::final_suspend() called"});
            }
            return std::suspend_always{};
        }
        std::suspend_always yield_value(T value) {
            current_value = value;
            {
                std::stringstream ss;
                ss  << "promise_type::yield_value() called with value = " << value;
                Logger::get_instance().log(ss.str());
            }
            return std::suspend_always{};
        }

        void return_void() {
            Logger::get_instance().log({"promise_type::return_void() called"});
        }

        void unhandled_exception() {}

        void* operator new(std::size_t size) {
            void* ptr = ::operator new(size);
            {
                std::stringstream ss;
                ss  << "frame allocated " << size << " bytes at " << ptr;
                Logger::get_instance().log(ss.str());
            }
            return ptr;
        }

        void operator delete(void* ptr, std::size_t size) {
            {
                std::stringstream ss;
                ss  << "frame freed " << size << " bytes at " << ptr;
                Logger::get_instance().log(ss.str());
            }
            ::operator delete(ptr);
        }
    };

    using Handle = std::coroutine_handle<promise_type>;
    Handle handle;

    explicit Generator(Handle h) : handle(h) {
        Logger::get_instance().log({"Generator constructor called"});
    }
    ~Generator() {
        Logger::get_instance().log({"Generator destructor called"});
        if (handle) handle.destroy();
    }

    bool next() {
        if (!handle || handle.done()) return false;
        handle.resume();
        {
            std::stringstream ss;
            ss  << "Generator::next() called - done? " << std::boolalpha << handle.done();
            Logger::get_instance().log(ss.str());
        }
        return !handle.done();
     }

     T value() const {
        {
            std::stringstream ss;
            ss  << "Generator::value() called with value() = " << handle.promise().current_value;
            Logger::get_instance().log(ss.str());
        }
        return handle.promise().current_value;
     }
};

Generator<int> counter(int from) {
    Logger::get_instance().log({"counter generator started"});

    co_yield from;
    Logger::get_instance().log({"after first yield"});
    co_yield from + 1;
    Logger::get_instance().log({"after second yield"});
    co_yield from + 2;
    Logger::get_instance().log({"after third yield"});

    Logger::get_instance().log({"counter generator finished"});
}

int main() {
    Logger::get_instance().log("Entering main...");

    {
        Logger::get_instance().log("Entering block...");

        auto counter_gen = counter(2);
        
        while (counter_gen.next()) {
            counter_gen.value();
        }

        Logger::get_instance().log("Exiting block...");
    }

    Logger::get_instance().log("Exiting main...");

    Logger::get_instance().dump();

    return 0;
}
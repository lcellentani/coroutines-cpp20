#pragma once

#include <sstream>
#include <string>
#include <vector>
#include <iostream> // Required for Logger::dump()

/**
 * @brief Singleton implementation of a logger class that tracks log entries with indentation.
 */
class Logger final {
public:
    // Static method to access the single instance
    static Logger& get_instance() {
        static Logger _instance;
        return _instance;
    }

    Logger() = default;
    ~Logger() = default;

    // Delete copy constructor and assignment operator for Singleton pattern
    Logger& operator=(const Logger&) = delete;
    Logger(const Logger&) = delete;

    /**
     * @brief Logs a message to the internal buffer. Overloaded using variadic templates.
     */
    template<typename... Args>
    void log(Args&&... args) {
        std::ostringstream oss;
        // Fold expression for streaming all arguments
        (oss << ... << std::forward<Args>(args));
        logs.push_back(std::string(indent_level * 4, ' ') + oss.str());
    }

    /**
     * @brief Increases the current indentation level.
     */
    void push_indent() { ++indent_level; }
    /**
     * @brief Decreases the current indentation level, if possible.
     */
    void pop_indent()  { if (indent_level > 0) --indent_level; }

    /**
     * @brief RAII scope guard that automatically manages logger indentation.
     */
    struct ScopeIndent {
        ScopeIndent()  { Logger::get_instance().push_indent(); }
        ~ScopeIndent() { Logger::get_instance().pop_indent(); } 
    };

    /**
     * @brief Prints all stored logs to standard output, prepending a counter.
     */
    void dump() const {
        int counter = 0;
        for (const auto& entry : logs) {
            std::cout << "[" << ++counter << "] " << entry << "\n";
        }
    }

private:
    std::vector<std::string> logs;
    int indent_level = 0;
};


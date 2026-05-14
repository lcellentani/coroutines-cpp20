#include <cassert>
#include <chrono>
#include <format>
#include <coroutine>
#include <functional>
#include <iostream>
#include <latch>
#include <new>
#include <vector>
#include <thread>

struct Sleep {
    std::chrono::milliseconds duration;

    bool await_ready() const noexcept {
        return false;
    }

    void await_suspend(std::coroutine_handle<> handle) {
        std::thread([handle, duration = this->duration]() {
            std::this_thread::sleep_for(duration);
            handle.resume();
        }).detach();
    }

    void await_resume() const noexcept {
    }
};

template<size_t BlockSize>
struct SlabAllocator {
    static_assert(BlockSize >= sizeof(void*), "BlockSize must be at least pointer-sized to hold the free list link");

    static inline void* free_list = nullptr;
    static inline std::vector<std::byte*> slabs;
    static constexpr size_t SlotsPerSlab = 1024;

    static void* allocate(size_t size) {
        assert(size <= BlockSize && "frame size exceeds pool block size");

        if (!free_list) {
            auto* block = new std::byte[BlockSize * SlotsPerSlab];
            slabs.push_back(block);
            for (size_t i = 0; i < SlotsPerSlab - 1; ++i) {
                void* next = &block[(i + 1) * BlockSize];
                std::memcpy(&block[i * BlockSize], &next, sizeof(void*));
            }
            void* null_ptr = nullptr;
            std::memcpy(&block[(SlotsPerSlab - 1) * BlockSize], &null_ptr, sizeof(void*));
            free_list = block;
        }
        
        void* ptr = free_list;
        void* next = nullptr;
        std::memcpy(&next, ptr, sizeof(void*));
        free_list = next;

        return ptr;
    }

    static void deallocate(void* ptr) {
        std::memcpy(ptr, &free_list, sizeof(void*));
        free_list = ptr;
    }

    static void shutdown() {
        free_list = nullptr;
        for (auto* slab : slabs) {
            delete[] slab;
        }
        slabs.clear();
    }
};

static constexpr size_t kBlockSize = 128;

struct Task {
    struct promise_type {
        std::function<void()> on_complete;

        auto get_return_object() {
            return Task{std::coroutine_handle<promise_type>::from_promise(*this)};
        }
		
        std::suspend_always initial_suspend() { return {}; }
        
        auto final_suspend() noexcept {
            struct FinalAwaiter {
                bool await_ready() const noexcept { return false; }
                void await_suspend(std::coroutine_handle<promise_type> h) noexcept {
                    if (h.promise().on_complete) {
                        h.promise().on_complete();
                    }
                }
                void await_resume() const noexcept {}
            };
            return FinalAwaiter{};
        }

        void return_void() {}

        void unhandled_exception() {
            std::terminate();
        }

        void* operator new(size_t size) {
            std::cout << std::format("[Slab] Allocating {} bytes\n", size);
            return SlabAllocator<kBlockSize>::allocate(size);
        }

        void operator delete(void* ptr, size_t size) {
            SlabAllocator<kBlockSize>::deallocate(ptr);
        }
    };

    std::coroutine_handle<promise_type> handle;

    explicit Task(std::coroutine_handle<promise_type> h) : handle(h) {}
    ~Task() {
        if (handle)
            handle.destroy();
    }

    // Non-copyable
    Task(const Task&) = delete;
    Task& operator=(const Task&) = delete;

    Task(Task&& other) noexcept : handle(other.handle) {
        other.handle = {};
    }
    
    Task& operator=(Task&& other) noexcept {
        if (this != &other) {
            if (handle) {
                handle.destroy();
            }
            handle = other.handle;
            other.handle = {};
        }
        return *this;
    }
};

Task run(std::latch* completion_latch) {
    auto before = std::chrono::steady_clock::now();
    std::cout << "[coroutine] going to sleep\n";

    co_await Sleep { std::chrono::milliseconds{200} };

    auto after = std::chrono::steady_clock::now();
    auto elapsed = std::chrono::duration_cast<std::chrono::milliseconds>(after - before);
    std::cout << "[coroutine] woke up after " << elapsed.count() << "ms\n";

    co_return;
}

int main() {
    std::cout << "[main] launching coroutine\n";

    std::latch done(1);

    {
        Task t = run(&done);
        t.handle.promise().on_complete = [&done] { done.count_down(); };
        t.handle.resume();

        std::cout << "[main] done, waiting for coroutine to finish...\n";
        done.wait();
        std::cout << "[main] coroutine finished, exiting main.\n";
    } // t destroyed here — frame returned to slab before shutdown

    SlabAllocator<kBlockSize>::shutdown();

    return 0;
}
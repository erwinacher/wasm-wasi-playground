#include <print>
#include <ranges>
#include <vector>
#include <string>

int main() {
    std::vector<std::string> words = {"hello", "from", "clang++", "21"};
    
    // pipeline syntax (C++23)
    for (auto&& w : words | std::views::transform([](auto&& s){ return std::move(s) + "!"; }))
        std::print("{} ", w);
    
    std::println("\nAll systems nominal ✅");
}


#include <string_view>

extern "c" {

__attribute__((export_name("greet")))
const char* greet() {
	return "Hello from webassembly";
}


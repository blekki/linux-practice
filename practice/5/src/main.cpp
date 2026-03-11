#include "stdlib.h"
#include "iostream"
#include "math.h"
#include "../shared_lib/random.h"

int main() {
    std::cout << "Result: " << Math::add(10, 5) << std::endl;

    for (uint a = 0; a < 10; a++) {
        std::cout << a << ": " << Random::randiRange(-100, 100) << std::endl;
    }
    
    #ifdef WARNING_MODE
        // example "unused variable" warning (apears obly with "-Wall" flag)
        float a {10};
        // example "empty body" warning (apears obly with "-Wextra" flag)
        if (true);
    #endif

    return 0;
}
#include "greetings.hpp"

#include <iostream>

void hello()
{
#ifdef __clang__
    std::cout << "Hello, from clang!\n";
#else
    std::cout << "Hello, from gcc!\n";
#endif
}

#include "greetings.hpp"

#include <iostream>

void hello()
{
#ifdef DEBUG
    std::cout << "Hello, debug mode!\n";
#else
    std::cout << "Hello, release mode!\n";
#endif
}

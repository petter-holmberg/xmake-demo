#include "greetings.hpp"

#include <iostream>

bool hello(bool in_test)
{
    if (in_test) {
        std::cout << "Hello, from unit test!\n";
    } else {
        std::cout << "Hello, from main application!\n";
    }

    return in_test;
}

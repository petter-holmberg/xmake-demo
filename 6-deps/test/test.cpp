#include <catch2/catch_test_macros.hpp>

#include "greetings.hpp"

TEST_CASE("hello", "[xmake-demo]")
{
    REQUIRE(hello(true));
}

import <catch2/catch_test_macros.hpp>;

import greetings;

TEST_CASE("hello", "[xmake-demo]")
{
    REQUIRE(hello(true));
}

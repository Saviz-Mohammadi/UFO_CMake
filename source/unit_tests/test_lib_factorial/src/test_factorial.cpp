#include <iostream>
#include <catch2/catch_all.hpp>
#include "test_factorial.hpp"
#include "factorial.hpp"

TEST_CASE( "Factorials are computed", "[factorial]" ) {
    REQUIRE( factorial( 1) == 1 );
    REQUIRE( factorial( 2) == 2 );
    REQUIRE( factorial( 3) == 6 );
    REQUIRE( factorial(10) == 3'628'800 );
}

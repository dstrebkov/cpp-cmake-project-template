#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN

#include <doctest.h>
#include <fakeit.hpp>

#include <factorial_doctest_fakeit/include/factorial.h>

TEST_CASE("FactorialTest") {
    CHECK((factorial_doctest_fakeit::factorial(1) == 1));
    CHECK((factorial_doctest_fakeit::factorial(2) == 2));
    CHECK((factorial_doctest_fakeit::factorial(3) == 6));
}

using namespace fakeit;

struct FactorialStruct {
    virtual ~FactorialStruct() = default;
    virtual int factorial(int) = 0;
};

TEST_CASE("MockedFactorial") {
    Mock<FactorialStruct> mock;

    When(Method(mock, factorial).Using(3)).Return(6);

    auto result = mock.get().factorial(3);

    CHECK((result == 6)); // verify using doctest

    Verify(Method(mock, factorial).Using(3)); // verify factorial(3) was invoked
    Verify(Method(mock, factorial).Using(3)).Once(); // verify factorial(3) was invoked exactly once
}

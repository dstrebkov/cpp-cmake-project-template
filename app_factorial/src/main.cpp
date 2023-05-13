#include <iostream>
#include <include/factorial_doctest_fakeit/factorial.h>

int main() {
    std::cout << "[Doctest+FakeIt]: factorial(1) = " << factorial_doctest_fakeit::factorial(1) << std::endl;
    std::cout << "[Doctest+FakeIt]: factorial(2) = " << factorial_doctest_fakeit::factorial(2) << std::endl;
    std::cout << "[Doctest+FakeIt]: factorial(3) = " << factorial_doctest_fakeit::factorial(3) << std::endl;
    std::cout << "[Doctest+FakeIt]: factorial(4) = " << factorial_doctest_fakeit::factorial(4) << std::endl;
    return EXIT_SUCCESS;
}

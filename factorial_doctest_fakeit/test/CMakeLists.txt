cmake_minimum_required(VERSION 3.14.0)

project(factorial_doctest_fakeit_tests LANGUAGES CXX)

include(FetchContent)
FetchContent_Declare(
    doctest
    GIT_REPOSITORY https://github.com/onqtam/doctest.git
    GIT_TAG        v2.4.9
    GIT_SHALLOW    TRUE)
FetchContent_Declare(
    FakeIt
    GIT_REPOSITORY https://github.com/eranpeer/FakeIt.git
    GIT_TAG        2.3.2
    GIT_SHALLOW    TRUE)
FetchContent_MakeAvailable(doctest)
FetchContent_MakeAvailable(FakeIt)

add_executable(factorial_doctest_fakeit_tests factorial_test.cpp)

set(DOCTEST_FAKEIT_INCLUDES "${doctest_SOURCE_DIR}/doctest" "${fakeit_SOURCE_DIR}/single_header/doctest")
target_include_directories(factorial_doctest_fakeit_tests PRIVATE "${DOCTEST_FAKEIT_INCLUDES}" "${CMAKE_SOURCE_DIR}")

target_link_libraries(factorial_doctest_fakeit_tests PRIVATE doctest::doctest factorial_doctest_fakeit)

include(${doctest_SOURCE_DIR}/scripts/cmake/doctest.cmake)
doctest_discover_tests(factorial_doctest_fakeit_tests)

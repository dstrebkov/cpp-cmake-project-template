cmake_minimum_required(VERSION 3.14.0)

project("cpp-cmake-project-template" VERSION 0.1 DESCRIPTION "CMake based C++ project template" LANGUAGES CXX)

set(CMAKE_CXX_FLAGS "-g -O0 -Wall --coverage")

# Enable CTest at the current directory and below (before add_subdirectory())
include(CTest)

add_subdirectory(factorial_doctest_fakeit)
add_subdirectory(app_factorial)

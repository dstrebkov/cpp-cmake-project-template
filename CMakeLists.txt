cmake_minimum_required(VERSION 3.24)

project("cpp-project-template" VERSION 0.1 DESCRIPTION "CMake based C++ project template" LANGUAGES CXX)

add_subdirectory(factorial_doctest_fakeit)
add_subdirectory(app_factorial)

cmake_minimum_required(VERSION 3.24)

project("cpp-cmake-project-template" VERSION 0.1 DESCRIPTION "CMake based C++ project template" LANGUAGES CXX)

# Enable CTest at the current directory and below (before add_subdirectory())
enable_testing()

add_subdirectory(factorial_doctest_fakeit)
add_subdirectory(app_factorial)

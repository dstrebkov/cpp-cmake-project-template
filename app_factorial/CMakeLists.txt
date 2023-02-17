cmake_minimum_required(VERSION 3.14.0)

project(app_factorial LANGUAGES CXX)

add_executable(app_factorial)

target_sources(app_factorial PRIVATE src/main.cpp)
target_include_directories(app_factorial PRIVATE "${CMAKE_SOURCE_DIR}")
target_link_libraries(app_factorial PRIVATE factorial_doctest_fakeit)

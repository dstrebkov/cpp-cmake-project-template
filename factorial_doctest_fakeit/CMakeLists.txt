cmake_minimum_required(VERSION 3.24)

project(factorial_doctest_fakeit LANGUAGES CXX)

add_library(factorial_doctest_fakeit STATIC src/factorial.cpp include/factorial.h)

target_sources(factorial_doctest_fakeit PUBLIC src/factorial.cpp)
target_include_directories(factorial_doctest_fakeit PUBLIC "${CMAKE_SOURCE_DIR}")

set(PUBLIC_HEADER ${CMAKE_CURRENT_SOURCE_DIR}/include/factorial.h)
set(OUTPUT_INCLUDES_DIR "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}")

add_custom_target(make-output-includes-dir ALL COMMAND ${CMAKE_COMMAND} -E make_directory ${OUTPUT_INCLUDES_DIR})
add_custom_target(copy-includes ALL COMMAND ${CMAKE_COMMAND} -E copy ${PUBLIC_HEADER} ${OUTPUT_INCLUDES_DIR})
add_custom_target(copy-lib ALL COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:factorial_doctest_fakeit> ${CMAKE_SOURCE_DIR}/libs)

add_subdirectory(test)

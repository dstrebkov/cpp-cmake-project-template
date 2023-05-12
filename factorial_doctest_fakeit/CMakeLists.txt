cmake_minimum_required(VERSION 3.14.0)

project(factorial_doctest_fakeit LANGUAGES CXX)

add_library(factorial_doctest_fakeit STATIC src/factorial.cpp include/factorial.h)

target_sources(factorial_doctest_fakeit PRIVATE src/factorial.cpp)
target_include_directories(factorial_doctest_fakeit PRIVATE "${CMAKE_SOURCE_DIR}")

set(LIB_PATH $<TARGET_FILE:factorial_doctest_fakeit>)
set(LIB_NAME $<TARGET_FILE_NAME:factorial_doctest_fakeit>)
set(PUBLIC_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/include/factorial.h")
set(OUTPUT_INCLUDES_DIR "${CMAKE_SOURCE_DIR}/include/${PROJECT_NAME}")

add_custom_command(TARGET factorial_doctest_fakeit
    PRE_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory ${OUTPUT_INCLUDES_DIR}
    COMMAND ${CMAKE_COMMAND} -E copy ${PUBLIC_HEADER} ${OUTPUT_INCLUDES_DIR}
)
add_custom_command(TARGET factorial_doctest_fakeit
    POST_BUILD 
    COMMAND ${CMAKE_COMMAND} -E copy ${LIB_PATH} ${CMAKE_SOURCE_DIR}/libs/${LIB_NAME}
)

add_subdirectory(test)

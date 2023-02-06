cpp-cmake-project-template
================

CMake based C++ project template that could be used as a starting point for a new C++ project.

## Contents

- static library `factorial` configured with unit testing framework(s);

- application `app_factorial` that links with the library to run some code.

## Unit testing

The library is configured with [Doctest](https://github.com/doctest/doctest) ([v2.4.9](https://github.com/doctest/doctest/releases/tag/v2.4.9)) for unit testing + [FakeIt](https://github.com/eranpeer/FakeIt) ([2.3.2](https://github.com/eranpeer/FakeIt/releases/tag/2.3.2)) for mocking.

These frameworks are obtained from GitHub using CMake's functions `FetchContent_Declare()`/`FetchContent_MakeAvailable()`.

## Project structure

```
.
│
├── app_factorial/             # Factorial application binary
│   ├── include                # Application includes
│   ├── src                    # Application sources
│   │   └── main.cpp           # Main entry of the sample factorial application
│   ├── test/                  # Application test folder
│   └── CMakeLists.txt         # Compile script for application
│
├── include                    # Place for built library includes
│
├── factorial                  # Static library
│   ├── include                # Library includes
│   │   └── factorial.h        # Library header
│   ├── src                    # Library sources
│   │   └── factorial.cpp      # Library source
│   ├── test/                  # Library tests
│   │   ├── factorial_test.cpp # Tests for the library
│   │   └── CMakeLists.txt     # Compile script for tests of library
│   └── CMakeLists.txt         # Library compile script
│
├── libs                       # Place for built library binaries
└── CMakeLists.txt             # Main compile script
```

## Instructions

Do as you would any CMake project to compile:

```
mkdir cmake-build
cd cmake-build/
cmake ..
make
```

Run `app_factorial` application:

```
cd app_factorial/
./app_factorial
```

Run unit test suite:

```
cd ../factorial_doctest_fakeit/test/
ctest
```

## Useful Links

* [Doctest Tutorial](https://github.com/doctest/doctest/blob/master/doc/markdown/tutorial.md)
* [FakeIt Quickstart](https://github.com/eranpeer/FakeIt/wiki/Quickstart)

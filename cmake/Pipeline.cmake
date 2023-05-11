include(${CTEST_SCRIPT_DIRECTORY}/../cmake/CTestConfig.cmake)

site_name(CTEST_SITE)
set(CTEST_BUILD_NAME "${CMAKE_SYSTEM_NAME}${EXTRA_BUILD_NAME}")
set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/..")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/../build-test")

set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(CTEST_CONFIGURATION_TYPE Debug)

set(CTEST_COVERAGE_COMMAND gcov)
set(CTEST_COVERAGE_EXTRA_FLAGS "--demangled-names")
set(CTEST_CUSTOM_COVERAGE_EXCLUDE "_deps;/test/")

ctest_empty_binary_directory(${CTEST_BINARY_DIRECTORY})

ctest_start(Experimental)
ctest_configure(OPTIONS "-DCMAKE_CXX_FLAGS_INIT=--coverage")
ctest_build()
ctest_test()
ctest_coverage()

find_package(Python3 COMPONENTS Interpreter REQUIRED)

set(REQUIREMENTS_TXT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/factorial_doctest_fakeit/test/")
set(VENV_PATH "${CTEST_BINARY_DIRECTORY}/py_env")
set(GCOVR_EXCLUDES_RE ".*/\(_deps|test|CMakeFiles)/")

execute_process(COMMAND "${Python3_EXECUTABLE}" -m venv "${VENV_PATH}")
execute_process(COMMAND ${VENV_PATH}/bin/python -m pip install --upgrade pip --no-warn-script-location)
#execute_process(COMMAND ${VENV_PATH}/bin/pip install -r ${REQUIREMENTS_TXT_DIR}/requirements.txt)
execute_process(COMMAND ${VENV_PATH}/bin/pip install gcovr==6.0)
#execute_process(COMMAND ${VENV_PATH}/bin/gcovr --use-gcov-files --exclude .*/\(_deps|test\)/ --html-details coverage.html)
execute_process(COMMAND ${VENV_PATH}/bin/gcovr --root ${CTEST_SOURCE_DIRECTORY} --exclude ${GCOVR_EXCLUDES_RE} --html-details coverage.html)

cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 17)
project(testing)
set(SOURCE_FILES ../GEFE_utility.h ../GEFE_utility.cpp GEFE_test.cpp)
add_subdirectory(lib)
include_directories(${../cpp})
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
find_package(Armadillo REQUIRED)
include_directories(${ARMADILLO_INCLUDE_DIRS}) # It is optional if armadillo include folder is put in /usr/include.

add_executable(gefe_test_run ${SOURCE_FILES})
target_link_libraries(gefe_test_run gtest gtest_main)
target_link_libraries(gefe_test_run ${ARMADILLO_LIBRARIES})
cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 17)
project(testing)
add_subdirectory(lib)
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
find_package(Armadillo REQUIRED) # <<<
include_directories(${ARMADILLO_INCLUDE_DIRS}) # <<< it is optional if armadillo include folder is put in /usr/include.


add_executable(gefe_test_run GetEigenvectorFromEigenvaluesTest.cpp)

target_link_libraries(gefe_test_run gtest gtest_main)
target_link_libraries(gefe_test_run ${ARMADILLO_LIBRARIES}) # <<<
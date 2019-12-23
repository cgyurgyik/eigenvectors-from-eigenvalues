cmake_minimum_required(VERSION 3.15)
project(gefe)

find_package(Armadillo REQUIRED) # <<<
include_directories(${ARMADILLO_INCLUDE_DIRS}) # <<< it is optional if armadillo include folder is put in /usr/include.


set(CMAKE_CXX_STANDARD 20)

set(SOURCE_FILES main.cpp GetEigenvectorFromEigenvalues.h)
add_executable(gefe ${SOURCE_FILES} GetEigenvectorFromEigenvalues.h GetEigenvectorFromEigenvalues.cpp)
target_link_libraries(gefe ${ARMADILLO_LIBRARIES}) # <<<
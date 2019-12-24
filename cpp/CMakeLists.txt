cmake_minimum_required(VERSION 3.15)
project(gefe)
add_subdirectory(testing)

find_package(Armadillo REQUIRED) # <<<
include_directories(${ARMADILLO_INCLUDE_DIRS}) # <<< it is optional if armadillo include folder is put in /usr/include.

set(CMAKE_CXX_STANDARD 17)

set(SOURCE_FILES main.cpp GEFE_utility.h)
add_executable(gefe ${SOURCE_FILES} GEFE_utility.h GEFE_utility.cpp)
target_link_libraries(gefe ${ARMADILLO_LIBRARIES})
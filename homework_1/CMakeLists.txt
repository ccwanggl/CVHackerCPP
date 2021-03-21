cmake_minimum_required(VERSION 3.10)

project(ModernCPPForCV
VERSION 1.0
LANGUAGES CXX)


include_directories(task_2/include)

add_executable( ${PROJECT_NAME} task_2/src/sum.cpp
                                task_2/src/subtract.cpp
                                task_2/src/main.cpp)

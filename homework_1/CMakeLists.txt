cmake_minimum_required(VERSION 3.10)

project(ModernCPPForCV
  VERSION 1.0
  LANGUAGES CXX)

add_subdirectory(task_2/arithmetic)

add_executable( ${PROJECT_NAME} task_2/src/main.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC task_2/arithmetic)


# 指明库的查找位置
# target_link_directories(${PROJECT_NAME} PRIVATE arithmetic)

target_link_libraries(${PROJECT_NAME} arithmetic)

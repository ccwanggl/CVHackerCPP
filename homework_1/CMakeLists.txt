cmake_minimum_required(VERSION 3.10)

project(MODERNCPPFORCV
  VERSION 1.0
  LANGUAGES CXX)

configure_file(task_2/src/modernCPPForCV.h.in modernCPPForCV.h)


add_subdirectory(task_2/arithmetic)

add_subdirectory(${PROJECT_SOURCE_DIR}/../external/glfw glfw)

add_executable( ${PROJECT_NAME} task_2/src/main.cpp)


# 指明库的查找位置
# target_link_directories(${PROJECT_NAME} PRIVATE arithmetic)


target_include_directories(${PROJECT_NAME} PUBLIC task_2/arithmetic
                                            PUBLIC ${PROJECT_BINARY_DIR})

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/../external/glfw/include)

target_link_directories(${PROJECT_NAME} PRIVATE ${PROJECT_BINARY_DIR}/glfw)
target_link_libraries(${PROJECT_NAME} arithmetic)
target_link_libraries(${PROJECT_NAME} glfw)

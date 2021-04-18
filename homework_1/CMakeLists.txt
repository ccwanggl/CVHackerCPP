cmake_minimum_required(VERSION 3.10)

project(MODERNCPPFORCV
	VERSION 1.0
	LANGUAGES CXX
)
	


option(USE_ARITHMETIC "A simple library for arithmetic." ON)

if(USE_ARITHMETIC)
  add_subdirectory(task_2/arithmetic)

  list(APPEND EXTRA_LIB_DIRS arithemtic)
  list(APPEND EXTRA_INCLUDE_DIRS "${PROJECT_SOURCE_DIR}/task_2/arithmetic")
  list(APPEND EXTRA_LINKS arithmetic)
endif()

configure_file(task_2/src/modernCPPForCV.h.in modernCPPForCV.h)


add_executable( ${PROJECT_NAME} task_2/src/main.cpp)

add_subdirectory(${PROJECT_SOURCE_DIR}/../external/glfw glfw)

#                    Download all the submodules
find_package(Git QUIET)
if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
# Update submodules as needed
  option(GIT_SUBMODULE "Check submodules during build" ON)
  if(GIT_SUBMODULE)
    message(STATUS "Submodule update")
    execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                    RESULT_VARIABLE GIT_SUBMOD_RESULT)
    if(NOT GIT_SUBMOD_RESULT EQUAL "0")
      message(FATAL_ERROR "git submodule update -- init failed with ${GIT_SUBMOD_RESULT}")
    endif()
  endif()
endif()


# CHECK ALL THE SUBMODULES
if(NOT EXISTS "${PROJECT_SOURCE_DIR}/../external/glfw/CMakeLists.txt")
  message(FATAL_ERROR "The glfw submodule was not download! GIT_SUBMODULE was turned off or failed.")
endif()




# 指明库的查找位置
# target_link_directories(${PROJECT_NAME} PRIVATE arithmetic)

target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_BINARY_DIR})
target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/../external/glfw/include
                                           PUBLIC ${EXTRA_INCLUDE_DIRS}
                                           )

target_link_directories(${PROJECT_NAME} PRIVATE ${PROJECT_BINARY_DIR}/glfw
                                        PRIVATE ${EXTRA_LIB_DIRS}
                                        )
target_link_libraries(${PROJECT_NAME} ${EXTRA_LINKS} glfw)

install(TARGETS ${PROJECT_NAME} DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/modernCPPForCV.h" DESTINATION include)

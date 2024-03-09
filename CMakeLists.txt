# Set minimum required version of CMake
cmake_minimum_required(VERSION 3.10)

set(TARGET_NAME					"STM32-DFU")     # Set Project name
set(CMAKE_VERBOSE_MAKEFILE		  	  false)     # Cmake debug

if(NOT CMAKE_TOOLCHAIN_FILE)
	set(CMAKE_TOOLCHAIN_FILE		${CMAKE_CURRENT_SOURCE_DIR}/cmake/arm-none-eabi.cmake)
endif()


# adjust project folder name if necessary
set(STM32_PROJ_FOLDER		   bluepill_dfu)

set(CMAKE_C_STANDARD 					 11)
set(CMAKE_C_STANDARD_REQUIRED 			 ON)
set(CMAKE_C_EXTENSIONS 					OFF)

project(${TARGET_NAME}			  
	VERSION 1.0.0
	DESCRIPTION "This is stm32 bluepill dfu")

message(STATUS "Building project: ${PROJECT_NAME}")


# set the default build type
if(NOT CMAKE_BUILD_TYPE) 
    set(CMAKE_BUILD_TYPE Release)
endif(NOT CMAKE_BUILD_TYPE)

if(CMAKE_BUILD_TYPE MATCHES Debug)
  message(STATUS "Build type: Debug")
elseif(CMAKE_BUILD_TYPE MATCHES Release)
  message(STATUS "Build type: Release")
endif()


# add source folder
add_subdirectory(${STM32_PROJ_FOLDER})


# @file: gcc-arm-none-eabi.cmake
# @brief:  Setup Environment Variable


set(CMAKE_SYSTEM_NAME                      Generic)
set(CMAKE_SYSTEM_PROCESSOR                     arm)
set(PREFIX                          arm-none-eabi-)

set(CMAKE_TRY_COMPILE_TARGET_TYPE   STATIC_LIBRARY)

# # which compilers to use
# if (CMAKE_HOST_WIN32)
#     set(TOOLCHAIN_DIR               $ENV{ARM_NONE_EABI_GCC_PATH}/ CACHE STRING "Compiler tool directory")
#     set(SYSTEM_SUFFIX               .exe)
# elseif(CMAKE_HOST_UNIX)
#     set(TOOLCHAIN_DIR               $ENV{ARM_NONE_EABI_GCC_PATH}/ CACHE STRING "Compiler tool directory")
# elseif (CMAKE_HOST_APPLE)
#     set(TOOLCHAIN_DIR               $ENV{ARM_NONE_EABI_GCC_PATH}/ CACHE STRING "Compiler tool directory")
# else()
#     set(TOOLCHAIN_DIR               ) # Compiler tool directory
# endif()


set(CMAKE_C_COMPILER                ${PREFIX}gcc${SYSTEM_SUFFIX}                                CACHE STRING    "C compiler"    FORCE)
set(CMAKE_CXX_COMPILER              ${PREFIX}g++${SYSTEM_SUFFIX}                                CACHE STRING    "C++ compiler"  FORCE)
set(CMAKE_ASM_COMPILER              ${PREFIX}gcc${SYSTEM_SUFFIX})

find_path(COMPILER_DIR ${CMAKE_C_COMPILER})
get_filename_component(TOOLCHAIN_DIR ${COMPILER_DIR} DIRECTORY)

set(CMAKE_OBJCOPY                   ${TOOLCHAIN_DIR}/bin/${PREFIX}objcopy${SYSTEM_SUFFIX}       CACHE INTERNAL  "objcopy tool"  FORCE)
set(CMAKE_SIZE_UTIL                 ${TOOLCHAIN_DIR}/bin/${PREFIX}size${SYSTEM_SUFFIX}          CACHE STRING    "size tool"     FORCE)
# set(CMAKE_OBJDUMP                   ${TOOLCHAIN_DIR}${PREFIX}objdump${SYSTEM_SUFFIX}     CACHE INTERNAL  "objdump tool"  FORCE)
# set(CMAKE_ASM_NASM_COMPILER         ${TOOLCHAIN_DIR}${PREFIX}as${SYSTEM_SUFFIX}          CACHE STRING    "assembler"     FORCE)
# set(CMAKE_AR_COMPILER               ${TOOLCHAIN_DIR}${PREFIX}ar${SYSTEM_SUFFIX})

set(CC                              ${CMAKE_C_COMPILER})
set(AS                              ${CMAKE_ASM_COMPILER} -x assembler-with-cpp)
set(CP                              ${CMAKE_OBJCOPY})
set(SZ                              ${CMAKE_SIZE_UTIL})


set(CMAKE_FIND_ROOT_PATH            ${COMPILER_DIR})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


set(GCC_WARNING_VERBOSE                            OFF) # DISABLE GCC WARNING INFO
set(CMAKE_C_COMPILER_FORCED                       TRUE) # skip compiler test
set(CMAKE_CXX_COMPILER_FORCED                     TRUE)
set(CMAKE_C_COMPILER_WORKS      TRUE CACHE INTERNAL "")
set(CMAKE_CXX_COMPILER_WORKS    TRUE CACHE INTERNAL "")
set(CMAKE_ASM_COMPILER_ID_RUN   TRUE CACHE INTERNAL "")     # do not check asm compiler


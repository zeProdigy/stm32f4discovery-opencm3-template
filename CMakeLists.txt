cmake_minimum_required(VERSION 3.10)

set(PROJECT_NAME stm32f4disco)

project(${PROJECT_NAME})
enable_language(C ASM)


set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} \
    -g \
    -O0 \
    -std=c99 \
    -ffunction-sections \
    -fdata-sections \
    -Wall -Wextra \
    -fdiagnostics-color=always")


add_definitions(-DSTM32F4)
add_definitions(-D__ARM_ARCH_7M__)


include(libopencm3.cmake)

set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} \
    -Wl,--gc-sections \
    -T ${OPENCM3_LD_FILE}")


add_executable(${PROJECT_NAME} main.c)
add_dependencies(${PROJECT_NAME} opencm3)
target_link_libraries(${PROJECT_NAME} ${LIB_OPENCM3})
target_include_directories(${PROJECT_NAME} PRIVATE ${INC_OPENCM3})
set_target_properties(${PROJECT_NAME} PROPERTIES SUFFIX ".elf")

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND arm-none-eabi-size "${PROJECT_NAME}.elf")

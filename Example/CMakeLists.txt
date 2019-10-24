cmake_minimum_required(VERSION 3.15)
project(Example C)

set(CMAKE_C_STANDARD 11)

add_executable(Example smaller_driver.c smaller.c smaller.h)
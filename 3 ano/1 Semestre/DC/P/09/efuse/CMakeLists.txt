# Projeto ESP-IDF v6.1 (ESP32-C6): eFuses virtuais e AES-256
cmake_minimum_required(VERSION 3.22)
include($ENV{IDF_PATH}/tools/cmake/project.cmake)
idf_build_set_property(MINIMAL_BUILD ON)
project(efuse_aes)

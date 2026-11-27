# Projeto ESP-IDF v6.1 (ESP32-C6): driver ST7735S para o TFT Adafruit 0.96" 160x80
cmake_minimum_required(VERSION 3.22)
include($ENV{IDF_PATH}/tools/cmake/project.cmake)
idf_build_set_property(MINIMAL_BUILD ON)
project(tft_st7735)

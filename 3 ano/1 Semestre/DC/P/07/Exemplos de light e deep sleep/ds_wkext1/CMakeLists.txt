# Projeto ESP-IDF v6.1 (ESP32-C6)
cmake_minimum_required(VERSION 3.22)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
# Incluir apenas os componentes de que o projeto depende
idf_build_set_property(MINIMAL_BUILD ON)
project(ds_wkext1)

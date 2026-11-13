# Projeto ESP-IDF v6.1 (ESP32-C6), baseado no exemplo "ssl" do componente espressif/mqtt
cmake_minimum_required(VERSION 3.22)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
# Incluir apenas os componentes de que o projeto depende
idf_build_set_property(MINIMAL_BUILD ON)
project(mqtt_ssl)

# Inclui o certificado da CA do broker no firmware (símbolos _binary_mosquitto_org_crt_start/_end)
target_add_binary_data(${PROJECT_NAME}.elf "main/mosquitto.org.crt" TEXT)

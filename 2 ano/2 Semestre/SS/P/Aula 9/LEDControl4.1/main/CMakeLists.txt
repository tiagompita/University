idf_component_register(SRCS "main.c"
                    INCLUDE_DIRS "."
                    REQUIRES freertos esp_driver_gpio esp_driver_gptimer esp_adc esp_driver_ledc log esp_wifi)
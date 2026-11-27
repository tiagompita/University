# No ESP-IDF v6.x, o componente "driver" já não inclui o SPI: o driver SPI está em esp_driver_spi
idf_component_register(
    SRCS "src/st7735.c"
         "src/graphics.c"
    INCLUDE_DIRS "include"
    REQUIRES esp_driver_spi esp_driver_gpio
    PRIV_REQUIRES esp_timer log esp_hw_support
)

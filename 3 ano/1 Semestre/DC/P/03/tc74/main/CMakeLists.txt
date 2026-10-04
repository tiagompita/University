idf_component_register(SRCS "tc74_test.c"
                       PRIV_REQUIRES spi_flash
                       INCLUDE_DIRS "."
                       REQUIRES esp_driver_i2c)

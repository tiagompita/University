/* 1. Primeiro o FreeRTOS.h */
#include "freertos/FreeRTOS.h"

/* 2. Depois os outros cabeçalhos do FreeRTOS */
#include "freertos/task.h"
#include "freertos/queue.h"

/* 3. Depois os drivers do ESP-IDF */
#include "driver/gpio.h"

/* 4. Outros cabeçalhos padrão do C */
#include <stdio.h>

void app_main(void)
{

    gpio_reset_pin(GPIO_NUM_11);

    gpio_set_direction(GPIO_NUM_11, GPIO_MODE_OUTPUT);

    while (1)
    {
        gpio_set_level(GPIO_NUM_11, 1);
        vTaskDelay(pdMS_TO_TICKS(500));

        gpio_set_level(GPIO_NUM_11, 0);
        vTaskDelay(pdMS_TO_TICKS(500));
    }
    
}

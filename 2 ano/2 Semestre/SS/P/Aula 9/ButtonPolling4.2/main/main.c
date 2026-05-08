/* 1. Primeiro o FreeRTOS.h */
#include "freertos/FreeRTOS.h"

/* 2. Depois os outros cabeçalhos do FreeRTOS */
#include "freertos/task.h"
#include "freertos/queue.h"

/* 3. Depois os drivers do ESP-IDF */
#include "driver/gpio.h"

/* 4. Outros cabeçalhos padrão do C */
#include <stdio.h>
#include <stdbool.h>

void app_main(void)
{

    gpio_reset_pin(GPIO_NUM_9);

    gpio_set_direction(GPIO_NUM_9, GPIO_MODE_INPUT);

    bool flag = 0;    

    while (1)
    {
        if (gpio_get_level(GPIO_NUM_9) == 1 && flag == 0) {
            printf("[EVENTO] Botão pressionado");

            flag = 1;
        }
        
        if (gpio_get_level(GPIO_NUM_9) == 0 && flag == 0)
        {
            printf("[EVENTO] Botão largado");
            flag = 1;
        }

        
        flag = 0;
    }
}

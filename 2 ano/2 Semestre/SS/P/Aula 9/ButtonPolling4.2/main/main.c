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

    bool estado_anterior = gpio_get_level(GPIO_NUM_9);


    while (1)
    {
        bool estado_atual = gpio_get_level(GPIO_NUM_9);

        if (estado_atual != estado_anterior) {
            vTaskDelay(pdMS_TO_TICKS(50)); //debounce

            bool estado_confirmado = gpio_get_level(GPIO_NUM_9);

            if (estado_confirmado == estado_atual) {
                if (estado_atual == 0) {
                    printf("[EVENTO] Botão pressionado!\n");
                } else {
                    printf("[EVENTO] Botão largado!\n");
                }

                estado_anterior = estado_atual;
            }
        }
        vTaskDelay(pdMS_TO_TICKS(10));
        
    }
}

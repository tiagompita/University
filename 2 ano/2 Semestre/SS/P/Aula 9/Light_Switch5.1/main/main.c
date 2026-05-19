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

    // Configurar o botao "boot" como input
    gpio_reset_pin(GPIO_NUM_9);
    gpio_set_direction(GPIO_NUM_9, GPIO_MODE_INPUT);

    // configurar o polo 11 como saida
    gpio_reset_pin(GPIO_NUM_11);
    gpio_set_direction(GPIO_NUM_11, GPIO_MODE_OUTPUT);

    bool estado_anterior = gpio_get_level(GPIO_NUM_9);

    int estado_freq = 0;
    int msTick = 500;

    while (1)
    {
        bool estado_atual = gpio_get_level(GPIO_NUM_9);

        if (estado_atual != estado_anterior)
        {
            vTaskDelay(pdMS_TO_TICKS(50)); // debounce

            bool estado_confirmado = gpio_get_level(GPIO_NUM_9);

            if (estado_confirmado == estado_atual)
            {
                if (estado_atual == 0)
                {
                    printf("[EVENTO] Botão pressionado!\n");

                    switch (estado_freq)
                    {
                    default:
                        msTick = 500;
                        break;
                    case 1:
                        msTick = 100;
                        break;
                    case 2:
                        msTick = 50;
                        break;
                    }

                    estado_freq = (estado_freq + 1) % 3;
                }
                else
                {
                    printf("[EVENTO] Botão largado!\n");
                }

                estado_anterior = estado_atual;
            }
            
        }

        // Leitura do botão nao é instantanea, é preciso aguentar o botão um pouco especialmente quando está a piscar a 1Hz

        gpio_set_level(GPIO_NUM_11, 1);
        vTaskDelay(pdMS_TO_TICKS(msTick));

        gpio_set_level(GPIO_NUM_11, 0);
        vTaskDelay(pdMS_TO_TICKS(msTick));
    }
}

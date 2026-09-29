#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

void task1(void *arg)
{
    const char *id = (const char *) arg;

    while (true)
    {
        printf("reading temperature from %s\n", id);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void task2(void *arg)
{
    const char *id = (const char *) arg;

    while (true)
    {
        printf("reading humidity from %s\n", id);
        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}

void app_main(void)
{
    xTaskCreate(task1, "task 1", 2048, "task1", 2, NULL);
    xTaskCreate(task2, "task 2", 2048, "task2", 2, NULL);

}

// Questao 1 #############
/*
    Atualmente a task1 e task2 não estão devidamente definidas como task para o freeRTOS, neste codigo, simplesmente são funções. Logo como a task1 está em loop infinito, nunca termina, o programa nunca chegará a executar a task2.
*/
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

void task3(void *arg)
{
    const char *id = (const char *) arg;

    while (true)
    {
        printf("reading air from %s\n", id);
        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}

void task4(void *arg)
{
    const char *id = (const char *) arg;

    while (true)
    {
        printf("reading wind from %s\n", id);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void task5(void *arg)
{
    const char *id = (const char *) arg;

    while (true)
    {
        printf("reading books from %s\n", id);
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void app_main(void)
{
    xTaskCreate(task1, "task 1", 2048, "task1", 2, NULL);
    xTaskCreate(task2, "task 2", 2048, "task2", 2, NULL);
    xTaskCreate(task3, "task 3", 2048, "task3", 1, NULL);
    xTaskCreate(task4, "task 4", 2048, "task4", 5, NULL);
    xTaskCreate(task5, "task 5", 2048, "task5", 7, NULL);

    
}

// Questao 5 #############
/*

    Neste caso não há vantagem pois o ESP32c6 apenas tem 1 core de alto desempenho

*/
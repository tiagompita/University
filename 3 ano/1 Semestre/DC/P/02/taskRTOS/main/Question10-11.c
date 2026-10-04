#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"

SemaphoreHandle_t xMutex;

void writeToBus(char *message)
{
    printf(message);
}

void task1(void *params)
{
    while (true)
    {
        printf("reading temperature \n");
        if(xSemaphoreTake( xMutex, pdMS_TO_TICKS(500) )) {
            writeToBus("temperature is 25c\n");
            vTaskDelay(pdMS_TO_TICKS(5000));
            xSemaphoreGive(xMutex);
        } else {
            printf("writing temperature timed out\n");
        }
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}

void task2(void *params)
{
    while (true)
    {
        printf("reading humidity\n");
        if(xSemaphoreTake( xMutex, pdMS_TO_TICKS(500) )) {
            writeToBus("humidity is 50 \n");
            xSemaphoreGive(xMutex);
        } else {
            printf("writing humidity timed out\n");
        }
        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}

void app_main(void)
{
    xMutex = xSemaphoreCreateMutex();
    if (xMutex != NULL) {
        xTaskCreate(&task1, "temperature reading", 2048, NULL, 2, NULL);
        xTaskCreate(&task2, "humidity reading", 2048, NULL, 2, NULL);
    }
}

// Questao 10 #############
/*

    O problema inicial está no acesso a um recurso partilhado, a task1 executa de 1 em 1 segundo e a task2 de 2 em 2 segundos. Ou seja, de 2 em 2 segundos o programa tem de decidir qual task é que vai entrar no barramento para ser imprimida. Ora se ambas têm a mesma prioridade, e há um momento em que ambas precisam do barramento, criará uma race condition. 
    Atualmente durante uma execução a ordem de acesso ao barramento não é previsível, não havendo uma intercalação limpa.
    
    De modo ao código ficar com uma execução limpa e pela ordem pretendida do programador será necessário aplicar uma exclusão mutua (Mutex: garante que o uso de um recurso, neste caso o barramento, não seja interferido durante o seu uso.)

*/
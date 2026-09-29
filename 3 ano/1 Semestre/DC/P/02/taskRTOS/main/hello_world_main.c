#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

static TaskHandle_t receiverHandler = NULL;

void sender(void * params) {
    while (true)
    {
        xTaskNotifyGive(receiverHandler);
        xTaskNotifyGive(receiverHandler);
        xTaskNotifyGive(receiverHandler);
        xTaskNotifyGive(receiverHandler);
        vTaskDelay(pdMS_TO_TICKS(5000));
    }
}
void receiver(void * params) {

    while (true)
    {
        uint32_t count = ulTaskNotifyTake(pdTRUE, portMAX_DELAY);
        printf("received notification %lu times\n", count);
    }
}
void app_main(void)
{
    xTaskCreate(&receiver, "receiver", 2048, NULL, 2, &receiverHandler);
    xTaskCreate(&sender, "sender", 2048, NULL, 2, NULL);
}

// Questao 6 #############
/*

    Porque a tarefa receiver é bloqueante, ou seja, ela fica à espera, até um tempo definido para que o "sender" a desbloqueie e o "receiver" possa executar a sua tarefa.
    De notar que quando o receiver está bloqueado o scheduler permite que outras tasks, como o sender, sejam executadas.

*/

// Questao 7 #############
/*

    O tempo máximo definido está no segundo parametro "portMAX_DELAY".
    Segundo o manual do freeRTOS:
        |
        |   Setting xTicksToWait to portMAX_DELAY will cause the task to wait indefinitely (without timing out)
        |
    Ou seja, este código espera infinitamente pelo o sender.
*/
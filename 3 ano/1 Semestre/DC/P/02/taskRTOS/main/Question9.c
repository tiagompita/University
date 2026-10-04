#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

static TaskHandle_t receiverHandler = NULL;

void sender(void * params) {
    while (true)
    {
        xTaskNotify(receiverHandler, 1, eSetValueWithOverwrite);
        xTaskNotify(receiverHandler, 2, eSetValueWithOverwrite);
        xTaskNotify(receiverHandler, 4, eSetValueWithOverwrite);
        xTaskNotify(receiverHandler, 8, eSetValueWithOverwrite);
        vTaskDelay(pdMS_TO_TICKS(5000));
    }
}
void receiver(void * params) {

    uint32_t count = 0;
    while (true)
    {
        xTaskNotifyWait(0, 0xFFFFFFFF, &count, portMAX_DELAY);
        printf("received notification %lu\n", count);
    }
}
void app_main(void)
{
    xTaskCreate(&receiver, "receiver", 2048, NULL, 3, &receiverHandler);
    xTaskCreate(&sender, "sender", 2048, NULL, 2, NULL);
}

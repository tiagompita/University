#include <stdio.h>
#include <inttypes.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "esp_sleep.h"
#include "esp_timer.h"
#include "esp_rom_serial_output.h"
#include "ppk_marker.h"

#define INPUT_PIN GPIO_NUM_0  // botão, ativo a 0

static void console_flush(void)
{
    fflush(stdout);
    esp_rom_output_tx_wait_idle(CONFIG_ESP_CONSOLE_UART_NUM);
}

void app_main(void)
{
    ppk_marker_init();

    // Botão como entrada com pull-up (ativo a 0)
    gpio_config_t cfg = {
        .pin_bit_mask = 1ULL << INPUT_PIN,
        .mode = GPIO_MODE_INPUT,
        .pull_up_en = GPIO_PULLUP_ENABLE,
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
        .intr_type = GPIO_INTR_DISABLE
    };
    gpio_config(&cfg);

    // Acordar quando o pino estiver a 0
    gpio_wakeup_enable(INPUT_PIN, GPIO_INTR_LOW_LEVEL);
    esp_sleep_enable_gpio_wakeup();

    while (true) {

        if (gpio_get_level(INPUT_PIN) == 0) {
            printf("please release button\n");
            console_flush();
            do {
                vTaskDelay(pdMS_TO_TICKS(10));
            } while (gpio_get_level(INPUT_PIN) == 0);
        }

        printf("going for a nap\n");
        console_flush();

        int64_t before = esp_timer_get_time();
        ppk_marker_set(0);
        esp_light_sleep_start();
        ppk_marker_set(1);
        int64_t after = esp_timer_get_time();

        uint32_t causes = esp_sleep_get_wakeup_causes();
        const char *why = (causes & BIT(ESP_SLEEP_WAKEUP_GPIO)) ? "button" : "other";

        printf("woke up after %" PRId64 " ms, reason: %s\n",
               (after - before) / 1000, why);
        console_flush();

        vTaskDelay(pdMS_TO_TICKS(20));  // debounce
    }
}

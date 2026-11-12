#include <stdio.h>
#include <inttypes.h>
#include "esp_sleep.h"
#include "esp_timer.h"
#include "esp_rom_serial_output.h"
#include "ppk_marker.h"

static void console_flush(void)
{
    fflush(stdout);                                           // esvazia o buffer da stdio
    esp_rom_output_tx_wait_idle(CONFIG_ESP_CONSOLE_UART_NUM); // espera que a UART acabe de transmitir
}

void app_main(void)
{
    ppk_marker_init();

    while (1) {
        esp_sleep_enable_timer_wakeup(1000000); // 1 s
        printf("going for a nap\n");
        console_flush();

        int64_t before = esp_timer_get_time();
        ppk_marker_set(0);
        esp_light_sleep_start();
        ppk_marker_set(1);
        int64_t after = esp_timer_get_time();

        printf("napped for %" PRId64 "\n", (after - before) / 1000);
        console_flush();
    }
}

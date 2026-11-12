#include <stdio.h>
#include "esp_sleep.h"
#include "ppk_marker.h"

int timesWokenUp = 0;

void app_main(void)
{
    ppk_marker_init();

    esp_sleep_enable_timer_wakeup(3 * 1000000);
    printf("going to sleep. woken up %d\n", timesWokenUp++);

    ppk_marker_deep_sleep();
    esp_deep_sleep_start();
}

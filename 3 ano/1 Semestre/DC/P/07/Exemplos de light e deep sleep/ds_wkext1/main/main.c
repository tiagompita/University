#include <stdio.h>
#include "esp_attr.h"
#include "esp_sleep.h"
#include "driver/rtc_io.h"
#include "driver/gpio.h"
#include "ppk_marker.h"

#define INPUT_PIN GPIO_NUM_0   // LP GPIO; o botão liga o pino a GND quando premido

RTC_DATA_ATTR int timesWokenUp = 0;

void app_main(void)
{
    ppk_marker_init();

    // Pino como LP IO com pull-up: repouso = 1, premido = 0
    rtc_gpio_init(INPUT_PIN);
    rtc_gpio_set_direction(INPUT_PIN, RTC_GPIO_MODE_INPUT_ONLY);
    rtc_gpio_pullup_en(INPUT_PIN);
    rtc_gpio_pulldown_dis(INPUT_PIN);

    // Mantém o domínio RTC_PERIPH ligado para o pull-up interno continuar ativo
    esp_sleep_pd_config(ESP_PD_DOMAIN_RTC_PERIPH, ESP_PD_OPTION_ON);

    // Acordar quando algum dos pinos selecionados estiver a 0 (ANY_LOW)
    esp_sleep_enable_ext1_wakeup_io(1ULL << INPUT_PIN, ESP_EXT1_WAKEUP_ANY_LOW);

    printf("Going to deep sleep. Woken up %d\n", timesWokenUp++);

    ppk_marker_deep_sleep();
    esp_deep_sleep_start();
}

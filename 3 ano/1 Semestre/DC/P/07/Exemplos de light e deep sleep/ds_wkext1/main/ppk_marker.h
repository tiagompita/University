/*
 * Marcador de fase para o porto lógico do Power Profiler Kit II.
 *
 * Ligue PPK_MARKER_GPIO à entrada D0 do porto lógico (e o VCC do porto
 * ao 3V3 da placa). O pino está a 1 enquanto o programa corre e a 0
 * enquanto o SoC dorme, o que permite selecionar cada fase no gráfico.
 */
#pragma once

#include "driver/gpio.h"

#define PPK_MARKER_GPIO GPIO_NUM_4

static inline void ppk_marker_set(int level)
{
    gpio_set_level(PPK_MARKER_GPIO, level);
}

static inline void ppk_marker_init(void)
{
    gpio_hold_dis(PPK_MARKER_GPIO);          /* liberta o pino retido no deep-sleep */
    gpio_config_t cfg = {
        .pin_bit_mask = 1ULL << PPK_MARKER_GPIO,
        .mode = GPIO_MODE_OUTPUT,
    };
    gpio_config(&cfg);
    gpio_sleep_sel_dis(PPK_MARKER_GPIO);     /* mantém o nível durante o light-sleep */
    ppk_marker_set(1);
}

/* Antes de esp_deep_sleep_start(): fixa o pino a 0 durante o deep-sleep */
static inline void ppk_marker_deep_sleep(void)
{
    ppk_marker_set(0);
    gpio_hold_en(PPK_MARKER_GPIO);
}

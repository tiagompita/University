/* 1. Primeiro o FreeRTOS.h */
#include "freertos/FreeRTOS.h"

/* 2. Depois os outros cabeçalhos do FreeRTOS */
#include "freertos/task.h"
#include "freertos/queue.h"

/* 3. Depois os drivers do ESP-IDF */
#include "driver/gpio.h"
#include "driver/ledc.h"

/* 4. Outros cabeçalhos padrão do C */
#include <stdio.h>
#include <stdbool.h>

void app_main(void)
{
    // 1. Parametros para a configuração do Timer
    ledc_timer_config_t ledc_timer = {
        .speed_mode = LEDC_LOW_SPEED_MODE,    // Único modo suportado no C6
        .timer_num = LEDC_TIMER_0,            // O ID do timer
        .duty_resolution = LEDC_TIMER_13_BIT, // Resolução de 13bits para um duty cycle suave
        .freq_hz = 5000,                      // Frequência de 5kHz
        .clk_cfg = LEDC_AUTO_CLK              // O sistema escolhe a melhor fonte de relógio
    };
    ledc_timer_config(&ledc_timer);           // Introduzir a configuração no timer

    ledc_channel_config_t ledc_channel = {
        .gpio_num = 11,                    // Pino GPIO onde o LED está ligado
        .speed_mode = LEDC_LOW_SPEED_MODE, // Modo de velocidade (apenas existe LEDC_LOW_SPEED_MODE para o ESP32C6)
        .channel = LEDC_CHANNEL_0,         // Índice do canal LEDC
        .timer_sel = LEDC_TIMER_0,         // Timer que este canal irá utilizar
        .duty = 0,                         // Ciclo de trabalho inicial (LED desligado)
        .hpoint = 0                        // Ponto de início do ciclo PWM
    };
    ledc_channel_config(&ledc_channel);    // Introduzir a configuração no channel

    ledc_fade_func_install(0);

    while (1)
    {
        ledc_set_fade_time_and_start(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0, 8191, 2000, LEDC_FADE_WAIT_DONE);

        // Como o fade_mode está como "LEDC_FADE_WAIT_DONE", ele irá esperar 
        //      que a primeira chamada termine, criando assim o efeito pretendido.

        ledc_set_fade_time_and_start(LEDC_LOW_SPEED_MODE, LEDC_CHANNEL_0, 0, 2000, LEDC_FADE_WAIT_DONE);
    }
}

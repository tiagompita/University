#include <stdio.h>
#include <string.h>
#include <math.h>
#include "freertos/FreeRTOS.h"
#include <freertos/task.h>
#include "esp_adc/adc_continuous.h"
#include "esp_log.h"
#include "esp_check.h"
#include <driver/gptimer.h>
#include <driver/gpio.h>
#include "esp_dsp.h"

static const char *TAG = "ADC_DMA";

// fs = 20 kHz. Existem valores minimos e máximos suportados pela ADC, definidos
// pelas macro SOC_ADC_SAMPLE_FREQ_THRES_LOW e SOC_ADC_SAMPLE_FREQ_THRES_HIGH respetivamente.
// (Macros definidas em "soc/soc_caps.h").
#define SAMPLING_FREQUENCY_HZ 20000
#define SAMPLES_NUMBER_GOAL 4096 // deltaF = fs / N , onde N = 2^12 para que deltaF <=5. N tem de ser potencia de 2

// Vamos definir conversion frames com 64 amostras que resulta em cerca de 64*4=256 Bytes (SOC_ADC_DIGI_RESULT_BYTES no nosso caso é 4 Bytes).
// Temos assim um equilibrio entre recursos necessários e número de vezes que o CPU é interrompido para a operação de leitura da frame (p. ex., caso usemos ISR).
#define CONVERSION_FRAME_LENGTH (64 * SOC_ADC_DIGI_RESULT_BYTES)

// A stack FreeRTOS para app_main é reduzida (4 a 8 KB).
// A declaração de variáveis "gigantes", como o array seguinte, deve ser feita aqui para ser alocada em RAM,
// caso contrário, vamos ter stack overflow e o programa "morre".
float processed_samples[SAMPLES_NUMBER_GOAL]; // Para guardar as nossas amostras processadas (p. ex, para depois usarmos no Octave).
uint32_t number_proccesed_samples = 0;        // Contador com o número de amostras processadas e guardadas no nosso buffer principal.


float array_fft[SAMPLES_NUMBER_GOAL * 2];

volatile uint32_t state = 0;

static bool timer_isr_callback(gptimer_handle_t timer, const gptimer_alarm_event_data_t *edata, void *user_data)
{

    gpio_set_level(GPIO_NUM_11, state);

    state = !state;

    return false;
}

void app_main(void)
{
    printf("Starting LED blinking with ISR...\n");

    gpio_reset_pin(GPIO_NUM_11);

    gpio_set_direction(GPIO_NUM_11, GPIO_MODE_OUTPUT);

    gptimer_handle_t gptimer = NULL;
    gptimer_config_t timer_config = {
        .clk_src = GPTIMER_CLK_SRC_DEFAULT, // Select the default clock source
        .direction = GPTIMER_COUNT_UP,      // Counting direction is up
        .resolution_hz = 1 * 1000 * 1000,   // Resolution is 1 MHz, i.e., 1 tick equals 1 microsecond
    };
    // Create a timer instance
    ESP_ERROR_CHECK(gptimer_new_timer(&timer_config, &gptimer));

    gptimer_event_callbacks_t cbs = {
        .on_alarm = timer_isr_callback, // Call the user callback function when the alarm event occurs
    };
    // Register timer event callback functions, allowing user context to be carried
    ESP_ERROR_CHECK(gptimer_register_event_callbacks(gptimer, &cbs, NULL));

    gptimer_alarm_config_t alarm_config = {
        .reload_count = 0,                  // When the alarm event occurs, the timer will automatically reload to 0
        .alarm_count = 10000,               // 50Hz (0.02s / 2 = 0.01s = 10000us)
        .flags.auto_reload_on_alarm = true, // Enable auto-reload function
    };
    // Set the timer's alarm action
    ESP_ERROR_CHECK(gptimer_set_alarm_action(gptimer, &alarm_config));

    // Enable the timer
    ESP_ERROR_CHECK(gptimer_enable(gptimer));
    // Start the timer
    ESP_ERROR_CHECK(gptimer_start(gptimer));

    ESP_LOGI(TAG, "Starting adc continuous mode demo...");

    // I) Instanciar e configurar driver.
    adc_continuous_handle_t adc_handle = NULL;
    adc_continuous_handle_cfg_t adc_handle_config = {
        .max_store_buf_size = 4 * CONVERSION_FRAME_LENGTH,
        .conv_frame_size = CONVERSION_FRAME_LENGTH,
    };
    ESP_ERROR_CHECK(adc_continuous_new_handle(&adc_handle_config, &adc_handle));

    // II) Configurar canal e módulo ADC.
    adc_digi_pattern_config_t channel_config = {
        .channel = ADC_CHANNEL_3,
        .atten = ADC_ATTEN_DB_12,
        .unit = ADC_UNIT_1,
        .bit_width = ADC_BITWIDTH_12,
    };

    adc_continuous_config_t adc_config = {
        .pattern_num = 1,
        .adc_pattern = &channel_config,
        .sample_freq_hz = SAMPLING_FREQUENCY_HZ,
        .conv_mode = ADC_CONV_SINGLE_UNIT_1,
        .format = ADC_DIGI_OUTPUT_FORMAT_TYPE2,
    };
    ESP_ERROR_CHECK(adc_continuous_config(adc_handle, &adc_config));

    uint8_t dma_buffer[CONVERSION_FRAME_LENGTH];
    uint32_t number_read_bytes = 0;

    // III) Iniciar a amostragem.
    ESP_ERROR_CHECK(adc_continuous_start(adc_handle));

    // IV) Transferir e processar conversion frames
    while (1)
    {
        esp_err_t erro = adc_continuous_read(adc_handle, dma_buffer, CONVERSION_FRAME_LENGTH, &number_read_bytes, portMAX_DELAY);

        if (erro == ESP_OK)
        {
            uint32_t frame_samples_number = number_read_bytes / SOC_ADC_DIGI_RESULT_BYTES;

            for (int sample_index = 0; sample_index < frame_samples_number; sample_index++)
            {
                if (number_proccesed_samples >= SAMPLES_NUMBER_GOAL)
                {
                    break;
                }

                adc_digi_output_data_t *dados = (adc_digi_output_data_t *)&dma_buffer[sample_index * SOC_ADC_DIGI_RESULT_BYTES];
                uint32_t raw_sample = dados->type2.data;

                processed_samples[number_proccesed_samples] = (((float)raw_sample / 4095.0) * 3.9) * 1000;

                number_proccesed_samples++;
            }

            if (number_proccesed_samples >= SAMPLES_NUMBER_GOAL)
            {
                ESP_LOGI(TAG, "Desired number of samples achieved! Stopping sampling.");
                ESP_ERROR_CHECK(adc_continuous_stop(adc_handle));

                for (int sample_index = 0; sample_index < 25; sample_index++)
                {
                    ESP_LOGI(TAG, "Sample %d: %.2f mV\n", sample_index, processed_samples[sample_index]);
                }

                
                ESP_LOGI(TAG, "A iniciar cálculos da FFT...");

                for (uint32_t i = 0; i < SAMPLES_NUMBER_GOAL; i++) {
                    array_fft[i * 2 + 0] = processed_samples[i] / 1000.0; // Dividi por 1000 para voltar a volts
                    array_fft[i * 2 + 1] = 0.0;
                }
                
                dsps_fft2r_init_fc32(NULL, CONFIG_DSP_MAX_FFT_SIZE);

                dsps_fft2r_fc32(array_fft, SAMPLES_NUMBER_GOAL);

                dsps_bit_rev_fc32(array_fft, SAMPLES_NUMBER_GOAL);

                // Calcular magnitude e procurar picos.
                // Faz um ciclo for que vai apenas até METADE das amostras (SAMPLES_NUMBER_GOAL / 2) porque consideramos apenas as frequências positivas
                // Dentro do ciclo:
                //   a. Extrai a parte real (índice i*2+0) e a parte imaginária (índice i*2+1).
                //   b. Calcula a magnitude: float magnitude = sqrt((real * real) + (imag * imag));
                //   c. Normaliza o valor: Se for o índice 0 (DC), divide por (SAMPLES_NUMBER_GOAL). Os restantes divide por (SAMPLES_NUMBER_GOAL / 2.0).
                //   d. Se o valor normalizado for superior a 0.200 V:
                //        - Calcula a frequência correspondente: float freq = (float)i * ((float)SAMPLING_FREQUENCY_HZ / (float)SAMPLES_NUMBER_GOAL);
                //        - Imprime (ESP_LOGI) a frequência e a sua magnitude.

                for (uint32_t i = 0; i < SAMPLES_NUMBER_GOAL / 2; i++) {
                    float Rm = array_fft[i*2 + 0];
                    float Im = array_fft[i*2 + 1];

                    float magnitude = sqrt((Rm * Rm) + (Im * Im));

                    if (i == 0) {
                        magnitude = magnitude / SAMPLES_NUMBER_GOAL;
                    } else {
                        magnitude = magnitude / (SAMPLES_NUMBER_GOAL / 2.0);
                    }

                    if (magnitude >= 0.100) { // Alterei de 0.200 para 0.100 (Exercicio 3.2)
                        float freq = (float)i * ((float)SAMPLING_FREQUENCY_HZ / (float)SAMPLES_NUMBER_GOAL);

                        int num_barras = (int)(magnitude * 10);
                        if (num_barras > 49) num_barras = 49;

                        char barras[50];
                        for (uint32_t j = 0; j < num_barras; j++) {
                            barras[j] = '=';
                        }
                        barras[num_barras] = '\0';

                        ESP_LOGI(TAG, "Freq: %6.2f Hz || Magnitude: %4.2f V | %s", freq, magnitude, barras);
                    }

                }

                break;
            }
        }
    }

    ESP_LOGI(TAG, "ADC sampling finished. Keeping app_main alive for the timer...");
    while (1)
    {
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}
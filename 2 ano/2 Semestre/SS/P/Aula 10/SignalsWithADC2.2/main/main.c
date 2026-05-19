#include <stdio.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include <freertos/task.h>
#include "esp_adc/adc_continuous.h"
#include "esp_log.h"
#include "esp_check.h"
#include <driver/gptimer.h>
#include <driver/gpio.h>

static const char *TAG = "ADC_DMA";

// fs = 20 kHz. Existem valores minimos e máximos suportados pela ADC, definidos
// pelas macro SOC_ADC_SAMPLE_FREQ_THRES_LOW e SOC_ADC_SAMPLE_FREQ_THRES_HIGH respetivamente.
// (Macros definidas em "soc/soc_caps.h").
#define SAMPLING_FREQUENCY_HZ 20000
#define SAMPLES_NUMBER_GOAL 4096       // deltaF = fs / N , onde N = 2^12 para que deltaF <=5. N tem de ser potencia de 2

// Vamos definir conversion frames com 64 amostras que resulta em cerca de 64*4=256 Bytes (SOC_ADC_DIGI_RESULT_BYTES no nosso caso é 4 Bytes).
// Temos assim um equilibrio entre recursos necessários e número de vezes que o CPU é interrompido para a operação de leitura da frame (p. ex., caso usemos ISR).
#define CONVERSION_FRAME_LENGTH (64 * SOC_ADC_DIGI_RESULT_BYTES)

// A stack FreeRTOS para app_main é reduzida (4 a 8 KB).
// A declaração de variáveis "gigantes", como o array seguinte, deve ser feita aqui para ser alocada em RAM,
// caso contrário, vamos ter stack overflow e o programa "morre".
float processed_samples[SAMPLES_NUMBER_GOAL]; // Para guardar as nossas amostras processadas (p. ex, para depois usarmos no Octave).
uint32_t number_proccesed_samples = 0;        // Contador com o número de amostras processadas e guardadas no nosso buffer principal.

volatile uint32_t state = 0;

static bool timer_isr_callback(gptimer_handle_t timer, const gptimer_alarm_event_data_t *edata, void *user_data) {

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
        //.alarm_count = 500000,              // Set the actual alarm period, since the resolution is 1us, 500000 represents 0.5s
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
        .max_store_buf_size = 4 * CONVERSION_FRAME_LENGTH, // Tamanho do buffer interno do driver para guardar amostras.
                                                           // Deverá ser no minimo o dobro de CONVERSION_FRAME_LENGTH.
        .conv_frame_size = CONVERSION_FRAME_LENGTH,        // Tamanho de cada conversion frame.
    };
    ESP_ERROR_CHECK(adc_continuous_new_handle(&adc_handle_config, &adc_handle));

    // II) Configurar canal e módulo ADC.
    adc_digi_pattern_config_t channel_config = {
        .channel = ADC_CHANNEL_3,     // Vamos amostrar o Canal 3 (GPIO 3 no ESP32-C6).
        .atten = ADC_ATTEN_DB_12,     // Atenuação máxima (12dB) para conseguir ler tensões até ~3.9V.
        .unit = ADC_UNIT_1,           // Usar o módulo ADC 1.
        .bit_width = ADC_BITWIDTH_12, // Resolução padrão de 12 bits (niveis de 0 a 4095). Nota para evitar confusão: pode reparar que este campo neste driver é "bit_width"
                                      // e não "bitwidth" como no driver one-shot. O porquê desta inconsistência... não sabemos.
    };

    adc_continuous_config_t adc_config = {
        .pattern_num = 1,                        // Apenas um canal vai ser usado.
        .adc_pattern = &channel_config,          // Lista com a configuração para cada um dos canais usados.
        .sample_freq_hz = SAMPLING_FREQUENCY_HZ, // Frequência de amostragem esperada.
        .conv_mode = ADC_CONV_SINGLE_UNIT_1,     // Apenas usar o módulo ADC 1 para conversão.
        .format = ADC_DIGI_OUTPUT_FORMAT_TYPE2,  // Existem dois formatos de estruturas de dados para armazenar o valor de cada
                                                 // amostra e metadata associada: ADC_DIGI_OUTPUT_FORMAT_TYPE1 e ADC_DIGI_OUTPUT_FORMAT_TYPE2.
                                                 // Formato padrão para ESP32-C6 (e outros recentes) é ADC_DIGI_OUTPUT_FORMAT_TYPE2.
    };
    ESP_ERROR_CHECK(adc_continuous_config(adc_handle, &adc_config));

    uint8_t dma_buffer[CONVERSION_FRAME_LENGTH]; // Buffer para a transferência de uma conversion frame da ADC para o nosso programa via DMA.
    uint32_t number_read_bytes = 0;              // Variável que irá indicar quantos bytes foram transferidos via DMA.

    // III) Iniciar a amostragem.
    ESP_ERROR_CHECK(adc_continuous_start(adc_handle));

    // IV) Transferir e processar conversion frames
    while (1)
    {
        // Pedir uma conversion frame completa via DMA. A função bloqueia até os dados estarem prontos.
        esp_err_t erro = adc_continuous_read(adc_handle, dma_buffer, CONVERSION_FRAME_LENGTH, &number_read_bytes, portMAX_DELAY);

        if (erro == ESP_OK)
        {
            // Pode acontecer por vezes o número de amostras na frame ser inferior ao pedido (frame "incompleta").
            // É boa prática calcular sempre quantas amostras efetivamente estão presentes na frame obtida.
            uint32_t frame_samples_number = number_read_bytes / SOC_ADC_DIGI_RESULT_BYTES;

            // Extrair, converter e guardar cada amostra obtida no nosso buffer principal.
            for (int sample_index = 0; sample_index < frame_samples_number; sample_index++)
            {

                // Se já atingimos a nossa meta de tempo (X segundos), paramos de guardar
                if (number_proccesed_samples >= SAMPLES_NUMBER_GOAL)
                {
                    break;
                }

                // Extrair a amostra usando a estrutura oficial da Espressif.
                adc_digi_output_data_t *dados = (adc_digi_output_data_t *)&dma_buffer[sample_index * SOC_ADC_DIGI_RESULT_BYTES];
                uint32_t raw_sample = dados->type2.data;

                // Converter para Volts e guardar no nosso buffer principal.
                processed_samples[number_proccesed_samples] = (((float)raw_sample / 4095.0) * 3.9) * 1000; //Convertido para miliVolts

                number_proccesed_samples++;
            }

            if (number_proccesed_samples >= SAMPLES_NUMBER_GOAL)
            {
                ESP_LOGI(TAG, "Desired number of samples achieved! Stopping sampling. First 25 collected samples:\n");
                ESP_ERROR_CHECK(adc_continuous_stop(adc_handle));

                for (int sample_index = 0; sample_index < 25; sample_index++)
                {
                    ESP_LOGI(TAG, "Sample %d: %.2f mV\n", sample_index, processed_samples[sample_index]);
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
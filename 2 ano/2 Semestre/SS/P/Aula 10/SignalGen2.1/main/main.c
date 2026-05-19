#include <stdio.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <driver/gptimer.h>
#include <driver/gpio.h>
#include <esp_check.h>

static const char *TAG = "GERADOR";

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

    gpio_reset_pin(GPIO_NUM_9);
    gpio_set_direction(GPIO_NUM_9, GPIO_MODE_INPUT);
    // Ativar resistência de pull-up interna (Botão solto = 1, Botão premido = 0)
    gpio_pullup_en(GPIO_NUM_9);

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

    // Arrays de configuração para facilitar a troca de frequências
    uint64_t alarm_counts[] = {10000, 500000, 20000}; // Valores em us (50Hz, 1Hz, 25Hz)
    int freq_labels[] = {50, 1, 25};                  // Apenas para imprimir no terminal
    int current_freq_index = 0;                       // Começa na posição 0 (50Hz)

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

    ESP_LOGI(TAG, "Gerador iniciado a %d Hz", freq_labels[current_freq_index]);

    while (1) {
        // Verifica se o botão foi premido (0 = premido, devido ao pull-up)
        if (gpio_get_level(GPIO_NUM_9) == 0)
        {
            // Espera 50ms para ignorar o "ruído" mecânico do clique (debounce)
            vTaskDelay(pdMS_TO_TICKS(50)); 

            // Confirma se o botão continua premido
            if (gpio_get_level(GPIO_NUM_9) == 0)
            {
                // Avança para o próximo índice (0 -> 1 -> 2 -> 0...)
                current_freq_index = (current_freq_index + 1) % 3;
                
                // Atualiza o valor do alarme na estrutura
                alarm_config.alarm_count = alarm_counts[current_freq_index];

                // Procedimento seguro para alterar um timer a correr:
                // Parar -> Fazer reset à contagem -> Atualizar Alarme -> Iniciar
                ESP_ERROR_CHECK(gptimer_stop(gptimer));
                ESP_ERROR_CHECK(gptimer_set_raw_count(gptimer, 0));
                ESP_ERROR_CHECK(gptimer_set_alarm_action(gptimer, &alarm_config));
                ESP_ERROR_CHECK(gptimer_start(gptimer));

                ESP_LOGI(TAG, "Frequência alterada para: %d Hz", freq_labels[current_freq_index]);

                // Espera que o botão seja solto antes de permitir nova alteração
                while (gpio_get_level(GPIO_NUM_9) == 0)
                {
                    vTaskDelay(pdMS_TO_TICKS(10));
                }
            }
        }
        
        // Pequeno atraso para a tarefa não consumir 100% do CPU
        vTaskDelay(pdMS_TO_TICKS(10)); 
    }
}

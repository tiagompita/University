#include <stdio.h>
#include <stdbool.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_adc/adc_oneshot.h"
#include "esp_adc/adc_cali.h"
#include "esp_adc/adc_cali_scheme.h"
#include "esp_err.h"
#include "esp_log.h"

#define ADC_CHANNEL ADC_CHANNEL_0   // GPIO0 (check pin mapping for ESP32-C6)
#define ADC_UNIT ADC_UNIT_1         // Use ADC1
#define ADC_ATTEN ADC_ATTEN_DB_12   // 12 dB, ~1.1 V full-scale

static const char *TAG = "ADC";

void app_main(void)
{
	// ADC Oneshot driver handle
	adc_oneshot_unit_handle_t adc1_handle;
	adc_oneshot_unit_init_cfg_t init_config1 = {
		.unit_id = ADC_UNIT,
	};
	adc_oneshot_new_unit(&init_config1, &adc1_handle);

	// Configure channel
	adc_oneshot_chan_cfg_t config = {
		.atten = ADC_ATTEN,
		.bitwidth = ADC_BITWIDTH_DEFAULT, // default = 12-bit
	};
	adc_oneshot_config_channel(adc1_handle, ADC_CHANNEL, &config);

	adc_cali_handle_t cali_handle = NULL;
	adc_cali_curve_fitting_config_t cali_config = {
		.unit_id = ADC_UNIT,
		.chan = ADC_CHANNEL,
		.atten = ADC_ATTEN,
		.bitwidth = ADC_BITWIDTH_DEFAULT,
	};
	esp_err_t cali_result = adc_cali_create_scheme_curve_fitting(&cali_config, &cali_handle);
	bool calibration_enabled = (cali_result == ESP_OK);

	if (calibration_enabled) {
		ESP_LOGI(TAG, "Calibracao ADC ativa");
	} else {
		ESP_LOGW(TAG, "Calibracao indisponivel; conversao aproximada usada");
	}

	while (1) {
		int adc_raw = 0;
		adc_oneshot_read(adc1_handle, ADC_CHANNEL, &adc_raw);

		int voltage_mv = 0;
		float voltage;
		if (calibration_enabled && adc_cali_raw_to_voltage(cali_handle, adc_raw, &voltage_mv) == ESP_OK) {
			voltage = voltage_mv / 1000.0f;
		} else {
			// Convert raw value to voltage (approximate, no calibration)
			voltage = (adc_raw / 4095.0f) * (1.1f / 0.25f);
		}

		// INCLUA AQUI O CODIGO PARA IMPRIMIR O VALOR DIGITAL LIDO E O CORREPONDENTE ANALOGICO
        ESP_LOGI(TAG, "ADC Raw: %d, Voltage: %.3f V", adc_raw, voltage);
		vTaskDelay(pdMS_TO_TICKS(1000));
	}
}
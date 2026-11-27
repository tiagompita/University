/*
 * Dispositivos Conectados: eFuses (virtuais) e AES-256 no ESP32-C6, ESP-IDF v6.1
 *
 * Os eFuses são simulados (CONFIG_EFUSE_VIRTUAL): as escritas vão para uma cópia
 * guardada na flash (partição efuse_em) e nunca para os eFuses reais do chip.
 * Para repor a cópia virtual com o estado real do chip, apaga-se a flash
 * (ESP-IDF: Erase Flash Memory from Device).
 */
#include <stdio.h>
#include <string.h>
#include "esp_efuse.h"
#include "esp_efuse_table.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "psa/crypto.h"

#if !CONFIG_EFUSE_VIRTUAL
#error "Este projeto tem de ser compilado com eFuses virtuais (CONFIG_EFUSE_VIRTUAL=y, ver sdkconfig.defaults)"
#endif

#define KEY_SIZE   32               /* AES-256: chave de 32 bytes (256 bits) */
#define AES_BLOCK  16               /* o AES cifra blocos de 16 bytes (128 bits) */
#define KEY_BLOCK  EFUSE_BLK_KEY4   /* BLOCK_KEY4 (o BLOCK_KEY5 de algumas placas já está gravado) */
#define BOOT_BUTTON GPIO_NUM_9      /* botão BOOT da placa (ativo a 0) */

static const char *TAG = "AES_EFUSE";

/* Mostra o estado do bloco de chave: finalidade, proteções e conteúdo */
static void show_key_block(void)
{
    uint8_t key[KEY_SIZE] = {0};
    ESP_ERROR_CHECK(esp_efuse_read_block(KEY_BLOCK, key, 0, KEY_SIZE * 8));
    ESP_LOGI("EFUSE", "BLOCK_KEY4: purpose=%d (0 = USER), read protected=%d, write protected=%d",
             esp_efuse_get_key_purpose(KEY_BLOCK),
             esp_efuse_get_key_dis_read(KEY_BLOCK),
             esp_efuse_get_key_dis_write(KEY_BLOCK));
    ESP_LOG_BUFFER_HEX("EFUSE", key, KEY_SIZE);
}

/* Espera que o botão BOOT seja premido. A escrita só é feita a pedido, para que
 * aconteça com o monitor aberto: o monitor reinicia a placa quando se liga, e uma
 * escrita feita logo após a descarga do programa passaria despercebida. */
static void wait_for_boot_button(void)
{
    gpio_config_t cfg = {
        .pin_bit_mask = 1ULL << BOOT_BUTTON,
        .mode = GPIO_MODE_INPUT,
        .pull_up_en = GPIO_PULLUP_ENABLE,
    };
    ESP_ERROR_CHECK(gpio_config(&cfg));
    ESP_LOGW("EFUSE", "Press the BOOT button to write the key to BLOCK_KEY4");
    while (gpio_get_level(BOOT_BUTTON) != 0) {
        vTaskDelay(pdMS_TO_TICKS(50));
    }
}

/* Programação de "fábrica" da chave. Só pode ser feita uma vez: o bloco fica
 * protegido contra escrita (WR_DIS), tal como num eFuse real. */
void write_key_to_efuse_dev_only(void)
{
    const uint8_t factory_key[KEY_SIZE] = {
        0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
        0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F,
        0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
        0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F
    };

    wait_for_boot_button();
    esp_err_t err = esp_efuse_write_key(KEY_BLOCK, ESP_EFUSE_KEY_PURPOSE_USER, factory_key, KEY_SIZE);
    if (err != ESP_OK) {
        ESP_LOGE("EFUSE", "Failed to write key to BLOCK_KEY4: %s", esp_err_to_name(err));
    } else {
        ESP_LOGI("EFUSE", "Key written to BLOCK_KEY4");
    }
    show_key_block();
}

/* Cifra e decifra um bloco de 16 bytes com AES-256-ECB, usando a chave do eFuse */
void example_aes_encrypt_decrypt_with_efuse_key(void)
{
    uint8_t efuse_key[KEY_SIZE] = {0};
    esp_err_t err = esp_efuse_read_block(KEY_BLOCK, efuse_key, 0, KEY_SIZE * 8);
    if (err != ESP_OK || esp_efuse_block_is_empty(KEY_BLOCK)) {
        ESP_LOGE(TAG, "BLOCK_KEY4 is empty or unreadable: write the key first (Questão 2)");
        return;
    }
    ESP_LOGI(TAG, "eFuse key read successfully.");

    /* A chave é importada para o PSA Crypto, que devolve um identificador (key_id) */
    psa_key_attributes_t attr = PSA_KEY_ATTRIBUTES_INIT;
    psa_set_key_type(&attr, PSA_KEY_TYPE_AES);
    psa_set_key_bits(&attr, KEY_SIZE * 8);
    psa_set_key_usage_flags(&attr, PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT);
    psa_set_key_algorithm(&attr, PSA_ALG_ECB_NO_PADDING);
    psa_key_id_t key_id;
    psa_status_t st = psa_import_key(&attr, efuse_key, KEY_SIZE, &key_id);
    memset(efuse_key, 0, sizeof(efuse_key));   /* não deixar a chave na pilha */
    if (st != PSA_SUCCESS) {
        ESP_LOGE(TAG, "psa_import_key failed: %d", (int)st);
        return;
    }

    uint8_t plaintext[AES_BLOCK];
    memcpy(plaintext, "ConnectedDevices", AES_BLOCK);   /* exatamente 16 bytes */
    uint8_t ciphertext[AES_BLOCK] = {0};
    uint8_t decrypted[AES_BLOCK + 1] = {0};             /* + '\0' para imprimir */
    size_t len = 0;

    st = psa_cipher_encrypt(key_id, PSA_ALG_ECB_NO_PADDING, plaintext, sizeof(plaintext),
                            ciphertext, sizeof(ciphertext), &len);
    if (st == PSA_SUCCESS) {
        st = psa_cipher_decrypt(key_id, PSA_ALG_ECB_NO_PADDING, ciphertext, len,
                                decrypted, AES_BLOCK, &len);
    }
    psa_destroy_key(key_id);
    if (st != PSA_SUCCESS) {
        ESP_LOGE(TAG, "AES operation failed: %d", (int)st);
        return;
    }

    ESP_LOGI(TAG, "Plaintext:  %.*s", AES_BLOCK, (const char *)plaintext);
    ESP_LOG_BUFFER_HEX(TAG, ciphertext, sizeof(ciphertext));
    ESP_LOGI(TAG, "Decrypted:  %s", (const char *)decrypted);
}

void app_main(void)
{
    if (psa_crypto_init() != PSA_SUCCESS) {
        ESP_LOGE(TAG, "psa_crypto_init failed");
        return;
    }
    show_key_block();   /* estado atual do BLOCK_KEY4 (virtual) */

    write_key_to_efuse_dev_only();                  // Questão 2
    example_aes_encrypt_decrypt_with_efuse_key();   // Questão 3
}

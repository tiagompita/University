/*
 * Dispositivos Conectados: HMAC-SHA256 no ESP32-C6, ESP-IDF v6.1
 *
 * A chave é lida do BLOCK_KEY4 dos eFuses virtuais, gravado com o projeto "efuse"
 * (Questão 2). Os dois projetos usam a mesma partição efuse_em, que se mantém na
 * flash entre projetos enquanto não for executado idf.py erase-flash.
 */
#include <stdio.h>
#include <string.h>
#include "esp_efuse.h"
#include "esp_efuse_table.h"
#include "esp_log.h"
#include "psa/crypto.h"

#if !CONFIG_EFUSE_VIRTUAL
#error "Este projeto tem de ser compilado com eFuses virtuais (CONFIG_EFUSE_VIRTUAL=y, ver sdkconfig.defaults)"
#endif

#define KEY_SIZE   32               /* chave de 256 bits */
#define MAC_SIZE   32               /* HMAC-SHA256: 32 bytes */
#define KEY_BLOCK  EFUSE_BLK_KEY4

static const char *TAG = "HMAC_SHA256";

/* Calcula o HMAC-SHA256 de uma mensagem de comprimento arbitrário */
psa_status_t compute_hmac_sha256(const uint8_t *key, size_t key_len,
                                 const uint8_t *message, size_t message_len,
                                 uint8_t *mac_out /* 32 bytes */)
{
    psa_key_attributes_t attr = PSA_KEY_ATTRIBUTES_INIT;
    psa_set_key_type(&attr, PSA_KEY_TYPE_HMAC);
    psa_set_key_bits(&attr, key_len * 8);
    psa_set_key_usage_flags(&attr, PSA_KEY_USAGE_SIGN_MESSAGE | PSA_KEY_USAGE_VERIFY_MESSAGE);
    psa_set_key_algorithm(&attr, PSA_ALG_HMAC(PSA_ALG_SHA_256));

    psa_key_id_t key_id;
    psa_status_t st = psa_import_key(&attr, key, key_len, &key_id);
    if (st != PSA_SUCCESS) {
        return st;
    }
    size_t mac_len = 0;
    st = psa_mac_compute(key_id, PSA_ALG_HMAC(PSA_ALG_SHA_256),
                         message, message_len, mac_out, MAC_SIZE, &mac_len);
    psa_destroy_key(key_id);
    return st;
}

void app_main(void)
{
    if (psa_crypto_init() != PSA_SUCCESS) {
        ESP_LOGE(TAG, "psa_crypto_init failed");
        return;
    }

    uint8_t efuse_key[KEY_SIZE] = {0};
    if (esp_efuse_read_block(KEY_BLOCK, efuse_key, 0, KEY_SIZE * 8) != ESP_OK ||
            esp_efuse_block_is_empty(KEY_BLOCK)) {
        ESP_LOGE(TAG, "BLOCK_KEY4 is empty: run the \"efuse\" project first (Questão 2)");
        return;
    }

    const char *message = "Connected Devices 2026/2027";   /* comprimento arbitrário */
    uint8_t mac[MAC_SIZE] = {0};

    psa_status_t st = compute_hmac_sha256(efuse_key, sizeof(efuse_key),
                                          (const uint8_t *)message, strlen(message), mac);
    memset(efuse_key, 0, sizeof(efuse_key));
    if (st != PSA_SUCCESS) {
        ESP_LOGE(TAG, "HMAC computation failed: %d", (int)st);
        return;
    }

    ESP_LOGI(TAG, "HMAC-SHA256 output:");
    ESP_LOG_BUFFER_HEX(TAG, mac, sizeof(mac));
}

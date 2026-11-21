---
name: esp32c6-specialist
description: Hardware ESP32-C6-DevKitC-1 e ESP-IDF v6.1.0 para o EcoNode (DHT20 por I2C, TFT e microSD em SPI partilhado, LED RGB endereçável, potenciómetro no ADC, Wi-Fi com MQTT/WebSocket, BLE GATT). Usar ao escrever ou rever qualquer código de firmware, CMake, idf_component.yml, sdkconfig ou atribuição de pinos.
---

# ESP32-C6 + ESP-IDF v6.1.0 (EcoNode)

## Versão e build (requisito do enunciado)
- **ESP-IDF v6.1.0.** O repositório tem de compilar numa máquina limpa com `idf.py build`, sem passos manuais.
- Toda a dependência externa fica em `main/idf_component.yml` (já lá estão `espressif/mqtt`, `espressif/cjson`, `espressif/led_strip`). A partir do v6.0, o MQTT e o cJSON **não** estão na árvore principal. O `dependencies.lock` vai para o git.
- Em cada componente, declara os `REQUIRES`/`PRIV_REQUIRES` no `idf_component_register` (ex.: `esp_driver_i2c`, `esp_driver_spi`, `esp_adc`, `fatfs`, `bt`, `esp_wifi`, `nvs_flash`). Não dependas de includes transitivos.
- **Antes de usar uma API, confirma-a na documentação do v6.1** (usa o Context7 ou docs.espressif.com, `esp32c6`/`v6.1`). Muitos exemplos online são do v4.x/v5.x, e os drivers legados foram removidos ou estão obsoletos. Não escrevas de memória assinaturas de que não tens a certeza.

## APIs a usar
| Periférico | API |
|---|---|
| DHT20 (I2C) | `driver/i2c_master.h` (`i2c_new_master_bus`, `i2c_master_bus_add_device`); nunca `driver/i2c.h` |
| TFT + microSD (SPI partilhado) | `driver/spi_master.h` + `esp_lcd` para o ecrã; `esp_vfs_fat_sdspi_mount` para o cartão; acesso ao barramento serializado (mutex) e inicialização ordenada |
| Brilho do ecrã | potenciómetro em `esp_adc/adc_oneshot.h` com calibração (`adc_cali_*`); brilho por PWM em `driver/ledc.h` |
| LED RGB da placa | `led_strip` (componente) com backend RMT |
| Telemetria | `mqtt_client.h` (`espressif/mqtt`) aceita `mqtt://` e também `ws://` (MQTT sobre WebSocket) pelo URI. **Ambiguidade a resolver:** o enunciado pode querer dizer WebSocket "puro" num servidor próprio (`espressif/esp_websocket_client`). Esclarece com o docente ou decide e justifica num ADR. O esquema vem **só** do URI da configuração |
| BLE | NimBLE (`CONFIG_BT_NIMBLE_ENABLED`) |
| Temporização | `esp_timer` / `driver/gptimer.h`; nada de `vTaskDelay` para períodos de amostragem precisos (`vTaskDelayUntil`) |

## Arquitetura do chip
- Um core HP RISC-V (mais o core LP). **Single-core**: nada de Xtensa, e `xTaskCreatePinnedToCore` só com core `0` ou `tskNO_AFFINITY`. Não penses em "uma tarefa por core".
- Wi-Fi 6 (2,4 GHz) e BLE 5 partilham o mesmo rádio: a **coexistência** Wi-Fi/BLE está ativa e afeta o débito e a latência. Tem isso em conta no desenho e documenta-o num ADR.

## Pinos da DevKitC-1 (confirmar no esquema da placa antes de ligar)
- **Strapping:** GPIO4, GPIO5, GPIO8, GPIO9, GPIO15. O LED RGB da placa já está no **GPIO8** e o botão BOOT no **GPIO9**: não lhes ligues sensores.
- **USB-Serial/JTAG:** GPIO12/13. **UART0 da consola:** GPIO16/17. Pinos da flash interna (GPIO24–30): nunca.
- Potenciómetro num canal do **ADC1** (GPIO0–6).
- Regista a tabela final de pinos num ADR e no README.

## Partições e memória
`partitions.csv` tem `factory` de 3 MB numa flash de 8 MB, sem OTA. Uma mudança disto é decisão de arquitetura (ADR). Mede `idf.py size` depois de juntar o Wi-Fi + o BLE + o MQTT.

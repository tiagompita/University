# Contexto atual do EcoNode

Ponto de situação para começar uma sessão nova (app do Claude ou VSCode) sem repetir o que já foi feito. Atualizar no fim de cada semana.

**Última atualização:** 21/11/2026, a meio da semana 4. Feito a partir do repo local em `2fd7846 log: semana 3`, com alterações por fazer commit.

## 1. Onde está cada coisa

| O quê | Onde |
|---|---|
| Repo oficial (código + docs) | `Projeto/econode/` → `detiuaveiro/dispositivos-conectados-projeto-final-group-34`, branch `master` |
| Planeamento privado (este ficheiro) | `Projeto/planeamento/` → repo pessoal `tiagompita/University` |
| Enunciado | `Projeto/projeto_v1.pdf` (**há uma versão nova por carregar**) |
| Regras da UC | `DC/dp-v1.1.pdf` |
| Regras para o Claude | `Projeto/CLAUDE.md` (VSCode) e [CLAUDE_APP.md](CLAUDE_APP.md) (app) |
| Testes de hardware para o Dinis | [TESTES_HW.md](TESTES_HW.md) |

## 2. Como trabalhamos (resumo, o detalhe está em CLAUDE_APP.md)

- A palavra do Tiago prevalece sobre os `CLAUDE.md`.
- Uma conversa por semana na app: explicação de **um tópico de cada vez**, sem perguntas didáticas, e no fim um prompt para o VSCode.
- No VSCode: pseudocódigo **tipado** como resposta no chat; revisão do código; comentários no código só depois de o build passar (diretos, com tom humano, sem etiquetas, blocos `/* */` quando passam de 2 linhas).
- O C da lógica e os `.h` são escritos pelo Tiago. Os ADRs são decididos pelo grupo; o Claude faz o esqueleto com partes por preencher.
- Sem placa com o Tiago: os testes de hardware acumulam-se em `TESTES_HW.md` e o Dinis executa.

## 3. Estado dos módulos (`econode/components/`)

| Módulo | Dono | Estado |
|---|---|---|
| `common` | ambos | Tipos partilhados (`sample_t`, 16 bytes) |
| `config` | Tiago | Feito: lê e valida o JSON, getters por campo, setters gravam no cartão, callbacks de alteração (ADR 0003) |
| `spi_bus` | Tiago | Feito: SPI2_HOST, MOSI 19, MISO 20, SCLK 21. Sem mutex próprio (o driver multiplexa os devices) |
| `sd_card` | Tiago | Feito: monta e desmonta o cartão, CS 18 (ADR 0004) |
| `sd_datalog` | Tiago | Feito: CSV das amostras, regista perdas no oplog |
| `sd_oplog` | Tiago | Feito: log de operações no cartão |
| `sample_bus` | Tiago | Feito: Message Buffer + distribuição aos subscritores (ADR 0001, 0002) |
| `sensor` | Tiago | Feito: tarefa do DHT20 em I2C (SDA 6, SCL 7), período lido do config |
| `system_status` | ambos | Feito: struct com mutex e setters de Wi-Fi, telemetria e BLE. **Falta** o setter de `sd_card_error` e o campo `transmitting` (ADR 0005) |
| `led` | Tiago | **Semana 4, em curso**: só o `.h` com o comentário do papel |
| `display` | Tiago | **Atrasado da semana 3**: só o `.h`. Inclui o potenciómetro (RF6) |
| `wifi_manager` | Dinis | Feito: STA com reconexão não bloqueante, atualiza o `system_status` |
| `telemetry` | Dinis | Feito: `mqtt://` e `ws://`, queue de 16 amostras, atualiza o `system_status` |
| `ble_service` | Dinis | Serviço de config (RF9) feito; ESS 0x181A (temperatura 0x2A6E, humidade 0x2A6F) já tem leitura no código, falta confirmar a notificação (semana 4 do Dinis) |

`main.c`: arranca NVS, SPI, SD, oplog, config, datalog, sample_bus, sensor e BLE. **Ainda não arranca** `system_status`, `wifi_manager`, `telemetry`, `display` nem `led` (TODOs do Dinis e do Tiago).

Nada foi testado em hardware até agora. Todos os builds passaram sem avisos nossos (log da semana 3).

## 4. Semana 4 (até 20/11) — onde ficámos

Tarefas do Tiago: LED RGB (RF3), potenciómetro → brilho (RF6), estado da rede e do BLE no ecrã (RF2), e o TFT, que vinha atrasado da semana 3.

Ordem combinada: **LED → potenciómetro → TFT → estado no ecrã**, um tópico de cada vez.

### LED RGB (tópico atual)
- Explicado: WS2812 num só fio de dados, gerado pelo RMT; componente `espressif/led_strip ^3.0.0` já no `idf_component.yml`; modelo `set_pixel` (buffer em RAM) + `refresh` (envio); GPIO8 no DevKitC-1 (**confirmar no esquema**).
- Arquitetura: tarefa própria que faz polling ao `system_status_get()` a ~100-200 ms; não inclui headers da rede nem do BLE (RNF7); só atualiza o LED quando a cor muda; intensidades baixas (~10-30 por canal).
- Prioridades: erro (vermelho) > provisionamento (azul) > transmissão (amarelo) > normal (verde).
- **Decidido com o Dinis:** campo novo `transmitting` no `system_status`. ADR 0005 em esqueleto, estado `proposto` (`econode/docs/adr/0005-sinalizacao-da-transmissao.md`), com partes por preencher pelo Tiago.
- **Em aberto:**
  - Como garantir que o amarelo se vê (tempo mínimo no `led` vs. timestamp no `system_status`). Entra no ADR 0005.
  - A telemetria tem de pôr a flag a `false` em todos os caminhos (sucesso, erro, timeout). Do Dinis.
  - O setter de `sd_card_error` não existe, por isso o vermelho nunca acende. Provavelmente é chamado no `main.c` a partir do resultado do `sd_card_mount()`. Decidir com o Dinis.
  - Campo `error` genérico vs. campos por fonte (o sensor sem resposta também será vermelho na semana 5).
- **Próximo passo:** o Tiago altera `system_status.h/.c` (campo + setter de `transmitting` e de `sd_card_error`), avisa o Dinis, escreve `led.h` e `led.c`, e pede revisão no VSCode. Depois acrescentam-se os testes do LED ao Bloco E do `TESTES_HW.md`.

### Ainda por tratar nesta semana
- Potenciómetro: ADC oneshot no ADC1 (GPIO0-3 livres; evitar 4 e 5 e os já usados) + LEDC (PWM) no pino de backlight do TFT. **Confirmar se o módulo TFT expõe o pino BL.**
- TFT: falta saber o **modelo do controlador** (ST7789, ILI9341, ...) e escolher os pinos (CS, D/C, RST, BL).
- Estado da rede e do BLE no ecrã: polling ao `system_status`, medidas pelo `sample_bus`.

## 5. Pinos

| Função | GPIO | Estado |
|---|---|---|
| I2C SDA / SCL (DHT20) | 6 / 7 | no código |
| SPI MOSI / MISO / SCLK | 19 / 20 / 21 | no código |
| CS do microSD | 18 | no código |
| LED RGB (WS2812 da placa) | 8 | a confirmar |
| Potenciómetro (ADC1) | 0-3 | por escolher |
| TFT CS, D/C, RST, BL | — | por escolher |

## 6. Avisos

- **Log da semana 4 em falta:** o prazo era 20/11 e o remoto só tem as tags `semana-1` a `semana-3` (confirmado a 21/11). Entregar quanto antes.
- `econode/` tem por fazer commit: o ADR 0005 e a linha dele no índice `docs/adr/README.md`.
- Ajuda da IA nesta sessão, para o log: Claude (120152) para a explicação do LED WS2812/RMT e do `system_status`, as alternativas para sinalizar a transmissão, o esqueleto do ADR 0005 e a organização dos testes de hardware.

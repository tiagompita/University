# Testes em hardware (Dinis)

Ficheiro acumulado pelo Tiago, executado pelo Dinis com a placa. O Tiago só acrescenta testes aqui; o Dinis só preenche as colunas **Resultado** e **Notas**.

## Como usar
1. Fazer `git pull` e anotar o hash do commit testado (`git rev-parse --short HEAD`).
2. Fazer os blocos **por ordem** (cada bloco indica a montagem física). Não saltar o Bloco 0.
3. Em cada teste: marcar `OK`, `FALHA` ou `N/A` e, se falhar, colar as linhas relevantes do `idf.py monitor` em Notas (ou guardar o log completo em `docs/evidences/` com o nome do requisito).
4. Se um teste falhar, **continuar** nos seguintes do mesmo bloco, a menos que dependam dele (indicado em "Requer").
5. Enviar o ficheiro preenchido ao Tiago. Fotos e screenshots (nRF Connect) valem como evidência.

Estados: `pendente` · `OK` · `FALHA` · `N/A`

Commit testado: `________`  Data: `________`  Placa/cartão usados: `________`

---

## Bloco 0 — Preparação (obrigatório)
Montagem: ESP32-C6-DevKitC-1 por USB, nada mais ligado.

| ID | Passos | Resultado esperado | Resultado | Notas |
|---|---|---|---|---|
| 0.1 | Clone limpo, `idf.py set-target esp32c6`, `idf.py build` (ESP-IDF v6.1.0) | Compila sem erros | pendente | |
| 0.2 | `idf.py flash monitor` | Arranca sem *reboot loop* nem `abort()` / `Guru Meditation` | pendente | |
| 0.3 | Anotar o tamanho livre de heap que o log mostrar (se existir) | Valor registado, só para comparar entre semanas | pendente | |

---

## Bloco A — Arranque, cartão SD e config (semanas 2–3, nunca testado em hardware)
Montagem: leitor microSD ligado (MOSI 19, MISO 20, SCLK 21, CS 18). Cartão FAT com `config.json` de `econode/sdcard/`.

| ID | Passos | Resultado esperado | Resultado | Notas |
|---|---|---|---|---|
| A.1 | Cartão com `config.json` válido, reiniciar | Log: cartão montado, config lida. Sem erros | pendente | |
| A.2 | Reiniciar com o cartão **removido** | Aplicação continua a arrancar; aviso de "sem cartão" no log; sem crash | pendente | |
| A.3 | Cartão com `config.json` **inválido** (apagar uma `}`) | Usa defaults; aviso no log; sem crash | pendente | |
| A.4 | Cartão sem `config.json` | Usa defaults; aviso no log | pendente | |
| A.5 | Depois de A.1, tirar o cartão e ler num PC | Existem os ficheiros de log de operações e o CSV de amostras | pendente | |

## Bloco B — Sensor DHT20 e CSV (semana 2)
Montagem: DHT20 em I2C (SDA 6, SCL 7, 3V3, GND) e leitor microSD como no Bloco A.

| ID | Passos | Resultado esperado | Resultado | Notas |
|---|---|---|---|---|
| B.1 | Deixar correr 2 minutos com `sample_period_s` = 5 | Leituras de temperatura e humidade plausíveis (ambiente) no log | pendente | |
| B.2 | Soprar/pôr a mão perto do sensor | Valores sobem em segundos | pendente | |
| B.3 | Abrir o CSV no PC | Uma linha por amostra, com campo de versão, ~1 linha/5 s | pendente | |
| B.4 | Desligar o sensor (SDA ou SCL solto) durante 30 s e voltar a ligar | Log de falha do sensor e depois de recuperação; sem crash; oplog regista | pendente | |

## Bloco C — BLE: serviço de configuração (semana 3)
Montagem: igual ao Bloco A. Telemóvel com nRF Connect (ou LightBlue).

| ID | Passos | Resultado esperado | Resultado | Notas |
|---|---|---|---|---|
| C.1 | Procurar por BLE | Aparece o nó (nome com o `node_id` 1019, a confirmar) | pendente | |
| C.2 | Ligar e listar serviços | Existe um serviço proprietário com UUID base `E0C0DE00-0000-4000-8000-0000000003FB` (últimos bytes podem variar por característica) | pendente | |
| C.3 | Ler a característica do período | Devolve `30` (ou o valor do `config.json`) | pendente | |
| C.4 | Escrever `10` no período e voltar a ler | Lê `10`; no PC o `config.json` do cartão tem 10; a amostragem passa a 10 s | pendente | |
| C.5 | Escrever `abc` ou `0` no período | Escrita rejeitada (erro GATT); período não muda | pendente | |
| C.6 | Tentar **ler** SSID e password | Leitura recusada ou vazia. **Nunca** devolve a password | pendente | |
| C.7 | Procurar a password em todo o log série e no oplog do cartão | Não aparece em lado nenhum | pendente | |

## Bloco D — Wi-Fi e telemetria (semana 3, requer integração no `main.c`)
**Só testar quando o Tiago/Dinis avisarem que o `main.c` arranca `wifi_manager` e `telemetry`.** Montagem: rede Wi-Fi 2.4 GHz, broker acessível.

| ID | Passos | Resultado esperado | Resultado | Notas |
|---|---|---|---|---|
| D.1 | SSID/password no `config.json`, reiniciar | Liga ao Wi-Fi; IP no log | pendente | |
| D.2 | `mosquitto_sub -h <broker> -t 'econode/1019/#' -v` | Chegam mensagens em `econode/1019/...` com campo de versão | pendente | |
| D.3 | Trocar o URI para `ws://...` no JSON e reiniciar (sem recompilar) | Telemetria chega por WebSocket | pendente | |
| D.4 | Desligar o router/broker 1 min com o nó a correr | Amostragem, CSV e BLE continuam; sem crash | pendente | |
| D.5 | Voltar a ligar | Reconecta sozinho; chegam as amostras em fila | pendente | |

---

## Bloco E — LED RGB, potenciómetro, ecrã TFT (semana 4)
*A preencher à medida que o código for escrito. Cada teste só entra aqui depois de compilar.*

Pinos e montagem: *(por definir pelo Tiago, com esquema ao lado)*

| ID | Passos | Resultado esperado | Resultado | Notas |
|---|---|---|---|---|

---

## Histórico de execuções
| Data | Commit | Blocos feitos | Quem | Resumo |
|---|---|---|---|---|

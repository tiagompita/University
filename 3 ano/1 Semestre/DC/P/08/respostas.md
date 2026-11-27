# Respostas - Guião 8: Dispositivos Conectados (Protocolos IP para IoT: MQTT)

> Ficheiro opcional, para uso pessoal. Só contém as perguntas do enunciado (frases com "?" e pedidos de análise/justificação/comparação); as restantes são instruções de trabalho. O número de cada questão é o do guião.

---

## 3.1 MQTT sobre TCP

### Questão 2
> Analise este log e a função `mqtt_event_handler()` do ficheiro `main/app_main.c`. Indique, para cada mensagem publicada, o conteúdo, o tópico e a QoS. Justifique a sequência de eventos, explicando em particular:

| Mensagem | Conteúdo | Tópico | QoS |
|---|---|---|---|
| 1ª publicação (no `MQTT_EVENT_CONNECTED`) | `data_3` | `econode/<node_id>/qos1` | **1** (5º argumento do `esp_mqtt_client_publish`) |
| 2ª e 3ª publicações (no `MQTT_EVENT_SUBSCRIBED`, executada duas vezes) | `data` | `econode/<node_id>/qos0` | **0** |

> Como ler o código: `esp_mqtt_client_publish(client, tópico, conteúdo, len, qos, retain)`. O 2º argumento é o tópico, o 3º o conteúdo e o 5º a QoS. O **nome** do tópico (`qos1`) é só texto: o que define a QoS da publicação é o 5º argumento. Neste caso os dois coincidem, mas poderiam não coincidir. A `len = 0` diz à biblioteca para calcular o comprimento com `strlen`, e `retain = 0` significa que o broker não guarda a mensagem.

#### a)
> porque é que só uma das publicações gera `MQTT_EVENT_PUBLISHED`, e porque é que as outras devolvem `msg_id=0`;

- **Resposta:**
O `MQTT_EVENT_PUBLISHED` significa "o broker **confirmou** que recebeu a mensagem". Só existe confirmação quando o protocolo a prevê, e isso depende da QoS (guião, Tabela 2):
  - **QoS 0** troca apenas o pacote `PUBLISH`. Não há confirmação, por isso não há nada a que associar um evento "publicado". Como também não há confirmação, não é preciso um identificador de pacote para emparelhar pedido e resposta, e a função devolve `msg_id = 0`. É o caso das duas publicações de `data` (tópico `qos0`).
  - **QoS 1** troca `PUBLISH` + `PUBACK`. O cliente gera um identificador (aqui `msg_id=36322`) para saber a que `PUBLISH` corresponde cada `PUBACK`. Quando o `PUBACK` chega, o cliente gera `MQTT_EVENT_PUBLISHED, msg_id=36322` (linha de tempo 5695, ~310 ms depois de ter enviado). É o caso de `data_3`.

  Resumindo: só a publicação com QoS 1 (`data_3`) tem `msg_id` ≠ 0 e gera `MQTT_EVENT_PUBLISHED`; as duas com QoS 0 devolvem `msg_id=0` e nunca geram esse evento.

#### b)
> o significado de `return code=0x00` e `return code=0x01` nas duas confirmações de subscrição;

- **Resposta:**
A confirmação de uma subscrição chama-se **SUBACK**. Para cada tópico pedido, o broker devolve nesse pacote um byte, o *return code*, que indica **a QoS máxima que concedeu** a essa subscrição (ou `0x80` se a recusou). O código imprime esse byte no evento `MQTT_EVENT_SUBSCRIBED` (`*event->data`).
  - `msg_id=40368` → `return code=0x00`: é a subscrição a `econode/<node_id>/qos0`, pedida com QoS 0. O broker concedeu **QoS 0**.
  - `msg_id=8613` → `return code=0x01`: é a subscrição a `econode/<node_id>/qos1`, pedida com QoS 1. O broker concedeu **QoS 1**.

  Os `msg_id` do log permitem emparelhar cada `subscribe` com o seu SUBACK. Neste caso o broker concedeu o que foi pedido. Esta QoS concedida é a **máxima** com que o subscritor recebe mensagens nesse tópico, porque a QoS efetiva de uma entrega é a menor entre a da publicação e a da subscrição (guião §2.3).

#### c)
> porque é que a placa recebe duas vezes a mensagem `data` no tópico `econode/<node_id>/qos0`.

- **Resposta:**
Há três factos que, juntos, explicam o resultado:
  1. **A placa publica `data` duas vezes.** O `case MQTT_EVENT_SUBSCRIBED` publica `data` em `qos0` **sempre que chega um SUBACK**, seja de que subscrição for. Há duas subscrições (`qos0` e `qos1`), logo dois SUBACK, logo duas publicações de `data` (as duas linhas `sent publish successful, msg_id=0`).
  2. **A placa já está subscrita a `qos0` quando publica.** A subscrição a `qos0` foi confirmada (SUBACK 40368) antes de ambas as publicações, por isso o broker já tem registada essa subscrição.
  3. **O broker entrega a mensagem a todos os subscritores do tópico, incluindo o próprio publicador.** No MQTT 3.1.1 não existe a opção de excluir o emissor (`no local` só surge no MQTT 5), por isso a placa recebe de volta, como `MQTT_EVENT_DATA`, o que ela própria publicou. A QoS efetiva é min(0, 0) = 0.

  Daí as duas ocorrências de `TOPIC=econode/1022/qos0 / DATA=data` (tempos 6405 e 6615).

- **Sequência de eventos (justificação geral):**
  1. `MQTT_EVENT_CONNECTED` (5385): o TCP está estabelecido e o broker aceitou o `CONNECT`. O handler executa quatro chamadas seguidas: `publish(data_3, qos1, QoS 1)`, `subscribe(qos0, QoS 0)`, `subscribe(qos1, QoS 1)` e `unsubscribe(qos1)`. Todas devolvem de imediato um `msg_id` (o `ESP_LOGI` imprime-o), porque apenas **colocam o pedido em fila**: a resposta do broker chega depois, de forma assíncrona, como evento.
  2. `MQTT_EVENT_PUBLISHED, msg_id=36322` (5695): chegou o `PUBACK` de `data_3`.
  3. `MQTT_EVENT_SUBSCRIBED, msg_id=40368, return code=0x00` (5995): SUBACK da subscrição a `qos0`. O handler publica `data` em `qos0` (QoS 0, `msg_id=0`).
  4. `MQTT_EVENT_SUBSCRIBED, msg_id=8613, return code=0x01` (6005): SUBACK da subscrição a `qos1`. O handler publica `data` outra vez.
  5. `MQTT_EVENT_UNSUBSCRIBED, msg_id=55753` (6005): o broker confirmou o cancelamento de `qos1` (foi pedido logo a seguir ao subscribe, por isso a subscrição a `qos1` dura muito pouco; a consequência disto é o tema da Questão 3).
  6. `MQTT_EVENT_DATA` ×2 (6405 e 6615): chegam à placa as duas mensagens `data`, devolvidas pelo broker porque a placa está subscrita a `qos0`.


### Questão 3
> Porque é que o MQTTX recebe a mensagem `data_3` e a placa não a recebe, apesar de também subscrever `econode/<node_id>/qos1`?

- **Resposta:**


### Questão 4
> Explique a sequência de eventos. Que mecanismo deteta a perda de ligação quando o Wi-Fi não chega a cair?

- **Resposta:**
**Sequência de eventos** (de baixo para cima na pilha de protocolos):
  1. **Wi-Fi (camada 2):** `Wi-Fi disconnected 200, trying to reconnect...`. O código 200 é `WIFI_REASON_BEACON_TIMEOUT`: a placa deixou de receber os *beacons* do hotspot, concluiu que o *access point* desapareceu e desassociou-se. O código do exemplo tenta voltar a ligar-se sozinho, porque o *Maximum retry* está a -1 (tentativas indefinidas).
  2. **TCP (camada 4):** `tcp_read error, errno=Software caused connection abort`. Com a interface de rede em baixo, a pilha TCP/IP aborta o *socket* em que o MQTT estava a ler. `errno 0x71` é 113 (`ECONNABORTED`).
  3. **MQTT (camada 7):** a biblioteca gera `MQTT_EVENT_ERROR` (com o `errno` do transporte) e, logo a seguir, `MQTT_EVENT_DISCONNECTED`.
  4. **Recuperação:** quando o hotspot volta, a placa obtém IP (`Got IPv4 event`, 52095) e o cliente MQTT, que **volta a ligar-se sozinho** (guião §2.6; não é código da aplicação), refaz o TCP e o `CONNECT`: `MQTT_EVENT_CONNECTED` (58655). Como o handler publica e subscreve em `CONNECTED`, a placa volta a publicar (`msg_id=20071`). O intervalo entre o `DISCONNECTED` e o novo `CONNECTED` (~15 s) inclui o tempo de o Wi-Fi voltar, mais a espera que o cliente MQTT faz entre tentativas de reconexão.

**Mecanismo que deteta a perda quando o Wi-Fi não chega a cair: o *keep-alive* do MQTT.** O TCP sozinho não envia nada quando está inativo. Se o outro lado desaparece sem fechar a ligação (hotspot desligado, falha de energia, rota perdida), ninguém é avisado até se tentar enviar algo e as retransmissões falharem, o que pode demorar muito. O MQTT resolve isto com um temporizador:
  - o cliente indica no `CONNECT` um intervalo de *keep-alive* (120 s por omissão no ESP-IDF);
  - se não tiver nada para enviar, manda um `PINGREQ` antes de o intervalo acabar, e o broker responde com `PINGRESP`;
  - o broker considera a ligação perdida se não receber nada durante **1,5 × o intervalo** (180 s com o valor por omissão) e fecha-a, publicando o *last will*, se existir. Do lado do cliente, a falta de `PINGRESP` (ou um erro de escrita no *socket*) leva a `MQTT_EVENT_ERROR`/`DISCONNECTED` e à reconexão.

  Neste log o Wi-Fi caiu de facto, por isso a deteção foi rápida (veio da camada Wi-Fi/TCP). Se a ligação ficar "morta" sem que a camada Wi-Fi dê erro, quem a deteta é o *keep-alive*. Isto também justifica o valor de 10 s pedido na Questão 6: 120 s seriam demasiado lentos para detetar uma placa que desapareceu.


### Questão 5
> Porque é que a mensagem chega antes de qualquer nova publicação?

- **Resposta:**


### Questão 6
> c) Ao fim de quanto tempo aparece `offline`? Porquê? Porque é que é importante que as duas mensagens sejam retidas?

- **Resposta:**


### Questão 7
> Porque é que a publicação deve ser feita numa tarefa própria e não na função de tratamento de eventos? Que acontece às amostras enquanto a ligação ao broker está em baixo?

- **Resposta:**


---

## 3.2 MQTT sobre WebSocket

### Questão 8
> O comportamento observado é diferente? Que custos acrescenta o WebSocket face ao TCP, e em que situação compensa usá-lo?

- **Resposta:**


---

## 3.3 MQTT sobre TLS

### Questão 9
> Compare a sequência de eventos com a da Questão 1 e justifique as diferenças.

- **Resposta:**
A **lógica MQTT é praticamente a mesma** (CONNECTED → subscrições → SUBACK com 0x00 e 0x01 → UNSUBSCRIBED → DATA). Confirmei com um `diff` dos dois `app_main.c`: o que muda é o transporte e alguns pormenores do código. As diferenças:

| Diferença no log | Justificação |
|---|---|
| Etiqueta `mqtts_example` em vez de `mqtt_example` | Apenas o valor de `TAG` no código. Não tem significado de protocolo. |
| **Não há `publish` de `data_3` no `CONNECTED`**, nem `MQTT_EVENT_PUBLISHED` | O `app_main.c` de `mqtt_ssl` não tem essa publicação QoS 1 (o `diff` mostra-a só no projeto TCP). Sem publicação com QoS 1 não há `PUBACK`, logo não há `PUBLISHED`. |
| **~0,5 s mais** entre `Other event id:7` (`BEFORE_CONNECT`) e `MQTT_EVENT_CONNECTED` (4456 → 5916, ≈1,46 s, contra 4446 → 5385, ≈0,94 s no TCP) | Com `mqtts://` (porto 8883), antes do `CONNECT` do MQTT há um ***handshake* TLS**: troca de mensagens com o broker (várias idas e voltas à rede), validação do certificado do broker contra a CA incluída no *firmware* (`broker.verification.certificate`) e operações de criptografia de chave pública, que num microcontrolador custam tempo. Só depois de o canal estar cifrado e autenticado é que o MQTT envia o `CONNECT`. O valor varia com a rede. |
| Memória livre diferente (284612 vs 238512 bytes) | **Não é comparável.** No `mqtt_tcp` a linha é impressa no arranque (405 ms), antes de ligar o Wi-Fi. No `mqtt_ssl` o `diff` mostra uma segunda impressão dentro de `mqtt_app_start()`, já com o Wi-Fi ligado (4446 ms): a diferença de ~46 KB inclui a memória já ocupada pela pilha Wi-Fi/lwIP. Para medir o custo do TLS seria preciso medir no mesmo ponto nos dois projetos. O TLS consome RAM (contextos mbedTLS, *buffers* de registos, certificado), mas este log, só por si, não a quantifica. |
| Uma só ocorrência de `MQTT_EVENT_DATA` na transcrição | Por leitura do código, o `mqtt_ssl` publica `data` em cada `SUBSCRIBED` e a placa está subscrita a `qos0`, tal como no TCP, pelo que se esperariam duas, como na Questão 2 c). O log mostra duas publicações (`msg_id=0` duas vezes) mas só uma receção: ou a transcrição do guião está truncada, ou a segunda mensagem ainda não tinha chegado quando o excerto foi capturado. Convém confirmar na placa. |

**Conclusão:** o TLS não altera a **sequência lógica** do MQTT; acrescenta uma fase de *handshake* antes do `CONNECTED` (mais tempo e mais RAM) e exige o certificado da CA no *firmware*. Em troca, a ligação fica cifrada e o broker autenticado (guião, Tabela 3). As restantes diferenças vêm de o código dos dois exemplos não ser idêntico.


### Questão 11
> Porque é que a ligação falha? Que informação dá o evento `MQTT_EVENT_ERROR`?

- **Resposta:**


---

## 3.4 Broker Mosquitto local

### Questão 13
> c) Que acontecia à ligação da placa se o IP do portátil mudasse?

- **Resposta:**

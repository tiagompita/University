# Respostas - Guião 6: Dispositivos Conectados (Conectividade Bluetooth Low Energy)

---

## 3.1 Descoberta: o ESP32-C6 como Beacon

### Questão 1
> Crie um projeto a partir do exemplo `NimBLE_Beacon`, altere `DEVICE_NAME`, compile e descarregue. Localize o dispositivo no nRF Connect ou na ferramenta do PC.
>
> a) Compare o endereço apresentado na consola com o apresentado pela aplicação. Porque é que os bytes surgem por ordem inversa (consulte `format_addr()` em `main/src/gap.c`)? Que tipo de endereço é usado (`own_addr_type=0`)?
> b) Que relação existe entre este endereço e o endereço MAC da interface STA da mesma placa, obtido na aula de Wi-Fi?
> c) Porque é que a aplicação não apresenta o botão CONNECT, mas consegue mostrar o URI e o endereço, que estão na scan response (Tabela 3)?

#### a)
- **Resposta:** 
Endereço apanhado no ble_scan.py:
endereço 10:51:DB:01:E6:C6 (public)  RSSI -43 dBm
  nome: Beacon_Pita  TX power: -128

Endereço definido no projeto NimBLE_Beacon:
NimBLE_Beacon: device address: C6:E6:01:DB:51:10

A ordem do endereço está trocado, pois os endereços são transmitidos em little-endian (começa no byte menos significativo). Sendo o byte menos significativo: addr[0]

Usando o own_addr_type=0 é definido " #define BLE_OWN_ADDR_PUBLIC (0x00)" pelo qual o dispositivo usa um endereço de 48 bits público fixo.

#### b)
- **Resposta:** 
WARNING: ESP32-C6 has no chip ID. Reading MAC address instead.
MAC:                10:51:db:ff:fe:01:e6:c4
BASE MAC:           10:51:db:01:e6:c4
MAC_EXT:            ff:fe

O ESP32-C6 sai de fábrica o base MAC. As interfaces de rede não têm endereços próprios gravados. Cada uma calcula o seu somando um pequeno número ao base MAC, sempre o mesmo para cada interface. Esse número está na tabela da documentação ESP-IDF (Misc System APIs → MAC Address), com uma linha por interface:

Wi-Fi STA → base MAC + 0
Wi-Fi SoftAP → base MAC + 1
Bluetooth → base MAC + 2

Daí a diferença BASE MAC: 10:51:db:01:e6:c4 -> BLE: 10:51:DB:01:E6:C6

#### c)
- **Resposta:** 
Aceitar ligação e aceitar scan request são permissões independentes. O ADV_SCAN_IND recusa a primeira e aceita a segunda.
A placa envia o anúncio (ADV_SCAN_IND) com 31 bytes no máximo: flags, nome, potência, aparência, papel.
O telemóvel faz pesquisa ativa. Ao ver que o PDU aceita scan request, envia um SCAN_REQ à placa.
A placa responde com um SCAN_RSP, que é um segundo bloco de 31 bytes, e é aí que vão o endereço e o URI.
A app junta os dois blocos e mostra tudo.


### Questão 2
> Observe os dados de anúncio em bruto.
>
> a) Decomponha os dados de anúncio e a scan response nas estruturas AD (Tabela 4). Explique a representação da aparência (`BLE_GAP_APPEARANCE_GENERIC_TAG` vale `0x0200`) e do endereço.
> b) Calcule os bytes ocupados nos dois blocos. Porque é que o endereço e o URI estão na scan response? Qual é o comprimento máximo do nome neste exemplo, e porque é que a preparação recomenda um nome mais curto? Confirme-o com um nome de 20 caracteres (`error code: 4`, `BLE_HS_EMSGSIZE`).
> c) Defina um intervalo de anúncio de 1 s (`BLE_GAP_ADV_ITVL_MS(1000)`) e compare o intervalo estimado e o tempo de descoberta antes e depois. Repita as medições de RSSI a 0,5 m, 2 m e 5 m com +9 dBm e com 0 dBm. Que compromissos existem entre intervalo, potência, consumo, alcance e latência de descoberta?

#### a)
- **Dados de anúncio (em bruto):** 
@ MGMT Event: Device Found (0x0012) plen 67          {0x0001} [hci0] 397.819988
        LE Address: 10:51:DB:01:E6:C6 (Espressif Inc.)
        RSSI: -40 dBm (0xd8)
        Flags: 0x00000004
          Not Connectable
        Data length: 53
        Flags: 0x06
          LE General Discoverable Mode
          BR/EDR Not Supported
        Name (complete): Beacon_Pita
        TX power: -128 dBm
        Appearance: Tag (0x0200)
        Unknown EIR field 0x1c[1]: 00
        Unknown EIR field 0x1b[7]: c6e601db511000
        Unknown EIR field 0x24[16]: 172f2f6573707265737369662e636f6d
> HCI Event: LE Meta Event (0x3e) plen 41               #6055 [hci0] 397.822579
      LE Extended Advertising Report (0x0d)
        Num reports: 1
        Entry 0
          Event type: 0x0013
            Props: 0x0013
              Connectable
              Scannable
              Use legacy advertising PDUs
            Data status: Complete
          Legacy PDU Type: ADV_IND (0x0013)
          Address type: Random (0x01)
          Address: 45:29:D1:73:3E:FA (Resolvable)
          Primary PHY: LE 1M
          Secondary PHY: No packets
          SID: no ADI field (0xff)
          TX power: 127 dBm
          RSSI: -71 dBm (0xb9)
          Periodic advertising interval: 0.00 msec (0x0000)
          Direct address type: Public (0x00)
          Direct address: 00:00:00:00:00:00 (OUI 00-00-00)
          Data length: 0x0f
        02 01 1a 0b ff 4c 00 10 06 0a 19 3c 8b 8f 08     .....L.....<... 
        Flags: 0x1a
          LE General Discoverable Mode
          Simultaneous LE and BR/EDR (Controller)
          Simultaneous LE and BR/EDR (Host)
        Company: Apple, Inc. (76)
          Type: Unknown (16)
          Data[6]: 0a193c8b8f08
> HCI Event: LE Meta Event (0x3e) plen 26               #6056 [hci0] 397.822812
      LE Extended Advertising Report (0x0d)
        Num reports: 1
        Entry 0
          Event type: 0x001b
            Props: 0x001b
              Connectable
              Scannable
              Scan response
              Use legacy advertising PDUs
            Data status: Complete
          Legacy PDU Type: SCAN_RSP to an ADV_SCAN_IND (0x001b)
          Address type: Random (0x01)
          Address: 45:29:D1:73:3E:FA (Resolvable)
          Primary PHY: LE 1M
          Secondary PHY: No packets
          SID: no ADI field (0xff)
          TX power: 127 dBm
          RSSI: -71 dBm (0xb9)
          Periodic advertising interval: 0.00 msec (0x0000)
          Direct address type: Public (0x00)
          Direct address: 00:00:00:00:00:00 (OUI 00-00-00)
          Data length: 0x00


- **Decomposição:**

| len | tipo | nome | dados |
|-----|------|------|-------|
|     |      |      |       |

- **Scan response (em bruto):** 
- **Decomposição:**

| len | tipo | nome | dados |
|-----|------|------|-------|
|     |      |      |       |

- **Aparência e endereço:** 

#### b)
- **Resposta:** 

#### c)

| Intervalo | Intervalo estimado | Tempo de descoberta |
|-----------|--------------------|---------------------|
| omissão (100–150 ms) | | |
| 1 s | | |

| Distância | RSSI (+9 dBm) | RSSI (0 dBm) |
|-----------|---------------|--------------|
| 0,5 m | | |
| 2 m | | |
| 5 m | | |

- **Compromissos:** 

### Questão 3
> Altere o `NimBLE_Beacon` para anunciar a temperatura do TC74 (Service Data, UUID `0x181A`, 1 byte com sinal), atualizada a cada 2 s. Que vantagens e limitações tem esta forma de disponibilizar uma medição, face a uma ligação?

- **Resposta:** 

---

## 3.2 Ligação: o ESP32-C6 como periférico

### Questão 4
> a) Identifique o connection handle e os parâmetros da ligação antes e depois da atualização, em milissegundos (Tabela 5).
> b) Que tipo de endereço usa o telemóvel (campo `type` e dois bits mais significativos)? Mantém-se ao desligar e voltar a ligar?
> c) Com o telemóvel ligado, um segundo telemóvel encontra o dispositivo? Porquê? Que alteração permitiria até três ligações simultâneas?

#### a)
- **Resposta:** 

#### b)
- **Resposta:** 

#### c)
- **Resposta:** 

### Questão 5
> a) Descodifique as causas de desconexão observadas (ex.: 531 e 520; base `0x200`) com base na Core Specification (Vol. 1, Parte F).
> b) Quanto tempo decorre entre a perda de comunicação e `BLE_GAP_EVENT_DISCONNECT`? Relacione com o supervision timeout.
> c) Compare com a Questão 3 da aula de Wi-Fi: quem toma a iniciativa de restabelecer a ligação, e o ESP32-C6 deixa de estar disponível em algum momento?

#### a)
- **Resposta:** 

#### b)
- **Resposta:** 

#### c)
- **Resposta:** 

### Questão 6
> Pedido: intervalo 500–1000 ms, latência 0, supervision timeout 6 s. Que parâmetros foram efetivamente aplicados? Que impacto teriam no consumo e no tempo de resposta a uma leitura?

- **Resposta:** 

---

## 3.3 Troca de dados: servidor GATT

### Questão 7
> a) Construa a tabela de atributos dos dois serviços (handle, UUID, significado). Deduza o handle do CCCD. Porque é que a característica do LED não tem CCCD? De onde surgem os serviços `0x1800` e `0x1801`?
> b) Interprete os dois bytes lidos e o evento subscribe (`reason=1, curi=1`). Que valor foi escrito no CCCD?
> c) Porque é que a função de acesso é invocada "by nimble stack" antes de cada indicação, e em que tarefa corre?
> d) Que vantagem e que custo teriam indicações (vs. notificações) num sensor que envia uma medição por segundo?

#### a)

| Handle | UUID | Significado |
|--------|------|-------------|
|        |      |             |

- **Resposta:** 

#### b)
- **Resposta:** 

#### c)
- **Resposta:** 

#### d)
- **Resposta:** 

### Questão 8
> a) Escreva `01`, `00` e `0101` na característica do LED. Que erro recebe o telemóvel e quem o gera? Porque não há leitura, e que erro devolveria a pilha (`ble_att_svr_check_perms()`, `host/ble_att.h`)?
> b) Compare o UUID com `BLE_UUID128_INIT(...)` de `led_chr_uuid`. Por que ordem são indicados os bytes?
> c) Escreva as declarações `BLE_UUID128_INIT(...)` do serviço de configuração e da primeira característica para o seu grupo.

#### a)
- **Resposta:** 

#### b)
- **Resposta:** 

#### c)
- **Resposta:** 

### Questão 9
> Substitua o Heart Rate pelo ESS (Temperature e Humidity do DHT20, leitura e notificação). Justifique porque é que as funções de acesso não acedem ao sensor (comparar com a Questão 9 da aula de Wi-Fi). Compare com o servidor HTTPS quanto a quem inicia a comunicação e à quantidade de dados por medição.

- **Resposta:** 

### Questão 10
> Acrescente o serviço proprietário de configuração protegido por emparelhamento.
>
> a) Sem emparelhar, leia o ESS e tente escrever o período. O que acontece? Verifique `encrypted`, `authenticated` e `bonded`. Que modelo de associação foi usado, e porquê?
> b) Altere o período para 10 s e verifique as notificações; tente escrever 0 e 5000.
> c) Após RST, a ligação volta a ser cifrada sem código? E com as bonding keys persistidas em NVS? Porque é que no `NimBLE_Security` esta opção não bastaria (`set_random_addr()`, `ble_hs_id_gen_rnd()`)?
> d) Um atacante passivo consegue obter o código? E com Just Works, ou com Passkey Entry em LE Legacy?
> e) Proponha um formato para o período que inclua um campo de versão de formato.

#### a)
- **Resposta:** 

#### b)
- **Resposta:** 

#### c)
- **Resposta:** 

#### d)
- **Resposta:** 

#### e)
- **Resposta:** 

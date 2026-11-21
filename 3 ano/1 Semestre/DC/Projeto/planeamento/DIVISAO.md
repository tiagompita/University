# Divisão de trabalho

Duas frentes de peso equivalente. Cada um é **responsável** pela sua frente, mas ambos têm de a perceber toda para a defesa.

## As duas frentes

| Tiago (120152): **dispositivo local** | Dinis (126036): **conetividade** |
|---|---|
| **RF7** Módulo de configuração: ler o JSON do cartão, validar, `config_version`, interface pública de leitura **e escrita** | **RF5** Wi-Fi (station) e telemetria para o servidor indicado por URI |
| **RF4** microSD: CSV das leituras + log de operações | **RF5 / RNF2** `mqtt://` e `ws://`, reconexão, tolerância a falhas |
| **RF1** Tarefa de aquisição do DHT20 com **Message Buffer** | **RF8** BLE GATT: Environmental Sensing Service (0x181A), Temperature 0x2A6E e Humidity 0x2A6F, com leitura e notificação |
| **RF2** Ecrã TFT (SPI partilhado com o microSD), ecrã de arranque com node_id e UUID | **RF9** Serviço GATT proprietário de configuração (UUID base `E0C0DE00-…-0000000003FB`) |
| **RF3** LED RGB de estado · **RF6** potenciómetro → brilho do ecrã | **RF10** Provisionamento por BLE · **RF11** estratégia de consumo com medições |

**Comum aos dois:** arquitetura, `main/main.c`, RNF1, RNF3, RNF4, RNF6, RNF7, ADRs, evidências, log semanal, dashboard e demo, apresentação.

## Semana 1 (até 30/10): combinar os contratos, juntos
Antes de cada um programar a sua frente, temos de decidir as **interfaces entre as frentes**. Cada decisão vira um ADR em `docs/adr/` (o modelo está em `docs/adr/0000-template.md`).

Perguntas a responder juntos:
1. **Amostra:** que campos leva (valores, timestamp, número de sequência, estado do sensor, versão de formato)? Que tamanho tem?
2. **Message Buffer:**
   - Quem lê o Message Buffer da tarefa de aquisição?
   - Como chega a mesma amostra ao SD, ao ecrã, à telemetria e ao BLE **sem que estes módulos se conheçam** (RNF7)?
   - Que tamanho tem o buffer, e o que acontece quando enche?
3. **Configuração:**
   - Que funções públicas tem o módulo de config?
   - Como é que o BLE (provisionamento) altera um valor e o guarda no cartão?
   - O que acontece se o JSON não existir ou for inválido?
4. **Estado do sistema:** como chega o estado da rede e do BLE ao ecrã e ao LED, sem que o ecrã inclua headers da rede?
5. **Módulos e tarefas:** nomes das pastas em `components/`, que tarefas FreeRTOS existem e com que prioridades.
6. **Campos do JSON:** `config_version`, node_id, período, Wi-Fi, URI do servidor, tópicos, etc.

No fim da semana 1 devem existir pelo menos os ADRs 0001–0003, os `.h` dos contratos acordados e a primeira entrada do log.

## Tarefas por semana

| Sem. | Tiago (dispositivo local) | Dinis (conetividade) |
|---|---|---|
| 1 (30/10) | Contratos (juntos). Módulo config: ler e validar o JSON do cartão | Contratos (juntos). Módulo Wi-Fi station com reconexão (base: guião 5) |
| 2 (6/11) | microSD: CSV + log de operações. Tarefa DHT20 com Message Buffer (base: guiões 3 e 4) | Telemetria `mqtt://` com tópicos `econode/1019/…` e campo de versão |
| 3 (13/11) | TFT com SPI partilhado com o SD. Ecrã de arranque (node_id, UUID) e ecrã de medidas | `ws://` escolhido só pela config. RNF2: Wi-Fi ou broker em baixo não afetam o resto. Documento sobre o transporte |
| 4 (20/11) | LED RGB (estados normal, erro, transmissão, provisionamento). Potenciómetro → brilho. Estado da rede e do BLE no ecrã | BLE ESS 0x181A (leitura + notificação) |
| 5 (27/11) | Robustez: sem cartão, JSON inválido, sensor sem resposta. RNF6 no ecrã e no log | Serviço GATT de configuração + provisionamento (RF10). Características das credenciais só de escrita |
| 6 (4/12) | Validação e evidências da frente; docs | RF11: estratégia de consumo com medições; validação e evidências |
| Defesa | Ensaio conjunto. Cada um apresenta a frente do outro pelo menos uma vez | igual |

Se uma frente atrasar, o outro ajuda. O objetivo é o projeto completo, não a frente individual.

## Para dominarmos os dois tudo
- **30 minutos por semana** (por exemplo à sexta, antes do log): cada um explica ao outro o código que fez nessa semana. Quem ouve faz perguntas como se fosse o professor.
- Antes de fazer push de algo que mexa em ficheiros partilhados, avisar o outro.
- A alínea "Divisão de trabalho" do log semanal identifica o que cada um fez, por NMEC.

# Extras de inovação

Funcionalidades que o enunciado **não pede** mas que melhoram a qualidade do projeto e contam no critério "Inovação/complexidade".

**Regras**
- Só se começa um extra depois de os requisitos da própria frente estarem `validado`.
- Cada extra feito tem ADR, evidência em `docs/evidences/`, referência no log semanal e uma linha no README do repo.
- **Estado:** `proposto` → `escolhido` → `em curso` → `feito`. Também pode ficar `descartado`, com o motivo.
- **Responsável:** **T** = Tiago, **D** = Dinis, **D+T** = os dois, **Claude** = infraestrutura que não é matéria da UC.

## Nível 1: baixo custo, alto retorno
| # | Ideia | Porque melhora o projeto | Resp. | Estado |
|---|---|---|---|---|
| 1 | **CI no GitHub Actions**: build automático com a imagem `espressif/idf:v6.1` a cada push | Prova que "compila em qualquer máquina", que é requisito explícito | Claude | proposto |
| 2 | **Alarmes/limiares** de temperatura e humidade no JSON → LED, ecrã e tópico `alert` | Uso real de monitorização: a config dirige o comportamento | T + D | proposto |
| 3 | **MQTT Last Will** + tópico `status` (uptime, heap livre, RSSI, amostras perdidas por Message Buffer cheio) | Observabilidade. O contador de perdas responde à pergunta "e quando o buffer enche?" | D (+T contadores) | proposto |
| 4 | **Hora real por SNTP** nos registos e na telemetria, com o uptime como alternativa quando não há rede | Os CSV ficam úteis para análise e mostra que pensámos no modo offline | D | proposto |
| 5 | **Config aplicada sem reboot** (ex.: mudar o período por BLE tem efeito imediato) | Demonstra a regra "não copiar a configuração" | T | proposto |
| 6 | **Factory reset**: pressão longa no botão BOOT (GPIO9) → modo de provisionamento | Usabilidade em campo (RNF4) | T | proposto |
| 7 | **Plausibilidade do sensor**: CRC do DHT20, limites físicos, estado "sensor em erro" | Robustez; liga ao LED vermelho | T | proposto |
| 8 | **Diagramas na documentação**: tarefas e fluxo de dados, máquina de estados do LED, sequência de provisionamento | Clareza na documentação e na defesa | D+T decidem, Claude desenha | proposto |

## Nível 2: custo médio, diferenciador
| # | Ideia | Porque melhora o projeto | Resp. | Estado |
|---|---|---|---|---|
| 9 | **Store-and-forward**: as leituras não enviadas ficam no SD e são reenviadas quando a rede volta | RNF2 levado ao fim: zero perda de dados | D+T | proposto |
| 10 | **Segurança BLE**: LE Secure Connections com passkey mostrada no TFT para as características de config | RNF6 a sério; junta ecrã e BLE | D (+T ecrã) | proposto |
| 11 | **TLS** (`mqtts://` / `wss://`) com o certificado da CA no cartão | Segurança na rede (aula 10); só muda o esquema do URI | D | proposto |
| 12 | **Métricas medidas**: latência sensor → dashboard, uso de CPU (`vTaskGetRunTimeStats`), pilha por tarefa, memória | Números concretos para o log e para a defesa | D+T | proposto |
| 13 | **Testes em host** da lógica pura (validação do JSON, formato CSV, parse do URI) | Qualidade de código; apanha regressões quando os requisitos mudarem | D+T | proposto |
| 14 | **Config remota por MQTT** (tópico `config/set`) com a mesma API do BLE | Mostra a arquitetura a absorver um canal novo sem mexer nos módulos | D | proposto |
| 15 | **Dashboard avançado**: histórico, online/offline via LWT, alarmes, exportar CSV | Demo mais forte | Claude | proposto |

## Nível 3: custo alto (só se sobrar tempo)
| # | Ideia | Porque melhora o projeto | Resp. | Estado |
|---|---|---|---|---|
| 16 | **Light/deep sleep com consumo medido** (mA por modo, estimativa de autonomia com bateria) | RF11 com dados reais; trade-off com o BLE sempre ligado | D | proposto |
| 17 | **OTA** por HTTPS com rollback | Matéria C3 (aula 10); obriga a mudar o `partitions.csv` | D+T | proposto |
| 18 | **Home Assistant MQTT Discovery** | Integração com uma plataforma real | D | proposto |

**Ordem sugerida**, pelo retorno face ao esforço: 1 → 3 → 2 → 5 → 4 → 9 → 10 → 12, depois o resto.

## Novas ideias
_Acrescentar aqui as ideias que surgirem durante o projeto._

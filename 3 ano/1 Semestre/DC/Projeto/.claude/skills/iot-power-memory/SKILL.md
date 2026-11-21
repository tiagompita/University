---
name: iot-power-memory
description: Robustez FreeRTOS, memória, tolerância a falhas e consumo do EcoNode, alinhados com os requisitos RNF1, RNF2, RNF6, RNF7 e RF11 do enunciado. Usar ao desenhar tarefas, filas, módulos, reconexão de rede, tratamento de credenciais ou a estratégia de energia.
---

# Tarefas, memória, falhas e energia (EcoNode)

## Tarefas e comunicação (RNF1)
- Uma tarefa FreeRTOS por funcionalidade (aquisição, ecrã, registo SD, telemetria, BLE, LED, configuração). **Nenhuma bloqueia outra**: esperas sempre com timeout e nunca `portMAX_DELAY` à espera de um recurso partilhado que outra tarefa possa reter.
- **Tarefa de aquisição:** usa o mecanismo **sorteado ao grupo** (Queue *ou* Message Buffer, ver README). A amostra leva os valores, os metadados (timestamp, número de sequência, estado do sensor) e o campo de versão de formato.
- **Documenta o dimensionamento** (profundidade da fila / tamanho do buffer, com contas: período mínimo de 1 s × pior atraso do consumidor) e **o que acontece quando enche** (descartar a mais antiga, descartar a nova, contar as perdas no log...). É pergunta certa na defesa: decide, mede e regista num ADR.
- Mede a ocupação de pilha (`uxTaskGetStackHighWaterMark`) e põe os números no registo semanal.
- O SPI partilhado TFT/SD passa por um único mecanismo de exclusão, e a inicialização dos dois é serializada.

## Módulos (RNF7) e configuração
- Cada módulo em `components/<nome>/` com interface pública em `include/*.h`. **Consumidores não se incluem uns aos outros** (o ecrã não inclui headers da rede). Os dados chegam por filas/eventos (`esp_event`) ou por um módulo de estado neutro.
- **Os módulos não copiam a configuração para variáveis locais no arranque**: leem sempre pela interface pública do módulo de configuração. A configuração pode mudar por BLE em funcionamento.
- Toda a estrutura trocada com o exterior (telemetria, registos no SD, características GATT proprietárias) tem **campo de versão de formato**; o JSON tem `config_version`.

## Tolerância a falhas (RNF2)
- A perda de Wi-Fi ou do broker **não pode parar** a amostragem, o registo no SD nem o BLE. A reconexão faz-se com backoff exponencial limitado numa tarefa própria, e as leituras não enviadas ficam no SD (decide e documenta se são reenviadas).
- Cartão ausente, JSON inválido ou sensor sem resposta: o sistema arranca de forma degradada, sinaliza no LED (vermelho) e no ecrã, e regista no log. Nunca `abort()` silencioso.
- Watchdog de tarefas (`esp_task_wdt`) nas tarefas de longa duração.

## Segurança (RNF6)
- Credenciais **nunca** no ecrã, nunca no log do SD, nunca em `ESP_LOG*`.
- As características BLE que recebem credenciais são **só de escrita** (sem leitura) e exigem emparelhamento/encriptação.

## Memória
- Sem `malloc`/`free` em ciclos de amostragem: buffers estáticos ou alocados no arranque. Nada de cJSON a criar árvores a cada amostra se um `snprintf` para um buffer fixo chegar.
- ISRs mínimas em `IRAM_ATTR`: nada de logs nem chamadas bloqueantes; acordam tarefas com `xQueueSendFromISR`/`vTaskNotifyGiveFromISR`.

## Energia (RF11)
- O nó é alimentado e tem BLE sempre disponível, por isso o *deep sleep* contínuo choca com o RF8–RF10. Candidatos realistas: **modem sleep do Wi-Fi**, **light sleep automático com DFS** (`esp_pm_configure`, `CONFIG_PM_ENABLE`, *tickless idle*), intervalo de anúncio/ligação BLE mais longo, ecrã com brilho pelo potenciómetro e apagado por inatividade, e agrupar publicações. O TWT do Wi-Fi 6 só funciona se o AP o suportar.
- A estratégia escolhida vai para um ADR com **medições** (corrente antes/depois, condições de medição) e evidência em `docs/evidences/`.

## Processo académico (avaliado)
- Toda a decisão estrutural tem ADR em `docs/adr/NNNN-*.md` (mínimo 5), com alternativas consideradas.
- Um requisito só fica `validado` com evidência em `docs/evidences/` (nome a começar pelo requisito, ex. `RF1-periodo-1s.csv`).
- Registo semanal: commit `log: semana N` + tag `semana-N`; **nunca editar entradas anteriores**. Lembra o grupo de declarar o uso de ferramentas de geração assistida (incluindo o Claude), porque omiti-lo é falta de integridade académica.

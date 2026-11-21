# Regras de uso de IA no projeto

## O que a UC diz (dp-v1.1.pdf §9.1, regime de IA CONDICIONADA)
- No **desenvolvimento do projeto** a IA é permitida como apoio ao debug, à programação e à documentação.
- A IA **não pode substituir** a nossa capacidade de análise e argumentação. O projeto tem de ser trabalho intelectual nosso.
- A **defesa oral é sem IA**, e temos de dominar todos os aspetos da solução. Os mini-testes e o teste escrito também são sem IA.
- **Cada entrada do log semanal** tem de declarar que ferramentas de IA usámos e em quê. Omitir é falta de integridade académica.

## As nossas regras (iguais para os dois)
1. **A lógica do firmware é nossa.** Isto inclui tarefas, drivers, BLE, Wi-Fi, MQTT, config, SD, TFT e as interfaces `.h` dos módulos. A IA explica, faz perguntas, mostra pseudocódigo e revê o código, mas **não escreve o código por nós**.
2. **A IA pode fazer o que não é matéria da UC:** CMakeLists, `idf_component.yml`, `sdkconfig.defaults`, `.gitignore`, formatação de documentos, diagramas a partir das nossas decisões, o dashboard web e a CI.
3. **As decisões de arquitetura são nossas.** A IA pode listar alternativas e prós e contras, mas a escolha e o texto do ADR são nossos.
4. **Antes de fazer commit, sabes explicar cada linha?** Se não, ainda não está pronto.
5. **Confirmar sempre as APIs na documentação do ESP-IDF v6.1** (docs.espressif.com, alvo esp32c6). A IA erra muitas vezes com APIs antigas (v4/v5): `driver/i2c.h` legado, `vTaskDelayUntil`, etc.
6. **Simples primeiro.** Primeiro uma solução simples e modular que cumpra o requisito; os extras vêm depois (ver EXTRAS.md).
7. **Anotar o uso de IA durante a semana** (uma linha por sessão), para o log de sexta não ser escrito de memória.

## Bloco para colar no teu assistente de IA
Cola o texto abaixo como instruções do sistema, instruções personalizadas ou primeira mensagem do teu assistente (ChatGPT, Gemini, Copilot, etc.).

```text
És um tutor de sistemas embebidos para um projeto universitário (UC Dispositivos
Conectados, Universidade de Aveiro, 2026/27). Responde em português de Portugal,
mantendo os termos técnicos em inglês.

PROJETO: "EcoNode", nó de monitorização ambiental com ESP32-C6-DevKitC-1 e
ESP-IDF v6.1.0. Sensor DHT20 (I2C), ecrã TFT e microSD no mesmo barramento SPI,
LED RGB endereçável (GPIO8), potenciómetro no ADC para o brilho do ecrã,
configuração num ficheiro JSON no microSD, telemetria por Wi-Fi para um servidor
indicado por URI (mqtt:// ou ws://), BLE GATT (Environmental Sensing Service
0x181A + serviço proprietário de configuração + provisionamento). FreeRTOS: uma
tarefa por funcionalidade, nenhuma bloqueia outra. A tarefa de aquisição envia
as amostras por um Message Buffer. Arquitetura modular: cada módulo em
components/<nome>/ com interface pública include/<nome>.h; os módulos que
consomem dados não se incluem uns aos outros. Os módulos não copiam a
configuração para variáveis locais: leem-na sempre pela interface do módulo de
config. node_id = 1019; tópicos econode/1019/; UUID base do serviço de config
E0C0DE00-0000-4000-8000-0000000003FB.

A MINHA PARTE: Wi-Fi, telemetria (mqtt:// e ws://, reconexão, tolerância a
falhas), BLE GATT (ESS, serviço de configuração, provisionamento) e estratégia
de consumo energético.

REGRAS OBRIGATÓRIAS (regime de IA condicionada da UC; a defesa oral é sem IA):
1. NÃO escrevas código C da lógica do projeto nem os ficheiros .h dos módulos.
   Explica os conceitos, faz perguntas orientadoras que me levem à solução e,
   se for preciso, mostra pseudocódigo de alto nível.
2. Quando eu te mostrar código meu: aponta bugs e melhorias de estrutura e
   explica PORQUÊ, mas deixa a correção para mim. Se eu estiver bloqueado há
   muito tempo, dá dicas cada vez mais concretas, sem a solução completa.
3. Podes escrever ficheiros que não são matéria da UC: CMakeLists.txt,
   idf_component.yml, sdkconfig.defaults, .gitignore, e formatar texto de
   documentação.
4. Usa só APIs do ESP-IDF v6.1 (por exemplo driver/i2c_master.h e
   xTaskDelayUntil). Se não tiveres a certeza de uma assinatura, diz-me para a
   confirmar em docs.espressif.com em vez de a inventar.
5. Privilegia soluções simples, modulares e fáceis de explicar numa defesa oral.
6. No fim de cada sessão, faz um resumo de 1 a 2 linhas sobre em que é que me
   ajudaste, para eu declarar no log semanal.
```

## Exemplo de declaração no log
> **Utilização de ferramentas de geração assistida.** 120152: Claude (Anthropic) para a estrutura do repositório e os ficheiros de build, e para esclarecer o uso de Message Buffers no FreeRTOS. 126036: ChatGPT para explicar a sequência de eventos do Wi-Fi station e rever o módulo de reconexão. O código dos módulos foi escrito pelo grupo.

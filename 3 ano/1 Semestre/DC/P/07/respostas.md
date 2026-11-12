# Respostas - Guião 7: Dispositivos Conectados (Modos de consumo de energia reduzido)

> Ficheiro opcional, para uso pessoal. Só contém os enunciados e as tabelas de medição em branco.

---

## Tabela de medições (preencher durante a aula)

Convenção: Ī = corrente média; t = duração; Q = carga (painel *Selection* do PPK2). Janelas de sono ≥ 1 s.

### ls_wktimer (Q2, Q4, Q5)

| Versão | Ī sono (µA) | Ī fase ativa (mA) | t fase ativa (ms) | Q sono (µC) | Q fase ativa (µC) | Ī ciclo 10 s |
|---|---|---|---|---|---|---|
| Original | | | | | | |
| Referência (guião) | 239,19 | 26,25 | 3,65 | 236,32 | 95,81 | — |
| Sem printf/flush (Q4) | | | | | | |
| + `esp_sleep_cpu_retention_init()` (Q5a) | | | | | | |
| + `PM_POWER_DOWN_PERIPHERAL_IN_LIGHT_SLEEP` (Q5b) | | | | | | |

### ls_wkgpio (Q7)

| Medição | Ī sono (µA) | Ī fase ativa (mA) | t fase ativa (ms) | Q fase ativa |
|---|---|---|---|---|
| Medido | | | | |
| Referência (guião) | ~160 | 21,81 | 126,1 | — |

### Pull-up em light-sleep (Q8)

| Configuração | Botão solto (µA) | Botão premido (µA) | ΔI (µA) |
|---|---|---|---|
| a) sem `gpio_sleep_sel_dis` | | | |
| b) com `gpio_sleep_sel_dis(GPIO_NUM_0)` | | | |

### Deep-sleep (Q11, Q13, Q15, Q16)

| Projeto / versão | Ī deep-sleep (µA) | Ī wake-up (mA) | t wake-up (ms) | Q wake-up (mC) |
|---|---|---|---|---|
| ds_wktimer | | | | |
| Referência ds_wktimer | 8,26 | 30,62 | 256,8 | 7,87 |
| ds_wktimer + opções Q13 | | | | |
| ds_wkext1 | | | | |
| Referência ds_wkext1 | 9,64 | 30,79 | 271,2 | 8,35 |
| ds_wkext1 sem `esp_sleep_pd_config` (Q15b) | | | | |
| Wake-up falso (Q16) | | | | |

### Cálculo de autonomia (Q12, Q17)

| Modo | T | Q por ciclo | Ī ciclo (mA) | Autonomia 2000 mAh (h) |
|---|---|---|---|---|
| Light-sleep | 10 s | | | |
| Light-sleep | 600 s | | | |
| Deep-sleep | 10 s | | | |
| Deep-sleep | 600 s | | | |

---

## 5.2.1 Light-sleep com timer

### Questão 1
> Abra o projeto no VSCode e estude o ficheiro main.c. Qual a duração do período de light-sleep configurado? Compile o programa, descarregue-o para o SoC e abra a consola. Altere depois o intervalo entre wake-ups e verifique o funcionamento.

- **Resposta:**
A duração do período de light-sleep está configurado de "origem" com 1 segundo.


### Questão 2
> Com o programa original e o PPK2 ligado como na Figura 1, meça a corrente média no sono, a corrente média e a duração da fase ativa (use o marcador D0), a carga de cada fase e a corrente média ao longo de 10 s. Registe os valores numa tabela e compare-os com os de referência e com o valor da ficha técnica para o light-sleep (Tabela 2). Que componentes do módulo podem explicar a diferença face à ficha técnica?

- **Resposta:**


### Questão 3
> Consulte a secção UART Output Handling da documentação dos Sleep Modes e justifique a invocação da função console_flush() antes de esp_light_sleep_start() e no fim do ciclo de app_main(). No ESP-IDF v6.1, o que acontece por omissão aos caracteres que ainda estão por transmitir quando o chip entra em light-sleep? E em deep-sleep?

- **Resposta:**


### Questão 4
> Comente as chamadas a printf() e a console_flush(), mantendo a medição do tempo, e repita as medições da fase ativa da Questão 2. Em quanto diminuem a duração da fase ativa, a carga por ciclo e a corrente média? Relacione a diferença com o número de caracteres enviados a 115 200 bit/s.
>
> Opcional: reponha as mensagens, retire as chamadas a console_flush() e acrescente, antes do ciclo, `esp_sleep_set_console_uart_handling_mode(ESP_SLEEP_ALWAYS_DISCARD_UART);` O que observa na consola e no PPK2?

- **Resposta:**


### Questão 5
> No programa original, a CPU fica apenas parada durante o light-sleep. Para que o ESP-IDF a possa desligar, a aplicação tem de reservar memória para guardar o contexto da CPU, chamando esp_sleep_cpu_retention_init() no início de app_main(). Os periféricos digitais só podem ser desligados se a CPU também o for.
>
> a) Acrescente essa chamada e repita as medições da Questão 2.
> b) Ative depois a opção CONFIG_PM_POWER_DOWN_PERIPHERAL_IN_LIGHT_SLEEP no menuconfig e repita as medições. Compare as correntes em light-sleep das três versões entre si e com o valor de 35 µA da ficha técnica. A duração da fase ativa alterou-se? Porquê?
> c) Com esta opção, que função de wake-up usada no projeto ls_wkgpio deixa de estar disponível, e que função a substitui?

#### a)
- **Resposta:**

#### b)
- **Resposta:**

#### c)
- **Resposta:**


---

## 5.2.2 Light-sleep com GPIO

### Questão 6
> Abra o projeto no VSCode e estude o ficheiro main.c. Explique qual a função do seguinte bloco de código:
> ```
> if (gpio_get_level(INPUT_PIN) == 0) {
>     printf("please release button\n");
>     console_flush();
>     do { vTaskDelay(pdMS_TO_TICKS(10)); } while (gpio_get_level(INPUT_PIN) == 0);
> }
> ```

- **Resposta:**


### Questão 7
> Compile o programa, descarregue-o para o SoC e abra a consola. Ao premir o botão, o SoC deverá acordar do light-sleep. Meça com o PPK2 a corrente média em light-sleep e a duração e a carga da fase ativa que se segue a um wake-up. A fase ativa é mais longa do que no projeto anterior. Porquê? A corrente em light-sleep é igual à medida na Questão 2?

- **Resposta:**


### Questão 8
> Avalie o consumo de uma resistência de pull-up durante o sono.
>
> a) No projeto ls_wktimer, configure o GPIO0 como entrada com pull-up interno, como em ls_wkgpio, mas sem o configurar como fonte de wake-up. Meça a corrente em light-sleep com o botão solto e com o botão premido.
> b) Acrescente gpio_sleep_sel_dis(GPIO_NUM_0) depois de gpio_config() e repita as medições. Estime o valor da resistência de pull-up interna a partir da diferença de corrente e compare-o com o valor indicado na ficha técnica.
> c) Que corrente consumiria uma resistência de pull-up externa de 10 kΩ com o botão premido? Compare-a com a corrente do módulo em light-sleep.

#### a)
- **Resposta:**

#### b)
- **Resposta:**

#### c)
- **Resposta:**


---

## 5.3.1 Deep-sleep com timer

### Questão 9
> Abra o projeto no VSCode e estude o ficheiro main.c. Qual o funcionamento esperado para este programa? Compile-o, descarregue-o e abra a consola. Deveria observar uma variável de contagem incrementada a cada ciclo. Contudo, isso não ocorre. Porquê? Pista: consulte a documentação dos Sleep Modes.

- **Resposta:**


### Questão 10
> Altere o programa de modo a que a variável de contagem seja preservada entre wake-ups sucessivos e teste o seu programa.

- **Resposta:**


### Questão 11
> Meça a corrente média em deep-sleep e a duração e a carga de cada wake-up. O marcador D0 só passa a 1 quando app_main() começa: que fração da fase ativa decorre antes disso, e em que etapas do arranque é gasta?

- **Resposta:**


### Questão 12
> Com o deep-sleep, cada wake-up custa mais carga do que com o light-sleep, mas a corrente durante o sono é menor. Sejam Qls e Qds as cargas de um wake-up e Ils e Ids as correntes durante o sono em light-sleep e em deep-sleep. Mostre que o deep-sleep só compensa para períodos superiores a T\* = (Qds − Qls) / (Ils − Ids) e calcule T\* com os valores de referência e com os seus. O projeto prevê períodos de amostragem entre 1 s e 3600 s: em que parte desse intervalo deve ser usado cada modo?

- **Resposta:**


### Questão 13
> Reduza a duração do arranque após o deep-sleep ativando, no menuconfig, as opções CONFIG_BOOTLOADER_SKIP_VALIDATE_IN_DEEP_SLEEP, CONFIG_BOOTLOADER_LOG_LEVEL_NONE e CONFIG_LOG_DEFAULT_LEVEL_WARN. Como o bootloader também muda, volte a descarregar o projeto completo. Meça de novo a duração e a carga de cada wake-up e recalcule T\*. Que garantia se perde com a primeira opção?

- **Resposta:**


---

## 5.3.2 Deep-sleep com EXT1

### Questão 14
> Abra o projeto no VSCode e estude o ficheiro main.c. Compile o programa e teste-o premindo o botão. Cada pressão deverá provocar um arranque completo, seguido de uma mensagem com o contador incrementado.

- **Resposta:**


### Questão 15
> Analise o consumo do wake-up por EXT1.
>
> a) Meça a corrente média em deep-sleep e compare-a com a do projeto ds_wktimer. A que se deve a diferença?
> b) Comente a chamada a esp_sleep_pd_config(ESP_PD_DOMAIN_RTC_PERIPH, ESP_PD_OPTION_ON) e repita a medição. O botão continua a acordar o chip? Consulte a documentação de esp_sleep_enable_ext1_wakeup_io() em esp_sleep.h e explique o resultado.
> c) Mantenha o botão premido durante alguns segundos. O que observa na consola e no PPK2? Porquê?

#### a)
- **Resposta:**

#### b)
- **Resposta:**

#### c)
- **Resposta:**


### Questão 16
> Monte um segundo botão de pressão, ligado ao GPIO5 (um LP GPIO), e configure-o com pull-up interno, como o primeiro. Altere o programa de modo a que só conte um wake-up quando ambos os botões estiverem premidos em simultâneo. Como o ESP32-C6 não suporta o modo ESP_EXT1_WAKEUP_ALL_LOW, acorde com ESP_EXT1_WAKEUP_ANY_LOW, verifique o estado dos dois pinos com rtc_gpio_get_level() e, se só um estiver premido, volte a adormecer, contando estes wake-ups falsos numa segunda variável. Atenção ao comportamento observado na Questão 15 c). Meça a carga de um wake-up falso e comente o custo desta solução.

- **Resposta:**


---

## 5.4 Estimativa de autonomia

### Questão 17
> Considere um nó do projeto que lê o DHT20 e escreve a amostra no cartão com um período T, gastando em cada leitura a carga indicada na Tabela 3, e que dorme entre leituras.
>
> a) Usando as suas medições (ou, na falta delas, os valores de referência), calcule a corrente média para T = 10 s e para T = 600 s, adormecendo em light-sleep e em deep-sleep.
> b) Calcule a autonomia correspondente com uma bateria de 2000 mAh, admitindo um regulador linear, em que a corrente pedida à bateria é igual à corrente do módulo.
> c) Indique três razões pelas quais estas estimativas são otimistas. Considere o que a medição em J5 não inclui, o consumo dos sensores e do cartão durante o sono e as comunicações sem fios.
> d) O nó tem de manter uma interface BLE disponível. Que consequência tem esta exigência na escolha entre light-sleep e deep-sleep?

#### a)
- **Resposta:**

#### b)
- **Resposta:**

#### c)
- **Resposta:**

#### d)
- **Resposta:**

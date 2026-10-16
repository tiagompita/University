# Respostas - Guião 4: Dispositivos Conectados (Barramento SPI: armazenamento em cartão microSD)

> **Nota:** Em cada resposta às questões, indique a tabela, figura, secção da ficha técnica ou documentação do ESP-IDF em que se apoia (por exemplo, "ESP-IDF Programming Guide, FAT Filesystem Support" ou "ESP32-C6 TRM, Secção X"). Uma resposta sem fonte está incompleta.

---

## 3.2 Aplicação de teste para leitura/escrita de cartões SD

### Questão 1
> Estude o driver SD (*SD SPI Host Driver*) e o suporte para o sistema de ficheiros (*FAT Filesystem Support*) e analise o código do exemplo.
> 
> a) Identifique a sequência de passos realizados pelo exemplo e, para cada passo, a função da API utilizada (p. ex. `spi_bus_initialize()`, `esp_vfs_fat_sdspi_mount()`, `fopen()`, `rename()`, `esp_vfs_fat_sdcard_unmount()`, `spi_bus_free()`).  
> b) Que controlador SPI é utilizado pelo exemplo? Consultando o *Technical Reference Manual*, quantos controladores SPI de uso geral possui o ESP32-C6?  
> c) Explique o significado dos campos `format_if_mount_failed`, `max_files` e `allocation_unit_size` da estrutura `esp_vfs_fat_sdmmc_mount_config_t`.  
> d) Qual o papel do *mount point* `/sdcard`? Porque é possível usar funções padrão como `fopen()` e `fprintf()` para aceder ao cartão?  
> e) A consola indica uma velocidade de 20 MHz. Porque é que a inicialização do cartão não é feita diretamente a esta frequência?  
> f) A que correspondem as mensagens `cmd=52` e `cmd=5 ... command not supported`? Porque não representam um erro?  
> g) Porque deve o pino TFTCS ser ligado a 3,3 V? O que poderia acontecer se ficasse desligado? Para que servem as resistências de *pull-up* nos sinais MISO, MOSI e SDCS?

#### a)
- **Fonte:** 
- **Resposta:** 

#### b)
- **Fonte:** 
- **Resposta:** 

#### c)
- **Fonte:** 
- **Resposta:** 

#### d)
- **Fonte:** 
- **Resposta:** 

#### e)
- **Fonte:** 
- **Resposta:** 

#### f)
- **Fonte:** 
- **Resposta:** 

#### g)
- **Fonte:** 
- **Resposta:** 

---

### Questão 2
> Desligue o ESP32-C6 DevKit da alimentação e retire o cartão microSD. Usando um leitor de cartões SD, inspecione o seu conteúdo.
> 
> a) Que ficheiros criados pelo programa encontra e qual o seu conteúdo? Justifique, com base no código, a ausência do ficheiro `hello.txt`.  
> b) Que data de modificação apresentam esses ficheiros? Explique porquê e indique como poderia o sistema registar a data e hora corretas.

#### a)
- **Fonte:** 
- **Resposta:** 

#### b)
- **Fonte:** 
- **Resposta:** 

---

## 3.3 Aplicação de log para escrita no cartão SD

### Questão 3
> Altere o programa anterior para registar no ficheiro `/sdcard/log.txt`, em formato CSV, o tempo decorrido desde o arranque da placa e um valor de contagem. O programa deve cumprir os seguintes requisitos:
> - O registo é realizado por uma tarefa FreeRTOS com um período de 1000 ms, garantido com `xTaskDelayUntil()`. Esta função devolve `pdFALSE` quando não chegou a bloquear a tarefa, por o instante de despertar já ter passado; nesse caso, é impresso um aviso com `ESP_LOGW()` a indicar que o período foi excedido. Não use `vTaskDelayUntil()`: deixou de ser suportada como função de compatibilidade a partir do ESP-IDF v6.0 e não devolve qualquer valor;
> - O tempo em milissegundos é obtido com `esp_timer_get_time() / 1000`; o contador começa em 0 e é incrementado a cada registo;
> - Formato: a primeira linha é o cabeçalho `millis,counter`; cada linha seguinte contém os dois valores inteiros separados por vírgula, sem espaços, terminada com `\n`;
> - Se o ficheiro não existir no arranque (verifique com `stat()`), é criado e o cabeçalho é escrito; se já existir, os novos registos são acrescentados no fim (modo `"a"`) sem repetir o cabeçalho — assim, cada novo arranque da placa inicia uma nova sequência com `millis` e `counter` a recomeçar;
> - O ficheiro é aberto, escrito e fechado a cada registo;
> - Ao premir o botão BOOT (GPIO 9, ativo a nível baixo — configure o *pull-up* interno), a tarefa termina o logging, desmonta o cartão, liberta o barramento SPI, imprime a mensagem «Cartão desmontado. Pode remover o cartão.» e termina.
> 
> a) Implemente o programa, execute-o durante alguns segundos, termine o logging com o botão BOOT, desligue a placa e leia o ficheiro `log.txt` no portátil.  
> b) Numa primeira versão de uma solução, que usava `vTaskDelay(pdMS_TO_TICKS(1000))`, obteve-se a sequência de tempos 270, 1340, 2400, 3460, .... Explique porque é que o intervalo entre registos excede 1000 ms nessa versão e porque é que `xTaskDelayUntil()` resolve o problema.

#### a)
- **Fonte / Implementação:** 
- **Conteúdo de log.txt obtido:** 
- **Observações:** 

#### b)
- **Fonte:** 
- **Resposta:** 

---

## 3.4 Aplicação de leitura do log escrito no cartão SD

### Questão 4
> Desenvolva um programa em que uma tarefa FreeRTOS leia, a cada segundo, uma linha do ficheiro `/sdcard/log.txt` gerado na questão anterior e a imprima no terminal. O programa deve cumprir os seguintes requisitos:
> - O ficheiro é aberto em modo de leitura uma única vez, no início da tarefa, e as linhas são lidas com `fgets()` para um buffer de 64 bytes;
> - A primeira linha (cabeçalho) é ignorada, bem como linhas vazias;
> - O carácter de fim de linha é removido antes de imprimir; cada linha é impressa no formato `CSV: <linha>`;
> - Se o ficheiro não existir, é impressa uma mensagem de erro e a tarefa termina;
> - Ao atingir o fim do ficheiro, é impresso `EOF: <n> linhas lidas` (sem contar o cabeçalho), o ficheiro é fechado, o cartão é desmontado e a tarefa termina (`vTaskDelete(NULL)`).

- **Fonte / Implementação:** 
- **Resultado obtido na consola:** 
- **Observações:** 

---

## 3.5 Integração da leitura da temperatura e humidade (DHT20) com logging no cartão microSD

### Questão 5
> Desenvolva um programa que, a cada segundo, leia a temperatura e a humidade do sensor DHT20 e registe esses valores no ficheiro `/sdcard/dht20.csv`. O programa deve ser organizado em duas tarefas FreeRTOS que comunicam através de uma queue:
> - A queue é criada em `app_main()`, antes das tarefas, com capacidade para 10 itens do tipo `sample_t`; a tarefa do sensor tem prioridade superior à da tarefa de logging;
> - Tarefa do sensor: com um período de 1000 ms garantido com `xTaskDelayUntil()` (com aviso se o período for excedido, como na Questão 3), obtém o tempo atual (`esp_timer_get_time() / 1000`), desencadeia uma medição no DHT20, lê o resultado e envia para a queue uma estrutura `sample_t` com os campos `millis`, `counter`, `temperature` e `humidity`. O contador é incrementado a cada tentativa de medição; se a leitura falhar (erro de comunicação I2C, sensor ocupado ou CRC inválido), é impresso um aviso com `ESP_LOGW()` e nada é enviado para a queue, pelo que as falhas ficam visíveis como lacunas no contador. O envio usa `xQueueSend()` com tempo de espera 0: se a queue estiver cheia, a função retorna `errQUEUE_FULL`, a amostra é descartada e é impresso um aviso, sem que o período de amostragem seja afetado;
> - Tarefa de logging: chama `xQueueReceive()` com um tempo de espera de 100 ms (`pdMS_TO_TICKS(100)`). Quando recebe uma estrutura, acrescenta uma linha ao ficheiro (abrindo-o e fechando-o a cada registo) e imprime na consola `Logged: time=<millis> ms, counter=<n>, temp=<t> C, hum=<h> %`. Quando a função retorna `pdFALSE` (tempo esgotado sem dados), verifica o estado do botão BOOT;
> - Formato do ficheiro: cabeçalho `millis,counter,temp_C,hum_pct`; temperatura e humidade com duas casas decimais; sem espaços; mesmas regras de criação/acrescento do ficheiro que na Questão 3;
> - Ao detetar o botão BOOT premido, a tarefa de logging termina o logging e desmonta o cartão, tal como na Questão 3;
> - Pode reutilizar o código de acesso ao DHT20 desenvolvido na aula anterior, mas deve usar o driver `driver/i2c_master.h`: o driver legado `driver/i2c.h` está em fim de vida desde o ESP-IDF v6.0 e será removido na v7.0. Recorde que cada medição demora cerca de 80 ms e que, após a alimentação, o sensor necessita de pelo menos 100 ms antes da primeira medição.

- **Fonte / Implementação:** 
- **Resultado obtido na consola:** 
- **Observações:** 

---

### Questão 6
> Termine o logging com o botão BOOT, desligue a placa e remova o cartão microSD.
> 
> a) Consulte o conteúdo do ficheiro `dht20.csv` e compare-o com a informação impressa na consola. Existem lacunas no contador? Se sim, a que se devem?  
> b) O programa abre e fecha o ficheiro a cada segundo, o que obriga a atualizar a tabela FAT e os diretórios do cartão em cada registo. Discuta o compromisso entre o risco de perda de dados e o desgaste do cartão (número limitado de ciclos de escrita) e proponha uma estratégia alternativa (p. ex. acumular N registos em memória antes de escrever). Que dados se perderiam, no pior caso, com a sua estratégia?  
> c) Verifique se o período de medição de 1 s cumpre o critério de autoaquecimento da ficha técnica do DHT20 (tempo de ativação não superior a 10% do período). Que efeito teria na temperatura medida um período muito mais curto?  
> d) Suponha que, ocasionalmente, uma escrita no cartão demora 4 s. Com a queue de 10 itens especificada, perdem-se amostras? A partir de que duração de escrita começariam a perder-se? Justifique com base no funcionamento de `xQueueSend()` com tempo de espera 0.

#### a)
- **Fonte:** 
- **Comparação / Lacunas observadas:** 
- **Resposta:** 

#### b)
- **Fonte:** 
- **Discussão (desgaste vs perda de dados):** 
- **Estratégia alternativa:** 
- **Pior caso de perda:** 

#### c)
- **Fonte:** 
- **Verificação do critério de autoaquecimento:** 
- **Efeito de período mais curto:** 

#### d)
- **Fonte:** 
- **Resposta e Justificação:** 

---

## 3.6 Exercício opcional: observação dos sinais SPI

### Questão Opcional
> Se dispuser de um analisador lógico ou osciloscópio, ligue-o aos sinais SCK, MOSI, MISO e SDCS e capture o arranque do programa da Questão 3. Identifique o comando CMD0 e meça a frequência de SCK durante a inicialização e durante as escritas no ficheiro. Os valores obtidos são consistentes com a sua resposta à alínea e) da Questão 1?

- **Fonte:** 
- **Medições / Formas de onda observadas:** 
- **Resposta:** 


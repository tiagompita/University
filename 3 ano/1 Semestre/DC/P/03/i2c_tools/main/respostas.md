# Respostas - Guião 3: Dispositivos Conectados (Sensores/Atuadores I2C)

> **Nota:** Em cada resposta às questões, indique a tabela, figura ou secção da ficha técnica em que se apoia (por exemplo, "TC74, Table 4-2"). Uma resposta sem fonte está incompleta.

---

## 4.1 I2C-TOOL: Exploração de comunicações I2C com sensores simples

### Questão 1
> O TC74 existe em dois encapsulamentos com numerações de pinos diferentes. Consulte a Table 2-1 da ficha técnica e indique qual dos dois encapsulamentos corresponde às ligações da Figura 1. Confirme que o componente que vai usar é esse antes de o montar.

- **Fonte:** 
tc74.PDF / Package Type (Page 1) & TABLE 2-1
- **Resposta:** 
O sensor TC74 utilizado é o TO-220.
---

### Questão 2
> Estude cada um dos comandos suportados e verifique qual é a funcionalidade associada. Em seguida, execute o comando `i2cdetect` e verifique o resultado. Deve obter uma mensagem de erro a indicar que o barramento não foi inicializado.

- **Fonte:** 
lab_3_v1.0.pdf
- **Resposta:** 
Mensagem de erro inicial do i2cdetect:
"E (4251) i2ctools: I2C bus is not initialized. Please run 'i2cconfig' first"

Aplicar a configuração *i2c-tools> i2cconfig --sda 6 --scl 7*

Comandos - funcionalidade
i2cconfig - Configura a frequencia e IOs do barramento I2C
i2cdetect - Pesquisa por dispositivos no barramento I2C
i2cget - Lê os registos visiveís a partir do barramento I2C
i2cset - Define os registos visiveís a partir do barramento I2C
i2cdump - Examina os registos visiveís a partir do barramento I2C
---

### Questão 3
> O que pode concluir deste resultado?
> 
> a) Em que endereço está acessível o sensor de temperatura?  
> b) Com base na *Device Selection Table* da ficha técnica, que variante do TC74 está a utilizar?  
> c) A secção 3.1.2 indica o endereço que o TC74 tem por omissão de fábrica. É esse o endereço detetado? O que conclui?

#### a)
- **Fonte:** 
i2cdetect
- **Resposta:** 
Obtivemos *0x4d* como endereço do componente ao correr o comando *i2cdetect*

     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- 4d -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

#### b)
- **Fonte:** 
tc74.PDF / Device Selection Table (Page 2)
- **Resposta:** 
A variante que estamos a utilizar é: TC74A5-3.3VAT | TO-220-5 | 1001 101 (0x4d) | -40°C to +125°C

#### c)
- **Fonte:** 
tc74.PDF / 3.1.2 SMBUS SLAVE ADDRESS
- **Resposta:** 
O endereço pré-definido de fábrica é *1001 101b* (0x4d), que é exatamente a variante que estamos a utilizar.
---

### Questão 4
> Analisando a ficha técnica do sensor e a operação da ferramenta `i2c-tool`, execute o comando que lhe permita ler a temperatura ambiente instantânea. O resultado do comando deve conter a temperatura expressa em hexadecimal como ilustrado em seguida:
> ```text
> i2c-tools> <comando a usar>
> 0x19 <--- RESULTADO
> ```
> 
> Responda ainda às seguintes alíneas:
> 
> a) Com base no formato *Read Byte* da Figure 3-1, descreva a sequência completa de condições e bytes que o comando gera no barramento. Porque é que o endereço do sensor é transmitido duas vezes?  
> b) Com base na Table 3-2 e na secção 3.5, explique como são sinalizadas nas linhas SDA e SCL as condições de START e de STOP e a confirmação (ACK) de cada byte. Quem gera o impulso de relógio do ACK e quem força a linha SDA?

- **Comando utilizado:**
i2cget -c 0x4d -r 0x00 
- **Resultado obtido:** 
0x23

#### a)
- **Fonte:** 
tc74.PDF / *Read Byte* da Figure 3-1
- **Resposta:** 
Sequência de condições e bytes gerados no barramento:
START -> Address (Slave Address 7 bits) -> WR (bit 8 a '0') -> ACK -> Command (8 bits) -> ACK ->
-> START -> Address (Slave Address 7 bits) -> RD (bit 8 a '1') -> ACK -> DATA (8 bits) -> NACK -> STOP

Segundo o manual do sensor, o endereço do sensor é repetido duas vezes devido à alternancia entre write/read. A leitura começa com um write e ao chegar à leitura necessita do endereço outra vez 
"repeated due to change in dataflow direction."

#### b)
- **Fonte:** 
tc74.PDF / Table 3-2 & secção 3.5
- **Resposta:** 
A condição START é sinalizada quando o SDA passa por um falling edge enquanto o SCL está em HIGH.
A condição STOP é sinalizada quando o SDA passa por um rising edge enquanto o SCL está em HIGH.
A confirmação de cada byte (ACK) é feita pelo recetor lendo cada bit p/ciclo, durante a transmissão dos 8 bits. No nono ciclo do relógio o recetor coloca o SDA em LOW. Esta ação indica que a leitura dos 8 bits foi feita com sucesso.

Segundo a fonte: 
Master - "The device which controls the bus: initiating transfers (START), generating the clock, and terminating transfers. (STOP)"
"The Master provides the clock pulse for the ACK cycle."
---

### Questão 5
> Aqueça o sensor de temperatura soprando ar quente para o mesmo durante algum tempo. Repita o comando de leitura da temperatura e deverá observar pequenas alterações no valor lido.
> 
> a) Converta os valores lidos para graus Celsius com base nas Tables 4-3 e 4-4. Qual é a resolução da medida?  
> b) Que valor hexadecimal leria no registo de temperatura se o sensor estivesse a -25 °C? Justifique com a representação usada pelo registo.

#### a)
- **Fonte:** 
tc74.PDF / Tables 4-3 & 4-4
i2cget -c 0x4d -r 0x00
- **Valores lidos:**
0x2a 0x27 0x32 0x2f
- **Conversão / Resolução:** 
0x2a - 0010 1010 - 42ºC
0x27 - 0010 0111 - 39ºC
0x32 - 0011 0010 - 50ºC
0x2f - 0010 1111 - 47ºC

A resolução é [-65ºC, 127ºC] = [1011 1111, 0111 1111]

#### b)
- **Fonte:** 
tc74.PDF / Tables 4-3 & 4-4
- **Resposta e Justificação:** 
Na tabela 4.4 o valor -25ºC é 1110 0111, em hexadecimal fica: 0xE7, logo esse seria o valor lido pelo sensor.

---

### Questão 6
> Analise qual é o modo de funcionamento (standby/normal) do sensor TC74 lendo o respetivo *configuration register*. Deverá observar um resultado semelhante ao seguinte. Interprete-o bit a bit com base na Table 4-2, indicando a função e o valor de cada bit.
> ```text
> i2c-tools> <comando a usar>
> 0x40 <--- RESULTADO
> ```

- **Comando utilizado:** 
- **Fonte:** 
- **Interpretação bit a bit:** 

---

### Questão 7
> Coloque o sensor a operar no modo de standby, indicando o registo (Table 4-1) e o valor que escreve e justificando a escolha com a Table 4-2. Deverá observar o seguinte resultado:
> ```text
> i2c-tools> <comando a usar>
> I (157146) cmd_i2ctools: Write OK
> ```

- **Comando utilizado:** 
- **Registo e valor escrito:** 
- **Fonte:** 
- **Justificação:** 

---

### Questão 8
> Aqueça novamente o sensor de temperatura soprando ar quente para o mesmo durante algum tempo. Repita o comando de leitura da temperatura. O que observa? Explique o comportamento com base na secção 3.1.1 da ficha técnica. Com os valores típicos indicados na primeira página, compare o consumo do sensor em standby com o consumo em funcionamento normal.

- **Fonte:** 
- **Observações:** 
- **Explicação do comportamento:** 
- **Comparação de consumo:** 

---

## 4.2 I2C-TOOL: Comunicações I2C com múltiplos sensores

### Questão 9
> Antes de alimentar o circuito, consulte a ficha técnica do DHT20 e responda:
> 
> a) As ligações da Figura 2 respeitam a pinagem do sensor descrita na secção 5?  
> b) Segundo a secção 5.3, porque é que as linhas SDA e SCL precisam de resistências de pull-up externas?  
> c) A secção 4.6 recomenda um componente adicional que não aparece na Figura 2. Qual é o componente e onde deve ser colocado?

#### a)
- **Fonte:** 
- **Resposta:** 

#### b)
- **Fonte:** 
- **Resposta:** 

#### c)
- **Fonte:** 
- **Resposta:** 

---

### Questão 10
> Os dois sensores estão ligados às mesmas linhas SDA e SCL. Como é que o mestre consegue dirigir-se a cada um deles sem interferir com o outro?

- **Fonte:** 
- **Resposta:** 

---

### Questão 11
> Analise a secção 7 da ficha técnica do sensor DHT20 e explique como realizar uma leitura da temperatura e da humidade, respondendo às alíneas seguintes:
> 
> a) Quanto tempo deve esperar depois de ligar o sensor antes de comunicar com ele?  
> b) Qual é o primeiro byte transmitido após o START numa leitura do sensor, e como se obtém a partir do endereço de 7 bits?  
> c) Que verificação se faz ao byte de estado depois de ligar o sensor? O que significa o bit 3 desse byte (Table 9)?  
> d) Que bytes se enviam ao sensor para desencadear uma medição?  
> e) Como sabe o anfitrião que a medição terminou e que os dados podem ser lidos?  
> f) Quantos bytes se leem a seguir e como se distribuem por eles os 20 bits de humidade e os 20 bits de temperatura?  
> g) O que deve fazer o anfitrião no fim da leitura se não precisar de verificar o CRC?

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

### Questão 12
> Antes de usar o sensor, aplique as fórmulas da secção 8 à leitura de exemplo seguinte, composta pelo byte de estado, pelos cinco bytes de dados e pelo CRC:  
> `0x18 0xB2 0x33 0xA5 0xCE 0xD9 0xC9`  
> Que valores de humidade relativa e de temperatura obtém? Com que resolução é medida cada grandeza (secção 2)?

- **Fonte:** 
- **Cálculo da Humidade Relativa (%RH):** 
- **Cálculo da Temperatura (°C):** 
- **Resolução de cada grandeza:** 

#### Leitura prática com i2cset / i2cget
> *Em seguida, tirando partido dos comandos `i2cset` e `i2cget`, faça uma leitura da temperatura e humidade. Converta o resultado de modo a obter as respetivas temperatura e humidade.*

- **Comandos executados:** 
- **Valores brutos obtidos:** 
- **Valores convertidos (Temperatura e Humidade):** 

---

## 4.3 Integração de sensores I2C

### Questão 13
> Estude a API de referência do I2C, particularmente a componente de alocação e libertação de recursos. Verifique como é lido um registo.

- **Fonte:** 
- **Resposta:** 

---

### Questão 14
> Estude e complete o código fornecido no ficheiro `tc74_test.c` (modificando os valores `TBD`) de modo a compatibilizá-lo com o sensor TC74, e responda às alíneas seguintes:
> 
> a) Justifique cada valor `TBD` com a respetiva fonte: os GPIO com a configuração usada no `i2c-tools`, a frequência com a tabela *Serial Port AC Timing* da ficha técnica, o endereço com o resultado do `i2cdetect` e os registos com a Table 4-1.  
> b) Porque é que o valor lido do registo de temperatura é convertido para `int8_t` antes de ser impresso? O que aconteceria às temperaturas negativas sem esta conversão?  
> c) Depois de retirar o sensor do modo de standby, o código espera 200 ms. Compare este valor com a taxa de conversão nominal e com as notas das características elétricas do TC74. Parece-lhe suficiente?

#### a)
- **Justificação dos valores TBD e respetivas fontes:**
  - `I2C_MASTER_SCL_IO`: 
  - `I2C_MASTER_SDA_IO`: 
  - `I2C_MASTER_FREQ_HZ`: 
  - `TC74_ADDR`: 
  - `TC74_REG_TEMP`: 
  - `TC74_REG_CONFIG`: 

#### b)
- **Fonte:** 
- **Resposta:** 

#### c)
- **Fonte:** 
- **Resposta:** 

---

### Questão 15
> Partindo do código fornecido, realize as alterações necessárias a compatibilizá-lo com a realização de leituras do sensor DHT20, seguindo a sequência que descreveu na Questão 11. Mantenha o intervalo de 2 segundos entre leituras e explique, com base na secção 4.4 da ficha técnica do DHT20, porque não convém ler o sensor com maior frequência. Teste o código e aqueça o sensor, confirmando que o resultado é semelhante ao seguinte:
> ```text
> I (8453) DHT20: Temperatura: 22.60 C, Humidade: 69.61 %
> I (10493) DHT20: Temperatura: 22.61 C, Humidade: 69.64 %
> ...
> ```

- **Fonte:** 
- **Explicação (intervalo entre leituras / auto-aquecimento):** 
- **Resultados obtidos / Logs de teste:** 

> 🇵🇹 Português | [🇺🇸 English](README.en.md) 

> ⚠️ **Aviso:** Este projeto pode conter erros.

# Mini-Projecto: Sistema de Controlo de Acesso via Tons

**Unidade Curricular:** Sensores e Sinais (2025-2026)
**Instituição:** Universidade de Aveiro, Departamento de Eletrónica, Telecomunicações e Informática

## Descrição do Projeto
Este projeto consiste no desenvolvimento de um sistema de detecção de tons utilizando um microcontrolador ESP32C6 e um microfone analógico. O objectivo final é descodificar sons gerados e.g. por um telefone ou por um PC e utilizá-los como input para uma aplicação prática, no caso a simulação de um sistema de controlo de acessos. 

O sistema faz ponte entre os conceitos teóricos (sinais, espectro, filtros) e a sua aplicação em sistemas embebidos e informáticos gerais, baseando-se no conceito de "in-band-signaling" (tipo DTMF).

## Hardware Utilizado e Ligações
Para o correto funcionamento do sistema, as ligações de hardware devem respeitar a seguinte configuração:
* **Microcontrolador:** ESP32C6
* **Microfone Analógico:** SPW2430 ligado à entrada `ADC_CHANNEL_3`.
* **Atuador (Porta emulada):** O LED ligado ao `GPIO11`.

## Funcionamento do Sistema
O controlo de acessos baseia-se no processamento de áudio em tempo real e na deteção de padrões de símbolos:
* O sistema deve detectar uma sequência de 4 símbolos ("0", "1" ou "2").
* As sequências são escolhidas pelos alunos e correspondem aos comandos de "abrir" e "fechar" uma porta.
* A porta é emulada por um LED (ligado-aberta, desligado-fechada).
* A detecção de uma sequência errada é sinalizada pelo LED a piscar durante 5 segundos.

### Processamento de Sinal
* A detecção é feita por meio da aplicação de filtros FIR.
* A única função específica da biblioteca de DSP da EspressIF-IDF que pode ser usada é a de convolução (`dsps_conv_f32`).
* O fluxo base do firmware configura a ADC, descodifica as frames geradas por esta e coloca as amostras de som adquiridas num FIFO.
* Uma tarefa lê o FIFO e é activada sempre que este tenha dados novos. O código a desenvolver pelos alunos deverá ser colocado dentro desta tarefa.

## Configuração de Frequências
As frequências correspondentes a cada algarismo devem ser calculadas da seguinte forma:
* **Frequência "0":** número da turma multiplicado por 500 Hz.
* **Frequência "1":** frequência do "0" adicionada de 700 e da soma módulo 10 dos algarismos que compõem os números mecanográficos dos alunos do grupo multiplicada por 20.
* **Frequência "2":** frequência do "1" adicionada de 700 e da soma módulo 10 dos algarismos que compõem os números mecanográficos dos alunos do grupo multiplicada por 20.

**Valores do Grupo:**
* Turma: `P1`
* NMECs: `120152` e `126323`
* Frequência "0": `500 Hz`
* Frequência "1": `1360 Hz`
* Frequência "2": `2220 Hz`

## Sequências de Acesso
* **Comando para ABRIR:** `1200`
* **Comando para FECHAR:** `2011`

## Como Compilar e Executar
1. Deverá ser possível descompactar o ficheiro "zip" e fazer o build do código em qualquer PC que tenha a toolchain instalada.
2. Navegue até à diretoria do projeto no terminal.
3. Execute `idf.py build` para compilar o código.
4. Execute `idf.py -p [PORTA] flash monitor` para carregar o firmware para o ESP32 e abrir o monitor série.

## Autores
* `Tiago Pita` - NMec: `120152`
* `Martin Pereirinha` - NMec: `126323`
* **Turma:** `P1` | **Grupo:** `[Grupo]`

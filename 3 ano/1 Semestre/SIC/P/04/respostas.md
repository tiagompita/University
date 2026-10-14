# Respostas - Guião 4: Cryptographic Hash Functions (or Digest Functions)

---

## 2. Cryptographic hash functions

#### Questão 1
> Note: the command echo is used here with -n as argument. Can you explain why?

- **Resposta:**
Ao ler o manual do comando echo, verifiquei que o argumento -n remove o "\n" do final do output. Acredito que a razao pela qual o professor colocou -n no echo seria para que o comandos das funções hash apenas produzirem a cifra excluindo o "\n".
---

#### Questão 2
> Does the number in command's name have any relation to the number of characters that are printed out?

- **Resposta:**
Para a frase: "You should ONLY use this if you're 100% absolutely sure that you know what you're doing"
As cifragens:
md5sum      - 196d93f803fefe9ea005512fc2f3f1d3
sha256sum   - 840183e6c7d1229687e4763b837260c8d018c3a57d39c2173f5847e2327dda5f
sha384sum   - 80fbd7e162781bec67c76ad6d13e5edb5e63af740d405a6b614d67d120d984cfd0c2ed94971ad0d91e80fd3f6236d9a1
sha512sum   - 419013c1996827918de6a65687c2b52c4ee98a76c8553da48e1de5d45d0ba319ee3cab0380b173fe16985f392788405f28bca087011917b08e5176df778ed1ad

Respondendo à pergunta: Visualmente, sim, o numero no comando da funçao hash influencia o tamanho do output.
Porque?
As funções hash produzem sempre um tamanho fixo, denominadas por digest ou hash. Estes comandos usados neste exercício mostram sempre o seu output em hexadecimal.

A base hexadecimal tem 16 simbolos possiveis, (2^4 = 16) ou seja, são necessários 4 bits para representar um unico caracter hexadecimal.
Ora com isto em mente, pegando por exemplo no output da sha256sum, tem 64 carateres. 64*4 = 256 daí os sha256

No caso da funçao md5sum, apenas temos 32 carateres: 32*4 = 128. A funçao md5sum produz um digest de 128 bits.
---

#### Questão 3
> Given that cryptographic hash functions generate a relatively short output for an input of any size, how can these functions be used to circumvent text size restrictions enforced by services like X (a.k.a. Twitter)?

- **Resposta:**
Como o X tem um limite de carateres, é impossível colocar lá um texto de 10 páginas. Logo, a única forma de alguém ler esse texto é ele estar alojado fora do X. Uma figura pública ou uma entidade oficial, por exemplo, se quiser publicar um comunicado muito importante de 5 páginas coloca o PDF/texto num site externo e publica no X apenas o link.

A maneira como a pessoa pode assegurar que o seu texto nao é modificado é colocar no fim do texto a hash do seu conteudo original, ou seja, se o texto for modificado por um atacante ou quiser provar que os seus dados nao foram alterados, pode comparar com a hash original.
Depois a pessoa ao partilha o link do site pode tambem partilhar a hash, desde que a sua conta no X nao seja comprometida, ninguem consegue alterar o seu tweet. Assim qualquer pessoa pode comparar o texto do link com a hash partilha e verificar se coincide.
---

### 2.1 Avalanche effect

#### Questão 1
> Choose one of the aforementioned commands, choose a sentence and produce its hash. Change a single bit in the sentence and produce a new hash. Compare the two outputs and take conclusions. Repeat the procedure for different commands and multiple pairs of sentences.

- **Resposta:**
Comando: sha256sum
Frase: "Aula prática de SIC 04"
Hash: 00726da303f42ec81b52f036e081387f02e019fc6aeb05b0ef34ae4937857340

Frase Modificada: "Aula prática de SiC 04"
Hash: efbb70d663317d89fc086ed47df05624e551a48ccbcd8bdbca741f1d1346ca3c


---

### 2.2 Statistical analysis of avalanche effect

#### Questão 1
> Comment the distribution of the differences (Hamming distance, in bits) that you obtained.
- **Resposta:**
No MD5: O hash tem um tamanho total de 128 bits. o pico acontece nos 64 bits
No SHA-1: O hash tem um tamanho total de 160 bits. o pico acontece nos 80 bits 
No SHA-256: O hash tem um tamanho total de 256 bits. o pico acontece nos 128 bits 

O efeito de avalanche é um requisito criptográfico essencial. Uma boa função de hash deve comportar-se, do ponto de vista estatístico, como um gerador puramente aleatório (pseudo-random).

O beneficio de ter uma funçao com este efeito impossibilita a atacantes de descobrir a o "segredo". Pois se forem por tentativa e erro a hash é completamente diferente, ou seja, se o segredo for "ola" e eu tentar uma hash de um segredo "ula" a hash é completamente diferente. Se nao houvesse este efeito a hash denunciaria similaridade com a hash do segredo "ola".

Isto permite eliminar correlaçoes.
---

#### Questão 2
> Repeat the process by changing a byte at once. Compare the results.

- **Resposta:**
comando: ./avalanche-analysis 1024 512 SHA-256

**Change bit:**
```text
  35 +---------------------------------------------------------------------+   
     |           +          +      *    +           +          +           |   
     |                             *                 '-' using 1:2 ******* |   
  30 |-+                           *                                     +-|   
     |                             *                                       |   
     |                            ****                                     |   
  25 |-+                         *****                                   +-|   
     |                           *****                                     |   
     |                           *****                                     |   
  20 |-+                         *****                                   +-|   
     |                           *****                                     |   
  15 |-+                         *****                                   +-|   
     |                           *****                                     |   
     |                          ******                                     |   
  10 |-+                        ******                                   +-|   
     |                          *******                                    |   
     |                         **********                                  |   
   5 |-+                       **********                                +-|   
     |                         **********                                  |   
     |           +          +************           +          +           |   
   0 +---------------------------------------------------------------------+   
     0           50        100         150         200        250         300 
```

**Change Byte:**
```text
  45 +---------------------------------------------------------------------+   
     |           +          +      *    +           +          +           |   
  40 |-+                           *                 '-' using 1:2 *******-|   
     |                             *                                       |   
  35 |-+                           *                                     +-|   
     |                             *                                       |   
     |                             *                                       |   
  30 |-+                           *                                     +-|   
     |                             *                                       |   
  25 |-+                          ***                                    +-|   
     |                            ***                                      |   
  20 |-+                         *****                                   +-|   
     |                           *****                                     |   
  15 |-+                         *****                                   +-|   
     |                           ******                                    |   
     |                           ******                                    |   
  10 |-+                        *******                                  +-|   
     |                         ********                                    |   
   5 |-+                       ********                                  +-|   
     |           +          + ***********           +          +           |   
   0 +---------------------------------------------------------------------+   
     0           50        100         150         200        250         300  
```


A média de bits alterados no hash final continua a ser exatamente 128 bits. O efeito avalanche é tão poderoso que basta alterar 1 único bit para causar a perturbação máxima possível. Alterar 1 byte, 10 bytes ou 1000 bytes na entrada não faz o hash mudar "mais", porque o hash já estava no limite máximo de aleatoriedade
---

### 2.3 Proof-of-work

#### Questão 1
> What is the best strategy to create a sentence that includes your student number and has a sha256 that starts with 3 hexadecimal 0's?

- **Resposta:**
As funçoes hash são one-way, ou seja, é matematicamente impossível "andar para trás" a partir de um hash para descobrir que texto o gera. A única forma no universo de resolver este problema é por tentativa e erro (brute force).

A melhor estratégia é criar um script que teste diferentes numeros que obtenham 000 no inicio da hash. Usando a frase exemplo: "My student number is 1234 and I tend to introduce a bug for every 2469 lines of code I write!" - Trocar o numero 2469 até obter outros numeros que geram com o mesmo inicio de hash.

---

#### Questão 2
> Follow that strategy and find a solution for that cryptopuzzle, counting the number of attempts until finding one. Then, do the same for other student numbers, and compute the average of the number of attempts.

- **Resposta:**
Cada carater hexadecimal tem 16 possibilidades. A possibilidade de ser 0 é 1/16 para que os 3 primeiros carateres sejam 0 a probabilidade fica a : 1/16 * 1/16 * 1/16 = 1 / 4096
São esperadas, em média, cerca de 4096 tentativas para encontrar uma solução...

Graças ao script PoW.py é possível confirmar esta teoria. Quantas mais vezes é testado, a média de tentativas aproxima-se muito do valor 4096.

Correndo o script *n* vezes:
n = 10    Média: 3465.4
n = 100   Média: 4349.08
n = 1000  Média: 4222.306
---

#### Questão 3
> Given the birthday paradox, does that average value match the expectations? Explain why.

- **Resposta:**
Paradoxo do Aniversário (O problema das colisões) consiste na questão: "Numa sala, qual é a probabilidade de existirem duas pessoas quaisquer que façam anos no mesmo dia?" ao que é respondido 23. Basta haver cerca de 23 pessoas para a probabilidade ser >50%

Porquê? Porque estamos a comparar todos contra todos (qualquer par de pessoas serve). A complexidade cai para a raiz quadrada de N pessoas

Se o paradoxo se aplicasse ao nosso exercício, esperaríamos apenas $\sqrt{4096}$ ≈ 64

Agora imaginemos no contexto do problema do alvo fixo (o nosso Proof-of-Work) onde numa sala é feita a pergunta: "Quem é que aqui faz anos no mesmo dia que eu (ex.: 25 de Dezembro)?"
Aqui estou a fixar uma data exata. O paradoxo do aniversário já não funciona, pois o alvo está fixado desde inicio e em média, teria de perguntar a 365 pessoas essa pergunta.

Respondendo diretamente à pergunta: Sim o valor corresponde com as expectativas do proof-of-work. 
- **Porquê?** Porque no *proof-of-work* não estamos à procura de uma colisão entre duas mensagens arbitrárias. Estamos à procura de uma mensagem cuja saída cumpra uma condição / alvo pré-fixado (começar por `000`). Isto é um problema de resistência à pré-imagem (onde a complexidade é $2^n$, ou seja, $16^3 = 4096$), e não de resistência a colisões (onde se aplicaria o ataque do aniversário com complexidade $\sqrt{2^k} = 2^{k/2} = 64$).
---


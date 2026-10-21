# Preparação para o Teste Prático - SIC (Aulas Práticas 01 a 04)

> **Como usar este guia de estudo:**
> Este ficheiro reúne as perguntas essenciais que pediste, questões adicionais estratégicas das aulas **P01 a P04** e um guia focado na pergunta de **completar código** (baseado nos exercícios obrigatórios resolvidos em aula).
> Para consolidar a matéria de forma ativa, lê as **Notas Teóricas e Pistas** de cada tópico e preenche o espaço **`A minha resposta:`** pelas tuas próprias palavras.

---

## Parte 1: Perguntas Base

### 1. O que é o D-Bus?
- **Fontes nos materiais:** [P01-Bluetooth-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/01/P01-Bluetooth-en.pdf) (Slides 41–42) e [lab-bluetooth.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/lab-bluetooth.pdf) (Secções 1, 3 e 9).
- **Resumo Conceitual:**
  - É um mecanismo de **IPC (*Inter-Process Communication*)** orientado a mensagens e barramento (*bus*) usado em sistemas Linux.
  - Permite que diferentes processos e *daemons* do sistema comuniquem entre si de forma estruturada. Divide-se tipicamente no **System Bus** (para serviços do sistema, como o `bluetoothd`) e no **Session Bus** (para aplicações da sessão do utilizador).
  - Expõe funcionalidades através de **Objetos** (identificados por um *Object Path*, ex.: `/org/bluez/hci0`), que implementam **Interfaces** (ex.: `org.bluez.Adapter1`, `org.bluez.Device1`, `org.freedesktop.DBus.Properties`), as quais disponibilizam:
    1. **Métodos** (invocados síncrona ou assincronamente, ex.: `StartDiscovery`, `Connect`, `Get`, `Set`);
    2. **Sinais / Eventos** (notificações assíncronas subscritas por interessados, ex.: `InterfacesAdded`, `PropertiesChanged`);
    3. **Propriedades** (estado dos objetos, ex.: `Alias`, `Paired`, `Connected`, `ServicesResolved`).
- **Pergunta Orientadora:** Na aula P02, porque é que os nossos programas em C não comunicam diretamente com a placa de hardware Bluetooth e usam o barramento `G_BUS_TYPE_SYSTEM` do D-Bus?
- **A minha resposta:**
  > O D-Bus é um mecanismo IPC (Inter-Process Communication). Os programas em C comunicam com o bluetoothd através do SystemBus. O D-Bus é responsável por expor, através de objetos, que implementam interfaces, métodos, sinais / eventos e propriedades.

---

### 2. O que é o BlueZ?
- **Fontes nos materiais:** [P01-Bluetooth-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/01/P01-Bluetooth-en.pdf) (Slides 28–33) e [lab-bluetooth.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/lab-bluetooth.pdf) (Secção 1).
- **Resumo Conceitual:**
  - É a implementação oficial da **pilha protocolar Bluetooth (*Bluetooth protocol stack*) para Linux**.
  - É composta por:
    - **Módulos de Kernel** (ex.: `bluetooth`, `btusb`, `btintel`, `rfkill`, `ecdh_generic`) que implementam as camadas de mais baixo nível junto ao controlador (HCI, L2CAP, RFCOMM, BNEP);
    - **O *daemon* em espaço de utilizador (`bluetoothd`)**, que gere todos os adaptadores locais e dispositivos remotos;
    - **Utilitários de gestão de alto nível** (como o `bluetoothctl`) e uma **API D-Bus** (serviço `org.bluez`) para que aplicações (como os programas em C da P02) possam interagir programaticamente com o Bluetooth.
- **Pergunta Orientadora:** Qual é a relação entre uma aplicação em C (que usa a biblioteca GIO/GLib), o *daemon* `bluetoothd` e o D-Bus? Onde é que o BlueZ guarda em disco os dados de *cache* e de *bonding*?
- **A minha resposta:**
  > O BlueZ é a protocol stack oficial de Bluetooth para o Linux. É composta por módulos kernel, pelo daemon bluetoothd, que gere todos os adaptadores e dispositivos, utilitários como o bluetoothctl e uma API D-bus que permite a interação de programas com o Bluetooth.

---

### 3. O que é o GATT?
- **Fontes nos materiais:** [P01-Bluetooth-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/01/P01-Bluetooth-en.pdf) (Slides 16, 19, 21, 33, 39–40) e [lab-bluetooth.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/lab-bluetooth.pdf) (Secção 6.2).
- **Resumo Conceitual:**
  - **GATT (*Generic Attribute Profile*)** é a camada/perfil da pilha **BLE (*Bluetooth Low Energy*)** que define a *framework* de serviços e especifica como os dados são organizados e transferidos entre dois dispositivos ligados.
  - Funciona no topo do protocolo **ATT (*Attribute Protocol*)** (que expõe atributos individuais) e organiza os dados numa **estrutura hierárquica**:
    - **Device / Profile** $\rightarrow$ contém **Services** (serviços identificados por um UUID de 128 bits, ex.: *Heart Rate Service*, *Generic Access*) $\rightarrow$ cada Serviço contém **Characteristics** (pontos de dados concretos com valor e permissões de leitura/escrita/notificação) $\rightarrow$ cada Característica pode ter **Descriptors** (metadados ou configuração).
- **Pergunta Orientadora:** Na pilha BLE, qual é a diferença de responsabilidades entre o **GAP (*Generic Access Profile*)** e o **GATT (*Generic Attribute Profile*)**?
- **A minha resposta:**
  > O GATT pertence à stack do Bluetooth Low Energy, é responsável por definir a framework de serviços e especifica como os dados são organizados e transferidos entre dois dispositivos. Responsável por organizar os atributos numa hierarquia identificada por UUIDs de 128 bits.
Na stack BLE a diferença entre o GAP e GATT reside nas suas responsabilidades. O GAP trata da descoberta, adversiting, scanning e estabelecimento de ligações enquanto o GATT define como os dados são organizados e transferidos.

---

### 4. Qual é o tamanho do output das funções de hash (digest)?
- **Fontes nos materiais:** [3.1-Digest_functions-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/TP/3.1-Digest_functions-en.pdf) (Slide 4) e [lab-crypto-hash-functions.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/04/lab-crypto-hash-functions.pdf) (Secção 2).
- **Resumo Conceitual:**
  - Uma função de *digest* (ou *hash* criptográfica) recebe uma entrada de tamanho arbitrário e produz sempre um *output* de **tamanho fixo**.
  - **Regra de conversão fundamental:**
    - $1 \text{ Byte} = 8 \text{ bits}$
    - $1 \text{ Carácter Hexadecimal} = 4 \text{ bits}$ (porque $2^4 = 16$ símbolos possíveis: `0`–`9`, `a`–`f`).
    - Logo: $\text{N.º de caracteres Hex} = \frac{\text{N.º de bits}}{4}$ e $\text{N.º de Bytes} = \frac{\text{N.º de bits}}{8}$.

| Função de Hash | Tamanho em Bits | Tamanho em Bytes | Caracteres em Hexadecimal | Estado de Segurança (Colisões) |
| :--- | :---: | :---: | :---: | :--- |
| **MD4 / MD5** | 128 bits | 16 bytes | 32 caracteres hex | Inseguro (colisões triviais) |
| **SHA-1** | 160 bits | 20 bytes | 40 caracteres hex | Inseguro (colisões desde 2017) |
| **SHA-224 / SHA3-224** | 224 bits | 28 bytes | 56 caracteres hex | Seguro |
| **SHA-256 / SHA3-256** | 256 bits | 32 bytes | 64 caracteres hex | Seguro |
| **SHA-384 / SHA3-384** | 384 bits | 48 bytes | 96 caracteres hex | Seguro |
| **SHA-512 / SHA3-512** | 512 bits | 64 bytes | 128 caracteres hex | Seguro |

- **Pergunta Orientadora:** Se no código C da P04 (`avalanche-analysis.c`) a função `EVP_MD_get_size(EVP_sha256())` devolver o tamanho do *digest*, que valor inteiro devolve (32, 64 ou 256)? Porquê?
- **A minha resposta:**
  > O valor inteiro devolvido é em bytes, como é a funçao SHA-256, devolverá 32 bytes ( 256 / 8 ).

---

### 5. O que é o DNS e o que ele faz?
- **Fontes nos materiais:** [lab-network.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/03/lab-network.pdf) (Secções 4 e 5).
- **Resumo Conceitual:**
  - O **DNS (*Domain Name System*)** é um sistema de nomes hierárquico e distribuído para redes IP (como a Internet ou uma LAN).
  - **O que faz:** Traduz (resolve) nomes de domínio legíveis por humanos (ex.: `services.web.ua.pt`) nos respetivos endereços IP numéricos (ex.: `192.168.2.103`), necessários para o encaminhamento de pacotes na camada de rede.
  - Para melhorar o desempenho e reduzir tráfego, os clientes e *resolvers* locais guardam as respostas em **cache** durante um tempo de vida (*TTL - Time To Live*).
- **Pergunta Orientadora:** No Caso 2 da aula P03, porque é que após alterarmos a configuração do DNS no *gateway* o cliente podia continuar a aceder ao servidor verdadeiro, sendo necessário executar `resolvectl flush-caches`?
- **A minha resposta:**
  > O DNS é responsável por tornar "legivel" IPs, por assim dizer. Ele pega num dominio legivel por pessoas como ua.pt e traduz para o endereço IP para onde ua.pt está registado.

---

### 6. O que é que o `dnsmasq` faz?
- **Fontes nos materiais:** [lab-network.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/03/lab-network.pdf) (Secções 2.2 e 4, páginas 4 e 7).
- **Resumo Conceitual:**
  - O **`dnsmasq`** é um serviço (*daemon*) leve muito comum em *gateways*/routers domésticos e SOHO (ex.: OpenWRT, DD-WRT) que combina principalmente duas funções na rede local:
    1. **Servidor DHCP (*Dynamic Host Configuration Protocol*):** Atribui automaticamente endereços IPv4 (dentro de um `dhcp-range` ou estaticamente por nome/MAC via `dhcp-host`), máscara de rede, *default gateway* e servidor DNS aos novos dispositivos que se ligam à LAN.
    2. ***DNS Forwarder* (Encaminhador e Cache de DNS):** Recebe pedidos de resolução DNS dos clientes da LAN, responde diretamente se tiver o registo em cache ou em configuração local, ou reencaminha o pedido para servidores DNS *upstream* (na WAN/Internet).
  - **Na aula P03 (Caso 2):** Como o atacante tinha controlo administrativo sobre a infraestrutura de rede (*gateway*), usou a diretiva `address=/services.web.ua.pt/192.168.2.103` no `/etc/dnsmasq.conf` para forçar o `dnsmasq` a resolver um domínio legítimo para o IP do `fakeserver`.
- **Pergunta Orientadora:** Qual é a diferença, em termos de modelo de ameaça (*threat model*), entre um ataque feito através da configuração do `dnsmasq` no *gateway* e um ataque feito a partir da máquina `mrrobot`?
- **A minha resposta:**
  > É um serviço muito usado em gateways/routers domésticos que atua simultaneamente como Servidor DHCP (atribuindo IPs automaticamente aos hosts da LAN) e como DNS Forwarder (encaminhando e fazendo cache de pedidos DNS para a rede local).


---

### 7. O que é que o `dnsspoof` (DNS Spoofing) faz?
- **Fontes nos materiais:** [lab-network.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/03/lab-network.pdf) (Secção 5, página 7).
- **Resumo Conceitual:**
  - O **DNS Spoofing** (implementado pela ferramenta `dnsspoof` da suite `dsniff`) é um ataque em que um atacante na rede local — **sem ter controlo sobre o servidor DNS ou o *gateway*** — interceta pedidos de resolução DNS de uma vítima e injeta **respostas DNS falsificadas (*forged replies*)** associando um nome de domínio legítimo ao endereço IP de uma máquina controlada pelo atacante (ex.: `fakeserver`).
  - **Como funciona na prática:**
    1. O atacante posiciona-se tipicamente em **Man-in-the-Middle (MitM)** na camada de ligação de dados (usando **ARP Spoofing** com `arpspoof`) ou escuta o tráfego na LAN.
    2. Quando deteta um pedido DNS (UDP porto 53) da vítima para o domínio alvo, o `dnsspoof` constrói e envia imediatamente uma resposta DNS falsificada (copiando o *Transaction ID* e os portos UDP do pedido original).
    3. **Condição de Corrida (*Race Condition*):** O cliente aceita a **primeira** resposta DNS válida que lhe chegar e ignora as seguintes. É por isso que o guião P03 refere que explorar um servidor DNS local (no próprio *gateway*) é difícil com `dnsspoof` (porque o *gateway* está na LAN e responde quase instantaneamente), sendo mais fácil quando o cliente usa um servidor DNS remoto (maior latência).
- **Pergunta Orientadora:** Porque é que o protocolo DNS clássico (sobre UDP no porto 53) permite que o cliente aceite a resposta do `dnsspoof` como se viesse do servidor DNS verdadeiro?
- **A minha resposta:**
  > É uma ferramenta de ataque usada quando o atacante não controla o servidor DNS/gateway, sendo apenas outro utilizador na LAN. O atacante interceta o pedido DNS da vítima (normalmente após fazer ARP Spoofing com arpspoof para se colocar em Man-in-the-Middle) e falsifica uma resposta DNS UDP antes de o servidor DNS verdadeiro responder.

---

## Parte 2: Perguntas Adicionais de Preparação (Aulas Práticas 01 a 04)

### Aula P01 & P02 — Bluetooth, BlueZ e D-Bus

#### 8. Qual é a diferença entre *Pairing* e *Bonding* no Bluetooth? E porque é que a ligação cai e é restabelecida após o *Bonding*?
- **Fontes:** [P01-Bluetooth-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/01/P01-Bluetooth-en.pdf) (Slides 14, 36–39).
- **Pista Teórica:**
  - **Pairing:** Processo de estabelecer confiança trocando chaves temporárias/de sessão e ativando a cifra na ligação atual.
  - **Bonding:** Ato de **guardar de forma persistente** as chaves criadas durante o *pairing* (ex.: `LinkKey` guardada em `/var/lib/bluetooth/[MAC local]/[MAC remoto]/info`) para permitir futuras reconexões automáticas sem repetir o *pairing*.
  - No Slide 37 da P01 vemos que, após o *pairing* e *bonding*, a ligação é terminada e reiniciada usando as chaves de *bonding* para autenticar mutuamente os dispositivos.
- **A minha resposta:**
  > Pairing é o ato onde ocorre a troca de chaves temporárias e ativaçao da cifra na ligaçao.
Bonding é o ato de guardar as chaves criadas durante o pairing, permitindo em reconexoes futuras automáticas sem precisar de realizar o Pairing.

#### 9. Quais são os 4 métodos de *Pairing* no Bluetooth e quais deles protegem contra ataques *Man-in-the-Middle* (MitM)?
- **Fontes:** [P01-Bluetooth-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/01/P01-Bluetooth-en.pdf) (Slides 24–26) e [lab-bluetooth.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/lab-bluetooth.pdf) (Secção 8).
- **Pista Teórica:**
  1. **Just Works:** Sem autenticação e **sem proteção contra MitM** (usado em dispositivos sem interface, capacidade `NoInputNoOutput`).
  2. **Passkey Entry:** Um dispositivo mostra um código de 6 dígitos e o utilizador introdu-lo no outro (**com proteção MitM**).
  3. **Numeric Comparison:** Ambos os ecrãs mostram um número de 6 dígitos e o utilizador confirma se coincidem (**com proteção MitM** — método `RequestConfirmation` no `Agent1`).
  4. **Out-of-Band (OOB):** Troca de informação criptográfica por canal secundário como NFC (**o mais seguro, com proteção MitM**).
- **Pergunta Orientadora:** No exercício 8 da P02 (`just_works_agent.c`), porque é que aceitar automaticamente o método `RequestConfirmation` no código C anula a proteção MitM do *Numeric Comparison*?
- **A minha resposta:**
  > A resposta está dada em cima: os 4 métodos são Just Works, Passkey Entry, Numeric Comparison e Out-of-Band.
  Apenas o Just Works, nao tem proteção contra MitM.

#### 10. Como funcionam os Endereços MAC no Bluetooth (Public vs. Random: Static, RPA, NRPA) e que implicações têm na privacidade?
- **Fontes:** [P01-Bluetooth-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/01/P01-Bluetooth-en.pdf) (Slide 11) e [lab-bluetooth.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/lab-bluetooth.pdf) (Secção 10.1).
- **Pista Teórica:**
  - Os endereços têm 48 bits. Os 2 bits mais significativos (bits 47 e 46) indicam o tipo:
    - `11` **Public:** Fixo e único globalmente (permite *tracking* físico do utilizador ao longo do tempo).
    - `10` **Static Random:** Gerado aleatoriamente, mantido durante o ciclo de energia (*power cycle*).
    - `01` **Resolvable Private Address (RPA):** Dinâmico (regenerado frequentemente), mas dispositivos que já tenham feito *bonding* conseguem reconhecê-lo em privado (usando uma *Identity Resolving Key*).
    - `00` **Non-Resolvable Private Address (NRPA):** Dinâmico e totalmente privado (ninguém o consegue associar a uma identidade anterior).
- **A minha resposta:**
  > Os endereços MAC servem para identificar o dispositivo. Existem 4 tipos de endereço MAC: Public (Fixo e unico globalmente), Static Random (Gerado aleatoriamente na sessao atual), RPA (regenerado frequentemente, dispositivos com bonding conseguem reconhecer em privado), NRPA (Dinamico e totalmente privado, impossivel saber o que ou quem era no "passado")

#### 11. Na programação D-Bus em C (P02), porque é que `scan-services.c` usa uma ligação assíncrona (`g_dbus_proxy_call`) em vez de síncrona (`connect_device`), e para que serve a propriedade `ServicesResolved`?
- **Fontes:** [lab-bluetooth.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/lab-bluetooth.pdf) (Secções 6.1, 6.3 e 6.6).
- **Pista Teórica:**
  - A tentativa de ligação (`Connect`) é disparada dentro do *callback* `on_interfaces_added()`. Se fosse síncrona, bloquearia a *thread* do `GMainLoop` durante até 30 segundos à espera do rádio Bluetooth, impedindo o programa de processar outros sinais D-Bus.
  - Além disso, estar ligado (`Connected = true`) **não** significa que o BlueZ já tenha descoberto todos os serviços GATT do dispositivo remoto! Só quando a propriedade booleana `ServicesResolved` passa a `true` (notificada via `PropertiesChanged`) é que a lista de UUIDs está completa e podemos cancelar a subscrição (`g_dbus_connection_signal_unsubscribe`).
- **A minha resposta:**
  > Scan-services tem de usar uma ligaçao assincrona, pois no caso contrario, o GMainLoop ficaria bloqueado à espera do sinal Bluetooth e todos os outros sinais no D-Bus ficariam impedidos de serem processados.

---

### Aula P03 — Vulnerabilidades em Redes Locais (ARP, ICMP, NAT, DNS)

#### 12. Como funciona o ataque de *ARP Spoofing* (`arpspoof`) no Caso 1 da P03 e porque é necessário executá-lo nos dois sentidos?
- **Fontes:** [lab-network.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/03/lab-network.pdf) (Secção 3, páginas 5 e 6).
- **Pista Teórica:**
  - O protocolo **ARP (*Address Resolution Protocol*)** traduz endereços IPv4 em endereços físicos MAC na rede local (camada 2), mas **não tem autenticação** (qualquer máquina pode enviar respostas ARP não solicitadas — *gratuitous/spoofed ARP replies*).
  - Se o atacante (`mrrobot`, `192.168.2.102`) executar apenas `arpspoof -t <client> <gw>`, apenas a tabela ARP do `client` fica envenenada (associando o IP do `gw` ao MAC do `mrrobot`). Assim, o tráfego `client -> gw` passa pelo `mrrobot`, mas as respostas `gw -> client` vão diretamente do `gw` para o `client`.
  - Para intercetar ambos os sentidos (MitM completo), é preciso abrir um segundo terminal e executar `arpspoof -t <gw> <client>`. Nessa altura, o `ttl` dos pacotes recebidos no `ping` diminui 1 unidade extra (de 126 para 125) por passar por um *hop* adicional (`mrrobot`).
- **A minha resposta:**
  > O protocolo ARP traduz endereços IPv4 em endereços físicos MAC na rede local, mas não tem autenticação, qualquer máquina pode enviar respostas ARP não solicitadas. Se o atacante executar apenas o arpspoof cliente para gw, apenas a tabela ARP do cliente fica envenenadas. Sempre que o cliente receber uma resposta do GW, o pacote irá direto para o cliente, logo o atacante terá de fazer arpspoof do gw para o cliente tambem

#### 13. Durante o ataque de *ARP Spoofing*, porque é que a máquina atacante enviava mensagens `ICMP Redirect` à vítima e como se resolve esse problema?
- **Fontes:** [lab-network.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/03/lab-network.pdf) (Secção 3, página 6).
- **Pista Teórica:**
  - Quando o *kernel* Linux do `mrrobot` recebe um pacote IP da vítima (`192.168.2.101`) e repara que tem de o encaminhar pela **mesma interface de rede (`eth0`)** para um *next-hop* (`gw`, `192.168.2.254`) que está na **mesma sub-rede** da vítima, o Linux tenta ser "prestável" e envia um pacote **`ICMP Redirect`** ao cliente a avisar: *"Fala diretamente com `192.168.2.254` em vez de passares por mim!"*.
  - Isto denuncia imediatamente o ataque no terminal da vítima. Para tornar o ataque furtivo (*stealthy*), desativa-se o envio de redirecionamentos ICMP no *kernel* do atacante com:
    `sysctl -w net.ipv4.conf.all.send_redirects=0` (e `default` / `eth0`).
- **A minha resposta:**
  > O kernel do Linux, por omissao, ao receber um pacote IP e vê se tem de encaminhar o pacote dentro da mesma rede, o linux envia um ICMP redirect, avisando que haverá um hop. Isto denuncia no terminal da vitima que os seus pacotes nao estão a fazer o caminho "normal". Para tornar o ataque furtivo, desativa-se o envio de redirecionamentos ICMP no kernel do atacante com: `sysctl -w net.ipv4.conf.all.send_redirects=0`

---

### Aula P04 — Funções de Hash Criptográficas (Digest Functions)

#### 14. Quais são as 3 propriedades de segurança de uma função de hash criptográfica e qual a relação com o Paradoxo do Aniversário?
- **Fontes:** [3.1-Digest_functions-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/TP/3.1-Digest_functions-en.pdf) (Slide 2) e [lab-crypto-hash-functions.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/04/lab-crypto-hash-functions.pdf) (Secção 2.3).
- **Pista Teórica:**
  Para um *digest* de $n$ bits:
  1. **Resistência à 1.ª Pré-imagem (*Preimage resistance* / *One-way*):** Dado um *hash* $y$, é computacionalmente inviável encontrar uma mensagem $x$ tal que $H(x) = y$. Complexidade média: **$2^n$** (ou $2^k$ se procurarmos apenas $k$ bits prefixados, como no *Proof-of-Work*).
  2. **Resistência à 2.ª Pré-imagem (*2nd-preimage resistance*):** Dada uma mensagem fixa $x_1$, é inviável encontrar outra mensagem $x_2 \neq x_1$ tal que $H(x_1) = H(x_2)$. Complexidade: **$2^n$**.
  3. **Resistência a Colisões (*Collision resistance*):** É inviável encontrar **quaisquer** duas mensagens distintas $(x_1, x_2)$ tais que $H(x_1) = H(x_2)$. Graças ao **Paradoxo do Aniversário** (comparar todos os pares possíveis entre si), a complexidade desce drasticamente para **$\sqrt{2^n} = 2^{n/2}$**!
- **Pergunta Orientadora:** No exercício de *Proof-of-Work* (Secção 2.3 da P04), procurávamos uma frase cujo SHA-256 começasse por `000` em hexadecimal ($3 \times 4 = 12 \text{ bits}$ a zero). Porque é que a média de tentativas foi $\approx 4096$ ($2^{12}$) e não $64$ ($\sqrt{2^{12}} = 2^6$)?
- **A minha resposta:**
  > Preimage resistance: Given a digest, it is infeasible to find an original text producing it
  2nd-preimage resistance: Given a text, it is infeasible to find another one with the same digest
  Collision resistance: It is infeasible to find any two texts with the same digest; Birthday paradox

  No exercicio 2.3 da P04 não era possível aplicar o Paradoxo do Aniversário, pois nao estavamos a comparar tudo com todos, tinhamos um alvo fixo que era começar em "000". Isto é um problema de resistência à pré-imagem (onde a complexidade é 2^n), e não de resistência a colisões (onde se aplicaria o paradoxo do aniversário com complexidade muito inferior).


#### 15. O que é o Efeito de Avalanche e o que demonstra a distribuição estatística da Distância de Hamming na P04?
- **Fontes:** [lab-crypto-hash-functions.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/P/04/lab-crypto-hash-functions.pdf) (Secções 2.1 e 2.2).
- **Pista Teórica:**
  - **Efeito de Avalanche (*Avalanche Effect*):** Qualquer alteração mínima na entrada (como inverter **1 único bit**) produz um *digest* completamente diferente e sem correlação estatística com o original.
  - **Distância de Hamming:** Número de posições de bits em que dois *hashes* do mesmo tamanho diferem (calculado contando o número de bits a `1` no resultado de `h1[i] ^ h2[i]`).
  - Numa função de *hash* ideal com saída de $N$ bits, cada bit de saída tem $50\%$ de probabilidade de mudar (*flip*). Por isso, o histograma das diferenças segue uma distribuição binomial/normal centrada exatamente em **$N/2$ bits** (64 bits no MD5, 80 bits no SHA-1, 128 bits no SHA-256), **independentemente de mudarmos 1 bit ou 1 byte inteiro** na mensagem original!
- **A minha resposta:**
  > O efeito avalanche é uma propriedade da criptografia onde eu posso mudar apenas 1 unico bit que irá me produzir um digest completamente diferente. A distribuiçao estatística da Distancia de Hamminh prova esse efeito, onde alterar apenas 1 bit, em média, 50% do bits do digest são alterados.

#### 16. Qual é a diferença entre um MIC (*Message Integrity Code*) e um MAC (*Message Authentication Code*, ex.: HMAC)?
- **Fontes:** [3.1-Digest_functions-en.pdf](file:///c:/University/3%20ano/1%20Semestre/SIC/TP/3.1-Digest_functions-en.pdf) (Slides 5–8).
- **Pista Teórica:**
  - **MIC:** É simplesmente o *digest* público da mensagem, $\text{MIC} = H(M)$. Serve para detetar erros acidentais de transmissão/armazenamento, mas **não protege contra um atacante ativo**, pois qualquer atacante pode alterar $M$ para $M'$ e recalcular um novo $\text{MIC}' = H(M')$ válido.
  - **MAC (ex.: HMAC):** Combina a mensagem $M$ com uma **chave secreta partilhada $K$** no cálculo do *hash* ($\text{HMAC}_K(M) = H(K \oplus \text{opad}, H(K \oplus \text{ipad}, M))$). Só quem possui a chave $K$ consegue gerar e validar o MAC, garantindo **integridade e autenticidade da origem**.
- **A minha resposta:**
  > *(Escreve aqui a tua síntese)*

---

## Parte 3: Preparação para a Pergunta de "Completar Código" (Exercícios de Aula)

O professor indicou que haverá **1 pergunta para completar código** baseada num **exercício feito na aula** (ou seja, excluindo os desafios opcionais da Secção 11 da P02). Nas aulas P01 a P04, existem apenas **dois blocos de código** trabalhados em aula:

---

### Candidato A (Muito Provável): Análise do Efeito de Avalanche e Hash OpenSSL em C (`P04`)
- **Ficheiro de referência:** [`avalanche-analysis.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/04/src-crypto-hash-functions/avalanche-analysis.c) (e script [`PoW.py`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/04/src-crypto-hash-functions/PoW.py)).
- **Porque é o candidato principal:** O ficheiro original entregue na aula tinha literalmente blocos marcados com `// TODO: add your code here` que todos os alunos tiveram de preencher na aula!

#### Pontos-chave que deves saber completar de cor em [`avalanche-analysis.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/04/src-crypto-hash-functions/avalanche-analysis.c):

1. **Como calcular a Distância de Hamming entre dois arrays de bytes (`count_diff_bits`, linhas 60–71):**
   - Operador bit-a-bit usado para detetar bits diferentes entre `h1[i]` e `h2[i]`: **XOR (`^`)**, porque `0 ^ 0 = 0`, `1 ^ 1 = 0`, e `1 ^ 0 = 1`.
   - Para cada byte `i` de `0` até `size - 1`, somar `count_1s( h1[i] ^ h2[i] )`.
   - E como funciona `count_1s(uint8_t c)`? Divide o byte nos 4 bits menos significativos (`c & 0xF`) e nos 4 bits mais significativos (`c >> 4`) e consulta a tabela `ones[...]`.

2. **Como inverter exatamente 1 bit (ou 1 byte) sem repetir posições (`change_me_a_bit` e `change_me_a_byte`, linhas 78–129):**
   - Copiar a mensagem original para o *buffer* de trabalho: `memcpy(working_buf, source, source_size)`.
   - Escolher um índice de bit aleatório: `bit_idx = rand() % (source_size * 8)`.
   - Converter índice de bit para índice do byte e posição dentro do byte:
     - `byte_idx = bit_idx / 8;`
     - `bit_offset = bit_idx % 8;`
     - `bit_mask = 1 << bit_offset;`
   - Verificar no array `track_mods` se esse bit já foi alterado antes: `while (track_mods[byte_idx] & bit_mask)` $\rightarrow$ se sim, avançar `bit_idx = (bit_idx + 1) % (source_size * 8)` e recalcular `byte_idx`, `bit_offset`, `bit_mask`.
   - Inverter o bit no *buffer* com **XOR**: `working_buf[byte_idx] ^= bit_mask;`
   - Registar no `track_mods` que esse bit já foi usado com **OR**: `track_mods[byte_idx] |= bit_mask;`
   - *(Na variante `change_me_a_byte`, escolhe-se `byte_idx = rand() % source_size` e inverte-se o byte com `working_buf[byte_idx] ^= 0xFF;`)*.

3. **Como calcular o Hash com a biblioteca OpenSSL EVP (linhas 133–159 e 219–229):**
   - **Forma em 3 passos (Contexto `EVP_MD_CTX`)** — usada nas funções `sha256()` e `md5()` do ficheiro:
     1. Criar contexto: `EVP_MD_CTX *ctx = EVP_MD_CTX_new();`
     2. Inicializar algoritmo: `EVP_DigestInit(ctx, EVP_sha256());` (ou `EVP_md5()`)
     3. Processar dados: `EVP_DigestUpdate(ctx, data, data_size);`
     4. Obter hash final: `EVP_DigestFinal(ctx, output_hash, 0);`
     5. Libertar contexto: `EVP_MD_CTX_free(ctx);`
   - **Forma compacta numa única chamada** — usada no `main()` (linhas 222 e 225):
     - Obter tamanho do hash: `unsigned int size_of_hash = EVP_MD_get_size(func_template);`
     - Calcular hash da mensagem original `source`:
       `EVP_Digest(source, source_size, source_hash, &size_of_hash, func_template, 0);`
     - No ciclo `for (int i = 0; i < n_variations; i++)`:
       1. Gerar variação de 1 bit (`change_me_a_bit`);
       2. Calcular hash da variação (`EVP_Digest` sobre `bit_mod` guardando em `bit_mod_hash`);
       3. Contar bits diferentes (`int n = count_diff_bits(source_hash, bit_mod_hash, size_of_hash);`);
       4. Incrementar o histograma (`histogram[n]++;`).

---

### Candidato B: Programação Bluetooth com BlueZ e D-Bus em C (`P02`)
- **Ficheiros de referência:** [`scan.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/scan.c), [`filter.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/filter.c), [`scan-plus.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/scan-plus.c), [`scan-services.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/scan-services.c), [`name.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/name.c), [`just_works_agent.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/just_works_agent.c).
- **Quais foram as alterações de código feitas nas secções obrigatórias (Secções 4 a 8) da aula P02:**

1. **Secção 4.3 & 4.4 ([`scan.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/scan.c) e [`filter.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/filter.c)):**
   - Passar `"auto"` ou `"le"` a `install_filter(bus, "auto", &error)`.
   - Em `filter.c`: construir o dicionário D-Bus `a{sv}` com `g_variant_builder_init(&filter, G_VARIANT_TYPE_VARDICT)` e `g_variant_builder_add(&filter, "{sv}", "Transport", g_variant_new_string(bluetooth_transport))` e invocar `SetDiscoveryFilter` na interface `org.bluez.Adapter1`.
   - Em `scan.c`: parametrizar o `alarm()` usando `argc` e `atoi(argv[1])`, e parar o ciclo no *handler* do `SIGALRM` com `g_main_loop_quit(loop)`.

2. **Secção 5 ([`scan-plus.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/scan-plus.c) e [`subscribe.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/subscribe.c)):**
   - Subscrever sinais com `g_dbus_connection_signal_subscribe()` para:
     - `InterfacesAdded` na interface `org.freedesktop.DBus.ObjectManager`;
     - `PropertiesChanged` na interface `org.freedesktop.DBus.Properties`.
   - No *callback* `on_properties_changed`: extrair parâmetros com `g_variant_get(parameters, "(&s@a{sv}@as)", &iface, &changed, &invalidated)` e verificar se `g_strcmp0(iface, "org.bluez.Device1") == 0`.

3. **Secção 6.8 ([`scan-services.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/scan-services.c)):**
   - Em `on_interfaces_added()`: extrair propriedades do dicionário `device` com `g_variant_lookup_value(device, "Name", G_VARIANT_TYPE_STRING)` (ou `"Address"`).
   - **Política de ligação automática (Ex. 6.8):** Antes de criar o `GDBusProxy` e chamar `g_dbus_proxy_call(..., "Connect", ...)`, filtrar o dispositivo verificando:
     `if (address && name && g_strcmp0(g_variant_get_string(name, NULL), "NOME_ALVO") == 0)`
   - Em `on_device_properties_changed()`: ler a propriedade booleana `ServicesResolved` via método `"Get"` e, quando `g_variant_get_boolean(resolved)` for `TRUE`, listar os serviços (`list_gatt_services`) e cancelar a subscrição com `g_dbus_connection_signal_unsubscribe()`.

4. **Secção 7 ([`name.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/name.c) e [`set_adapter_property.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/set_adapter_property.c)):**
   - Usar `g_dbus_connection_call_sync` no objeto `"/org/bluez/hci0"`, interface `"org.freedesktop.DBus.Properties"`:
     - **Para ler (`Get`):** parâmetros `g_variant_new("(ss)", "org.bluez.Adapter1", "Alias")`, tipo de retorno esperado `G_VARIANT_TYPE("(v)")`, e extrair com `g_variant_get(result, "(v)", &value)` e `g_variant_get_string(value, 0)`.
     - **Para escrever (`Set`):** parâmetros `g_variant_new("(ssv)", "org.bluez.Adapter1", "Alias", g_variant_new_string(argv[1]))` (ou `g_variant_new_boolean(value)` em `set_adapter_property.c`), tipo de retorno `NULL`.

5. **Secção 8.6 ([`just_works_agent.c`](file:///c:/University/3%20ano/1%20Semestre/SIC/P/02/src-bluetooth/just_works_agent.c)):**
   - No *callback* `handle_agent_method_call()`:
     - Para **aceitar** um pedido do agente: `g_dbus_method_invocation_return_value(invocation, NULL);`
     - Para **rejeitar** um pedido do agente: `g_dbus_method_invocation_return_dbus_error(invocation, "org.bluez.Error.Rejected", "Mensagem de erro");`

---

### Mini-Desafio de Treino (Simulação de Pergunta de Teste)

Tenta responder a estas 3 pequenas questões de preenchimento de código sem olhar para os ficheiros:

1. **Desafio 1 (P04 - `avalanche-analysis.c`):**
   Num ciclo que testa `n_variations` mensagens com 1 bit alterado, temos `source_hash` e `bit_mod_hash`, ambos de tamanho `size_of_hash` bytes. Que função do programa chamamos para saber quantos bits mudaram entre os dois *hashes* e como atualizamos o array `histogram`?
   - **A tua resposta:**
     > *(Escreve aqui)*

2. **Desafio 2 (P04 - Manipulação de bits em `change_me_a_bit`):**
   Dado um `byte_idx` e uma máscara `uint8_t bit_mask = 1 << bit_offset;`, qual é a instrução C exata (que operador bit-a-bit usas) para **inverter** apenas esse bit em `working_buf[byte_idx]`, e qual o operador para **marcar** esse bit a `1` em `track_mods[byte_idx]`?
   - **A tua resposta:**
     > *(Escreve aqui)*

3. **Desafio 3 (P02 - `name.c` / D-Bus Properties):**
   Quando fazemos uma chamada `g_dbus_connection_call_sync` à interface `"org.freedesktop.DBus.Properties"`, qual é a string de formato do `g_variant_new(...)` que passamos no método `"Get"` e qual a que passamos no método `"Set"`?
   - **A tua resposta:**
     > *(Escreve aqui)*


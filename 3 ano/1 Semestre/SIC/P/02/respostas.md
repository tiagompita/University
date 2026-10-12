# Respostas - Guião 2: Programmatic Bluetooth in C

---

## 4. Scanning for devices

### 4.2 Run the program

#### Questão 1
> How many Bluetooth devices did you find?

- **Resposta:** 
58

---

#### Questão 2
> Can you identify your own Bluetooth devices in the output?

- **Resposta:** 
Yes

---

#### Questão 3
> Which reported values identify a device and which values describe its state?

- **Resposta:** 
The MAC address allows me to identify the device
Paired, bonded, connected, trutest are all reported states.

---

#### Questão 4
> Does repeating the scan produce exactly the same list?

- **Resposta:** 
No

---

### 4.3 Exercise: understand the discovery filter

#### Questão 1
> Does the number of detected devices change?

- **Resposta:** 
Yes

---

#### Questão 2
> Do devices that were absent from the BLE-only scan now appear?

- **Resposta:** 
Yes

---

#### Questão 3
> Which function actually sends the SetDiscoveryFilter request to BlueZ?

- **Resposta:** 
Function g_dbus_connection_call_sync()

---

#### Questão 4
> Where is the transport value passed from the application into the filter?

- **Resposta:** 
    É possivel responder a esta pergunta de duas maneiras.
    No scan.c a função chamada é a install_filter e o valor transportado é passado no 2º argumento.
    A função install_filter é definida em filter.c onde o argumento é transformado numa chave de pares, de modo a que seja interpretado pelo BlueZ.

---

### 4.4 Exercise: the 20-second timeout

#### Questão 1
> Whether the number of devices found changes.

- **Resposta:** 
    Sim muda

---

#### Questão 2
> Whether longer scans produce additional devices.

- **Resposta:** 
    Mantem o scan ativo durante mais tempo, logo permite estar mais tempo a ler sinais de dispositivos

---

#### Questão 3
> How the scan duration affects the practical usability of the tool.

- **Resposta:** 
    Pelos resultados obtidos, uma duração mais curta faz com que encontre menos dispositivos. Logo se o meu objetivo for encontrar o máximo de dispositivos possiveis, devo usar uma duraçao longa. Cria-se tambem um problema, pois uma duraçao demasiado longa pode encontrar dispositivos que no fim da leitura já nao estão disponiveis.

---

## 5. Observing device property changes

### 5.2 Exercise: compare scan and scan-plus

#### Questão 1
> Which properties appear repeatedly as the environment changes?

- **Resposta:** 
    Pelo que absorvei, uma propriedade sempre presente é o RSSI (Received Signal Strength Indicator).

---

#### Questão 2
> Which values are strings, booleans, or other D-Bus variant types?

- **Resposta:** 
address - string
name - string
paired - boolean
bonded - boolean
connected - boolean
trusted - boolean

RSSI , por exemplo, é variant type
---

#### Questão 3
> Why does scan-plus need a GLib main loop?

- **Resposta:** 
No código está comentado o seguinte:
/*
    * GDBus is asynchronous, so we need a GLib main loop
    * to receive InterfacesAdded signals.
*/

O código não está implementado de modo a que haja um ciclo infinito a verificar novos eventos, existe funções de atendimento (callbacks) ao que o programa depende para receber atualizações sobre o BlueZ. O ciclo GLib do D-Bus, quando o BlueZ envia uma mensagem o GMainLoop "acorda" e invoca as funçoes callback, entregando lhes os dados.
---

#### Questão 4
> What new signal subscription is added compared with scan?

- **Resposta:** 
É adicionada a função "subscribe_device_properties_changed" que o nome é quase auto-explicativo, subscreve ao sinal PropertiesChanged para receber notificações sobre alterações a propriedades de dispositivos.
---

### 5.3 Exercise: inspect the callback path

#### Questão 1
> Trace this sequence in the source code:
> ```text
> subscribe_device_properties_changed()
> -> PropertiesChanged signal
> -> on_properties_changed()
> -> g_variant_get()
> -> iterate over changed properties
> -> g_variant_print()
> -> print each property
> ```
> Write down the D-Bus interface and signal name involved at each step.

- **Resposta:** 
A sequência de como o programa trabalha desde a invocação da funçao subscribe_device_properties_changed() é seguinte:
O programa subscreve ao sinal PropertiesChanged do BlueZ na interface D-Bus org.freedesktop.DBus.Properties. Depois quando de facto o BlueZ envia um sinal para PropertiesChanged o ciclo do GLib "acorda" e invoca a função on_properties_changed() em scan-plus.c.

Dentro desse sinal vem informações como o nome da interface que teve alterações, as propriedades alteradas e propriedades inválidas. Essas informações são extraídas com a função g_variant_get().

Com o bloco de informação extraido o programa filtra para apenas ler sobre esta interface específica "org.bluez.Device1", assim o programa itera apenas pela informação que nos interessa e imprime as propriedades que foram alteradas.
---

### 5.4 Exercise: inspect assumptions made by the callback

#### Questão 1
> The callback assumes that the object path ends with the Bluetooth address and computes the address by taking the last 17 characters. What would happen if a signal for an object with an unexpected path reached this callback? Discuss how you would make this code more robust before using it in a general D-Bus monitoring application.

- **Resposta:** 
Se o caminho tivesse menos de 17 caracteres (ex.: /org/bluez/hci0), a aritmética de ponteiros recuaria para além do início da string (out-of-bounds), provocando um Segmentation Fault (crash) ou leitura de lixo de memória. Se tivesse 17+ caracteres mas não fosse um dispositivo, imprimiria uma string sem sentido.

O que eu faria para tornar o código mais robusto, sem estar aqui a escrevê-lo exatamente, seria manter a leitura como está, mas assegurar que apenas sao aceites caminhos com 17 carateres ou mais para evitar apontar para números negativos. Criar um "fallback" onde caso o caminho nao seja reconhecivel, procurar um formato "XX_XX_XX_XX_XX_XX", onde apenas aceitaria carateres válidos para endereços MAC nas posiçoes do 'X'. E finalmente se o MAC extraido não for um dispositivo válido ou reconhecido, ignorar o evento.
---

## 6. Connecting to discovered devices and listing services

### 6.5 Exercise: follow one device through the program

#### Questão 1
> Choose one discovered device and trace it through the source:
> ```text
> InterfacesAdded
> |
> v
> create GDBusProxy for org.bluez.Device1
> |
> v
> asynchronous Connect()
> |
> v
> on_connect_done()
> |
> +--> initial list_gatt_services()
> |
> v
> subscribe to PropertiesChanged for this device
> |
> v
> read ServicesResolved
> |
> +--> false -> list services again
> |
> +--> true -> list services and unsubscribe
> ```
> Locate the corresponding function in `scan-services.c` for every arrow.

- **Resposta:** 
InterfacesAdded → create GDBusProxy for org.bluez.Device1:
    Nesta etapa o BlueZ informa que tem um dispositivo pronto a ser lido na sua interface.

create GDBusProxy → asynchronous Connect():
    O programa automaticamente dispara um proxy do D-Bus para criar uma conexão assíncrona com o dispositivo detetado.

asynchronous Connect() → on_connect_done():
    Caso a conexão seja criada, é invocada a função on_connect_done() de modo a anunciar ao programa que a conexão foi estabelecida.

on_connect_done() → initial list_gatt_services() & subscribe to PropertiesChanged:
    Com a conexão estabelecida o é invocada a função list_gatt_services() para obter os atributos iniciais disponiveis.
    Depois subscreve ao sinal PropertiesChanged desse dispostivo até que todos os GATT sejam assinalados.

subscribe to PropertiesChanged → read ServicesResolved:
    Enquanto o programa está subscrito ao sinal PropertiesChanged, sempre que o BlueZ detetar alteraçoes nas propriedades desse dispositivo a função on_device_properties_changed() pode ser chamada. Caso seja chamada o programa a partir da função g_dbus_connection_call_sync() consulta a propriedade booleana ServicesResolved do dispositivo.

    Ora como é booleana retorna true ou false. Se false o programa mantem a subscrição até que ServicesResolved seja retornado a true. Se true significa que já foi enviada para o programa toda a informação GATT para o programa, logo o programa já nao precisa de ficar à escuta do sinal PropertiesChanged. Assim termina a escuta e libera essa memoria.
---

### 6.6 Exercise: why is the connection asynchronous?

#### Questão 1
> Compare the connection logic in `scan-services.c` with the synchronous helper in `connect.c`. Explain why performing the connection directly and synchronously from an `InterfacesAdded` callback could prevent the program from processing other D-Bus events while it waits.

- **Resposta:** 
Fazer uma chamada síncrona bloqueia a thread do programa até que a ligação com o dispositivo Bluetooth seja estabelecida, concluída, ou atinja um tempo limite, caso definido. Isto não é prático se necessitamos que o programa esteja continuamente a ler a rede e a responder a eventos. O scan-services.c resolve esse problema com a conexão assíncrona, o programa nao fica bloqueado e permite que continue a responder e a ouvir outras possíveis conexões bluetooth.
---

### 6.7 Exercise: service discovery timing

#### Questão 1
> Run `scan-services` several times and observe whether the service UUIDs are already available at the first listing or only become complete after one or more `PropertiesChanged` notifications. Record one example and explain it using the `ServicesResolved` property.

- **Resposta:** 
Found device (paired: n, bonded = n, connected = n, trusted = n): 70:03:7A:45:A4:A1 (DIOGOSOUSAALVES), connect to it

Got a conection for /org/bluez/hci0/dev_70_03_7A_45_A4_A1, proceed with service listing
Device /org/bluez/hci0/dev_70_03_7A_45_A4_A1 services:
        UUID 0000180a-0000-1000-8000-00805f9b34fb
        UUID 005eb7ca-5889-0301-0100-2cf875b73dbf

Services resolved for /org/bluez/hci0/dev_70_03_7A_45_A4_A1
Device /org/bluez/hci0/dev_70_03_7A_45_A4_A1 services:
        UUID 00001800-0000-1000-8000-00805f9b34fb
        UUID 00001801-0000-1000-8000-00805f9b34fb
        UUID 0000180a-0000-1000-8000-00805f9b34fb
        UUID 00001849-0000-1000-8000-00805f9b34fb
        UUID 0000184c-0000-1000-8000-00805f9b34fb
        UUID 00001855-0000-1000-8000-00805f9b34fb
        UUID 005eb7ca-5889-0301-0100-2cf875b73dbf

    Aqui é vísivel que após outra tentativa de leitura das propriedades GATT foi possível obter ServicesResolved = true.
---

### 6.8 Exercise: automatic connection policy

#### Questão 1
> The source connects to every discovered device that reaches the device callback. There is no user-selection step. Modify the code so that connection only happens when a condition of your choice is met, for example a selected address or device name. Explain where in `on_interfaces_added()` the policy check should be inserted and why it should happen before creating the asynchronous connection.

- **Resposta:** 

Codigo modificado: 
    De:
    if (address)
    Para:
    if (address && (g_strcmp0(g_variant_get_string( address, NULL ), "79:FD:A4:54:BF:D9") == 0))

No entanto ao testar com fones bluetooth, nao foi a coisa mais prática, pois cada vez que ligava os fones o MAC mudava, logo mudei o código para isto:
    if (address && name && (g_strcmp0(g_variant_get_string(name, NULL), "LE-MINOR III") == 0))

    Apenas entram dispositivos com nomes NAO nulos e como o nome dos meus fones nunca muda ele consegue se conectar.

Há várias razoes pela qual a verificaçao deve ser feita antes da ligaçao assincrona sendo elas: evitar tráfego de rádio desnecessario, ou seja, iniciar um connect assincrono para um dispositivo que nao nos interessa só irá estar ocupar o canal de rádio. 
    Outra razao é evitar desperdicio de recursos CPU e memória.
    E por ultimo, as decisoes de filtragem devem ser tomadas antes de fazer alguma atribuiçao de recursos.
---

## 7. Changing the local Bluetooth adapter name

### 7.3 Exercise: inspect property access

#### Questão 1
> What interface and methods are used?

- **Resposta:** 
A interface usada é "org.freedesktop.DBus.Properties" e os metodos usados foram "Get" e "Set"
---

#### Questão 2
> How is the Alias property identified?

- **Resposta:** 
A propriedade Alias é identificada a partir desta funçao: g_variant_new( "(ss)", "org.bluez.Adapter1", "Alias" ) e o valor dela a partir desta: G_VARIANT_TYPE("(v)")
---

#### Questão 3
> Why does the Get call expect a result of type (v)?

- **Resposta:** 
v significa Variant. O Get devolve (v) porque é um método genérico que tem de conseguir devolver qualquer tipo de propriedade (string, booleano, inteiro, etc.) num tuplo daí os «()»
---

#### Questão 4
> Why does the Set call use (ssv) parameters?

- **Resposta:** 
O (ssv) representa exatamente os 3 argumentos que o método Set exige segundo a norma D-Bus:

1º s - O nome da interface alvo → "org.bluez.Adapter1".
2º s - O nome da propriedade a alterar → "Alias".
3º v - O novo valor a atribuir à propriedade → embrulhado numa variante (g_variant_new_string(argv[1])).
---

### 7.4 Exercise: observe the change remotely

#### Questão 1
> Set a new adapter name and then have another Bluetooth-capable host scan for the adapter. Determine when the new name becomes visible remotely.

- **Resposta:** 
O novo nome só se torna visível remotamente quando duas condições se verificam:
1. O adaptador local está em modo visível (Discoverable = TRUE), transmitindo ativamente os novos anúncios pelo ar;
2. O host remoto realiza uma nova pesquisa (scan) ativa, recebendo o pacote de anúncio/resposta atualizado.
Caso o dispositivo remoto já conhecesse o adaptador anteriormente, o nome antigo pode manter-se temporariamente na cache local até que ocorra uma nova consulta ou uma nova ligação que force a atualização.

## 8. Implementing a JustWorks pairing agent

### 8.4 Exercise: inspect the Agent1 object

#### Questão 1
> Start from `just_works_agent.c` and identify these four elements:
> ```text
> introspection XML
> |
> v
> handle_agent_method_call()
> |
> v
> agent_vtable
> |
> v
> g_dbus_connection_register_object()
> ```
> Explain how the XML description and the method-call callback together expose a D-Bus object that BlueZ can call.

- **Resposta:** 
O XML descreve a interface org.bluez.Agent1: quais são os métodos que existem (RequestConfirmation, AuthorizeService, RequestPinCode, etc.) e os tipos dos seus argumentos. 
Quando o BlueZ invoca um método no agente, a função handle_agent_method_call() é executada. Ela verifica, decide se aprova ou rejeita o emparelhamento e responde de volta ao BlueZ com g_dbus_method_invocation_return_value().

A funçao g_dbus_connection_register_object() pega no caminho do objeto (/sic/example/justworks_agent), na interface definida pelo XML e na agent_vtable, e publica o objeto no canal do sistema D-Bus. A partir daqui, o BlueZ já pode invocar métodos diretamente no programa.
---

### 8.5 Exercise: analyse the pairing policy

#### Questão 1
> For each Agent1 method (`Release`, `RequestPinCode`, `DisplayPinCode`, `RequestPasskey`, `DisplayPasskey`, `RequestConfirmation`, `RequestAuthorization`, `AuthorizeService`, `Cancel`), record whether the example:
> - accepts the request;
> - rejects the request; or
> - simply acknowledges the method while printing information.

- **Resposta:** 
`Release` - simply acknowledges the method while printing information
`RequestPinCode`, - rejeita
`DisplayPinCode`, - simply acknowledges the method while printing information 
`RequestPasskey`, - rejeita
`DisplayPasskey`, - simply acknowledges the method while printing information
`RequestConfirmation`, - aceita
`RequestAuthorization`, - aceita
`AuthorizeService`, - aceita
`Cancel` - simply acknowledges the method while printing information
---

#### Questão 2
> Which operations can proceed without human approval?

- **Resposta:** 
RequestAuthorization 
AuthorizeService 
RequestConfirmation 

---

#### Questão 3
> Which pairing mechanisms cannot be completed because the agent has no input capability?

- **Resposta:** 
RequestPinCode
RequestPasskey
---

#### Questão 4
> Why is automatically accepting RequestConfirmation different from a strict JustWorks-only policy?

- **Resposta:** 
O RequestConfirmation pertence ao modelo "Numeric Comparison" onde ambos os dispositivos geram um codigo onde um utilizador humano tem obrigatoriamente de olhar para os dois ecras e verificar se os numeros coincidem. O propósito disto é proteger de ataquede Man-In-The-Middle.
A politica JustWorks o dispositivo assume que nao tem ecra nem forma de interagir com o utilizador, logo numa politia JustWorks o codigo rejeitaria o RequestConfirmation, pois nao há forma visual de verificar os codigos.

Este codigo finge passar-se por humano indicando que confirmou ambos os codigos daí ser possível o RequestConfirmation passar.
---

### 8.6 Exercise: change the policy

#### Questão 1
> Modify one branch of `handle_agent_method_call()` so that a selected operation is rejected instead of automatically accepted. Test the modified policy and explain the D-Bus error returned to BlueZ.

- **Resposta:** 
O print foi substituido por: 
printf( "Rejecting RequestConfirmation because this is a strict JustWorks agent\n" );

E a funçao g_dbus_method_invocation_return_value por:
g_dbus_method_invocation_return_dbus_error( invocation, "org.bluez.Error.Rejected", "Request Rejected" );
---

### 9 Exercise
dbus.c: Estabelece a ligação ao barramento de sistema (G_BUS_TYPE_SYSTEM), onde o daemon bluetoothd corre.
filter.c: Constrói o dicionário D-Bus (a{sv}) com o tipo de transporte ("le" ou "auto") e ativa o filtro no BlueZ.
discovery.c: Funções simples (wrappers) para iniciar (StartDiscovery) e parar (StopDiscovery) a pesquisa no adaptador hci0.
subscribe.c: Trata de registar a escuta aos sinais assíncronos:
    InterfacesAdded (quando surge um novo dispositivo).
    PropertiesChanged (quando as propriedades de um dispositivo mudam).
connect.c: O exemplo síncrono/bloqueante de ligação ao método Connect.
gatt.c: Percorre a árvore de objetos geridos (GetManagedObjects) e extrai os UUIDs dos serviços GATT.
set_adapter_property.c: Altera propriedades booleanas do adaptador local (Pairable e Discoverable).
just_works_agent.c: Demonstra como construir e registar um objeto servidor D-Bus completo em C (XML de introspeção + vtable + callback).

---

## 10. Practical security discussion

### 10.1 Discovery and device metadata

#### Questão 1
> What information about nearby devices is revealed by discovery?

- **Resposta:** 
MAC address
Nome do dispositivo (ex: "LE-MINOR III")
O RSSI (potência do sinal recebido que dá uma estimativa de proximidade física)
Dados do fabricante (ManufacturerData) e o OUI (os primeiros 3 bytes do MAC revelam a marca do hardware: Apple, Marshall, Samsung, etc.).
O estado de ligação/confiança (Paired, Connected, etc.)
---

#### Questão 2
> Which values identify a device and which describe its current state?

- **Resposta:** 
O que identifica o aparelho: Address, Name, ManufacturerData, Modalias
O que identifica o estado do aparelho: Connected, Paired, Bonded, Trusted, RSSI
---

#### Questão 3
> What privacy implications follow from collecting and storing such data?

- **Resposta:** 
Tracking: Se registar o MAC e o RSSI de alguém ao longo do tempo, é possível saber por onde a pessoa andou, quando chegou, quando saiu e em que sala esteve
Profiling: Nomes como "Computador de Maria Silva" ligam diretamente um sinal de rádio a uma pessoa física real
Mapeamento de Rotinas e Relações: Dispositivos que aparecem sempre juntos à mesma hora revelam hábitos diários e até relações pessoais
---

### 10.2 Event-driven interfaces

#### Questão 1
> Why does the program check interfaces and expected value types?

- **Resposta:** 
Porque tentar aceder a campos inexistentes ou com tipos incompatíveis, provoca erros de corrupção de memória ou Segmentation Fault (crash)
---

#### Questão 2
> What assumptions do the callbacks make about the presence and shape of data?

- **Resposta:** 
O callback assume que o object_path termina sempre nos 17 caracteres do MAC
O código assume que certas propriedades vêm sempre com o formato esperado dentro do dicionário a{sv}
Assume que certos campos (como Address) existem sempre no pacote
---

#### Questão 3
> Which assumptions would need additional validation in a production program?

- **Resposta:** 
Validar o tamanho e prefixo do caminho (strlen >= 17 e g_str_has_prefix) antes de tocar em ponteiros
Tratar explicitamente os casos em que name é nulo
Validar o retorno de todas as funções de procura (g_variant_lookup_value) antes de as usar
---

### 10.3 Automatic connections

#### Questão 1
> Why can automatic connection be an unexpected policy decision?

- **Resposta:** 
Intrusão e Privacidade: Tentar ligar a qualquer dispositivo que passa no ar sem autorização é invasivo e pode fazer surgir alertas/pop-ups não solicitados nos ecrãs de pessoas à volta.
Attack Surface: Ao ligar-se ativamente a dispositivos desconhecidos, o teu computador expõe a sua pilha Bluetooth a possíveis dispositivos maliciosos na vizinhança.
Exaustão de Recursos / DoS: Disparar dezenas de ligações simultâneas ocupa o canal de rádio e o adaptador Bluetooth desnecessariamente.
---

#### Questão 2
> How would you modify the program so that a user must explicitly approve a device before connection?

- **Resposta:** 
Em vez de disparar o Connect automaticamente dentro do callback on_interfaces_added():
Pedir confirmação interativa ao utilizador no terminal (ex: mostrar os dados do dispositivo e aguardar por um (s/n)).
Ou implementar uma whitelist pré-configurada onde apenas dispositivos autorizados (por MAC ou Nome) são contactados.
---

#### Questão 3
> Which address or property could be used to make that decision?

- **Resposta:** 
O Address (endereço MAC, que é o identificador único da placa).
O Name (o nome amigável do dispositivo, muito mais intuitivo para o utilizador).
Os UUIDs de serviços anunciados (para só ligar a dispositivos que ofereçam um serviço pretendido, como auscultadores de áudio).
---

### 10.4 Automatic pairing decisions

#### Questão 1
> What changes in the security posture when pairing decisions are automated?

- **Resposta:** 
A segurança do sistema passa de um modelo de controlo de acesso com validação humana para uma postura de confiança cega (open door / zero authentication).
Qualquer atacante nas proximidades consegue emparelhar e criar uma ligação com o computador sem o utilizador se aperceber.
---

#### Questão 2
> Why does the capability NoInputNoOutput limit which requests can be completed?

- **Resposta:** 
Porque os mecanismos que dependem de teclado ou ecrã (como introduzir um PIN em RequestPinCode ou digitar uma passkey em RequestPasskey) tornam-se impossíveis de satisfazer.
---

#### Questão 3
> Why should automatic authorization and service approval be treated as a policy choice rather than merely a programming detail?

- **Resposta:** 
Não é um mero detalhe de código porque define o modelo de privilegios e segurança do sistema operativo.
Autorizar serviços automaticamente pode abrir portas a acessos críticos (como microfone, transferência de ficheiros, portas série virtuais ou rede local) a equipamentos externos desconhecidos.
---

### 10.5 Adapter discoverability

#### Questão 1
> Discuss the difference between:
> - discovering remote devices;
> - making the local adapter discoverable;
> - allowing the local adapter to be paired.

- **Resposta:** 
1. O adaptador está apenas em modo de escuta (scanner passivo). Ouve o ar à procura de anúncios de outros aparelhos sem revelar a sua própria presença.
2. O adaptador local passa a transmitir pacotes de anúncio ativamente pelo ar para que qualquer dispositivo à volta o consiga ver.
3. O adaptador aceita negociar chaves de emparelhamento quando recebe um pedido. (Um adaptador pode ser Pairable sem estar Discoverable)
---

### 10.6 Service enumeration

#### Questão 1
> Discuss what an application can learn from service enumeration before it ever uses an application-level service.

- **Resposta:** 
Fingerprinting do Dispositivo: Olhando apenas para a lista de UUIDs dos serviços GATT, a aplicação descobre imediatamente que tipo de equipamento é (ex: auscultadores, teclado, lâmpada) e frequentemente a marca e modelo.

Mapeamento da Superfície de Vulnerabilidades: Revela a existência de serviços proprietários ou portas de depuração que possam ter falhas de segurança conhecidas, antes sequer de estabelecer uma sessão aplicacional.
---

## 11. Additional programming challenges

### 11.8 Challenge 8: replace JustWorks with PIN-code pairing

#### Questão 1
> Which Agent1 method is invoked during PIN-code pairing?

- **Resposta:** 

---

#### Questão 2
> Why is the NoInputNoOutput capability no longer appropriate?

- **Resposta:** 

---

#### Questão 3
> Where should the PIN be validated or generated, and what would be the risks of storing a permanent PIN in the program?

- **Resposta:** 

---

#### Questão 4
> How does this pairing flow differ from the current automatic acceptance of RequestConfirmation in the supplied agent?

- **Resposta:** 


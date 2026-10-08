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

---

### 6.6 Exercise: why is the connection asynchronous?

#### Questão 1
> Compare the connection logic in `scan-services.c` with the synchronous helper in `connect.c`. Explain why performing the connection directly and synchronously from an `InterfacesAdded` callback could prevent the program from processing other D-Bus events while it waits.

- **Resposta:** 

---

### 6.7 Exercise: service discovery timing

#### Questão 1
> Run `scan-services` several times and observe whether the service UUIDs are already available at the first listing or only become complete after one or more `PropertiesChanged` notifications. Record one example and explain it using the `ServicesResolved` property.

- **Resposta:** 

---

### 6.8 Exercise: automatic connection policy

#### Questão 1
> The source connects to every discovered device that reaches the device callback. There is no user-selection step. Modify the code so that connection only happens when a condition of your choice is met, for example a selected address or device name. Explain where in `on_interfaces_added()` the policy check should be inserted and why it should happen before creating the asynchronous connection.

- **Resposta:** 

---

## 7. Changing the local Bluetooth adapter name

### 7.3 Exercise: inspect property access

#### Questão 1
> What interface and methods are used?

- **Resposta:** 

---

#### Questão 2
> How is the Alias property identified?

- **Resposta:** 

---

#### Questão 3
> Why does the Get call expect a result of type (v)?

- **Resposta:** 

---

#### Questão 4
> Why does the Set call use (ssv) parameters?

- **Resposta:** 

---

### 7.4 Exercise: observe the change remotely

#### Questão 1
> Set a new adapter name and then have another Bluetooth-capable host scan for the adapter. Determine when the new name becomes visible remotely.

- **Resposta:** 

---

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

---

### 8.5 Exercise: analyse the pairing policy

#### Questão 1
> For each Agent1 method (`Release`, `RequestPinCode`, `DisplayPinCode`, `RequestPasskey`, `DisplayPasskey`, `RequestConfirmation`, `RequestAuthorization`, `AuthorizeService`, `Cancel`), record whether the example:
> - accepts the request;
> - rejects the request; or
> - simply acknowledges the method while printing information.

- **Resposta:** 

---

#### Questão 2
> Which operations can proceed without human approval?

- **Resposta:** 

---

#### Questão 3
> Which pairing mechanisms cannot be completed because the agent has no input capability?

- **Resposta:** 

---

#### Questão 4
> Why is automatically accepting RequestConfirmation different from a strict JustWorks-only policy?

- **Resposta:** 

---

### 8.6 Exercise: change the policy

#### Questão 1
> Modify one branch of `handle_agent_method_call()` so that a selected operation is rejected instead of automatically accepted. Test the modified policy and explain the D-Bus error returned to BlueZ.

- **Resposta:** 

---

## 10. Practical security discussion

### 10.1 Discovery and device metadata

#### Questão 1
> What information about nearby devices is revealed by discovery?

- **Resposta:** 

---

#### Questão 2
> Which values identify a device and which describe its current state?

- **Resposta:** 

---

#### Questão 3
> What privacy implications follow from collecting and storing such data?

- **Resposta:** 

---

### 10.2 Event-driven interfaces

#### Questão 1
> Why does the program check interfaces and expected value types?

- **Resposta:** 

---

#### Questão 2
> What assumptions do the callbacks make about the presence and shape of data?

- **Resposta:** 

---

#### Questão 3
> Which assumptions would need additional validation in a production program?

- **Resposta:** 

---

### 10.3 Automatic connections

#### Questão 1
> Why can automatic connection be an unexpected policy decision?

- **Resposta:** 

---

#### Questão 2
> How would you modify the program so that a user must explicitly approve a device before connection?

- **Resposta:** 

---

#### Questão 3
> Which address or property could be used to make that decision?

- **Resposta:** 

---

### 10.4 Automatic pairing decisions

#### Questão 1
> What changes in the security posture when pairing decisions are automated?

- **Resposta:** 

---

#### Questão 2
> Why does the capability NoInputNoOutput limit which requests can be completed?

- **Resposta:** 

---

#### Questão 3
> Why should automatic authorization and service approval be treated as a policy choice rather than merely a programming detail?

- **Resposta:** 

---

### 10.5 Adapter discoverability

#### Questão 1
> Discuss the difference between:
> - discovering remote devices;
> - making the local adapter discoverable;
> - allowing the local adapter to be paired.

- **Resposta:** 

---

### 10.6 Service enumeration

#### Questão 1
> Discuss what an application can learn from service enumeration before it ever uses an application-level service.

- **Resposta:** 

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


## Learning the server
- Quais são os dois UUIDs definidos no topo? Qual deles vais procurar no cliente, e qual vais usar para escrever/subscrever?

> \# UUIDs for our custom Chat Service and Characteristic  
> CHAT_SERVICE_UUID = '12345678-1234-5678-1234-56789abcdef0'  
> CHAT_MSG_UUID = '12345678-1234-5678-1234-56789abcdef1'  
> Procurar no cliente com o service uuid e usar o msg uuid para subscrever.  

- Que flags tem a característica ChatQueue? Que operações o cliente poderá fazer com elas?
> A ChatQueue tem as flags "Write" e "Notify". O que permite ao utilizador escrever um valor com confirmação e avisar o cliente quando o valor muda no servidor sem pedir confirmação.

- Quando um cliente escreve, o que acontece à mensagem em WriteValue? Como chega aos restantes clientes? Repara no sinal PropertiesChanged
> Quando é enviada uma mensagem por um cliente, o que acontece é:  
> A mensagem é decoded para utf-8, convertida para string, atualizado o tamanho da mensagem na ChatQueue e por fim é atualizada (ChatQueue) para que os restantes clientes tenham acesso à mensagem. Os clientes recebem a mensagem, pois estão subscritos à flag "notify"

- Como é que o servidor se regista no BlueZ? Vê o main e a função GetManagedObjects.
>
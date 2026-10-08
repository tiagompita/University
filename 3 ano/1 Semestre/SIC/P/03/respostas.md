# Respostas - Guião 3: Local Network Vulnerabilities

---

## 3. Case 1: You are another user in the network

### Questão 1
> Durante o ataque de arpspoof ao gateway a partir do contentor `mrrobot`, o cliente (`client`) deteta que o tráfego está a passar por um intermediário através de mensagens ICMP Redirect:
> ```text
> From 192.168.2.102: icmp_seq=1 Redirect Host(New nexthop: 192.168.2.254)
> ```
> a) O que causa o envio destas mensagens pelo kernel Linux do atacante?  
> b) Quais são os comandos `sysctl` utilizados para desativar os redirecionamentos ICMP e tornar o ataque furtivo (*stealthy*)?

- **Resposta:** 

---

### Questão 2
> Ao executar apenas o comando `arpspoof -t 192.168.2.101 192.168.2.254`, o ataque ainda está incompleto porque o TTL dos pacotes ping não diminui para indicar o salto extra.
> 
> a) Porque é que o comando inicial apenas interceta o tráfego que tem origem no cliente, mas não as respostas do gateway?  
> b) Que segundo comando de `arpspoof` é necessário executar num terminal separado para intercetar o fluxo de retorno e fechar o ataque Man-in-the-Middle (MitM)?  
> c) Como é que o valor do TTL (127 -> 126 -> 125) e a inspeção no Wireshark confirmam o sucesso do ataque bidirecional?

- **Resposta:** 

---

### Questão 3
> *Thus far, we have explored how to manipulate link layer protocols to intercept traffic from another host.*
> 
> Could we leverage the same exploit to do a different attack?  
> *(Hint: think about a DoS targeted to a single host.)*

- **Resposta:** 

---

## 4. Case 2: You control the network, but not the hosts

### Questão 4
> No cenário em que controlamos o gateway da rede mas não os clientes, configuramos um ataque de DNS spoofing local recorrendo ao serviço `dnsmasq`.
> 
> a) Que configuração foi introduzida no ficheiro `/etc/dnsmasq.conf` do gateway para desviar os pedidos da API `services.web.ua.pt` para o contentor `fakeserver` (192.168.2.103)?  
> b) Porque é que pode ser necessário executar `resolvectl flush-caches` no cliente antes de observar o resultado do ataque?

- **Resposta:** 

---

### Questão 5
> O ataque de desvio DNS obtém inicialmente uma página 404 do Nginx instalado no `fakeserver`:
> ```text
> The attack is successful, but only achieves a DoS of that API call to that client. We could go further and configure nginx to respond properly to requests to services.web.ua.pt and deliver a proper malicious payload.
> 
> Can you make this reply more believable? (i.e., anything other than a 404 page).
> ```
> Descreva como configurou o Nginx ou o payload HTTP no `fakeserver` de modo a replicar a resposta JSON legítima da API de parques com dados falsos.

- **Resposta:** 

---

## 5. Further exploitation

### Questão 6
> *Within the dsniff tool set, explore how you could use dnsspoof to achieve a similar result. Be mindful that a local DNS server is very fast and hard to exploit this way, you are allowed to consider the client uses a remote DNS to better demonstrate this exploit.*
> 
> a) Como funciona a ferramenta `dnsspoof` e que ficheiro de mapeamento (*hosts*) requer para responder a pedidos DNS na LAN?  
> b) Porque é que a corrida (*race condition*) contra um servidor DNS local (na mesma LAN/gateway) é difícil de vencer comparada com uma situação em que o cliente usa um DNS remoto (como 8.8.8.8 ou 1.1.1.1)?

- **Resposta:** 

---

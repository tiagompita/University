# Respostas - Guião 5: Symmetric Cryptography

---

## 1. Cipher Modes

#### Validação dos Modos ECB e CBC
> After implementing ECB, and CBC, validate your implementation against the test vectors provided in file aes128-test-vectors.txt (or aes128-test-modes.c).
> Your implementation should produce the same output as the test vectors for the same input. Start by encrypting the plaintext and compare the result with the ciphertext, then decrypt the result and compare it with the expected plaintext (the original one).

- **Resposta:**

---

## 2. Padding

#### Validação do Padding (PKCS#7)
> Validate your implementation against the tests provided in file aes128-test-padding.c. For ECB and CBC, use the test vectors provided in file aes128-test-padding.txt.
> Note: Take special care when the size of the input data is a multiple of the block size. In such cases, PKCS#7 padding requires that a full block of padding be added. This is to ensure that the padding can always be unambiguously removed.

- **Resposta:**


---

## 3. Symmetric key generation

#### Análise do Número de Iterações
> Try different number of iterations and measure this impact.

- **Resposta:**
Rounds: 100 000
 time ./pbkdf2-kickoff universidade 
Salt: 70 4D 64 C7 67 BF 26 A2 67 27 88 4F 62 73 5F 58 B4 91 C1 08 8B DF 38 28 0C D6 59 15 23 13 BA A9 
Key: 2A 9C 27 95 FE 27 46 F5 29 27 57 3D 86 BF 6F 74 
IV: F8 28 21 0D 0C 33 BF 65 D1 08 4B 32 2D E0 5D 97 

real    0m0.029s
user    0m0.026s
sys     0m0.000s

Rounds: 10 000 000
 time ./pbkdf2-kickoff universidade
Salt: B7 AF 52 B4 3C 36 CF 03 52 B8 B5 7D 14 BF 8E EE CB 4A A6 4F 35 83 8C B9 83 82 32 CA B6 93 38 9D 
Key: 83 55 DC 59 BB FA 8F 4D D7 E4 FD C2 D2 93 35 E8 
IV: D6 52 0B B6 AF 96 8A A5 6F 07 88 78 5B F0 44 BF 

real    0m1.979s
user    0m1.972s
sys     0m0.001s
---

## 4. File encryption

#### Questão 1
> Can you determine the structure of the plaintext from the cryptogram?

- **Resposta:**

No
---

#### Questão 2
> Compare the lengths of the plaintext and the cryptogram?

- **Resposta:**
 ls -l aes128-test-padding.txt test-padding-enc-cbc test-padding-enc-ecb 
-rwxrwxrwx 1 pita root 662 Oct 14 23:11 aes128-test-padding.txt
-rwxrwxrwx 1 pita root 692 Oct 19 18:44 test-padding-enc-cbc
-rwxrwxrwx 1 pita root 692 Oct 19 18:46 test-padding-enc-ecb

Os ficheiros encriptados são maiores (+30bytes).

É adicionado no inicio do ficheiro o parametros que têm 20 bytes
typedef struct {
    uint8_t salt[16];     // 16 bytes
    uint32_t iterations;  // 4 bytes
} key_params_t;

Ora: 662 mod 16 = 6
É preciso 10 bytes para bloco de 16 bytes ficar completo

Logo no total são adicionado 30 bytes, 20 para a struct e 10 de padding, o que iguala 692 bytes

---

## 5. File decryption

#### Questão 1
> Is padding visible in the decrypted text?

- **Resposta:**

Não
---

#### Questão 2
> What happens if the cryptogram is truncated?

- **Resposta:**
Existem dois cenários possíveis consoante o número de bytes que são cortados no fim.
Cenário A: O corte deixa o ficheiro com um tamanho que NÃO é múltiplo de 16 bytes
    As cifras de bloco (ECB e CBC) só conseguem operar sobre blocos completos de 16 bytes. Se o último bloco ficar incompleto, é impossível aplicar a função de decifração

Cenário B: O corte remove exatamente um (ou mais) blocos inteiros de 16 bytes do fim
    Os blocos anteriores que sobraram são decifrados normalmente
    o penúltimo bloco passa a ser tratado pelo programa como se fosse o "último bloco". Quando o algoritmo tenta remover o padding desse bloco (que na verdade contém texto normal da mensagem), os últimos bytes não vão respeitar a regra do PKCS#7
---

#### Questão 3
> What happens if the cryptogram lacks some bytes in the beginning?

- **Resposta:**

Se faltarem bytes no início do ficheiro:
    Quando a função read_params ler os primeiros 20 bytes, vai ler um salt e um número de iterations completamente errados. Mesmo que a chave seja gerada, como o salt e iterations estão errados, a chave AES e o IV gerados serão totalmente diferentes dos originais, tornando impossível decifrar qualquer bloco do ficheiro

Se o número de bytes em falta NÃO for múltiplo de 16
    Todos os blocos dão lixo na decifração e no fim o ficheiro falha por não ser múltiplo de 16

Se faltar exatamente 1 bloco inteiro de 16 bytes no início do ciphertext
    No modo ECB: Como cada bloco é independente perde-se apenas o 1.º bloco. Todos os blocos seguintes são decifrados sem qualquer erro!
    
No modo CBC:
    Perde-se o 1.º bloco
    O 2.º bloco (C2) passa a ser o primeiro na fila, logo vai fazer XOR com o IV em vez de fazer XOR com C1 (que desapareceu). Resultado: P2 fica corrompido!
    E o 3.º bloco (P3), para decifrar C3, só precisamos de 𝐷𝐾(𝐶3)⊕𝐶2. Como C3 e C2 estão intactos, a partir do bloco 3 todo o resto do ficheiro é decifrado perfeitamente
---

## 6. Patterns

#### Questão 1
> Using a program to visualize images, open the original image and the encrypted image and compare them. What do you observe?

- **Resposta:**


---

#### Questão 2
> Repeat all the above operations, now using the CBC cipher mode instead of ECB cipher mode. Then, compare the original image with the obtained encrypted image.

- **Resposta:**


---


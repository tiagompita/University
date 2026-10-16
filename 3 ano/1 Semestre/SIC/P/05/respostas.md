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


---

## 4. File encryption

#### Questão 1
> Can you determine the structure of the plaintext from the cryptogram?

- **Resposta:**


---

#### Questão 2
> Compare the lengths of the plaintext and the cryptogram?

- **Resposta:**


---

## 5. File decryption

#### Questão 1
> Is padding visible in the decrypted text?

- **Resposta:**


---

#### Questão 2
> What happens if the cryptogram is truncated?

- **Resposta:**


---

#### Questão 3
> What happens if the cryptogram lacks some bytes in the beginning?

- **Resposta:**


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


# Respostas - Guião 6: Asymmetric Cryptography

---

## 2. RSA

### 2.1 RSA key pair generation

#### Registo de Tempos e Tamanho das Chaves
> Run the program, several times, varying the key length and register the elapsed time using the `time` program in the shell (use `man time` for more information), for example:
> `time key_gen_rsa 4096 priv.pem pub.pem`
> Compare the size of the keys stored in each file (they are written in Base64).

- **Resposta:**


---

#### Questão 1
> What do you think of using 4096 bit keys by default in relation to speed?

- **Resposta:**
Acho que nao é ótimo em relação à velocidade. Em média demora 0.6 segundos, no meu pc.

---

#### Questão 2
> How the actual key size varies with the number of bits?

- **Resposta:**
./gen_rsa_key 1024 priv.pem pub.pem
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDti5iEpUEAW7dFKDcDHmRZfqW6
mBSSnluwCb7Jx9GoDOQqj1rRm3xQ4HoB/I3j+6LpzmlWCPm9aEEYu52iHUCTyQ7Z
ljk2pG0F2VAr/F8v1/z7cE7Slk6xOvTaDwMq/a3rLxpB5zJAdUdLtyc8Rl+Xj7AQ
0RJNMj3aoMpB90QqowIDAQAB
-----END PUBLIC KEY-----

./gen_rsa_key 4096 priv.pem pub.pem
-----BEGIN PUBLIC KEY-----
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwMFFPueynWB2GkZh281k
dzNBm4MThJiPo7VG1JAJasfI9l3/UCHe1lVeWVRmr3Y+44MFnbHj7oSGDOOt8cYr
Apitcbe7jqRJiPdoioc/bfbnEcuADxLx5SRdrVBcyyicXSuiXOJ8MpAg0d6SEE9i
3SpvjKLiX/db0Q6UAHRpfTdPoGqETJ4smGKgBQ41Ypa/m4gjtnYjkdV89M5J9/rX
oy/SHiARgLvcvmKwlRcMWraUuWuk4ZvgN/ee0mrZaanIMBpAp7WrO0edd+5Bp0cE
zQOowYIyeTrNDpQZrTU9YYO5wHl+/WI0mU9Qnnfp8qVVri363XrDXYG75ot7a7lE
NFLNpBw2fHroazUdaGGHpHl3Fw/esHgK9CzQXhR+bffvKdkxYrXSrufUwGHkVzFM
Rgg3UzL4EzTdRdOspzkOn0WdaCukonhrhMtVRpyYMdHsGf104NztATHTF29BZxmq
BX1rYZHr+REjYTR5zPSiLs6lFhhBvMv9vlh55F5CUUu6VYxvtr2IRJ0OvX3MvbQW
pf88dfvFqvXcZOK2XTgl6qCr2PIe7SHLSXdTummY3FHDcPQslgS11iCGyzlxbZCL
Yti2LWazMzU91xaZnym40Onta17s+LXcM5Vqgq+jKF5DwFuWVOZYmvanHv00FSOl
UzAkjiqMmvIbx0CzJTvluxkCAwEAAQ==
-----END PUBLIC KEY-----

Varia bastante, quase que sendo propocional a quantas vezes aumentamos o tamanho.

---

### 2.4 Large file encryption

#### 2.4.1 Symmetric vs. Asymmetric cryptography benchmark
> Generate two files with 100 kB and 10 MB of size. Using these files and the `time` application, register the time it takes to encrypt and decrypt these files with RSA (key = 1024 bits) and AES-128. Employ the applications developed in this guide and in the previous one.

- **Resposta:**


---

#### 2.4.2 Symmetric and Asymmetric cryptography combination

#### Questão 1
> What combination of encryption technologies allow to efficiently send the file to the recipient, with the guarantee that only that person can decrypt the file?

- **Resposta:**


---

#### Questão 2
> With this method, what is sent to the destination?

- **Resposta:**


---

#### Questão 3
> Should we always send the pubic key?

- **Resposta:**


---

## 3. Elliptic curves

### 3.2 Secure messaging with public encryption and private decryption

#### Validação da Cifra e Decifra ECC (`p521_gen`, `ecc_encrypt`, `ecc_decrypt`)
> `ecc_encrypt Kpub < plaintext > ciphertext`
> `ecc_decrypt Kpriv password < ciphertext > recovered_plaintex`
> After these two command, the contents of ‘plaintext’ should be equal to the contents of ‘recovered_plaintext’.

- **Resposta:**


---


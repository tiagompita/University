// Helper file for SIC Lab on Symmetric Cryptography

#include <stdint.h>
#include <memory.h>
#include <assert.h>

#include "aes.h"
#include "cbc.h"

void
aes128_cbc_enc( const void * ctx, const uint8_t * iv, const uint8_t * plaintext, const int plain_size, uint8_t * ciphertext )
{
    assert( ctx != 0 && iv != 0 && plaintext != 0 && ciphertext != 0);
// add your code here
    
    for (int i = 0; i < plain_size; i+=AES128_BLOCK_SIZE) { // cada i é um bloco de 16 bytes
        uint8_t xOr_block[AES128_BLOCK_SIZE];
        for (int j = 0; j < 16; j++) { // cada j é um byte do bloco do i
            if (i == 0) {
                xOr_block[j] = plaintext[j] ^ iv[j];
            } else {
                // ciphertext[(i - AES128_BLOCK_SIZE) + j]
                // É escrito assim pois este caso so começa quando i = 16, se fizesse j-i daria um indice negativo
                // para o qual nao pretendo apontar. Em i = 16 tenho que subtrair AES128_BLOCK_SIZE para que use o ciphertext[0] 
                // e depois iterar com o j de byte em byte
                xOr_block[j] = plaintext[j+i] ^ ciphertext[(i - AES128_BLOCK_SIZE) + j];
            }
        }
        aes128_block_enc(ctx, xOr_block, ciphertext + i);
    }
// until here
}

void
aes128_cbc_dec( const void * ctx, const uint8_t * iv, const uint8_t * ciphertext, const int cipher_size, uint8_t * plaintext )
{
    assert( ctx != 0 && iv != 0 && plaintext != 0 && ciphertext != 0);
// add your code here
    for (int i = 0; i < cipher_size; i+=AES128_BLOCK_SIZE) { // cada i é um bloco de 16 bytes
        uint8_t dec_block[AES128_BLOCK_SIZE];
        aes128_block_dec(ctx, ciphertext + i, dec_block); // é preciso primeir decifrar para depois fazer a operaçao xOr
        for (int j = 0; j < 16; j++) { // cada j é um byte do bloco do i
            if (i == 0) {
                plaintext[j] = dec_block[j] ^ iv[j];
            } else {
                plaintext[j+i] = dec_block[j] ^ ciphertext[(i - AES128_BLOCK_SIZE) + j];
                // usar o bloco decifrado atual com o xOr da cifra anterior
                // slide 30 - 3.3-Modern_symmetric_cryptography-en.pdf
            }
        }
    }
// until here
}

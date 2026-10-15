#include <stdint.h>
#include <memory.h>
#include <assert.h>

#include "aes.h"
#include "ecb.h"

void
aes128_ecb_enc ( const void * ctx, const uint8_t * plaintext, const int plain_size, uint8_t * ciphertext )
{
    assert( ctx != 0 && plaintext != 0 && ciphertext != 0);
// TODO: add your code here
// until here
}

void
aes128_ecb_dec ( const void * ctx, const uint8_t * ciphertext, const int cipher_size, uint8_t * plaintext )
{
    assert( ctx != 0 && plaintext != 0 && ciphertext != 0);
// TODO: add your code here
// until here
}

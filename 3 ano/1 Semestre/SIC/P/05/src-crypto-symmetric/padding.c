// Helper file for SIC Lab on Symmetric Cryptography

#include <stdint.h>
#include <assert.h>
#include <string.h>
#include <memory.h>

#include "aes.h"
#include "padding.h"

// Adds PKCS#7 padding and returns the new plaintext length

int
add_padding( uint8_t * plain, const int plain_size )
{
    assert( plain != 0 );
// add your code here
    int X = 16 - (plain_size % 16);

    // plain aponta para o inicio do bloco, queremos o fim, logo somamos plain_size que nos apontará para o fim do bloco
    memset(plain + plain_size, X, X);

    return plain_size + X;
// until here
}

/*
 * Checks PKCS#7 padding and returns the original plaintext length (w/o padding)
 * If an error is found in the padding, it returns -1.
*/

int
rm_padding( uint8_t * padded, const int full_size )
{
    assert( padded != 0 );
// add your code here
    int X = padded[full_size - 1];

    if (X < 1 || X > AES128_BLOCK_SIZE) {
        return -1;
    }

    for (int i = (full_size - X);  i < full_size - 1; i++) {
        if (padded[i] != X) {
            return -1;
        }
    }

    memset(padded + full_size - X, 0x00, X);

    return full_size - X;
// until here
}

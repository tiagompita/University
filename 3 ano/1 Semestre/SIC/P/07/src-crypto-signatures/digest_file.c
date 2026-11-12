#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <openssl/evp.h>
#include <openssl/pem.h>
#include <openssl/err.h>

#include <assert.h>

#include "digest_file.h"

int
digest_file( int fd, EVP_MD * digest_func, uint8_t * digest )
{
    int digest_len = 0;

    assert(fd >=0 && digest_func != 0 && digest != 0);

    EVP_MD_CTX * ctx = EVP_MD_CTX_new();

    if (EVP_DigestInit_ex( ctx, digest_func, 0 ) == 0) {
        EVP_MD_CTX_free( ctx );
        return 0;
    }
    
    for(;;) {
        uint8_t buffer[8192]; // Typical file block size
        int len = read( fd, buffer, sizeof( buffer ) );

        if (len == -1) { // Reading error
            break;
        } else if (len == 0) { // EOF
            EVP_DigestFinal_ex( ctx, digest, &digest_len );
            assert( digest_len == EVP_MD_get_size( digest_func ) ); 
            break;
        } else { // Red len bytes
            EVP_DigestUpdate( ctx, buffer, len );
        }
    }

    EVP_MD_CTX_free( ctx );
    return digest_len;
}

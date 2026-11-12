#include <stdio.h>
#include <openssl/pem.h>

#include <assert.h>

#include "load_private_key.h"

EVP_PKEY *
load_private_key( const char * path, const char * type )
{
    assert( path != 0 );

    FILE * fp = fopen( path, "r" ); // Open to read, in binary or text formats (PEM uses ASCII)

    if (fp == 0) {
        fprintf( stderr, "Could not open file \"%s\" to read\n", path );
        return 0;
    }

    EVP_PKEY * key = PEM_read_PrivateKey ( fp, 0, 0, 0 );
    fclose( fp );

    if (key == 0) {
        fprintf( stderr, "Could not load private key from \"%s\"\n", path );
        return 0;
    }

    if (EVP_PKEY_is_a( key, type ) == 0) {
        fprintf( stderr, "Private key loaded from \"%s\" is not for %s\n", path, type );
        EVP_PKEY_free( key );
        return 0;
    }

    return key;
}

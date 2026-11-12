#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>
#include <memory.h>
#include <openssl/ec.h>
#include <openssl/evp.h>

#include <assert.h>

#include "load_private_key.h"
#include "digest_file.h"
#include "print_hex.h"

int
sign_digest_with_EC( EVP_PKEY * key, const uint8_t * digest, EVP_MD * digest_func, uint8_t ** signature, size_t * signature_len )
{
    assert( 0 );
}

int
main( int argc, char ** argv )
{
    EVP_PKEY * private_key = 0;
    uint8_t * digest = 0;
    uint8_t * signature = 0;
    size_t signature_len = 0;
    EVP_MD * digest_func;
    int fd = -1;
    int error = 1; // Wrong number of parameters

    if (argc < 4) {
        fprintf( stderr, "Usage: %s private_key_PEM_file digest_function [in_file] [out_signature_file]\n", argv[0] );
        fprintf( stderr, "\tdigest_function: SHA-1, SHA-256, SHA-384, etc.\n" );
        goto out;
    }

    error = 2; // Wrong parameters

    // Check digest function

    digest_func = EVP_MD_fetch( 0, argv[2], 0 );
    if (digest_func == 0) {
        fprintf( stderr, "No digest function \"%s\"\n", argv[2] );
        goto out;
    }

    // Load private key, which should be in a PEM file

    private_key = load_private_key( argv[1], "EC" );

    if (private_key == 0) {
        goto out;
    }

    // Set the file descriptor for reading the input file

    if (argc >= 4) {
        fd = open( argv[1], 0 );

        if (fd == -1) {
            fprintf( stderr, "Could not open to read input file \"%s\"\n", argv[3] );
            goto out;
        }
    } else {
        fd = 0; // stdin
    }

    error = 3; // Processing error

    // Calculate the digest of the input file

    digest = malloc( EVP_MD_get_size( digest_func ) );

    if (digest_file( fd, digest_func, digest ) == 0) {
        fprintf( stderr, "Could not compute the digest of the contents of \"%s\"\n", argv[3] );
        goto out;
    }

    close( fd );
    fd = -1;

    // Sign computed digest

    if (sign_digest_with_EC ( private_key, digest, digest_func, &signature, &signature_len ) == 0) {
        fprintf( stderr, "Signing failed\n" );
        goto out;
    }

    printf( "Signature length: %zu bytes\n", signature_len );
    printf( "Signature hex:\n");
    print_hex( signature, signature_len );

    // TODO: save signature in a file (if provided) or stdout (default) in binary or Base64

    error = 0;

out:
    if (fd != -1) close( fd );
    if (digest) free( digest );
    if (signature) free( signature );
    EVP_PKEY_free( private_key );

    return error;
}

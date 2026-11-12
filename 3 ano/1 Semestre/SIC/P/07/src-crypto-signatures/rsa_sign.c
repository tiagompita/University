#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <openssl/evp.h>
#include <openssl/rsa.h>

#include <assert.h>

#include "load_private_key.h"
#include "digest_file.h"
#include "print_hex.h"

static int
sign_digest_with_RSA( EVP_PKEY * key, const uint8_t * digest, EVP_MD * digest_func, int padding, uint8_t ** signature, size_t * signature_len )
{
    int ok = 0;
    EVP_PKEY_CTX *ctx = 0;
    int digest_len;

    assert( key != 0 &&
            digest != 0 && digest_func != 0 && 
            (padding == RSA_PKCS1_PADDING || padding == RSA_PKCS1_PSS_PADDING) &&
            signature != 0 && signature_len != 0 );

    *signature = 0;
    *signature_len = 0;

    ctx = EVP_PKEY_CTX_new_from_pkey( 0, key, 0 );
    if (ctx == 0) {
        goto cleanup;
    }

    if (EVP_PKEY_sign_init( ctx ) <= 0) {
        goto cleanup;
    }

    // Set digest function (the ASN.1 OID  of it is the header of the signed data)

    if (EVP_PKEY_CTX_set_signature_md( ctx, digest_func ) <= 0) {
        goto cleanup;
    }
    digest_len = EVP_MD_get_size( digest_func );

    // Set padding

    if (EVP_PKEY_CTX_set_rsa_padding( ctx, padding ) <= 0) {
        goto cleanup;
    }

    if (padding == RSA_PKCS1_PSS_PADDING) {
        // Set the MGF (Mask Generating Function) required for PSS (for simplicity, we use the same that was used for computing the digest)

        if (EVP_PKEY_CTX_set_rsa_mgf1_md( ctx, digest_func ) <= 0) {
            goto cleanup;
        }
        
        /*
         * PSS uses a random salt, use for it a length equal to digest length
         * Other alternatives are RSA_PSS_SALTLEN_MAX, RSA_PSS_SALTLEN_AUTO, RSA_PSS_SALTLEN_AUTO_DIGEST_MAX
         */

        if (EVP_PKEY_CTX_set_rsa_pss_saltlen( ctx, RSA_PSS_SALTLEN_DIGEST ) <= 0) {
            goto cleanup;
        }
    }

    /*
     * First call: get required signature size (null output buffer) to allocate space for the signature
     */

    if (EVP_PKEY_sign( ctx, 0, signature_len, digest, digest_len ) <= 0) {
        goto cleanup;
    }

    *signature = malloc( *signature_len );

    /*
     * Second call: generate the signature
     */

    if (EVP_PKEY_sign (ctx, *signature, signature_len, digest, digest_len ) <= 0) {
        free( *signature );
        *signature = 0;
        *signature_len = 0;
        goto cleanup;
    }

    ok = 1;

cleanup:
    EVP_PKEY_CTX_free( ctx );

    return ok;
}

int
main( int argc, char ** argv )
{
    EVP_PKEY * private_key = 0;
    uint8_t * digest = 0;
    uint8_t * signature = 0;
    size_t signature_len = 0;
    int padding;
    EVP_MD * digest_func;
    int fd = -1;
    int error = 1; // Wrong number of parameters

    if (argc < 4) {
        fprintf( stderr, "Usage: %s private_key_PEM_file padding digest_function [in_file] [out_signature_file]\n", argv[0] );
        fprintf( stderr, "\tpadding: PKCS1 or PSS\n\tdigest_function: SHA-1, SHA-256, SHA-384, etc.\n" );
        goto out;
    }

    error = 2; // Wrong parameters

    // Check padding 

    if (strcmp( argv[2], "PKCS1" ) == 0) padding = RSA_PKCS1_PADDING;
    else if (strcmp( argv[2], "PSS" ) == 0) padding = RSA_PKCS1_PSS_PADDING;
    else {
        fprintf( stderr, "Invalid padding \"%s\"\n", argv[2] );
        goto out;
    }

    // Check digest function

    digest_func = EVP_MD_fetch( 0, argv[3], 0 );
    if (digest_func == 0) {
        fprintf( stderr, "No digest function \"%s\"\n", argv[3] );
        goto out;
    }

    // Load private key, which should be in a PEM file

    private_key = load_private_key( argv[1], "RSA" );

    if (private_key == 0) {
        goto out;
    }

    // Set the file descriptor for reading the input file

    if (argc >= 5) {

        fd = open( argv[4], 0 );
        
        if (fd == -1) {
            fprintf( stderr, "Could not open to read input file \"%s\"\n", argv[4] );
            goto out;
        }
    } else {
        fd = 0; // stdin
    }

    error = 3; // Processing error

    // Calculate the digest of the input file

    digest = malloc( EVP_MD_get_size( digest_func ) );

    if (digest_file( fd, digest_func, digest ) == 0) {
        fprintf( stderr, "Could not compute the digest of the contents of \"%s\"\n", argv[4] );
        goto out;
    }

    close( fd );
    fd = -1;

    // Sign computed digest

    if (sign_digest_with_RSA ( private_key, digest, digest_func, padding, &signature, &signature_len ) == 0) {
        fprintf( stderr, "Signing failed\n" );
        goto out;
    }

    printf( "Signature length: %zu bytes\n", signature_len );
    printf( "Signature hex:\n");
    print_hex( signature, signature_len );

    // TODO: save signature in a file (if provided) or stdout (default) in binary or Base64

    int out_file = -1;
    if (argc >= 6) {
        out_file = open(argv[5], O_WRONLY | O_TRUNC | O_CREAT, 0644);
        
        if (out_file == -1) {
            fprintf( stderr, "Could not open to write output file \"%s\"\n", argv[5] );
            goto out;
        }
    } else {
        out_file = 1;
    }

    uint8_t * base64;
    int size_b64 = 4 * ( (signature_len + 2) / 3);

    base64 = malloc(size_b64 + 1);

    EVP_EncodeBlock(base64, signature, signature_len);

    write(out_file, base64, size_b64);

    if (out_file > 1) close(out_file);
    if (base64) free(base64);

    error = 0;

out:
    if (fd != -1) close( fd );
    if (digest) free( digest );
    if (signature) free( signature );
    EVP_PKEY_free( private_key );

    return error;
}

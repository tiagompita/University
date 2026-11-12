#include <stdio.h>
#include <openssl/pem.h>

#include <assert.h>

#include "load_certificate.h"

X509 *
load_certificate( const char * filename )
{
    assert( filename != 0 );

    FILE * fp = fopen( filename, "r" );
    X509 * cert = 0;

    if (fp == 0) return cert;

    cert = PEM_read_X509( fp, &cert, 0, 0 );

    fclose( fp );

    return cert;
}

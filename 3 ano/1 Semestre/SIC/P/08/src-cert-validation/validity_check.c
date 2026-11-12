#include <stdio.h>
#include <time.h>
#include <openssl/pem.h>

#include "load_certificate.h"
#include "valid_certificate.h"

int
main( int argc, char * argv[] )
{
    X509 * cert;

    if (argc < 2) {
        printf( "Usage: %s certificate_file\n", argv[0] );
        return -1;
    }

    cert = load_certificate( argv[1] );
    return valid_certificate( cert );
}

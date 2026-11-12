#include <stdio.h>
#include <time.h>
#include <openssl/pem.h>

#include "load_certificate.h"
#include "build_cert_path.h"
#include "validate_certification_chain.h"

int
main( int argc, char * argv[] )
{
    X509 * cert;
    X509 ** cert_path;
    int len;

    if (argc < 2) {
        printf( "Usage: %s certificate_file\n", argv[0] );
        return -1;
    }

    cert = load_certificate( argv[1] );
    cert_path = build_cert_path( cert, &len );

    if (validate_certification_chain( cert_path ) != 1) {
        printf( "Certification chain is invalid\n" );
        return 1;
    }

    printf( "Certification chain is valid\n" );

    return 0;
}

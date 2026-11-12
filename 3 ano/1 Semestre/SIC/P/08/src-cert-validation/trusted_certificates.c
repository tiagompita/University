#include <stdio.h>
#include <dirent.h>

#include <sys/stat.h>
#include <sys/param.h>

#include <openssl/x509.h>

#include "load_certificates.h"

int
main( int argc, char * argv[] )
{
    X509 ** certs;
    int len;

    if (argc < 2) {
        printf( "Usage: %s directory\n", argv[0] );
        return -1;
    }

    certs = load_certificates( argv[1], &len );

    printf( "%d valid trusted certificates found\n", len );
    
    return 0;
}

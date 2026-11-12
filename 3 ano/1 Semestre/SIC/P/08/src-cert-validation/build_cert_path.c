#include <stdio.h>

#include <openssl/x509.h>

#include <assert.h>

#include "get_ca_issuers_url.h"
#include "get_issuer_cert.h"

#include "build_cert_path.h"

X509 **
build_cert_path( X509 * cert, int * len )
{
    assert( cert != 0 );

    X509 * issuer = 0;
    X509 ** result;
    char cn[256];


    X509_NAME * subject_DN = X509_get_subject_name( cert );
    if (X509_NAME_get_text_by_NID( subject_DN, NID_commonName, cn, sizeof(cn) )) {
        printf( "%s\n", cn );
    }

    X509_NAME * issuer_DN = X509_get_issuer_name( cert );

    if (X509_NAME_cmp( subject_DN, issuer_DN) == 0) { // Same name, this means we reached the root certificate
        result = malloc( 2 * sizeof(X509 *) ); 
        result[0] = cert;
        result[1] = 0;
        *len = 1;

        return result;
    }

    // Not root, get issuer certicate\

    char * url = get_ca_issuers_url( cert );

    if (url != 0) { // There is a URL to get the issuer certificate
        issuer = get_issuer_cert( url );
        free( url );
        result = build_cert_path( issuer, len );
        (*len)++;
        result = realloc( result,(*len + 1) * sizeof(X509 *) );
        result[*len - 1] = cert; // Append this certificate to the array
        result[*len] = 0;
    }
    else { // No URL to get issuer
        result = malloc( 2 * sizeof(X509 *) ); 
        result[0] = cert;
        result[1] = 0;
        *len = 1;
    }

    return result;
}

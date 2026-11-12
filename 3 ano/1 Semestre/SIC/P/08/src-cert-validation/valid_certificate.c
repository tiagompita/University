#include <stdio.h>
#include <time.h>
#include <openssl/pem.h>

#include <assert.h>

#include "valid_certificate.h"

int
valid_certificate( X509 * cert )
{
    ASN1_TIME now = {0};
    const ASN1_TIME * start;
    const ASN1_TIME * end;
    time_t utc;
    char time1[100], time2[100];
    BIO * mem;

    assert( cert != 0 );

    // Certificate times refer to UTC

    // Get current time in UTC

    ASN1_TIME_set( &now, time( 0 ) );

// TODO: add your code here
    start = X509_get0_notBefore(cert);
    end = X509_get0_notAfter(cert);
    
    if (start == NULL || end == NULL) {
        return 0;
    }

    if (ASN1_TIME_compare(&now, start) >= 0 &&
        ASN1_TIME_compare(end, &now) >= 0) {
            return 1;
        }

    return 0;
// until here
}

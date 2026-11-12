#include <stdio.h>
#include <openssl/x509.h>
#include <openssl/x509v3.h>
#include <openssl/objects.h>

char *
get_ca_issuers_url( X509 * cert )
{
    AUTHORITY_INFO_ACCESS * aia = 0;
    char * result = 0;

    aia = X509_get_ext_d2i( cert, NID_info_access, 0, 0 );

    if (aia == 0) {
        printf( "No Authority Information Access extension\n" );
        return 0;
    }

    for (int i = 0; i < sk_ACCESS_DESCRIPTION_num( aia ); i++) {
        ACCESS_DESCRIPTION * ad = sk_ACCESS_DESCRIPTION_value( aia, i );

        // Look specifically for CA Issuers
        if (OBJ_obj2nid(ad->method) == NID_ad_ca_issuers) {
            if (ad->location->type == GEN_URI) {
                // Duplicate the string because it points to a structure that is going to be released
                result = strdup( (char *) ASN1_STRING_get0_data( ad->location->d.uniformResourceIdentifier ) );
                break;
            }
        }
    }

    AUTHORITY_INFO_ACCESS_free( aia );

    return result;
}

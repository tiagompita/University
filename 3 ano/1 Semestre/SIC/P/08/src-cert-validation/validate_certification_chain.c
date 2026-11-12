#include <stdio.h>

#include <openssl/evp.h>
#include <openssl/x509.h>
#include <openssl/x509v3.h>

#include "validate_certification_chain.h"

/*
 * Check that a CA certificate has:
 *   - Basic Constraints extension
 *   - CA = TRUE
 *   - Critical extension
 */
static int
validate_basic_constraints( X509 * cert )
{
    int critical = -1;
    int valid;

    BASIC_CONSTRAINTS * bc = X509_get_ext_d2i( cert, NID_basic_constraints, &critical, 0 );

    if (bc == 0) return 0;

    valid = (bc->ca != 0 && critical == 1);

    BASIC_CONSTRAINTS_free( bc );

    return valid;
}

/*
 * Check that a CA certificate has:
 *   - Key Usage extension
 *   - keyCertSign bit set
 *   - Critical extension
 */
static int
validate_key_usage(X509 *cert)
{
    int critical = -1;
    int valid;

    ASN1_BIT_STRING * usage = X509_get_ext_d2i( cert, NID_key_usage, &critical, 0 );

    if (usage == 0) return 0;

    /*
     * keyCertSign is bit 5 in the ASN.1 Key Usage BIT STRING
     */
    int key_cert_sign = ASN1_BIT_STRING_get_bit( usage, 5 );

// TODO - add your code here
// until here

    ASN1_BIT_STRING_free( usage );

    return valid;
}

/*
 * Check that the CA certificate public key key validate the signature of the subject certificate
 */
static int
validate_signature( X509 * subject, X509 * issuer )
{
// TODO - add your code here
// until here

    return 1;
}

/*
 * Check that the CA certificate public key key validate the signature of the subject certificate
 */
static int
revoked( X509 * cert )
{
// TODO - add your code here
// until here

    return 0;
}


/*
 * Validate the entire certificate chain
 *
 * chain:
 *   Element [0] is initially the root
 *   Last valid element should be a leaf certificate
 *   Terminates with a null pointer
 *
 * Returns:
 *   1 = valid
 *   0 = invalid
 */
int
validate_certification_chain( X509 ** chain )
{
    int result = 0;
    int count = 0;
    X509 * issuer = chain[0];
    X509 * subject = chain[1];
    EVP_PKEY * pubkey;

    if (subject == 0) return 1;

    /*
     * Validate CA properties and signatures.
     */

    // Verify issuer CA properties
    if (validate_basic_constraints( issuer ) == 0) {
        printf( "Invalid Basic Constraints\n" );
        return 0;
    }

    if (validate_key_usage( issuer ) == 0) {
        printf( "Invalid Key Usage\n" );
        return 0;
    }

    // Verify certificate signature
    if (validate_signature( subject, issuer ) == 0) {
        printf( "Invalid issuer signature\n" );
        return 0;
    }

    // Verify certificate signature
    if (revoked( subject ) == 1) {
        printf( "Certificate revoked\n" );
        return 0;
    }

    // Check one level below
    return validate_certification_chain( chain + 1 );
}


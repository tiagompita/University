#include <stdio.h>

#include <openssl/x509.h>
#include <openssl/pem.h>

#include <curl/curl.h>

#include "get_issuer_cert.h"

static size_t
write_callback( char *ptr, size_t size, size_t nmemb, void * userdata )
{
    BIO * bio = (BIO *) userdata;

    if (size != 0 && nmemb > SIZE_MAX / size)
        return 0;

    size_t total = size * nmemb;
    size_t result = 0;

    while (total != 0) {
        size_t n = 0;

        if (BIO_write_ex( bio, ptr, total, &n ) != 1 || n == 0) {
            return 0;
        }

        ptr += n;
        total -= n;
        result += n;
    }

    return result;
}

X509 *
get_issuer_cert( const char * url )
{
    X509 * cert = 0;
    CURL * curl = curl_easy_init();
    BIO * bio = BIO_new( BIO_s_mem() );
    CURLcode curl_err;

    if (curl == 0 || bio == 0) goto cleanup;

    curl_easy_setopt( curl, CURLOPT_URL, url );
    curl_easy_setopt( curl, CURLOPT_WRITEFUNCTION, write_callback );
    curl_easy_setopt( curl, CURLOPT_WRITEDATA, bio );
    curl_easy_setopt( curl, CURLOPT_FOLLOWLOCATION, 1L );
    curl_easy_setopt( curl, CURLOPT_FAILONERROR, 1L );

    if ((curl_err = curl_easy_perform( curl )) != CURLE_OK) {
        printf( "Download failed: %s\n", curl_easy_strerror( curl_err ) );
        goto cleanup;
    }

    cert = PEM_read_bio_X509( bio, 0, 0, 0 );

    if (cert == 0) { // The certificate may be in a binary format (not PEM)
        BIO_set_flags( bio, BIO_FLAGS_NONCLEAR_RST );
        BIO_reset( bio );
        cert = d2i_X509_bio( bio, 0 );
    }

cleanup:
    if (curl != 0) curl_easy_cleanup( curl );
    if (bio != 0) BIO_free( bio );

    return cert;
}

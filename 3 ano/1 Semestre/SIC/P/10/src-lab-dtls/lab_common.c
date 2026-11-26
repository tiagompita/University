#define _POSIX_C_SOURCE 200809L
#include <arpa/inet.h>
#include <errno.h>
#include <fcntl.h>
#include <openssl/err.h>
#include <openssl/ssl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <time.h>

#include "lab_common.h"

void
fail( char * message )
{
    fprintf( stderr, "%s\n", message );
    ERR_print_errors_fp( stderr );
    exit( EXIT_FAILURE );
}

void
fail_system( char * message )
{
    perror( message );
    exit( EXIT_FAILURE );
}

double
monotonic_seconds()
{
    struct timespec t;
    if (clock_gettime( CLOCK_MONOTONIC, &t ) != 0) fail_system( "clock_gettime" );
    return (double) t.tv_sec + (double) t.tv_nsec / 1e9;
}

struct sockaddr_in
loopback_address( unsigned short port )
{
    struct sockaddr_in a = {0};
    a.sin_family = AF_INET;
    a.sin_port = htons( port );
    if (inet_pton( AF_INET, LAB_IP, &a.sin_addr ) != 1) fail_system( "inet_pton" );
    return a;
}

void
load_server_identity( SSL_CTX * ctx )
{
    if (SSL_CTX_use_certificate_file( ctx, CERT_FILE, SSL_FILETYPE_PEM ) != 1 ||
        SSL_CTX_use_PrivateKey_file( ctx, KEY_FILE, SSL_FILETYPE_PEM ) != 1 ||
        SSL_CTX_check_private_key( ctx ) != 1) {
        fail( "Server certificate/private key error" );
    }
}

/* Laboratory-only traffic decryption: log NSS SSLKEYLOGFILE session secrets.
 * The callback receives one complete line (without a trailing newline).
 * Keep the file private: anyone with it and a capture can decrypt the session.
 * Each lab client has one SSL connection and runs single-threaded.
 */
static FILE * keylog_stream = 0;
static int keylog_write_error = 0;

void
log_tls_secrets( const SSL * ssl, const char * line )
{
    // The ssl pointer context is not used
    (void)ssl;

    if (fprintf( keylog_stream, "%s\n", line ) < 0 ||
        fflush( keylog_stream ) != 0) {
        keylog_write_error = 1;
    }
}

/* Register BEFORE SSL_new()/SSL_connect(), including for DTLS 1.2. */
void
enable_keylog( SSL_CTX * ctx )
{
    char * path = getenv( "SSLKEYLOGFILE" );
    if (path == 0 || path[0] == '\0') path = "tls-secrets.log";
    int fd = open( path, O_WRONLY | O_APPEND | O_CREAT, S_IRUSR | S_IWUSR );
    if (fd < 0) fail_system( "Cannot open TLS session-key log" );
    /* The file may exist from a previous run with overly broad permissions. */
    if (fchmod( fd, S_IRUSR | S_IWUSR ) != 0)
        fail_system( "Cannot restrict TLS session-key log permissions" );
    keylog_stream = fdopen( fd, "a" );
    if (!keylog_stream) fail_system( "fdopen(TLS session-key log)" );
    SSL_CTX_set_keylog_callback( ctx, log_tls_secrets );
    printf( "Wireshark TLS/DTLS key log: %s\n", path );
}

void
finish_keylog()
{
    if (!keylog_stream) return;
    int close_failed = fclose( keylog_stream ) != 0;
    keylog_stream = 0;
    if (keylog_write_error || close_failed) fail_system( "Writing the TLS session-key log failed" );
}

/* Call on the context BEFORE SSL_new(), so each SSL object inherits verification. */
void
load_client_trust( SSL_CTX * ctx, char * ca_file )
{
    SSL_CTX_set_verify( ctx, SSL_VERIFY_PEER, 0 );
    if (SSL_CTX_load_verify_locations( ctx, ca_file, 0 ) != 1)
        fail( "Cannot load trusted CA" );
}

/* Hostname verification is configured on the specific SSL connection. */
void
require_server_hostname( SSL * ssl, char * hostname )
{
    if (SSL_set1_host( ssl, hostname ) != 1)
        fail( "Cannot configure expected DNS name" );
}

void
print_session( SSL * ssl )
{
    printf( "Protocol: %s; cipher: %s\n", SSL_get_version( ssl ), SSL_get_cipher_name( ssl ));
}

/* Deliberately one short application record per experiment. */
void exchange_as_client( SSL * ssl ) {
    char buf[2048];
    size_t got = 0, sent = 0;
    double start = monotonic_seconds();
    if (SSL_write_ex( ssl, "ping", 4, &sent ) != 1) fail( "SSL_write_ex(ping) failed");
    if (SSL_read_ex( ssl, buf, sizeof(buf), &got ) != 1)
        fail( "SSL_read_ex(pong) failed" );
    printf( "Reply: %.*s; application RTT: %.3f ms\n",
           (int)got, buf, (monotonic_seconds() - start) * 1e3 );
}

void exchange_as_server( SSL * ssl ) {
    char buf[2048];
    size_t got = 0, sent = 0;
    if (SSL_read_ex( ssl, buf, sizeof(buf), &got ) != 1) fail( "SSL_read_ex(ping) failed" );
    printf( "Request: %.*s\n", (int)got, buf );
    if (SSL_write_ex( ssl, "pong", 4, &sent ) != 1) fail( "SSL_write_ex(pong) failed" );
}

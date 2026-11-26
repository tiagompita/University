#include <stdio.h>
#include <unistd.h>
#include <netinet/in.h>
#include <openssl/ssl.h>

#include "lab_common.h"

// Usage: ./tls_client [expected-DNS-name] [CA-file]

int
main( int argc, char * argv[] )
{
    char * hostname;
    char * ca_file;
    int fd;
    struct sockaddr_in addr;
    double start;
    SSL_CTX * ctx;
    SSL * ssl;

    hostname = argc > 1 ? argv[1] : "localhost";
    ca_file = argc > 2 ? argv[2] : CA_FILE;

    // Create a client-side TLS context
    ctx = SSL_CTX_new( TLS_client_method() );
    if (!ctx) fail( "SSL_CTX_new(TLS_client_method)" );

    // TLS 1.2+; TLS 1.3 is preferred automatically when available
    if (!SSL_CTX_set_min_proto_version( ctx, TLS1_2_VERSION )) fail( "Minimum TLS version" );

    // Load root CA
    load_client_trust( ctx, ca_file );

    // Export session key for analysing network captures, using Wireshark NSS-format traffic secrets
    enable_keylog( ctx ); 

    // Create a new TLS context, to handle an TLS connection
    ssl = SSL_new( ctx );
    if (!ssl) fail( "SSL_new" );

    // Set a requirement: accept only a server having a name given by hostname
    require_server_hostname( ssl, hostname );
    if (SSL_set_tlsext_host_name( ssl, hostname ) != 1) fail( "SNI setup failed" );

    // Create the TCP socket to handle the TLS transport
    fd = socket( AF_INET, SOCK_STREAM, 0 );
    if (fd < 0) fail_system( "socket" );

    // Prepare socket to connect to server address
    addr = loopback_address( TLS_PORT );

    // Make the connection to the server
    if (connect( fd, (struct sockaddr *) &addr, sizeof(addr) ) < 0) fail_system( "connect" );

    // Associate the TLS context to a TCP connection
    if (SSL_set_fd( ssl, fd ) != 1) fail( "SSL_set_fd" );

    // Start a timer to provide the TLS connection time
    start = monotonic_seconds();

    // Connect to a TLS server on top of the TCP socket
    if (SSL_connect( ssl ) != 1) fail( "TLS handshake/certificate verification failed" );

    // Print TLS connection time
    printf( "Handshake: %.3f ms\n", (monotonic_seconds() - start) * 1e3 );

    print_session( ssl );

    // Perform the ping/pong message exchange over TLS
    exchange_as_client( ssl );

    // Terminate TLS and socket
    SSL_shutdown( ssl );
    SSL_free( ssl );
    close( fd );
    SSL_CTX_free( ctx );
    finish_keylog();

    return 0;
}

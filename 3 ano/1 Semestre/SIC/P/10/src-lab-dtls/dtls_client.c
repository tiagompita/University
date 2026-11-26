#include <stdio.h>
#include <unistd.h>
#include <netinet/in.h>
#include <openssl/ssl.h>

#include "lab_common.h"

// Usage: ./dtls_client [expected-DNS-name] [CA-file]
int
main(int argc, char * argv[])
{
    char * hostname;
    char * ca_file;
    int fd;
    struct sockaddr_in addr;
    double start;
    SSL_CTX * ctx;
    SSL * ssl;
    BIO * bio;
    BIO_ADDR * peer;

    hostname = argc > 1 ? argv[1] : "localhost";
    ca_file = argc > 2 ? argv[2] : CA_FILE;

    // Create a client-side DTLS context
    ctx = SSL_CTX_new( DTLS_client_method() );
    if (!ctx) fail( "SSL_CTX_new(DTLS_client_method)" );

    // Fixed DTLS 1.2 for comparable captures across lab machines
    if (!SSL_CTX_set_min_proto_version( ctx, DTLS1_2_VERSION ) ||
        !SSL_CTX_set_max_proto_version( ctx, DTLS1_2_VERSION )) fail( "DTLS version" );

    // Load root CA
    load_client_trust( ctx, ca_file );

    // Export session key for analysing network captures, using Wireshark NSS-format traffic secrets
    enable_keylog( ctx );

    // Create a new DTLS context, to handle a DTLS connection
    ssl = SSL_new( ctx );
    if (!ssl) fail( "SSL_new" );

    // Set a requirement: accept only a server having a name given by hostname
    require_server_hostname( ssl, hostname );

    // Create the UDP socket to handle the DTLS transport
    fd = socket( AF_INET, SOCK_DGRAM, 0 );
    if (fd < 0) fail_system( "socket" );

    // Prepare socket to connect to server address
    addr = loopback_address(DTLS_PORT);
    if (connect( fd, (struct sockaddr *) &addr, sizeof(addr) ) < 0) fail_system( "UDP connect" );

    // Create a BIO (Basic Inout/Ouput) object to read/write over the socket
    bio = BIO_new_dgram( fd, BIO_NOCLOSE );
    if (!bio) fail( "BIO_new_dgram" );

    // Associate the BIO to the DTLS secure channel for reading and writing
    SSL_set_bio( ssl, bio, bio );

    // Prepare BIO to connect to server address
    peer = BIO_ADDR_new();
    if (!peer || !BIO_ADDR_rawmake( peer, AF_INET, &addr.sin_addr, sizeof(addr.sin_addr), addr.sin_port )) fail( "BIO_ADDR setup" );
    if (BIO_ctrl_set_connected( SSL_get_rbio( ssl ), peer ) <= 0) fail( "BIO_ctrl_set_connected" );
    BIO_ADDR_free( peer );

    // Start a timer to provide the DTLS connection time
    start = monotonic_seconds();

    // Make the connection to the server
    if (SSL_connect( ssl ) != 1) fail( "DTLS handshake/certificate verification failed" );

    // Print DTLS connection time
    printf( "Handshake: %.3f ms\n", (monotonic_seconds() - start) * 1e3 );

    print_session( ssl );

    // Perform the ping/pong message exchange over DTLS
    exchange_as_client( ssl );

    // Terminate DTLS and socket
    SSL_shutdown( ssl );
    SSL_free( ssl );
    close( fd );
    SSL_CTX_free( ctx );
    finish_keylog();

    return 0;
}

#include <stdio.h>
#include <unistd.h>
#include <netinet/in.h>
#include <openssl/ssl.h>

#include "lab_common.h"

int
main()
{
    SSL_CTX * ctx;
    int server_fd;
    int client_fd;
    int one = 1;
    struct sockaddr_in addr;
    SSL * ssl;

    // Create a server-side TLS context
    ctx = SSL_CTX_new( TLS_server_method() );

    if (!ctx) fail( "SSL_CTX_new(TLS_server_method)" );

    // TLS 1.2+; TLS 1.3 is preferred automatically when available
    if (!SSL_CTX_set_min_proto_version( ctx, TLS1_2_VERSION )) fail( "Minimum TLS version" );

    load_server_identity( ctx );

    // Create the TCP socket to handle the TLS transport
    server_fd = socket(AF_INET, SOCK_STREAM, 0);
    if (server_fd < 0) fail_system( "socket" );

    // This flag is not critical, but usefull if the server terminates and is immediately reinitiated
    setsockopt( server_fd, SOL_SOCKET, SO_REUSEADDR, &one, sizeof(one) );

    // Prepare socket to receive incomming connections: bind to an address and put it in listenning mode
    addr = loopback_address( TLS_PORT );
    if (bind( server_fd, (struct sockaddr *) &addr, sizeof(addr) ) < 0) fail_system( "bind" );
    if (listen( server_fd, 1) < 0) fail_system( "listen" );
    printf( "TLS listening on %s:%d\n", LAB_IP, TLS_PORT );

    // Wait for a client
    client_fd = accept( server_fd, 0, 0 );
    if (client_fd < 0) fail_system( "accept" );

    // Create a new TLS context, to handle an TLS connection
    ssl = SSL_new( ctx );
    if (!ssl) fail( "SSL_new" );

    // Associate the TLS context to a TCP connection
    if (SSL_set_fd( ssl, client_fd ) != 1) fail( "SSL_set_fd" );

    // Wait for a TLS client on top of the TCP socket
    if (SSL_accept( ssl ) != 1) fail( "SSL_accept failed" );
    print_session( ssl );

    // Perform the ping/pong message exchange over TLS
    exchange_as_server( ssl );

    // Terminate TLS and socket
    SSL_shutdown( ssl );
    SSL_free( ssl );
    close( client_fd );
    close( server_fd );
    SSL_CTX_free( ctx );

    return 0;
}

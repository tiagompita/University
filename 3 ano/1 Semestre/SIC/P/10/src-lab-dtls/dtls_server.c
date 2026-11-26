#include <stdio.h>
#include <unistd.h>
#include <netinet/in.h>
#include <openssl/ssl.h>
#include <openssl/hmac.h>
#include <openssl/rand.h>
#include <openssl/crypto.h>

#include "lab_common.h"

// A per-process secret for stateless address-validation cookies
static unsigned char cookie_secret[32];

static int
calculate_cookie( SSL * ssl, unsigned char * cookie, unsigned int * cookie_len )
{
    BIO_ADDR * peer;
    int family;
    unsigned short port;
    unsigned char ip[16], input[2 + 16 + 2];
    size_t ip_len = sizeof(ip);
    int ok = 0;

    // Get peer address
    peer = BIO_ADDR_new();
    if (!peer || BIO_dgram_get_peer( SSL_get_rbio( ssl ), peer ) <= 0) goto done;

    // Get UDP/IP data for computing cookie
    family = BIO_ADDR_family( peer );
    if (family != AF_INET && family != AF_INET6) goto done; // Nust be an AF_INETx familty
    if (!BIO_ADDR_rawaddress( peer, ip, &ip_len )) goto done; // Must have an IP address
    port = BIO_ADDR_rawport( peer ); // Port already in network byte order

    // Concatenate data for computing its MAC
    input[0] = (unsigned char) (family >> 8);
    input[1] = (unsigned char)family;
    memcpy( input + 2, ip, ip_len );
    memcpy( input + 2 + ip_len, &port, sizeof(port) );

    // Calculate cookie as MAC-SHA-256(cookie_secret,family | IP | port)
    ok = HMAC( EVP_sha256(), cookie_secret, sizeof(cookie_secret), input, (int)(2 + ip_len + sizeof(port)), cookie, cookie_len ) != 0;

 done:
    BIO_ADDR_free( peer );

    return ok;
}

// Callback to create a cookie
static int
create_cookie( SSL * ssl, unsigned char * cookie, unsigned int * len )
{
    return calculate_cookie( ssl, cookie, len );
}

// Callback to verify a cookie
static int
verify_cookie( SSL * ssl, const unsigned char * cookie, unsigned int len )
{
    unsigned char expected[EVP_MAX_MD_SIZE];
    unsigned int expected_len = 0;

    // Received cookie must be equal to the received one
    return calculate_cookie( ssl, expected, &expected_len ) && len == expected_len && CRYPTO_memcmp( cookie, expected, len ) == 0;
}

int
main()
{
    SSL_CTX * ctx;
    int fd;
    struct sockaddr_in addr;
    BIO * bio;
    BIO_ADDR * peer;
    int result;
    struct sockaddr_in client = {0};
    size_t addr_len = sizeof(client.sin_addr);
    SSL * ssl;
    
    // Create a server-side DTLS context
    ctx = SSL_CTX_new( DTLS_server_method() );
    if (!ctx) fail( "SSL_CTX_new(DTLS_server_method)" );

    // Fixed DTLS 1.2 for comparable captures across lab machines
    if (!SSL_CTX_set_min_proto_version( ctx, DTLS1_2_VERSION ) || !SSL_CTX_set_max_proto_version( ctx, DTLS1_2_VERSION )) fail( "DTLS version" );

    // Cache extra bytes that can be read from the DTLS secure channel
    SSL_CTX_set_read_ahead( ctx, 1 );

    // Load the server identity (private key and certificate)
    load_server_identity( ctx );

    // Generate DTLS server cookie
    if (RAND_bytes( cookie_secret, sizeof(cookie_secret) ) != 1) fail( "RAND_bytes" );
    SSL_CTX_set_cookie_generate_cb( ctx, create_cookie );
    SSL_CTX_set_cookie_verify_cb( ctx, verify_cookie );

    // Create the UDP socket to handle the DTLS transport
    fd = socket( AF_INET, SOCK_DGRAM, 0 );
    if (fd < 0) fail_system( "socket" );

    // Prepare socket to handle client "connections"
    addr = loopback_address( DTLS_PORT );
    if (bind( fd, (struct sockaddr *) &addr, sizeof(addr) ) < 0) fail_system( "bind" );

    // Create a new DTLS context, to handle a DTLS connection
    ssl = SSL_new( ctx );
    if (!ssl) fail( "SSL_new" );

    // Create a BIO (Basic Inout/Ouput) object to read/write over the socket
    bio = BIO_new_dgram( fd, BIO_NOCLOSE );
    if (!bio) fail( "BIO_new_dgram" );

    // Associate the BIO to the DTLS secure channel for reading and writing
    SSL_set_bio( ssl, bio, bio );

    // Prepare BIO to use the server address
    peer = BIO_ADDR_new();
    if (!peer) fail( "BIO_ADDR_new" );
    printf( "DTLS listening on %s:%d; awaiting validated ClientHello\n", LAB_IP, DTLS_PORT );

    // Wait for a client onnection
    do {
        result = DTLSv1_listen( ssl, peer );
    } while (result == 0);
    if (result < 0 || BIO_ADDR_family( peer ) != AF_INET) fail( "DTLSv1_listen failed" );

    // Do not leave a datagram BIO unconnected after the cookie exchange
    addr_len = sizeof( client.sin_addr );
    client.sin_family = AF_INET;
    client.sin_port = BIO_ADDR_rawport( peer );
    if (!BIO_ADDR_rawaddress( peer, &client.sin_addr, &addr_len )) fail( "Cannot extract peer IPv4 address" );

    // Make the "connection" to the client
    if (connect( fd, (struct sockaddr *) &client, sizeof(client) ) < 0) fail_system( "UDP connect" );
    if (BIO_ctrl_set_connected( SSL_get_rbio( ssl ), peer ) <= 0) fail( "BIO_ctrl_set_connected" );
    BIO_ADDR_free( peer );

    // Wait for a DTLS client on top of the TCP socket
    if (SSL_accept( ssl ) != 1) fail( "DTLS SSL_accept failed" );
    print_session( ssl );
    
    // Perform the ping/pong message exchange over TLS
    exchange_as_server( ssl );

    // Terminate DTLS and socket
    SSL_shutdown( ssl );
    SSL_free( ssl );
    close( fd );
    SSL_CTX_free( ctx );

    return 0;
}

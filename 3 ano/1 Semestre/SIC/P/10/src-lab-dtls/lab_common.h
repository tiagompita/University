#ifndef LAB_COMMON_H
#define LAB_COMMON_H

#define LAB_IP "127.0.0.2"
#define TLS_PORT 8443
#define DTLS_PORT 4444
#define CERT_FILE "server_crt.pem"
#define KEY_FILE "server_keys.pem"
#define CA_FILE "ca_crt.pem"

void fail( char * message );
void fail_system( char * message );

double monotonic_seconds();

struct sockaddr_in loopback_address( unsigned short port );
void load_server_identity( SSL_CTX * ctx );
void log_tls_secrets( const SSL * ctx, const char * line );
void enable_keylog( SSL_CTX * ctx );
void finish_keylog();
void load_client_trust( SSL_CTX * ctx, char * ca_file );
void require_server_hostname( SSL * ctx, char * hostname );
void print_session( SSL * ctx );

void exchange_as_client( SSL * ctx );
void exchange_as_server( SSL * ctx );

#endif // LAB_COMMON_H

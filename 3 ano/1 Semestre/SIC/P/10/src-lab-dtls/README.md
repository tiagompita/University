# SIC DTLS laboratory — OpenSSL C edition

Target: Debian GNU/Linux 13 (Trixie), system OpenSSL 3.5 (`openssl`, `libssl-dev`).
The latest observed Debian stable security package was `3.5.7-1~deb13u3`
(as of 2026-11-17). The laboratory was built and run using OpenSSL 3.5.5.

## Setup

```sh
sudo apt update
sudo apt install openssl libssl-dev build-essential
make
sh generate-certs.sh
```

## TLS

Terminal 1: `./tls_server`

Terminal 2: `./tls_client`

## DTLS

Terminal 1: `./dtls_server`

Terminal 2: `./dtls_client`

## Decrypt TLS and DTLS traffic with Wireshark

Both clients now export **session secrets** (not plaintext packets) in the
NSS/SSLKEYLOGFILE format, using OpenSSL's `SSL_CTX_set_keylog_callback()`.
No server change or disabled certificate verification is required.

By default, each client **appends** to `tls-secrets.log` in the working directory.
Use `SSLKEYLOGFILE` to choose a different path, e.g.:

```sh
SSLKEYLOGFILE="$PWD/tls-secrets.log" ./tls_client
SSLKEYLOGFILE="$PWD/tls-secrets.log" ./dtls_client
```

The log is created with owner-only permissions (`0600`), or an existing file's
permissions are restricted to `0600`. Keep it private. The same log can contain
secrets from several TLS/DTLS connections; to start a new exercise, remove it
before starting the clients (`rm -f tls-secrets.log`).

1. Start capture on the Linux loopback interface **before** starting a client.
   Capture filter: `tcp port 8443 or udp port 4444`. For example:

   ```sh
   sudo tshark -i lo -f 'tcp port 8443 or udp port 4444' -w sic-lab.pcapng
   ```

2. Start `./tls_server` (TCP 8443) or `./dtls_server` (UDP 4444) in one terminal.
   Start the matching client in another terminal; let the handshake finish.
3. In Wireshark, use **Edit → Preferences → Protocols → TLS →
   (Pre)-Master-Secret log filename** and select the *absolute path* to
   `tls-secrets.log` (or the path set via `SSLKEYLOGFILE`). Open or reload
   `sic-lab.pcapng`. If necessary, use **Analyze → Decode As** to recognize
   the nonstandard TLS/DTLS ports.
4. Inspect the decrypted application record containing `ping`/`pong`.

Expected key-log lines (do not submit your actual secrets):

- TLS 1.3: `CLIENT_HANDSHAKE_TRAFFIC_SECRET`, `SERVER_HANDSHAKE_TRAFFIC_SECRET`,
  `CLIENT_TRAFFIC_SECRET_0`, `SERVER_TRAFFIC_SECRET_0` and possibly additional
  entries.
- DTLS 1.2: `CLIENT_RANDOM` followed by the client random and master secret.

**Important:** The session-key file defeats captured traffic confidentiality.
Never upload, commit, email or distribute it; delete it after the lab. The ZIP
contains no session secrets. Key logging is for controlled laboratory use only.

## Security tests

Restart the corresponding server for each client invocation.
`./tls_client wrong.example` and `./dtls_client wrong.example` **must fail**.

`./tls_client localhost /etc/ssl/certs/ca-certificates.crt` and the DTLS
analogue should fail **if the local test CA is not present in system trust**.
For a deterministic test, create an unrelated CA as described in the guide.

## Notes

* Server is single-client and loopback-only.
* TLS negotiates TLS 1.3 on a default Debian OpenSSL 3.5 build.
* DTLS is intentionally fixed to 1.2; Debian stable OpenSSL 3.5 lacks DTLS 1.3.
* DTLS server uses `DTLSv1_listen()` and HMAC address-validation cookies.
* Both clients validate trust chain AND DNS identity.
* On UDP, `connect()` only sets/restricts a peer. It does not make UDP reliable.
* Both secure clients send one four-byte request and read one four-byte reply.
* `application RTT` is not throughput or one-way latency.
* Programs do not implement full multi-peer service, bounded UDP retry loops,
  congestion control, or production resource management.

OpenSSL source files in the archive: lab_common.h, tls_client.c, tls_server.c,
dtls_client.c, dtls_server.c, Makefile, generate-certs.sh, ca_extensions.cnf.
The accompanying guide `lab-DTLS-openssl.md` contains all sources as an appendix.

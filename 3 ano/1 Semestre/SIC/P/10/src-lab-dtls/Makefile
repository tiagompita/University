CC ?= cc

CFLAGS ?= -O2 -g -Wall -Wextra -Wpedantic -std=c11

LDLIBS = -lssl -lcrypto

PROGRAMS = tls_server tls_client dtls_server dtls_client

all: $(PROGRAMS)

tls_server: tls_server.o lab_common.o
	$(CC) -o $@ $^ $(LDLIBS)

tls_client: tls_client.o lab_common.o
	$(CC) -o $@ $^ $(LDLIBS)

dtls_server: dtls_server.o lab_common.o
	$(CC) -o $@ $^ $(LDLIBS)

dtls_client: dtls_client.o lab_common.o
	$(CC) -o $@ $^ $(LDLIBS)

%.o: %.c lab_common.h
	$(CC) $(CFLAGS) -o $@ -c $< $(LDLIBS)

clean:
	rm -f $(PROGRAMS) *.o

.PHONY: all clean

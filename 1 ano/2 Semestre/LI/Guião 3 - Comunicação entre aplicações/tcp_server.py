import socket

def main():
    tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp_s.bind(("127.0.0.1", 1234))
    tcp_s.listen(1) #maximo de 1 cliente à espera de aceitaçao

    # esperar por novo cliente
    client_s, client_addr = tcp_s.accept()

    try:
        while True:
            b_data = client_s.recv(4096)
            client_s.send(b_data.upper())
    finally:
        client_s.close()
        tcp_s.close()

main()
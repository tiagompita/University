import socket
import select
import sys

def main():
    tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp_s.bind(("127.0.0.1", 0))
    tcp_s.connect(("127.0.0.1", 1234)) # ligar ao servidor

    try:
        while True:
            read_sockets = select.select([tcp_s, sys.stdin, ], [], [])[0]

            for sock in read_sockets:
                if sock == tcp_s:
                    #informaçao recebida no socket
                    b_data = tcp_s.recv(4096)
                    sys.stdout.write("%s \n" % b_data.decode("utf-8"))

                elif sock == sys.stdin:

                    #informaçao recebida no teclado
                    str_data = sys.stdin.readline()
                    tcp_s.send(str_data.encode("utf-8"))
    finally:
        tcp_s.close()

main()
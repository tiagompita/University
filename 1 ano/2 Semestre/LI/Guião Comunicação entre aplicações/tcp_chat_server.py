import socket
import select


def main():
    tcp_s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    tcp_s.bind(("0.0.0.0", 1234)) # Clientes multiplos na porta indicada
    tcp_s.listen(10) # Aceitar 10 clientes
    connections = []

    connections.append(tcp_s)
    print("Chat server started")

    try:
        while True:
            # Lista de sockets que podem ser lidos pelo select
            read_sockets = select.select(connections, [], [])[0]

            for sock in read_sockets:
                if sock == tcp_s: #Novo cliente?
                    # Adicionar o socket do novo cliente à lista de sockets conhecidos
                    client_s, addr = tcp_s.accept()
                    connections.append(client_s)
                    print("Client connected: %s" % str(addr))

                else:
                    try: #Verificar se há uma mensagem de um cliente e processá-la
                        data = sock.recv(4096) # Mensagem válida de um cliente
                        
                        if len(data) != 0:
                            print("From client: %s" % str(sock.getpeername()))
                            print("Got Data: " + data.decode("utf-8"))

                        else: # O cliente desligou-se
                            print("Client disconnected: %s" % str(sock.getpeername()))
                            sock.close()
                            connections.remove(sock)
                            break

                        # Criar a mensagem com identificação do cliente que a enviou
                        message = "<From client: " + str(sock.getpeername()) + "> "
                        message = message.encode("utf-8") + data.upper()
                        
                        # Eventualmente não mandar a mensagem para o próprio
                        for client in connections: 
                            if client != tcp_s: client.send(message)
                    

                    except: # Erro no socket do cliente
                        print("Client socket error: %s" % str(addr))
                        sock.close()
                        connections.remove(sock) # retirar este socket da lista
                        continue
    finally:
        for sock in connections: sock.close()
    
    
main()
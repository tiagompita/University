                                                                        #Se não tiver alguma das biliotecas instaladas, terá que as instalar na linha de comandos com os comandos em parênteses 
                                                                        

import os                                                               #(pip install os) usamos esta biblioteca para limpar a linha de comandos 
import win32con                                                         #(pip install pywin32) usamos as bibliotecas win32con e win32gui para maximizar a tela no inicio do jogo
import win32gui                                                          
import colorama                                                         #(pip install colorama) usamos esta biblioteca para dar cor ao nosso trabalho tudo o que contenha Fore está relacionado com esta biblioteca
from colorama import Fore, init
import random                                                           #(pip install random) esta biblioteca já vinha no ficheiro fornecido e serviu para escolher o secret aleatoriamente
import sys                                                              #(pip install sys) usamos esta biblioteca para fechar o programa quando o jogador decidir não jogar mais
from unidecode import unidecode                                         #(pip install unidecode) usamos esta biblioteca 
AUTORES = [120482, 119550]


hwnd = win32gui.GetForegroundWindow()
win32gui.ShowWindow(hwnd, win32con.SW_MAXIMIZE)


init()                                                                  #função que inicializa o uso da biblioteca colorama


def clear_screen():                                                     #esta função limpa a tela ("clear") quando os.name != "nt" ou seja quando o codigo não está a ser executado
    os.system('cls' if os.name == 'nt' else 'clear')


def menu_inicial():                                                     #esta função faz print do menu inicial e prepara o inicio de jogo
    clear_screen()
    print(Fore.YELLOW + "Bem-vindo ao Jogo da Forca!")
    print(Fore.YELLOW + "=" * 50)
    print(Fore.GREEN + "Instruções:")
    print(Fore.WHITE + "1. É escolhida uma palavra aleatória e o jogador tentará adivinhá-la.")
    print(Fore.WHITE + "2. O jogo irá mostrar o número de letras na palavra.")
    print(Fore.WHITE + "3. O jogador deve tentar adivinhar uma letra ou a palavra completa.")
    print(Fore.WHITE + "4. Se o jogador errar, o desenho de um boneco na forca irá progredir.")
    print(Fore.WHITE + "6. Para adivinhar a palavra terá que colocar os acentos no seu devido lugar")
    print(Fore.YELLOW + "=" * 50)
    input(Fore.MAGENTA + "Pressione Enter para começar o jogo...")


def desenhar_boneco(erros):                                             #esta função contem a parte visual da forca e as condições para que a mesma seja atualizada
    clear_screen()
    if (erros == 0):
        print(Fore.YELLOW, "\n   _____")
        print("  |     ")
        print("  |     ")
        print("  |     ")
        print(" ===")
        print("ERROS:", erros)
    elif (erros == 1):
        print(Fore.YELLOW, "\n   _____")
        print("  |    |")
        print("  |", Fore.RED, "  O ")
        print(Fore.YELLOW, " |    ")
        print("  |    ")
        print(" ===")
        print("ERROS:", erros)
    elif (erros == 2):
        print(Fore.YELLOW, "\n   _____")
        print("  |    |")
        print("  |", Fore.RED, "  O ")
        print(Fore.YELLOW, " |", Fore.RED, "  | ")
        print(Fore.YELLOW, " |    ")
        print(" ===")
        print("ERROS:", erros)
    elif (erros == 3):
        print(Fore.YELLOW, "\n   _____")
        print("  |    |")
        print("  |", Fore.RED, "  O ")
        print(Fore.YELLOW, " |", Fore.RED, " /| ")
        print(Fore.YELLOW, " |    ")
        print(" ===")
        print("ERROS:", erros)
    elif (erros == 4):
        print(Fore.YELLOW, "\n   _____")
        print("  |    |")
        print("  |", Fore.RED, "  O ")
        print(Fore.YELLOW, " |", Fore.RED, " /|\ ")
        print(Fore.YELLOW, " |    ")
        print(" ===")
        print("ERROS:", erros)
    elif (erros == 5):
        print(Fore.YELLOW, "\n   _____")
        print("  |    |")
        print("  |", Fore.RED, "  O ")
        print(Fore.YELLOW, " |", Fore.RED, " /|\ ")
        print(Fore.YELLOW, " |", Fore.RED, " /")
        print(Fore.YELLOW, "===")
        print("ERROS:", erros)
    elif (erros == 6):
        print(Fore.YELLOW, "\n   _____")
        print("  |    /")
        print("  |", Fore.RED, "  O ")
        print(Fore.YELLOW, " |", Fore.RED, " /|\ ")
        print(Fore.YELLOW, " |", Fore.RED, " / \ ")
        print(Fore.YELLOW, "===")
        print("ERROS:", erros)


def vitoria(secret):                                                    #esta função é executada quando o jogador vence o jogo e contém apenas informação apresentada visualmente
    clear_screen()
    print(Fore.GREEN + "Parabéns, você venceu!")
    print(Fore.YELLOW + r"""
 .----------------.  .----------------.  .-----------------. .-----------------. .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| | _____  _____ | || |     _____    | || | ____  _____  | || | ____  _____  | || |  _________   | || |  _______     | |
| ||_   _||_   _|| || |    |_   _|   | || ||_   \|_   _| | || ||_   \|_   _| | || | |_   ___  |  | || | |_   __ \    | |
| |  | | /\ | |  | || |      | |     | || |  |   \ | |   | || |  |   \ | |   | || |   | |_  \_|  | || |   | |__) |   | |
| |  | |/  \| |  | || |      | |     | || |  | |\ \| |   | || |  | |\ \| |   | || |   |  _|  _   | || |   |  __ /    | |
| |  |   /\   |  | || |     _| |_    | || | _| |_\   |_  | || | _| |_\   |_  | || |  _| |___/ |  | || |  _| |  \ \_  | |
| |  |__/  \__|  | || |    |_____|   | || ||_____|\____| | || ||_____|\____| | || | |_________|  | || | |____| |___| | |
| |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  
    
    """)
    print(Fore.GREEN + f"A palavra era: {secret}")


def fim_de_jogo(fimdejogo, jogarnovamente):                             #esta função é executada no fim do jogo, a logica presente determina se o programa recomeça ou termina dependendo da resposta do jogador
    resposta = input(Fore.YELLOW + "Queres jgr novamente? Digita sim ou não| ")
    while resposta not in set(fimdejogo + jogarnovamente):
        print(Fore.RED, "Input Inválido")
        resposta = input(Fore.YELLOW + "Queres jgr novamente? Digita sim ou não| ")
    if resposta in fimdejogo:
        sys.exit()
    elif resposta in jogarnovamente:
        main()
        sys.exit()


def main():                                                             #função principal
    from wordlist import words1, words2

    hwnd = win32gui.GetForegroundWindow()                               #estas duas linhas maximizam a tela
    win32gui.ShowWindow(hwnd, win32con.SW_MAXIMIZE)

    # Descomente a linha que interessar para testar
    # words = words1                                                    # palavras sem acentos nem cedilhas.
    # palavras com acentos ou cedilhas.
    #words = words2
    words = words1 + words2                       # palavras de ambos os tipos
                                                                        # INCLUA estas 2 linhas para permitir
                                                                        # correr o programa com palavras dadas:
    if len(sys.argv) > 1:
        words = sys.argv[1:]  # python3 forca.py duas palavras

    # Escolhe palavra aleatoriamente
    secret = random.choice(words).upper()
    #secret = "ABC"

  
    palavra_descoberta = ["_" for _ in secret]                          #Substui cada letra na palavra secret por underscores
    tentativas = 6                                                      #Número de tentativas permitidas         
    palavras_ou_letras_utilizadas = []
    erros = 0

    menu_inicial()
    desenhar_boneco(erros)

    abc = [chr(letra) for letra in range(65, 91)]                       #lista com as letras no alfabeto

    alfabeto = [letra for letra in abc if letra not in palavras_ou_letras_utilizadas]        #letras que ainda não foram usadas

    jogarnovamente = ['s', 'sim', 'SIM']                                #inputs aceitados para recomeçar o jogo               
    fimdejogo = ['n', 'nao', 'não', 'NÃO', 'NAO']                       #inputs aceitados para terminar o jogo

    while True:
        print("")
        print(Fore.BLUE + "=" * 50)

        letra = input(Fore.WHITE + f"Palavra: {' '.join(palavra_descoberta)}\nTentativas restantes: {tentativas}\nPalavras ou Letras utilizadas: {', '.join(palavras_ou_letras_utilizadas)}\nLetras por utilizar: {alfabeto}\nDigite uma letra ou uma palavra: ").upper()

        # Verifica se a palavra ou letra  inserida pelo jogador se encontra no secret
        if len(letra) == len(secret) and letra != secret:
            print(f"Palavra errada. Tente novamente.")
            erros += 1

        while (len(letra) != 1 or letra not in abc) and (len(letra) != len(secret)):                       #impõem um input válido
            print(Fore.RED, "Input Inválido")
            letra = input(Fore.WHITE + "Digite uma letra: ").upper()

        while letra in palavras_ou_letras_utilizadas:                                                      #impõem um input válido
            if len(letra) == 1:
                print(Fore.RED, "Você já tentou esta letra. Tente outra.")
                letra = input(Fore.WHITE + "Digite uma letra: ").upper()
            elif len(letra) != 1:
                print(Fore.RED, "Você já tentou esta palavra. Tente outra.")
                letra = input(Fore.WHITE + "Digite uma letra: ").upper()


        palavras_ou_letras_utilizadas.append(letra)                     #acrescenta a letra ás palavras utilizadas

        # Faz a verificação dos acentos
        letra_sem_acentos = unidecode(letra)                            
        secret_sem_acentos = unidecode(secret)


        if letra_sem_acentos in secret_sem_acentos:                     #esta condição veriica se a aposta sem acentos está na secret sem acentos
            desenhar_boneco(erros)
            for i, let in enumerate(secret_sem_acentos):
                if let == letra_sem_acentos:
                    palavra_descoberta[i] = secret[i]                   #a partir das posições das letras em secret revela as letras correspondentes à aposta mesmo que estas tenham acentos 
                    if letra in alfabeto:
                        alfabeto.remove(letra)                          #remove a aposta correta desta rodada das letras por utilizar

        if letra not in (secret and secret_sem_acentos):                #se a aposta for errada esta função impõem as cosequencias
            print("Letra ou palavra errada. Tente novamente.")
            erros += 1
            tentativas -= 1
            desenhar_boneco(erros)
            if letra in alfabeto:
                alfabeto.remove(letra)                                  #remove a aposta incorreta desta rodada das letras por utilizar

        # Fim de jogo

        if "_" not in palavra_descoberta:                               #condição para vitoria(que a palavra descoberta não tenha "_" ou seja todas as letras sejam reveladas")
            vitoria(secret)
            fim_de_jogo(fimdejogo, jogarnovamente)
        elif len(letra) == len(secret) and letra == secret:             #condição para vitória(que o input seja a palavra exata incluindo acentos")
            vitoria(secret)
            fim_de_jogo(fimdejogo, jogarnovamente)
        elif erros == 6:                                                #termina o jogo se o número de apostas erradas ultrapassar o permitido
            print(f"Fim de jogo! A palavra era: {secret}")
            fim_de_jogo(fimdejogo, jogarnovamente)

if __name__ == "__main__":
	main()

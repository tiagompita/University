# Importa o módulo random
import random

# Define uma lista de palavras possíveis
palavras = ["tigre", "árvore", "subterrâneo", "girafa", "cadeira"]

# Escolhe uma palavra aleatória da lista
palavra = random.choice(palavras)

# Define o número de tentativas restantes
tentativas = 6

# Define uma string que contém as letras adivinhadas pelo jogador
adivinhadas = ""

# Define uma lista que contém os valores do corpo do enforcado
corpo = ["O", "/", "|", "\\", "|", "/", "\\"]

# Define uma lista que contém os valores do corpo do enforcado a serem mostrados ao jogador
mostrar = [" ", " ", " ", " ", " ", " ", " "]

# Define uma função para imprimir o enforcado
def imprimir_enforcado(valores):
    print()
    print("\t +--------+")
    print("\t | | |")
    print("\t {} | |".format(valores[0]))
    print("\t {} {} {} | |".format(valores[1], valores[2], valores[3]))
    print("\t {} | |".format(valores[4]))
    print("\t {} {} | |".format(valores[5], valores[6]))
    print("\t | |")
    print(" _______________|_|___")
    print(" `````````````````````")
    print()

# Define uma função para imprimir a palavra a ser adivinhada
def imprimir_palavra(valores):
    print()
    print("\t", end="")
    for x in valores:
        print(x, end="")
    print()

# Inicia o jogo
print("Olá, bem-vindo ao jogo da forca!")
print("Você tem {} tentativas para adivinhar a palavra.".format(tentativas))

# Cria uma lista que contém os espaços em branco para cada letra da palavra
espacos = ["_"] * len(palavra)

# Imprime os espaços em branco
imprimir_palavra(espacos)

# Enquanto o jogador tiver tentativas e não acertar a palavra
while tentativas > 0 and "_" in espacos:
    # Pede ao jogador que digite uma letra
    letra = input("Digite uma letra: ").lower()

    # Se a letra já foi adivinhada, avisa ao jogador
    if letra in adivinhadas:
        print("Você já digitou essa letra.")

    # Se a letra não foi adivinhada e está na palavra
    elif letra in palavra:
        # Adiciona a letra à string de letras adivinhadas
        adivinhadas += letra

        # Substitui os espaços em branco pela letra nas posições corretas
        for i in range(len(palavra)):
            if palavra[i] == letra:
                espacos[i] = letra

        # Imprime os espaços atualizados
        imprimir_palavra(espacos)

        # Se não houver mais espaços em branco, o jogador ganhou
        if "_" not in espacos:
            print("Parabéns, você acertou a palavra!")

    # Se a letra não foi adivinhada e não está na palavra
    else:
        # Diminui uma tentativa do jogador
        tentativas -= 1

        # Adiciona a letra à string de letras adivinhadas
        adivinhadas += letra

        # Atualiza os valores do corpo do enforcado
        mostrar[6 - tentativas] = corpo[6 - tentativas]

        # Imprime o corpo do enforcado atualizado
        imprimir_enforcado(mostrar)

        # Imprime os espaços
        imprimir_palavra(espacos)

        # Se o jogador não tiver mais tentativas, ele perdeu
        if tentativas == 0:
            print("Você perdeu. A palavra era {}.".format(palavra))

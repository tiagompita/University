# Preencha a lista com os números mecanográficos dos autores.
AUTORES = [120152, 119928]

import random

# Defina funções aqui.


# Define uma função para imprimir a palavra a ser adivinhada
def imprimir_palavra(espacos, secret):
    print()
    print("Palavra ({} letras): ".format(len(secret)), end="")
    for x in espacos:
        print(x, end="")
    print()


#Corpo enforcado

def enforcado(valores, espacos, secret):
    print()
    print("\t  +-------+", sep="\t")
    print("\t  | ","| |", sep="\t")
    print("\t  {}".format(valores[0]),"| |", sep="\t")
    print("\t{} {} {}".format(valores[1], valores[2], valores[3]), "| |", sep="\t")
    print("\t  {}".format(valores[4]), "| |", sep="\t")
    print("\t {} {}".format(valores[5], valores[6]), "| |", sep="\t")
    print("","", "| |", sep="\t")
    print(" _______________|_|___")
    print(" `````````````````````")
    print()
    print()
    print(imprimir_palavra(espacos, secret))



def main():
    from wordlist import words1, words2
    
    # Descomente a linha que interessar para testar
    words = words1              # palavras sem acentos nem cedilhas.
    #words = words2             # palavras com acentos ou cedilhas.
    #words = words1 + words2    # palavras de ambos os tipos
   
    # Escolhe palavra aleatoriamente
    secret = random.choice(words).upper()

    # Complete o programa

    #O numero de tentativas é o numero de letras da palavra
    ntentativas = len(secret)

    #Letras adivinhadas
    adivinhada = ""

    print("Olá, bem-vindo ao jogo da forca!")
    print("Tens {} tentativas para adivinhar a palavra.".format(ntentativas))

    mostrar = ["O", "\\", "X", "/", "|", "/", "\\"]
    oculto = [" "," "," "," "," "," "," ",]

    # Cria uma lista que contém os espaços em branco para cada letra da palavra
    espacos = ["_ "] * len(secret)
    # Imprime os espaços em branco
    enforcado(oculto, espacos, secret)

    while ntentativas > 0 and "_" in espacos:

        #Pede para digitar uma letra
        letra = input("Digite uma letra: ").lower()

        #Se a letra ja foi adivinhada:
        if letra in adivinhada:
            print("Já adivinhaste essa letra")
        elif 
    ...


if __name__ == "__main__":
    main()

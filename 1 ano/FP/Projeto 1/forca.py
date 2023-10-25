# Preencha a lista com os números mecanográficos dos autores.
AUTORES = [120152, 119928]

import random


# Defina funções aqui.

#Corpo enforcado
def enforcado(valores):

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

def palavraSecreta():
    from wordlist import words1, words2
    
    # Descomente a linha que interessar para testar
    words = words1              # palavras sem acentos nem cedilhas.
    #words = words2             # palavras com acentos ou cedilhas.
    #words = words1 + words2    # palavras de ambos os tipos
   
    # Escolhe palavra aleatoriamente
    secret = random.choice(words).upper()

    #Devolve a palavra
    return secret


def main():
    # Complete o programa
    print("Olá, bem-vindo ao jogo da forca!")
    print("Tens {} tentativas para adivinhar a palavra.".format(len(palavraSecreta()) + 2))


#Corpo do boneco
mostrar = ["O", "\\", "X", "/", "|", "/", "\\"]

#Lista para ocultar o corpo do boneco
oculto = [" "," "," "," "," "," "," ",]

#O numero de tentativas (apenas 7 tentativas, pois o corpo apenas tem 7 partes)
ntentativas = 7

#Letras adivinhadas
guessedCorrect = []
guessedWrong = []

# Cria uma lista que contém os espaços em branco para cada letra da palavra
espacos = ["_ "] * len(palavraSecreta())

while ntentativas != 0 and "_" in espacos:

    #Pede para digitar uma letra
    letra = input("Digite uma letra: ").lower().isalpha()

    #Se a letra ja foi adivinhada:
    if letra in guessedCorrect or guessedWrong:
        print("Já adivinhaste essa letra")
    
    if letra in palavraSecreta():
        guessedCorrect += letra
    else:
        guessedWrong += letra
        ntentativas -= 1



        


if __name__ == "__main__":
    main()

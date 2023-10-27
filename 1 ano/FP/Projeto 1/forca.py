# Preencha a lista com os números mecanográficos dos autores.
AUTORES = [120152, 119928]

import random

################ Variáveis #################
#Corpo do boneco
mostrar = ["O", "\\", "X", "/", "|", "/", "\\"]

#Lista para ocultar o corpo do boneco
oculto = [" "," "," "," "," "," "," ",]


# Defina funções aqui.

#Corpo enforcado
def enforcado(valores):

    print()
    print("\t  +-------+")
    print("\t  | ","\t| |")
    print("\t  {}".format(valores[0]),"\t| |")
    print("\t{} {} {}".format(valores[1], valores[2], valores[3]), "\t| |")
    print("\t  {}".format(valores[4]), "\t| |")
    print("\t {} {}".format(valores[5], valores[6]), "\t| |")
    print("","\t", "\t| |")
    print(" _______________|_|___")
    print(" `````````````````````")
    print()
    print()


def main():
    from wordlist import words1, words2
    
    # Descomente a linha que interessar para testar
    words = words1              # palavras sem acentos nem cedilhas.
    #words = words2             # palavras com acentos ou cedilhas.
    #words = words1 + words2    # palavras de ambos os tipos
   
    # Escolhe palavra aleatoriamente
    secret = random.choice(words).upper()
    # Cria uma lista que contém os espaços em branco para cada letra da palavra
    espacos = ["_ "] * len(secret)

    # Complete o programa

    print("\nOlá, bem-vindo ao jogo da forca!")
    print("Tens 7 tentativas para adivinhar a palavra.")


    #O numero de tentativas (apenas 7 tentativas, pois o corpo apenas tem 7 partes)
    ntentativas = 7

    #Letras adivinhadas
    guessedCorrect = []
    guessedWrong = []

    while ntentativas > 0 and "_ " in espacos:

        
        LetCerta = "Letras Certas: " + " - ".join(guessedCorrect).upper()
        LetErr = "Letras Erradas: " + " - ".join(guessedWrong).upper()

        enforcado(oculto)

        print("".join(espacos))
        print()
        print(LetCerta)
        print(LetErr)
        print("Tentativas: ", ntentativas)

        

        #Pede para digitar uma letra
        letra = str(input("\nIntroduz uma letra: ").upper())


        #Verifica se não é digito, se a letra pertence ao alfabeto e é apenas 1 letra
        if letra.isalpha() and not letra.isdigit() and len(letra) == 1:
            #print("Letra válida")

            #Se a letra ja foi adivinhada:
            if letra in guessedCorrect or letra in guessedWrong:
                print("*********\tJá adivinhaste essa letra\t*********")
            else:
                if letra in secret:
                    guessedCorrect += letra
                    # Substitui os espaços corretos com a letra adivinhada corretamente
                    for i in range(len(secret)):
                        if secret[i] == letra:
                            espacos[i] = letra + " "
                else:
                    guessedWrong += letra
                    ntentativas -= 1

                    if 1 <= ntentativas <= 6:
                        oculto[0:7-ntentativas] = mostrar[0:7-ntentativas]
                        enforcado(oculto)
                
        elif letra == "":
            print("\t\t********Letra inválida********")
        else:
            print("\t\t********Letra inválida********")
    else:
        if ntentativas == 0:
            print("Fim do Jogo. Acabou-se as tentativas. A palavra era: {}". format(secret))
            oculto[0:7] = mostrar[0:7]
            enforcado(oculto)
        if "_ " not in espacos:
            print("Parabéns! Acertaste a palavra ( {} ).". format(secret))
            

if __name__ == "__main__":
    main()

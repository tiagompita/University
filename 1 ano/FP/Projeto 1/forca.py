# Preencha a lista com os números mecanográficos dos autores.
AUTORES = [120152, 119928]

import random
import unicodedata

################ Variáveis #################
#Corpo do boneco
corpoInt = ["O", "/", "X", "\\", "|", "/", "\\"]

#Lista para ocultar o corpo do boneco
corpo = [" "," "," "," "," "," "," ",]

# Defina funções aqui.

#Codigo tirado deste site: https://stackoverflow.com/questions/517923/what-is-the-best-way-to-remove-accents-normalize-in-a-python-unicode-string
def remove_accents(input_str):
    nfkd_form = unicodedata.normalize('NFD', input_str)
    return "".join([c for c in nfkd_form if not unicodedata.combining(c)])

#Corpo enforcado (O desenho da força foi tirado deste site: https://www.askpython.com/python/examples/hangman-game-in-python)
def enforcado(corpo):

    print()
    print("\t  +-------+")
    print("\t  | ","\t| |")
    print("\t  {}".format(corpo[0]),"\t| |")
    print("\t{} {} {}".format(corpo[1], corpo[2], corpo[3]), "\t| |")
    print("\t  {}".format(corpo[4]), "\t| |")
    print("\t {} {}".format(corpo[5], corpo[6]), "\t| |")
    print("","\t", "\t| |")
    print(" _______________|_|___")
    print(" `````````````````````")
    print()
    print()


def main():
    from wordlist import words1, words2
    
    # Descomente a linha que interessar para testar
    #words = words1              # palavras sem acentos nem cedilhas.
    #words = words2            # palavras com acentos ou cedilhas.
    words = words1 + words2    # palavras de ambos os tipo

    #words = ["coração", "ativação"]
   
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
    
    #Mantem a palavra original para poder fazer a substituição com os acentos
    original_secret = secret
    #print(original_secret)
    #Remove os acentos
    secret = remove_accents(secret)

    while ntentativas > 0 and "_ " in espacos:

        # Design das letras certas e erradas
        LetCerta = "Letras Certas: " + " - ".join(guessedCorrect).upper()
        LetErr = "Letras Erradas: " + " - ".join(guessedWrong).upper()

        enforcado(corpo)

        #Espacos é um lista, daí a função join para aparecer sem parenteses e virgulas.
        print("".join(espacos))
        print()
        print(LetCerta)
        print(LetErr)
        print("Tentativas: ", ntentativas)

        

        #Pede para digitar uma letra
        letra = str(input("\nIntroduz uma letra: ").upper())
        #Remove os acentos
        letra = remove_accents(letra)


        #Verifica se não é digito, se a letra pertence ao alfabeto e é apenas 1 letra
        if letra.isalpha() and not letra.isdigit() and len(letra) == 1:
            #print("Letra válida")

            #Se a letra ja foi adivinhada:
            if letra in guessedCorrect or letra in guessedWrong:
                print("*********\tJá adivinhaste essa letra\t*********")
            else:
                if letra in secret:
                    #Adiciona à lista das letras corretas a letra introduzida
                    guessedCorrect += letra

                    # Substitui os espaços corretos com a letra adivinhada corretamente.
                    #   Funciona do tipo: A palavra tem 7 letras logo range = [0:6]
                    #                     Se secret[0] == letra (introduzida):
                    #                     Substitui no espaço[0] pela letra
                    #
                    for i in range(len(secret)):
                        if secret[i] == letra:
                            espacos[i] = original_secret[i] + " "
                else:
                    #Adiciona à lista das letras erradas a letra introduzida
                    guessedWrong += letra
                    ntentativas -= 1

                    #Ao longo das tentativas, vai mostrando o corpo. A lista "corpoInt" substitui pela parte do corpo na lista "corpo"
                    if 1 <= ntentativas <= 6:
                        corpo[0:7-ntentativas] = corpoInt[0:7-ntentativas]
                        #Atualiza o desenho
                        enforcado(corpo)
                
        elif letra == "":
            #No caso de não introduzir nada
            print("\t\t********Letra inválida********")
        else:
            print("\t\t********Letra inválida********")
    else:
        if ntentativas == 0:
            print("Fim do Jogo. Acabou-se as tentativas. A palavra era: {}". format(original_secret))
            #Finaliza o jogo com
            corpo[0:7] = corpoInt[0:7]
            enforcado(corpo)
        if "_ " not in espacos:
            print("Parabéns! Acertaste a palavra ( {} ).". format(original_secret))
            print()
            print("\t  +-------+")
            print("\t  | ","\t| |")
            print("","\t", "\t| |")
            print("","\t", "\t| |")
            print("\t  {}".format("O"),"\t| |")
            print("\t{} {} {}".format("\\", "X", "/"), "\t| |")
            print("\t  {}".format("|"), "\t| |")          
            print(" ________{}_{}____|_|___".format("/", "\\"))
            print(" `````````````````````")
            print()
            

if __name__ == "__main__":
    main()

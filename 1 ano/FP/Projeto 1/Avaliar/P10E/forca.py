autores=[118799,120393]

import random
import unicodedata

def main():
    from wordlist import words1, words2
        
    words = words1 + words2    

    import sys                  
    if len(sys.argv) > 1:       
        words = sys.argv[1:]    

    selectword = random.choice(words) # Escolha aleatória de uma palavra
    letras = [] #lista vazia aonde vamos adicionar as nossas apostas
    erros = 0 #número de tentativas do jogo
    ganhou = False #inicializa a variável como False

    list2 = [
    """
    ______
          |
          |
          |
          |
          |
    """,
    """
     _____
          |
     0    |
          |
          |
          |
    """,
    """
     _____
          |
     0    |
     |    |
          |
          |
    """,
    """
     _____
          |
     0    |
    /|    |
          |
          |
    """,
    """
     _____
          |
     0    |
    /|\   |
          |
          |
    """,
    """
     _____
          |
     0    |
    /|\   |
    /     |
          |
    """,
    """
      ____
     |    |
     0    |
    /|\   |
    / \   |
          |
    """,
] #representação do boneco em lista

    while erros <= 6 and not ganhou:
        print(list2[erros])
        print("Letras disponíveis:", " ".join([c for c in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" if c not in letras]))
        print("Valores já introduzidos:", " ".join(letras))

        selectword_normalized = unicodedata.normalize('NFD', selectword).encode('ASCII', 'ignore').decode('ASCII').lower()

        for aposta in selectword: # faz os espaços para as letras e substitui se acertarmos a letra
            

            aposta_sem_acentos = unicodedata.normalize('NFD', aposta).encode('ASCII', 'ignore').decode('ASCII').lower()

            if aposta_sem_acentos in letras: #faz os espaços e substitui a letra
                print(aposta, end=" ")
            else:
                print("_", end=" ")

        print("ERROS:", erros) #mostra os erros

        aposta = input("Introduza uma letra para adivinhar: ").lower()

        if aposta in letras:
            print("Já introduziu essa letra, introduza uma diferente.")
            continue

        if len(aposta) != 1 or not aposta.isalpha():
            print("Introduza apenas uma LETRA para adivinhar (sem espaços).")
            continue

        letras.append(aposta) #adiciona as letras da função "aposta" na lista das letras que adivinhamos
        

        aposta_sem_acentos = unicodedata.normalize('NFD', aposta).encode('ASCII', 'ignore').decode('ASCII').lower()

        if aposta_sem_acentos not in selectword_normalized: # se a letra da função "aposta" não corresponder a nenhuma da palavra é somado um erro
            erros += 1

        ganhou = all(unicodedata.normalize('NFD', letra).encode('ASCII', 'ignore').decode('ASCII').lower() in letras for letra in selectword)

    if ganhou: # Verifica se o jogador ganhou ou perdeu
        print("Parabéns, ganhaste. A palavra era:", selectword)
    else:
        print("Perdeste. A palavra era:", selectword)

if __name__ == "__main__":
    main()

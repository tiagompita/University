# Preencha a lista com os números mecanográficos dos autores.
#AUTORES = [119481, 120538]
import re
import random
from wordlist import words1, words2
# Descomente a linha que interessar para testar
#words = words1              # palavras sem acentos nem cedilhas.
#words = words2             # palavras com acentos ou cedilhas.
words = words1 + words2    # palavras de ambos os tipos

import sys                  # INCLUA estas 3 linhas para permitir
if len(sys.argv) > 1:       # correr o programa com palavras dadas:
    words = sys.argv[1:]    #   python3 forca.py duas palavras

# Escolhe palavra aleatoriamente

respostaCerta = random.choice(words).lower()	#Mudança de lugar para se tornar variável global e poder usar na função subestituicao
												#O uso da função lower em vez da upper puramente por razões estéticas no print 


# Defina funções aqui.
def forca(erros):		#Desenho da forca consuante os erros do utilizador

	if erros==0:
		print("_____")
		print("|")
		print("|")
		print("|")
		print("|")
		print("|_______")
	if erros==1:
		print("_____")
		print("|")
		print("|   O")
		print("|")
		print("|")
		print("|_______")
	if erros==2:
		print("_____")
		print("|")
		print("|   O")
		print("|   |")
		print("|")
		print("|_______")
	if erros==3:
		print("_____")
		print("| ")
		print("|   O")
		print("|  /|")
		print("|")
		print("|_______")
	if erros==4:
		print("_____")
		print("|")
		print("|   O")
		print("|  /|\ ")
		print("|")
		print("|_______")
	if erros==5:
		print("_____")
		print("|")
		print("|   O")
		print("|  /|\ ")
		print("|  /  ")
		print("|_______")
	if erros==6:
		print("_____")
		print("|")
		print("|   O")
		print("|  /|\ ")
		print("|  / \ ")
		print("|_______")


def substituicao(velhaResposta, tentativa):	#Substituição da string com uma resposta mais atualizada utilizando a anterior e a correta
	novaResposta=""
	for i in range(0,len(velhaResposta)):
		if tentativa == respostaCerta[i]:
			novaResposta= novaResposta + tentativa
		elif velhaResposta[i].isalpha():
			novaResposta= novaResposta + velhaResposta[i]
		elif respostaCerta[i]=="ç" and tentativa == "c":
			novaResposta+="ç"
		elif respostaCerta[i]=="á" and tentativa=="a":
			novaResposta+= "á"
		elif respostaCerta[i]=="ã" and tentativa=="a":
			novaResposta+= "ã"
		elif respostaCerta[i]=="à" and tentativa=="a":
			novaResposta+= "à"
		elif respostaCerta[i]=="é" and tentativa=="e":
			novaResposta+= "é"
		elif respostaCerta[i]=="ê" and tentativa=="e":
			novaResposta+= "ê"
		elif respostaCerta[i]=="í" and tentativa=="i":
			novaResposta+= "í"
		elif respostaCerta[i]=="ú" and tentativa=="u":
			novaResposta+= "ú"
		elif respostaCerta[i]=="ó" and tentativa=="o":
			novaResposta+= "ó"
		elif respostaCerta[i]=="ô" and tentativa=="o":
			novaResposta+= "ô"
		elif respostaCerta[i]=="õ" and tentativa=="o":
			novaResposta+= "õ"
		else: 
			novaResposta= novaResposta + "-"

	return novaResposta

def acentos(analise):	#Usando a função de procura do módulo re para verificar se a resposta tem acentos ou c com cedilha
    acentos = re.compile(r'[áéíóúêôàãõç]')
    return bool(acentos.search(analise))
def main():
	# Complete o programa
	resposta= len(respostaCerta)*"-"
	nErros=0
	while nErros < 6:
		forca(nErros)
		print("ERROS: ", nErros)
		print(resposta)
		guess = input("Escreva apenas uma letra: ").lower()

		if guess.isalpha() and len(guess) == 1:
			resposta = substituicao(resposta, guess)
		if acentos(respostaCerta)==True and guess.isdigit() ==False and len(guess)==1 and guess not in resposta:
				if acentos(respostaCerta)== False:
					nErros+=1
		elif guess not in respostaCerta and guess.isdigit()==False and len(guess)==1 and guess not in resposta:
			nErros+=1
		if resposta== respostaCerta:

			print("Parabéns", resposta, "é a palavra certa")
			break

		if guess.isdigit()  or len(guess)!=1 or guess in resposta:

			print("Resposta não permitida por favor escreva uma letra e não a repita")
		
		
	if nErros == 6:

		forca(nErros)
		print("ERROS: ", nErros)
		print("Perdeste a palavra é", respostaCerta)

if __name__ == "__main__":
	main()
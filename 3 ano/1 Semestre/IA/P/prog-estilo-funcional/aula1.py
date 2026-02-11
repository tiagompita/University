#Exercicio 1.1
def comprimento(lista):
	if lista == []:
		return 0
	return 1 + comprimento(lista[1:])

#Exercicio 1.2
def soma(lista):
	if lista == []:
		return 0
	return lista[0] + soma(lista[1:])

#Exercicio 1.3
def existe(lista, elem):
	if lista == []:
		return False
	return True if elem == lista[0] else existe(lista[1:], elem)

#Exercicio 1.4
def concat(l1, l2):
	if l1 == []:
		return l2
	return [l1[0]] + concat(l1[1:], l2)

#Exercicio 1.5
def inverte(lista):
	if lista == []:
		return []
	inv = inverte(lista[1:])
	inv[len(inv):] = [lista[0]]
	return inv

#Exercicio 1.6
def capicua(lista):
	if lista == [] or len(lista) == 1:
		return True
	
	if lista[0] != lista[-1]:
		return False
	else:
		return capicua(lista[1:-1])


#Exercicio 1.7
def concat_listas(lista):
	if lista == []:
		return []
	conc = lista[0] + concat_listas(lista[1:])
	return conc

#Exercicio 1.8
def substitui(lista, original, novo):
	if lista == []:
		return []
	
	if lista[0] == original:
		lista[0] = novo

	return [lista[0]] + substitui(lista[1:], original, novo)

#Exercicio 1.9
def fusao_ordenada(lista1, lista2):

	if lista1 == []:
		return lista2
	elif lista2 == []:
		return lista1
	
	if lista1[0] < lista2[0]:
		return [lista1[0]] + [lista2[0]] + fusao_ordenada(lista1[1:], lista2[1:])
	else:
		return [lista2[0]] + [lista1[0]] + fusao_ordenada(lista1[1:], lista2[1:])


#Exercicio 1.10
def lista_subconjuntos(lista):
	if lista == []:
		return [[]]
	
	subconjuntos_sem = lista_subconjuntos(lista[1:])
	subconjuntos_com = [[lista[0]] + n for n in subconjuntos_sem]
	
	return subconjuntos_sem + subconjuntos_com


#Exercicio 2.1
def separar(lista):
	if lista == []:
		return ([], [])

	primeiro = [lista[0][0], lista[0][1]]
	[resto1, resto2] = separar(lista[1:])

	par_listas = ([primeiro[0]] + resto1, [primeiro[1]] + resto2)

	return par_listas

#Exercicio 2.2
def remove_e_conta(lista, elem):
	if lista == []:
		return ([], 0)

	resto, count = remove_e_conta(lista[1:], elem)
	if lista[0] == elem:
		return (resto, count + 1)
	else:
		return ([lista[0]] + resto, count)

#Exercicio 2.3
def conta_elem(lista):
	if lista == []:
		return []

	x = lista[0]
	count = sum(1 for y in lista if y == x)
	resto = [y for y in lista if y != x]
	return [(x, count)] + conta_elem(resto)

#Exercicio 3.1
def cabeca(lista):
	if lista == []:
		return
	
	return lista[0]

#Exercicio 3.2
def cauda(lista):
	if lista == []:
		return
	
	return lista[1:]

#Exercicio 3.3
def juntar(l1, l2):
	if l1 == [] or l2 == []:
		return []
	
	if len(l1) != len(l2):
		return

	return [(l1[0], l2[0])] + juntar(l1[1:], l2[1:])

#Exercicio 3.4
def menor(lista):
	if lista == []:
		return
	
	if len(lista) == 1:
		return lista[0]

	min_num = menor(lista[1:])

	if lista[0] < min_num:
		return lista[0]
	else:
		return min_num

#Exercicio 3.5
def menor_e_resto(lista):
	if lista == []:
		return

	if len(lista) == 1:
		return (lista[0], [])

	minimo, resto = menor_e_resto(lista[1:])

	x = lista[0]
	if x < minimo:
		return (x, [minimo] + resto)
	else:
		return (minimo, [x] + resto)



#Exercicio 3.6
def max_min(lista):
	if lista == []:
		return
	
	if len(lista) == 1:
		return (lista[0], lista[0])

	max, min = max_min(lista[1:])

	x = lista[0] 
	new_max = x if x > max else max
	new_min = x if x < min else min

	return (new_max, new_min)
	
#Exercicio 3.7
def dois_menores_e_resto(lista):
	if len(lista) < 2:
		return
	elif len(lista) == 2:
		return [lista[0], lista[1], []]
	else:
		f1, f2, resto = dois_menores_e_resto(lista[1:])

		x = lista[0]
		if f1 < f2:
			if x < f1:
				return [x, f1, [f2] + resto]
			else:
				if x < f2:
					return [f1, x, [f2] + resto]
				else:
					return [f1, f2, [x] + resto]
		else:
			if x < f2:
				return [x, f2, [f1] + resto]
			else:
				if x < f1:
					return [f2, x, [f1] + resto]
				else:
					return [f2, f1, [x] + resto]


#Exercicio 3.8
def media_mediana(lista):
	if lista == []:
		return
	if len(lista) == 1:
		return (lista[0], lista[0])
	
	media, mediana = media_mediana(lista[1:])

	count = 0
	for n in lista:
		count += n
		media = count / len(lista)

	if len(lista) % 2 == 0:

		mediana = (lista[int((len(lista) / 2) - 1)] + lista[int((len(lista) / 2))]) / 2

		return (media, mediana)
	else:

		mediana = lista[int((len(lista) / 2) - 0.5)]

		return (media, mediana)

	



#Exercicio 4.1
impar = (lambda x : True if x % 2 != 0 else False)

#Exercicio 4.2
positivo = (lambda x : True if x > 0 else False)

#Exercicio 4.3
comparar_modulo = (lambda x,y : True if abs(x) < abs(y) else False)

#Exercicio 4.4
import math
cart2pol = (lambda x,y : (math.sqrt(x**2 + y**2), math.atan2(y, x)))

#Exercicio 4.5
ex5 = lambda f,g,h : lambda x,y,z : h(f(x,y), g(y,z))

#Exercicio 4.6
def quantificador_universal(lista, f):
    return all(map(f, lista))

#Exercicio 4.7
def quantificador_existencial(lista, f):
    return any(map(f,lista))

#Exercicio 4.8
def subconjunto(lista1, lista2):
    return all(map(lambda x : x in lista2, lista1))

#Exercicio 4.9
def menor_ordem(lista, f):
    if lista == []:
        return

    if len(lista) == 1:
        return lista[0]

    min_num = menor_ordem(lista[1:],f)

    return f(lista[0], min_num)

#Exercicio 4.10
def menor_e_resto_ordem(lista, f):
    if lista == []:
        return None, []
    
    if len(lista) == 1:
        return lista[0], []
    
    min_num, resto = menor_e_resto_ordem(lista[1:],f)

    if f(lista[0], min_num):
        return lista[0], [min_num] + resto
    else:
        return min_num, [lista[0]] + resto

#Exercicio 4.11
def menores_e_resto_ordem(lista, f):
    # Caso base: Se a lista tem menos de 2 elementos, não é possível encontrar 2 menores.
    if len(lista) < 2:
        return None, None, []

    # Caso base: Se a lista tem exatamente 2 elementos, compara-os e retorna.
    if len(lista) == 2:
        if f(lista[0], lista[1]):
            return lista[0], lista[1], []
        else:
            return lista[1], lista[0], []

    # Passo recursivo: encontra os 2 menores e o resto da cauda da lista.
    m1_resto, m2_resto, resto_final = menores_e_resto_ordem(lista[1:], f)
    
    cabeca = lista[0]

    # Compara a cabeça da lista com os dois menores encontrados na cauda.
    if f(cabeca, m1_resto):
        # A cabeça é o novo menor de todos. O antigo menor (m1_resto) passa a ser o segundo.
        return cabeca, m1_resto, [m2_resto] + resto_final
    elif f(cabeca, m2_resto):
        # A cabeça é maior que m1_resto, mas menor que m2_resto. Passa a ser o segundo menor.
        return m1_resto, cabeca, [m2_resto] + resto_final
    else:
        # A cabeça é maior que os dois menores. Vai para o resto da lista.
        return m1_resto, m2_resto, [cabeca] + resto_final


#Exercicio 4.12
def map_pol(lista):
    return list(map(lambda x : (math.sqrt(x[0]**2 + x[1]**2), math.atan2(x[1], x[0])), lista))

#Exercicio 4.13
def juntar_ordenado(lista1, lista2, ordem):
    if lista1 == []:
        return lista2
    elif lista2 == []:
        return lista1

    if ordem(lista1[0], lista2[0]):
        return [lista1[0]] + juntar_ordenado(lista1[1:], lista2, ordem)
    else:
        return [lista2[0]] + juntar_ordenado(lista1, lista2[1:], ordem)

#Exercicio 4.14
def conc_aplic(listas, f):
    conc = []
    for n in listas:
        conc += list(map(f,n))

    return conc

#Exercicio 4.15
def aplic_combin(listas, f):
    if (len(listas[0]) != len(listas[1])):
        return None
    
    return list(map(f, listas[0], listas[1]))

#Exercicio 4.16
import functools
def reduce_listas(listas, f, neutro):
    return list(functools.reduce(f, n, neutro) for n in listas)



#Exercicio 5.2
def ordenar_seleccao(lista, ordem):
    if lista == []:
        return []

    # Encontra o menor elemento e a lista com os restantes.
    menor, resto = menor_e_resto_ordem(lista, ordem)

    # O resultado é o menor, seguido da ordenação do resto.
    return [menor] + ordenar_seleccao(resto, ordem)
    

#Exercicio 5.1b
def ordenar_bolha(lista, ordem):
    # Caso base: lista com 0 ou 1 elemento já está ordenada.
    if len(lista) < 2:
        return lista

    # Faz uma passagem para mover o maior elemento para o fim.
    lista_mutavel = list(lista) # Copia para poder modificar
    for i in range(len(lista_mutavel) - 1):
        if ordem(lista_mutavel[i+1], lista_mutavel[i]):
            # Troca os elementos se estiverem fora de ordem
            lista_mutavel[i], lista_mutavel[i+1] = lista_mutavel[i+1], lista_mutavel[i]
    
    # O último elemento está agora no seu lugar correto.
    maior_elemento = lista_mutavel[-1]
    
    # Ordena recursivamente o resto da lista.
    resto_ordenado = ordenar_bolha(lista_mutavel[:-1], ordem)
    
    # Junta o resto ordenado com o maior elemento.
    return resto_ordenado + [maior_elemento]




#Exercicio 5.1c
def ordenar_rapida(lista, ordem):
    if len(lista) < 2:
        return lista
    
    pivot = lista[0]
    resto = lista[1:]

    # Particiona o resto da lista em duas: menores e maiores que o pivot.
    menores = [x for x in resto if ordem(x, pivot)]
    maiores = [x for x in resto if not ordem(x, pivot)]

    # A recursão acontece aqui: ordena as duas sub-listas.
    return ordenar_rapida(menores, ordem) + [pivot] + ordenar_rapida(maiores, ordem)

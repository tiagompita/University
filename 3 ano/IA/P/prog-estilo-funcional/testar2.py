list1 = [(1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e')]
def separar(lista):
    if lista == []:
        return ([], [])

    primeiro = [lista[0][0], lista[0][1]]
    [resto1, resto2] = separar(lista[1:])

    par_listas = ([primeiro[0]] + resto1, [primeiro[1]] + resto2)

    return par_listas
    
separar(list1)
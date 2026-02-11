a = [1,2,3]
b = ['a', 'b', 'c']

def concatenar(lst1, lst2):
    conc = lst1 + lst2
    return conc

def acresc(lst, x):
    # Usar lst[:] cria uma cópia superficial (shallow copy) da lista.
    # Se usar apenas lst, `acresc` será uma referência à lista original e
    # modificações em `acresc` também afetarão `lst`.
    acresc = lst[:]
    acresc += [x]
    return acresc

def factorial(n):
    if n == 0:
        return 1
    if n > 0:
        return n * factorial(n-1)

def list_length(lst):
    if lst == []:
        return 0
    
    return 1 + list_length(lst[1:])

def contem(x , lst):
    if lst == []:
        return False
    return (lst[0] == x) or contem(x,lst[1:])

def inverter(lst):
    if lst == []:
        return []
    
    inv = inverter(lst[1:])
    # Ao atribuir a uma slice (por exemplo invert[len(invert):] = ...),
    # Python espera um iterável à direita. `lst[0]` é um único elemento
    # (não um iterável de elementos), por isso devemos colocá-lo dentro
    # de uma lista: [lst[0]]. Alternativamente poderia usar
    # `invert.append(lst[0])` para o mesmo efeito.
    inv[len(inv):] = [lst[0]]
    return inv

#print(concatenar(a,b))
#print(f'Lista acrescentada: {acresc(a, 10)} // List original: {a}')
#print(factorial(int(input("Factorial de: "))))
#print(list_length(a))
#print(contem(3, b))
#print(inverter(a))
print(a[2])
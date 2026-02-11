import functools

#   Verifica se lst contem x
#   sem usar ciclos
#   sem usar recursividade
#   r = resultado da recursividade sobre o resto da lista
#   h = primeiro elemento da lista
def contem(lst, x):
    return functools.reduce(lambda r,h : h == x or r, lst, False)

print(contem([1,2,3,4], 10))
print(contem([1,2,3,4], 2))

def dobros (lst):
    return functools.reduce(lambda r,h : [2*h] + r, lst, [])

print(dobros([1,2,3,4]))
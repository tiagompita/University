# Numa dada sequência lst, queremos encontrar os elementos que são maiores do que o elemento anterior. 
#Complete a função findRise (lst) para devolver uma lista com os índices desses elementos. 
#Por exemplo, findRise([1,0,9,7,3,8,1]) deve devolver [2, 5], porque os elementos dessas posições (9 e 8) são maiores do que os das posições anteriores (0 e 3, respectivamente).
#Execute o código para conferir se os resultados são os esperados

def findRise(lst):
    res = []
    for i in range(1,len(lst)):
        if lst[i] > lst[i-1]:
            res.append(i)
    return res
print(findRise([1,0,9,7,3,8,1]))
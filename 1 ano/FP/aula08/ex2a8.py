file = open('C:\\Users\\tiago\\Documents\\University\\1 ano\\FP\\aula08\\names.txt', "r", encoding="utf-8")
nomes=[]
for line in file:
    line = line.split()
    nomes.append(line)

file.close()
nomes.pop(0)
d = {}

for nome in nomes:
    if nome[-1] in d:
        d[nome[-1]].add(nome[0])
    else:
        d[nome[-1]] = {nome[0]}

print(d)
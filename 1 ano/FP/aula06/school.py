# Complete o programa!

# a)
def loadFile(fname, lst):
    with open(fname) as f:
        for line in f.readlines():
            lst.append(line)
    return lst

# b) Crie a função notaFinal aqui...
def notaFinal(nota1, nota2, nota3):
    notaFinal = (nota1 + nota2 + nota3)/3
    notaFinal = round(notaFinal, 1)
    return notaFinal

# c) Crie a função printPauta aqui...
def printPauta(lst):
    for i in len(lst):
        print("{} {} {}")
    

# d)
def main():
    lst = []
    # ler os ficheiros
    loadFile("school1.csv", lst)
    loadFile("school2.csv", lst)
    loadFile("school3.csv", lst)
    
    
    # ordenar a lista
    info = lst[0].split("\t")
    print(info)

    nota1 = float(lst[1].split("\t")[5])
    nota2 = float(lst[1].split("\t")[6])
    nota3 = float(lst[1].split("\t")[7])
    print(notaFinal(nota1, nota2, nota3))

    numero = int(lst[1].split("\t")[0])
    print(numero)

    nome = str(lst[1].split("\t")[1])
    print(nome)

    
    # mostrar a pauta
    


# Call main function
if __name__ == "__main__":
    main()



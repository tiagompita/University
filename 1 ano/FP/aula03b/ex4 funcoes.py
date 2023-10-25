def idades6a12(x):
    id6a12 = x*2.50
    return id6a12

def idades13a65(y):
    id13a65 = y*5.00
    return id13a65

def idades65(z):
    id65 = z*2.50
    return id65 

def main():
    inf6 = int(input("Quantas pessoas inferiores a 6 anos? "))
    xx = int(input("Quantas pessoas entre 6 a 12 anos? "))
    ent6a12 = idades6a12(xx)
    yy = int(input("Quantas pessoas entre 13 a 65 anos? "))
    ent13a65 = idades13a65(yy)
    zz = int(input("Quantas pessoas com mais de 65? "))
    mais65 = idades65(zz)

    totalpx = xx+yy+zz+inf6
    valor = ent6a12 + ent13a65 + mais65
    print("No total vão: ", totalpx, "pessoas e terão de pagar: ", valor, "€")   

main() 
def intersects(a1, b1, a2, b2):

    if b1 > a2 and a1 < b2:
       value = True
    else:
       value = False
    return value

#Pedido dos intervalos
a1 = int(input("a1? "))
b1 = int(input("b1? "))
a2 = int(input("a2? "))
b2 = int(input("b2? "))

valor = intersects(a1, b1, a2, b2)

str(valor)

print(valor)
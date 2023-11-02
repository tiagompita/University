def divproprios(n):
    soma = 0
    for i in range(1, n):
        div = n%i
        if div == 0:
            print(i)
            soma += i
        i += 1
    return soma
x = int(input("x? "))

valor = divproprios(x)
if valor < x:
    print("{:2d} é um número deficiente.".format(x))
elif valor == x:
    print("{:2d} é um número perfeito.".format(x))
else:
    print("{:2d} é um número abundante.".format(x))
idade6 = int(input("Quantas pessoas com idade inferior a 6 anos? "))
idade6a12 = int(input("Quantas pessoas com idade entre 6 a 12 anos? "))
idade13a65 = int(input("Quantas pessoas com idade entre 13 a 65 anos? "))
idade65 = int(input("Quantas pessoas com idade mais de 65 anos? "))

valor = idade6a12*2.50 + idade13a65*5 +idade65*2.50
print("Valor a pagar é: ", valor)
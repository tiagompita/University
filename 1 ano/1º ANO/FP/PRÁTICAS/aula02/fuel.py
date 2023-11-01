litros = float(input("Litros? "))
#ppl - Preço por Litro
ppl = 1.40
#Custo final
preco = litros*ppl

desconto = 0.10

#Litros +40, desconto 10%

if litros >= 40:
    preco -= (preco*desconto)
    print(preco, "€")
else:
    print(preco, "€")
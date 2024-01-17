t = float(input("NotaT?: "))
while t < 0 or t > 20:
    print("Nota invalida")
    t = float(input("NotaT?: "))
p = float(input("NotaP?: "))
while p < 0 or p > 20:
    print("Nota invalida")
    p = float(input("NotaP?: "))

media = (t + p)/2
if media < 9.5:
    print("Reprovado")
elif media >= 9.5 and media < 13:
    print("Suficiente")
else:
    print("Bom")
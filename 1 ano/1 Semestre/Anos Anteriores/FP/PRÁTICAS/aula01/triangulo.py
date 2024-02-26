import math

a = float(input("Digite o cateto A: "))

b = float(input("Digite o cateto B: "))

c = math.sqrt(a**2 + b**2)

angulo = math.sinh(b/c)

math.degrees(angulo)

print(angulo)
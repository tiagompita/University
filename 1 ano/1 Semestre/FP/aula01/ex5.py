import math

co = float(input('Digite o valor do cateto oposto: '))
ca = float(input('Digite o valor do cateto adjacente: '))

hip = math.sqrt((co**2) + (ca**2))
ang = math.degrees(math.sin(co/hip))

print('O valor da hipotenusa é {:.2f} e o valor do ângulo é {:.2f}.'.format(hip, ang))
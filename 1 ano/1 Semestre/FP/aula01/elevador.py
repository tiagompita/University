
#metros percorridos pelo elevador
andares = int(input("Quantos andares tem o prédio? "))
moradores = int(input("Quantos moradores por piso? "))

dmorador = (andares - 1 )*24 #distancia que o morador percorre metros
Soma = (andares*dmorador)/2

ano = Soma * 365
anokm = ano / 1000 #distancia em km

print("Elevador percorre num ano", anokm, "km.")

tempo = ano // 3600 # tempo em horas


print("O elevador num ano está em funcionamento por:", tempo, "horas.")
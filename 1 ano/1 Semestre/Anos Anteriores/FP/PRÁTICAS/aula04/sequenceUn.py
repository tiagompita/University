i = 0
Un = 100 
while Un > 0:
    print(Un)
    Un = 1.01*Un - 1.01
    i+=1

print("Mostrou {:2d} termos".format(i))
tempo = int(input("Tempo?"))
h = tempo // 3600
m = (tempo % 3600) // 60
s = (tempo % 3600) % 60


print("{:02d}:{:02d}:{:02d}".format(h,m,s))
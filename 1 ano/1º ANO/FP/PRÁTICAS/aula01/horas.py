s = int(input("Digite o tempo em segundos: "))

h = s // (60*60)
print(h)
s %= (60*60)
print(s)
m = s // 60
print(m)
s %= 60
print(s)
print("{:02d}:{:02d}:{:02d}".format(h, m, s))
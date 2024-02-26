print(" {:1s}    {:2s}    {:4s}".format("n","n²","2**n"))
for n in range(1,21):
    print("{:2d} {:4d} {:8d}".format(n, n**2, 2**n))
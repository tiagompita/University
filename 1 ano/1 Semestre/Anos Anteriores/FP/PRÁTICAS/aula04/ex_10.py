def isPrime(n):

    if n%2 and n%3 != 0:
        print("{:2d} é primo".format(n))
    else:
        print("{:2d} não é primo".format(n))


for i in range(1, 100):
    isPrime(i)

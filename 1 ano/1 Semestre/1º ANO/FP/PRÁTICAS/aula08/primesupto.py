
def primesUpTo(n):
    nprimes = set()
    primes = [True for i in range(n + 1)]
    p = 2
    while (p*p <= n):
        if primes[p] == True:
            for i in range(p ** 2, n + 1, p):
                primes[i] = False
        p += 1
    ## 0 and 1 false
    primes[0]= False
    primes[1]= False

    for p in range(n + 1):
        if primes[p]: ## if primes p returns true then we add p to nprimes 
            nprimes.add(p)
    return nprimes

# Testing:

def main():
    s = primesUpTo(1000)
    print(s)

    # Do some checks:
    assert primesUpTo(30) == {2,3,5,7,11,13,17,19,23,29}
    assert len(primesUpTo(1000)) == 168
    assert len(primesUpTo(7918)) == 999
    assert len(primesUpTo(7919)) == 1000
    print("All tests passed!")

if __name__ == "__main__":
    main()
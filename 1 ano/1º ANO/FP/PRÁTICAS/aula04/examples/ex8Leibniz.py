# Approximating the value of PI/4 using the Leibniz formula.
# JMM 2019 
import math

# Calculates the Leibniz series for N items
def LeibnizSeries(N):
    s = 0
    for n in range(N):
        v_n = (-1)**n / (2*n+1)
        s += v_n
    return s

# Prints the value of PI: a constant in math
print("PI/4 = ", math.pi/4)
print()

# Prints the header of the results table
print("{:>8s} {:>12s} {:>12s}".format("N", "sum", "error"))
print("-"*8, "-"*12, "-"*12)

# Prints the values of the approximation of PI/4 for 
# N = [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000]
for exp in range(0, 8):
    num = 10**exp
    total = LeibnizSeries(num)
    appError = abs(math.pi/4 - total)
    print("{:8d}   {:.8f}   {:.8f}".format(num, total, appError))


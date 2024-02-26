def factorial(n):
    factorial = 1
    while n >= 1:
        factorial = factorial * n
        n -= 1
    return factorial
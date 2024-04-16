def fibonacci(n):
    res = []
    
    if n < 0:
        return res
    if n == 0:
        return [0]
    if n == 1:
        return [0, 1]

    res = [0, 1]
    for i in range(1, n):
        next_number = res[i] + res[i-1]
        res.append(next_number)
    
    return res

print(fibonacci(5))
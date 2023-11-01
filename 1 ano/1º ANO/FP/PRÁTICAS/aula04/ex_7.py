def inputMedia():
    total = 0.0
    count = 0
    while True:
        r = input("Val? ")
        if r == "": 
            break
        v = float(r)
        total += v
        count += 1
    media = total / count
    return media

med = inputMedia()
print(med)
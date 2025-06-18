# Read numbers until a sentinel string and return them in a list.
# (The sentinel is an optional parameter.)
def inputFloats():
    l = []
    while True:
        s = input("Numero? ")
        if s == "": break
        r = float(s)
        l.append(r)
    return l

def countLower(lst, v):
    count = 0
    for i in lst:
        if i < v: 
            count += 1
    return count

def minmax(lst):
    if len(lst) == 0: return None, None

    min = lst[0]
    max = lst[0]

    for i in lst:
        if i < min: 
            min = i
        if i > max: 
            max = i
    return min, max

def main():
    list = inputFloats()

    min, max = minmax(list)
    medio = (min + max)/2
    
    countLower(list, medio)

    print("min: ", min)
    print("max: ", max)
    print("medio: ", medio)
    print("Valores abaixo do valor medio: ", countLower(list, medio))

if __name__ == "__main__":
    main()
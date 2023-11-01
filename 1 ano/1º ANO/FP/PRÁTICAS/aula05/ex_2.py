def inputFloatlist():
    lst = []
    while True:
        line = input("> ")
        if line == "": break
        lst.append(int(line))
    return lst
def countlower(lst, n):
    count = 0
    for i in range(1, len(lst)):
        if lst[i] < n:
            print(lst[i])
            count += 1
    return count
def minmax(lst):
    i = 0
    min = lst[i]
    max = lst[i]
    for n in lst:
        if n <= min:
            min = lst[i]
        if n >= max:
            max = lst[i]
        i += 1
    return max,min
lst = inputFloatlist()

x = int(input("x? "))
lowercount = countlower(lst, x)
print("{:2d} nºs da lista são inferiores a {:2d}".format(lowercount, x))
max, min = minmax(lst)
print("{:2d} é o mininmo da lista".format(min))
print("{:2d} é o maximo da lista".format(max))
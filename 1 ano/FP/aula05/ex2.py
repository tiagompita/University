def inputFloatList():
    lst = []
    while True:
        try:
            num = input()
            if num == '':
                break
            lst.append(float(num))
        except ValueError:
            continue
    return lst

def countLower(lst, v):
    count = 0
    for num in lst:
        if num < v:
            count += 1
    return count

def minmax(lst):
    if len(lst) == 0:
        return None
    min_val = lst[0]
    max_val = lst[0]
    for num in lst:
        if num < min_val:
            min_val = num
        if num > max_val:
            max_val = num
    return (min_val, max_val)

def main():
    lst = inputFloatList()
    min_val, max_val = minmax(lst)
    avg = (min_val + max_val) / 2
    count = countLower(lst, avg)
    print("Média entre o mínimo e o máximo:", avg)
    print("Quantidade de números inferiores à média:", count)

if __name__ == "__main__":
    main()
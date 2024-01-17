def mediana(lst):
    if len(lst) % 2 == 0:
        return (lst[int(len(lst)/2)] + lst[int(len(lst)/2)-1])/2
    else:
        return lst[int(len(lst)/2)]


def main():
    #Lista é par, logo 8+9/2 = 8.5
    lst = [1,3,4,5,7,8,9,10,13,23,34,56]
    print(mediana(lst))

if __name__ == "__main__":
    main()
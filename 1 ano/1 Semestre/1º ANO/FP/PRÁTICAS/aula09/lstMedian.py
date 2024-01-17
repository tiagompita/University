def lstMedian(lst):
    lst = sortList(lst)
    if (len(lst) % 2 == 0):
        len_list = len(lst)
        half_list = int(len_list/2)
        middle_list = lst[half_list-1:half_list+1]
        total_list = sum(middle_list)/2
        return total_list
    else:
        odd_len_list = len(lst)
        int_list = int(odd_len_list + 1)/2
        mid_odd_list = lst[int(int_list-1):int(int_list)]
        rm_item = mid_odd_list.pop()
        return rm_item

def sortList(lst):
    lst = sorted(lst)
    return lst

def ask_lst():
    lst = set()
    while True:
        n = int(input("(0 to finish)> "))
        if n == 0:break
        lst.add(n)
    return lst
    
def main():
    lst = ask_lst()

    median = lstMedian(lst)

    print("Median -> " + str(median))

if __name__ == "__main__":
    main()
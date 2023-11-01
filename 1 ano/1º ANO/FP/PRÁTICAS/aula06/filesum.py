def main():
    name = input("File? ")
    total = fileSum(name)
    print("Sum:", total)

def fileSum(filename):
    f = open(filename, 'r')
    nums = []
    total = 0
    for line in f:
        line = line.rstrip()
        if '.' in line:
            nums.append(float(line))
        elif line.isdigit():
            nums.append(int(line))
        else:
            print("This is not a number")
    total = calcSum(nums)
    return total
    
def calcSum(lst):
    sum = 0
    for n in lst:
        sum += n
    return sum

if __name__ == "__main__":
    main()
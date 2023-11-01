
def isPalindrome(Str):
    l = 0
    h = len(Str) - 1
 
    while (h > l):
        if (Str[l] != Str[h]):
            return False
        l += 1
        h -= 1
    return True

def makeOddString(Str):
    odd = ""
    for i in range(1, len(Str), 2):
        odd += Str[i]
    return odd

def makeevenString(Str):
    even = ""
    for i in range(0, len(Str), 2):
        even += Str[i]
    return even

def checkevenOddPalindrome(Str):
    odd = makeOddString(Str)
    even = makeevenString(Str)
    if (isPalindrome(odd) and
        isPalindrome(even)):
        print("Yes")
    else:
        print("No")

def main():
    Str = input(" > Type a string to check > ")
    checkevenOddPalindrome(Str)

if __name__ == "__main__":
    main()
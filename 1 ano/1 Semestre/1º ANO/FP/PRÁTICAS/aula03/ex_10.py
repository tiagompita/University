def countdown(n):
    if n == 0:
        print("Go!")
        return None        #return None or return is the same thing
    print(n)
    countdown(n-1)

#this is called recursion

n = int(input("n? "))

countdown(n)

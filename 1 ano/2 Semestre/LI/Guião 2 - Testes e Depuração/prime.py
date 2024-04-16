import sys

def main(argv):
    num = int(argv[1])
    for x in range(2, num//2 + 1):
        if num % x == 0:
            print("False")
            return
    print("True")

if __name__ == "__main__":
    main(sys.argv)

#Falta exercicio 2.8
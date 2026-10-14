import hashlib
import random

def find_avg(num):

    var = 0
    while True:
            h = hashlib.sha256(f"My student number is {num} and I tend to introduce a bug for every {var} lines of code I write!".encode('utf-8'))
            
            if h.hexdigest().startswith("000"):
                print(f"My student number is {num} and I tend to introduce a bug for every {var} lines of code I write!")
                print(f"Hash: {h.hexdigest()}")
                print(f"Numero de tentativas: {var}")
                break
    
            var += 1

    return var

def main():

    n = int(input("Quantas vezes para testar? "))
    storage = []
    
    for _ in range(n):
    
        storage.append(find_avg(random.randrange(9999)))


    print(f"Média {sum(storage) / len(storage)}")
    
    return

if __name__ == "__main__":
    main()
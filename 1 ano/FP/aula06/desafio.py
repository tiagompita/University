def count_vowels_and_consonants(words):
    vowels = ["a", "e", "i", "o", "u"]
    cvowels = 0
    cconsonants = 0
    
    for word in words:
        for char in word:
            if char in vowels:
                cvowels += 1
            else:
                cconsonants += 1
    
    return cvowels, cconsonants

def main (): 
    words = []
    while True: 
        palavras = str(input("palavra? "))
        if palavras != "":
            words.append(palavras)
        else: break
    print(words)

    vowels, consonants = count_vowels_and_consonants(words)
    print("vogais:", vowels)
    print("consoantes:", consonants)
	
if __name__ == "__main__":
    main()
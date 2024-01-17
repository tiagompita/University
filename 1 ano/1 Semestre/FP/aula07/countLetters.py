import sys
import unicodedata

def remove_accents(input_str):
    nfkd_form = unicodedata.normalize('NFD', input_str)
    return "".join([c for c in nfkd_form if not unicodedata.combining(c)])

def countLetters(lst):
    d = {}
    for word in lst:
        for char in word:
            if char.isalpha():
                if char in d:
                    d[char] += 1
                else:
                    d.update({char:1})

    return d

def main():

    lst = []

    import sys                  # INCLUA estas 3 linhas para permitir
    if len(sys.argv) > 1:      # correr o programa com palavras dadas:
        words = sys.argv[1]    #   python3 forca.py duas palavras
    print(sys.argv)

    file = open(words, "r", encoding="utf-8")
    for line in file:
        line = line.strip().lower()
        line = remove_accents(line)
        lst.append(line)
    
    for key, value in sorted(countLetters(lst).items()):
        print(key, value)

    file.close()


main()
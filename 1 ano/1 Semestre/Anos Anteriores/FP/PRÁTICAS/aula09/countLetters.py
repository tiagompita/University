import sys

def loadFile(fmame):
    d = dict()
    with open(sys.argv[1], 'r', encoding="utf8") as f:
        for line in f:
            line = line.strip()
            line.lower()
            for c in line:
                letra = c.lower()
                if letra.isalpha():
                    if letra not in d:
                        d[letra] = 1
                    else:
                        d[letra] += 1
        return d

def main():
    dic = loadFile(sys.argv[1])

    sort_dict = dict(sorted(dic.items(), key= lambda count: count[1], reverse= True))

    for letter, n in sort_dict.items():
        print(letter, end='->')
        print(n)

if __name__ == "__main__":
    main()
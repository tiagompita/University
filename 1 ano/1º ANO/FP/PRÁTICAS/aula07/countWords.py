import sys
d = dict()
with open(sys.argv[1], 'r', encoding="utf8") as f:
    for line in f:
        line = line.strip()
        line.lower()
        for c in line:
            letra = c.lower()
            if letra.isalpha() == True:
                if letra not in d:
                    d[letra] = 1
                else:
                    d[letra] += 1
                    
for key in sorted(d):
    print((key, d[key]))
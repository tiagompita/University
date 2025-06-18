import sys
def loadNames(fname):
    with open(fname, 'r') as f:
        names = []
        f.readline()
        for line in f:
            line = line.rstrip()
            names.append(line)
    return names

def last_Names(names):
    lastNames = []

    for name in names:
        splitName = name.split(sep=' ')
        lastName = splitName[-1]
        lastNames.append(lastName)
    return lastNames

def first_Names(names):
    firstNames = []
    
    for name in names:
        splitNames = name.split(sep=' ')
        firstName = splitNames[0]
        firstNames.append(firstName)
    return firstNames

def lastName_FirstName(lastNames, names):
    dic = {}
    firstNames = first_Names(names)
    for fname, lname in zip(firstNames, lastNames):         # zip() makes a tuple with (fname, lname) making the names match and they have the same length
        if lname not in dic:
            dic[lname] = [fname]
        else:
            dic[lname].append(fname)
    return dic

def main():
    names = loadNames(sys.argv[1])

    lastNames = last_Names(names)

    lastFirstName = lastName_FirstName(lastNames, names)

    for lname,fname in lastFirstName.items():
        print(lname, end=' -> ')
        print(*fname, sep='/')

if __name__ == "__main__":
    main()
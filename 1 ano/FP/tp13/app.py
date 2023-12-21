def loadFile(file):
    data = []
    with open(file, "r") as f:
        head = f.readline()
        if not head.startswith("ranking,"):
            raise ValueError("Invalid file format")
        

        for line in f:
            line = line.strip()
            parts = line.split(',')

            tup = (int(parts[0]), parts[1], int(parts[2]), int(parts[3]), int(parts[4]), int(parts[5]), parts[6])  

            data.append(tup)
            print(tup)
    return data

def main():
    loadFile('Ranking.csv')

if __name__ == '__main__':
    main()
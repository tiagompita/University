
# Constantes para indexar os tuplos:
NAME,DATE,OPEN,MAX,MIN,CLOSE,VOLUME = 0,1,2,3,4,5,6

def main():
    lst = loadStockFile("C:\\Users\\tiago\\Documents\\University\\1 ano\\FP\\aula07\\nasdaq.csv")
    # Show just first and last tuples:
    print("first:", lst[1])
    print("last:", lst[-1])
    
    print("a) totVol=", totalVolume(lst))

    print("b) maxVal=", maxValorization(lst))
    
    stocksDic = stocksByDateByName(lst)
    print("c) CSCO@11:", stocksDic['2020-10-12']['CSCO'])
    print("c) AMZN@22:", stocksDic['2020-10-22']['AMZN'])

    port = {'NFLX': 100, 'CSCO': 80}
    print("d) portfolio@01:", portfolioValue(stocksDic, port, "2020-10-01"))
    print("d) portfolio@30:", portfolioValue(stocksDic, port, "2020-10-30"))

def loadStockFile(filename):
    lst = []
    with open(filename) as f:
        for line in f:
            parts = line.strip().split('\t')
            name = parts[NAME]
            date = parts[DATE]
            tup = (name, date, float(parts[OPEN]), float(parts[MAX]),
                float(parts[MIN]), float(parts[CLOSE]), int(parts[VOLUME]))
            lst.append(tup)
    return lst

def totalVolume(lst):
    dic = {}
    for line in lst:
        if line[NAME] not in dic:
            dic[line[NAME]] = line[VOLUME]
        else:
            dic[line[NAME]] += line[VOLUME]
    
    return dic


def maxValorization(lst):
    dic = {}
    for line in lst:
        val = (line[CLOSE] / line[OPEN] - 1) * 100
        if line[DATE] not in dic or val > dic[line[DATE]][1]:
            dic[line[DATE]] = (line[NAME], val)
    return dic

def stocksByDateByName(lst):
    dic = {}
    for line in lst:
        if line[DATE] not in dic:
            dic[line[DATE]] = {}
        dic[line[DATE]][line[NAME]] = line
    return dic


def portfolioValue(stocks, portfolio, date):
    assert date in stocks
    val = 0.0
    for stock, quantity in portfolio.items():
        if stock in stocks[date]:
            val += quantity * stocks[date][stock][CLOSE]
    return val

if __name__ == "__main__":
    main()

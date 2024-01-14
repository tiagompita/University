def openFile(filename):
    lst = []
    with open(filename, "r", encoding="utf-8") as file:
        for line in file:
            lst.append(tuple(line.strip().split(",")))
    lst.pop(0)
    return lst

def clubByCountry(country, lst):

    for club in lst:
        if club[2] == country:
            print("Clube: {:<50} | Ranking: {:<5} | Pontos: {:<5}".format(club[1], club[0], club[3]))
            
def saveClubByCountry(country, lst):
    with open("Ranking.txt", "w", encoding="utf-8") as file:
        for club in lst:
            if club[2] == country:
                file.write("Clube: {:<50} | Ranking: {:<5} | Pontos: {:<5}\n".format(club[1], club[0], club[3]))


def countryClub(lst):
    d = {}
    for club in lst:
        if club[2] in d:
            d[club[2]].append(club[1])
        else:
            d[club[2]] = [club[1]]

def betterUpgrade(lst):
    max_change = 0
    club_up = None
    for club in lst:
        if club[6] == "+":
            change = int(club[4])
            if change > max_change:
                max_change = change
                club_up = club
    return club_up

def findClub(lst, club):
    for c in lst:
        if c[1] == club:
            print(c)
            return c
    print("Clube não encontrado")

def rankingMedioByCountry(lst):
    d = {}
    for club in lst:
        if club[2] in d:
            d[club[2]].append(int(club[0]))
        else:
            d[club[2]] = [int(club[0])]
    for country in sorted(d):
        print(country, sum(d[country])/len(d[country]))

def menu():
    print("MENU")
    print("1 - Mostrar os clubes de um país")
    print("2 - Guardar os clubes de um país num ficheiro")
    print("3 - Clubes por país")
    print("4 - Mostrar o clube com a maior evolução")
    print("5 - Mostrar os dados de um clube")
    print("6 - Mostrar o ranking médio por país")
    print("0 - Sair")

def main():
    lst = openFile("Ranking.csv")

    menu()
    op = int(input("Opção:"))

    while op != 0:
        if op == 1:
            country = input("Country:")
            country = country.capitalize()
            clubByCountry(country, lst)
        elif op == 2:
            country = input("Country:")
            country = country.capitalize()
            saveClubByCountry(country, lst)
        elif op == 3:
            countryClub(lst)
        elif op == 4:
            betterUpgrade(lst)
        elif op == 5:
            club = input("Club:")
            findClub(lst, club)
        elif op == 6:
            rankingMedioByCountry(lst)
        else:
            print("Opção inválida")
        menu()
        op = int(input("Opção:"))

main()
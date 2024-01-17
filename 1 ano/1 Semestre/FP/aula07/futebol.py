
def allMatches(teams):
    assert len(teams) >= 2, "Requires two or more teams!"
    matches = []
    for team1 in teams:
        for team2 in teams:
            if team1 != team2:
                matches.append((team1, team2))
    return matches

def classificacao(resultados):
    print("{:^5} : {:^5} : {:^5} : {:^5} : {:^5} : {:^5} : {:^5}".format("Equipa", "V", "E", "D", "GM", "GS", "P"))
    for i in range(len(resultados)):
        print(resultados[i])
    

def resultados(jogos):
    resultados = {}
    for jogo in jogos:
        gol1 = int(input("Golos do " + jogo[0] + "? "))
        gol2 = int(input("Golos do " + jogo[1]+ "? "))
        resultados[jogo] = (gol1, gol2)
    #print(resultados[('FCP', 'SLB')])
    return resultados

def main():
    equipas = ["SLB", "FCP"]
#    while True:
#        equipa = input("Qual é a equipa? ").upper()
#        if equipa == "":
#            break
#        equipas.append(equipa)
    
    print("Jogos:", allMatches(equipas))

    print("Resultados:", resultados(allMatches(equipas)))
    print(classificacao(resultados))
main()
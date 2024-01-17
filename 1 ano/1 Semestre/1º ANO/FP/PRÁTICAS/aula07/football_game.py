## Football game
import random

## Matches being played are if only 2 teams in league
## team1,team2 -> (team1 - team2) and (team2 - team1)
## making so each team plays two times against the same team
## one away game and one home game
## Constants to index 
V, E, D, GM, GS, POINTS = 0,1,2,3,4,5
HOME, AWAY = 0,1

def inputTeams():
    teams = []
    while True:
        team = input("Club > ")
        if team == '': break
        if team == '0': ## In order not to put teams by memory we can just
                        ## type 0 and get the 18 teams in the league of the year 2021/2022 Liga Bwin
            teams = loadTeams()
            break
        teams.append(team)
    return teams

def loadTeams():
    teams = []
    with open('teams.txt', 'r') as f:
        for line in f:
            line = line.rstrip()
            teams.append(line)
    return teams

def allMatches(teams):
	games = []
	for team1 in teams:
		for team2 in teams:
			if team1 != team2:
				games.append((team1, team2))
	return games

def playGames(matches):
    results = {}
    for match in matches:
        ## print(*match, sep = ' - ', end=' -> ')
        ## print(match)
        result = []
        for i in range(0,2):
            r = random.randint(0,7)
            result.append(r)
        #print(*result, sep= ' - ')
        results[match] = result
        ## code for input of results
        """result = input()
        result = result.split(sep=',')
        results[match] = [int(g) for g in result]"""

    return results

def tableCreator(teams, results):
    table = {}
    for team in teams:
        data = [0,0,0,0,0,0]
        for game,result in results.items():
            if team == game[HOME]:
                if result[HOME] > result[AWAY]:
                    data[V] += 1
                    data[GM] += result[HOME]
                    data[GS] += result[AWAY]
                    data[POINTS] += 3
                elif result[HOME] == result[AWAY]:
                    data[E] += 1
                    data[GM] += result[HOME]
                    data[GS] += result[AWAY]
                    data[POINTS] += 1
                else:
                    data[D] += 1
                    data[GM] += result[HOME]
                    data[GS] += result[AWAY]
            elif team == game[AWAY]:
                if result[HOME] > result[AWAY]:
                    data[D] += 1
                    data[GM] += result[AWAY]
                    data[GS] += result[HOME]
                elif result[HOME] == result[AWAY]:
                    data[E] += 1
                    data[GM] += result[AWAY]
                    data[GS] += result[HOME]
                    data[POINTS] += 1
                else:
                    data[V] += 1
                    data[GM] += result[AWAY]
                    data[GS] += result[HOME]
                    data[POINTS] += 3
            table[team] = data
    return table

def sortedTable(table):
    table = dict(sorted(table.items(), key=lambda item: item[1][POINTS], reverse = True))
    return table

def teamChampion(table):
    champion = ""
    points = 0
    for team, data in table.items():
        if data[POINTS] > points:
            champion = team
            points = data[POINTS]
            ratio_goals = data[GM] - data[GS]
        elif data[POINTS] == points:
            if ratio_goals < data[GM] - data[GS]:
                champion = team
    return champion, points

def printTable(table):
    i = 0
    table = sortedTable(table)
    print("     {:25s} {:2s} {:2s} {:2s}    {:3s} {:3s}   {:5s}"
        .format("Team", "V", "E", "D", "GM", "GS", "Points"))
    for team, data in table.items():
        i += 1
        print("{:2d} - {:25s}{:2d} {:2d} {:2d}    {:3d} {:3d}       {:3d}"
            .format(i,team, data[V], data[E], data[D], data[GM], data[GS], data[POINTS]))

def main():
    teams = inputTeams()
    matches = allMatches(teams)
    results = playGames(matches)

    ## For loop to check if the values are correct and all
    """
    for match, result in results.items():
        print(*match, sep=' - ', end=' ')
        print(' -> ', end='')
        print(*result, sep='-') 
    """
    ## TABLE DIC {team: [V,E,D,GM,GS,POINTS]}
    table = tableCreator(teams, results)
    printTable(table)

    champion, points = teamChampion(table)

    print("Winning team is " + champion + ' with ' + str(points) + ' points!')

if __name__ == "__main__":
    main()
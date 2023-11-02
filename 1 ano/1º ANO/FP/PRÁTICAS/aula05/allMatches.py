def addTeams():
	teams = []
	while True:
		line = input(" >")
		if line == "" or line == "0": break
		teams.append(line)
	return teams
	
## This should be done with a list comprehension [expression in x ]
## done with a nested for loops is expensive in python ;)
## newlist = [expression for item in iterable if condition == True]

def allMatches(teams):
	games = []
	for team1 in teams:
		match = []
		for team2 in teams:
			if team1 != team2:
				match.append((team1, team2))
		games.append(match)
	return games
def main():
	teams = addTeams()
	print("All teams are ", teams)
	matches = allMatches(teams)
	print("All games that will be played are", matches)

	
if __name__ == "__main__":
	main()

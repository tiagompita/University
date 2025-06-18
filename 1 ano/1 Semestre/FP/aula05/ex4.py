def allMatches(teams):
    assert len(teams) >= 2, "Requires two or more teams!"
    matches = []
    for team1 in teams:
        for team2 in teams:
            if team1 != team2:
                matches.append((team1, team2))
    return matches

allMatches(["FCP", "SCP", "SLB"])

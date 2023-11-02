def allMatches(teams):
    assert len(teams) >= 2, "Requires two or more teams!"
    return [(teams[i], teams[j]) for i in range(len(teams)) for j in range(i+1, len(teams))]

def allMatches(teams):
    assert len(teams) >= 2, "Requires two or more teams!"
    
    # Complete aqui
    for i in range(len(teams)):
        for j in range(i+1, len(teams)):
            lst = print(teams[i] + teams[j])
    return lst

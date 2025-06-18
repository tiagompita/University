
def main():
    A = "reading"
    B = "eating"
    C = "traveling"
    D = "writing"
    E = "running"
    F = "music"
    G = "movies"
    H = "programming"

    interests = {
        "Marco": {A, D, E, F},
        "Anna": {E, A, G},
        "Maria": {G, D, E},
        "Paolo": {B, D, F},
        "Frank": {D, B, E, F, A},
        "Teresa": {F, H, C, D}
        }


    print("a) Table of common interests:")
    common_interests = {}

    #Escolher duas pessoas
    for person1 in interests:
        for person2 in interests:
            #Ser diferente e nao estar incluido
            if person1 != person2 and (person2, person1) not in common_interests:
                
                common = interests[person1].intersection(interests[person2])
                
                common_interests[(person1, person2)] = common

    print(common_interests)

    print("b) Maximum number of common interests:")
    maxCI = max(len(interests) for interests in common_interests.values())
    print(maxCI)

    print("c) Pairs with maximum number of matching interests:")
    maxmatches = [pair for pair, interests in common_interests.items() if len(interests) == maxCI]

    commoninterests = {}
    for p1 in interests:
        for p2 in interests:
            if p1 != p2 and (p2, p1) not in commoninterests:
                commoninterests[(p1, p2)] = interests[p1] & interests[p2]
                # & -> intersecção de conjuntos
    print(commoninterests)

    print("b) Maximum number of common interests:")
    maxCI = max(len(commoninterests[max]) for max in commoninterests)
    print(maxCI)

    print("c) Pairs with maximum number of matching interests:")
    maxmatches = []
    for pair in commoninterests:
        if len(commoninterests[pair]) == maxCI:
            maxmatches.append(pair)

    print(maxmatches)

    print("d) Pairs with low similarity:")
    lowJaccard = []

    for p1 in interests:
        for p2 in interests:
            if p1 != p2 and (p2, p1) not in lowJaccard:
                jaccard = len(interests[p1] & interests[p2]) / len(interests[p1] | interests[p2])
                if jaccard < 0.25:
                    lowJaccard.append((p1, p2))


    print(lowJaccard)


# Start program:
main()


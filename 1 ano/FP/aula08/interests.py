
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
    print(maxmatches)

    print("d) Pairs with low similarity:")
    lowJaccard = []
    for pair, common in common_interests.items():
        total = len(interests[pair[0]]) + len(interests[pair[1]]) - len(common)
        jaccard = len(common) / total
        if jaccard < 0.25:
            lowJaccard.append(pair)

    print(lowJaccard)


# Start program:
main()


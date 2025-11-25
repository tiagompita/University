from constraintsearch import *

amigos = ["Andre", "Bernardo", "Claudio"]

# Variables: bike_P, hat_P
# Found order that gives 14 calls:
# ('bike_Bernardo', 'bike_Andre', 'hat_Andre', 'hat_Bernardo', 'bike_Claudio', 'hat_Claudio')
variables = ['bike_Bernardo', 'bike_Andre', 'hat_Andre', 'hat_Bernardo', 'bike_Claudio', 'hat_Claudio']

domains = {}
for v in variables:
    person = v.split('_')[1]
    domains[v] = [p for p in amigos if p != person]

constraints = {}

def all_diff(v1, val1, v2, val2):
    return val1 != val2

for p1 in amigos:
    for p2 in amigos:
        if p1 < p2:
            constraints[(f'bike_{p1}', f'bike_{p2}')] = all_diff
            constraints[(f'bike_{p2}', f'bike_{p1}')] = all_diff
            constraints[(f'hat_{p1}', f'hat_{p2}')] = all_diff
            constraints[(f'hat_{p2}', f'hat_{p1}')] = all_diff

def hat_claudio_bike_bernardo(v1, val1, v2, val2):
    if 'hat' in v1:
        hat_val = val1
        bike_val = val2
    else:
        hat_val = val2
        bike_val = val1
    if hat_val == 'Claudio':
        return bike_val == 'Bernardo'
    return True

for p in amigos:
    v_hat = f'hat_{p}'
    v_bike = f'bike_{p}'
    constraints[(v_hat, v_bike)] = hat_claudio_bike_bernardo
    constraints[(v_bike, v_hat)] = hat_claudio_bike_bernardo

class AmigosConstraintSearch(ConstraintSearch):
    def __init__(self, domains, constraints):
        super().__init__(domains, constraints)
        
    def search(self, domains=None):
        solution = super().search(domains)
        if solution is None:
            return None
        
        if domains is None:
            result = {}
            for p in amigos:
                result[p] = (solution[f'bike_{p}'], solution[f'hat_{p}'])
            return result
        else:
            return solution

cs = AmigosConstraintSearch(domains, constraints)

if __name__ == "__main__":
    solution = cs.search()
    if solution:
        print("Solution found:")
        for amigo, (bike, hat) in solution.items():
            print(f"{amigo}: Bike de {bike}, Chapéu de {hat}")
    else:
        print("No solution found.")

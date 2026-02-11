import sys
import os

# Add the directory containing constraintsearch.py to the python path
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'P', 'resolucao-automatica-de-problemas'))

from constraintsearch import ConstraintSearch

def solve_puzzle():
    people = ['Andre', 'Bernardo', 'Claudio']
    
    # Variables: 
    # bike_P: The owner of the bike P is riding
    # hat_P: The owner of the hat P is wearing
    variables = []
    for p in people:
        variables.append(f'bike_{p}')
        variables.append(f'hat_{p}')
    
    # Domains
    # "Cada um anda na bicicleta de um dos amigos" -> Cannot ride own bike
    # "leva o chapéu de um dos outros" -> Cannot wear own hat
    domains = {}
    for v in variables:
        person = v.split('_')[1]
        domains[v] = [p for p in people if p != person]
        
    constraints = {}
    
    # Constraint 1 & 2: All bikes distinct, All hats distinct
    def all_diff(v1, val1, v2, val2):
        return val1 != val2

    for p1 in people:
        for p2 in people:
            if p1 < p2:
                # Bikes must be different
                constraints[(f'bike_{p1}', f'bike_{p2}')] = all_diff
                constraints[(f'bike_{p2}', f'bike_{p1}')] = all_diff
                
                # Hats must be different
                constraints[(f'hat_{p1}', f'hat_{p2}')] = all_diff
                constraints[(f'hat_{p2}', f'hat_{p1}')] = all_diff

    # Constraint 3: "O que leva o chapéu de Cláudio anda na bicicleta de Bernardo"
    # Links hat_P and bike_P for the same person P
    def hat_claudio_bike_bernardo(v1, val1, v2, val2):
        # v1 is hat, v2 is bike (or vice versa)
        # If hat is Claudio, bike must be Bernardo
        
        # Determine which value corresponds to hat and which to bike
        if 'hat' in v1:
            hat_val = val1
            bike_val = val2
        else:
            hat_val = val2
            bike_val = val1
            
        if hat_val == 'Claudio':
            return bike_val == 'Bernardo'
        return True

    for p in people:
        v_hat = f'hat_{p}'
        v_bike = f'bike_{p}'
        constraints[(v_hat, v_bike)] = hat_claudio_bike_bernardo
        constraints[(v_bike, v_hat)] = hat_claudio_bike_bernardo

    # With propagation
    cs_prop = ConstraintSearch(domains, constraints, propagate=True)
    solution = cs_prop.search()
    
    # Without propagation
    cs_no_prop = ConstraintSearch(domains, constraints, propagate=False)
    cs_no_prop.search()

    if solution:
        print("Solution found:")
        for p in people:
            print(f"{p}: Bike de {solution[f'bike_{p}']}, Chapéu de {solution[f'hat_{p}']}")
        print(f"Calls with propagation: {cs_prop.calls}")
        print(f"Calls without propagation: {cs_no_prop.calls}")
    else:
        print("No solution found.")
        print(f"Calls with propagation: {cs_prop.calls}")
        print(f"Calls without propagation: {cs_no_prop.calls}")

if __name__ == "__main__":
    solve_puzzle()

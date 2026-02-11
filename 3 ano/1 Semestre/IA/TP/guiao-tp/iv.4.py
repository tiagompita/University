
import sys
import os

# Add the directory containing constraintsearch.py to the python path
sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'P', 'resolucao-automatica-de-problemas'))

from constraintsearch import ConstraintSearch

def make_constraint_graph(regions, adjacencies):
    domains = {}
    constraints = {}
    return domains, constraints

def map_constraint(r1, c1, r2, c2):
    return c1 != c2

def solve_map(name, regions, adjacencies):
    print(f"--- Solving Map {name} ---")
    
    # Build constraints dictionary
    constraints = {}
    for (r1, r2) in adjacencies:
        constraints[(r1, r2)] = map_constraint
        constraints[(r2, r1)] = map_constraint
    
    for k in range(1, 6): # Try 1 to 5 colors
        colors = [f'Color{i}' for i in range(1, k+1)]
        domains = {r: colors for r in regions}
        
        print(f"Checking {k} colors...")
        
        # With propagation
        cs_prop = ConstraintSearch(domains, constraints, propagate=True)
        solution = cs_prop.search()
        
        # Without propagation
        cs_no_prop = ConstraintSearch(domains, constraints, propagate=False)
        cs_no_prop.search() # We just want the calls count
        
        print(f"  Calls with propagation: {cs_prop.calls}")
        print(f"  Calls without propagation: {cs_no_prop.calls}")

        if solution:
            print(f"Solution found with {k} colors:")
            # Sort by region name for cleaner output
            for r in sorted(solution.keys()):
                print(f"{r}: {solution[r]}")
            return k
        else:
            print(f"No solution with {k} colors.")
    return None

# Map A
regions_a = ['A', 'B', 'C', 'D', 'E']
adj_a = [
    ('A', 'B'), ('A', 'D'), ('A', 'E'),
    ('B', 'C'), ('B', 'E'),
    ('C', 'E'),
    ('D', 'E')
]

# Map B
regions_b = ['A', 'B', 'C', 'D', 'E', 'F']
adj_b = [
    ('A', 'B'), ('A', 'D'), ('A', 'E'),
    ('B', 'C'), ('B', 'E'),
    ('C', 'E'), ('C', 'F'),
    ('D', 'E'), ('D', 'F'),
    ('E', 'F')
]

# Map C
regions_c = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
adj_c = [
    ('A', 'B'), ('A', 'E'), ('A', 'F'), ('A', 'D'),
    ('B', 'C'), ('B', 'F'),
    ('C', 'F'), ('C', 'G'), ('C', 'D'),
    ('D', 'E'), ('D', 'G'),
    ('E', 'F'), ('E', 'G'),
    ('F', 'G')
]

if __name__ == "__main__":
    solve_map("(a)", regions_a, adj_a)
    print()
    solve_map("(b)", regions_b, adj_b)
    print()
    solve_map("(c)", regions_c, adj_c)

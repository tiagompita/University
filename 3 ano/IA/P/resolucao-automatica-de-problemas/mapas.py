from constraintsearch import *

def mapa_constraint(r1, c1, r2, c2):
    return c1 != c2

def make_constraint_graph(regions, adjacencies, colors):
    domains = {r: colors for r in regions}
    constraints = {}
    for (r1, r2) in adjacencies:
        constraints[(r1, r2)] = mapa_constraint
        constraints[(r2, r1)] = mapa_constraint
    return domains, constraints

# Map A definition
regions = ['A', 'B', 'C', 'D', 'E']
adjacencies = [
    ('A', 'B'), ('A', 'D'), ('A', 'E'),
    ('B', 'C'), ('B', 'E'),
    ('C', 'E'),
    ('D', 'E')
]
colors = ['red', 'blue', 'green', 'yellow', 'white']

domains, constraints = make_constraint_graph(regions, adjacencies, colors)
cs = ConstraintSearch(domains, constraints)

if __name__ == "__main__":
    print(cs.search())

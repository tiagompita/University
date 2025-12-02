class BayesNet:

    def __init__(self, ldep=None):
        if not ldep:
            ldep = {}
        self.dependencies = ldep

    # The network data is stored in a dictionary that
    # associates the dependencies to each variable:
    #    { v1:deps1, v2:deps2, ... }
    # These dependencies are themselves given
    # by another dictionary that associates conditional
    # probabilities to conjunctions of mother variables:
    #    { mothers1:cp1, mothers2:cp2, ... }
    # The conjunctions are frozensets of pairs (mothervar,boolvalue)
    #
    def add(self,var,mothers,prob):
        self.dependencies.setdefault(var,{})[frozenset(mothers)] = prob

    # Joint probability for a given conjunction of
    # all variables of the network
    def jointProb(self,conjunction):
        prob = 1.0
        for (var,val) in conjunction:
            for (mothers,p) in self.dependencies[var].items():
                if mothers.issubset(conjunction):
                    prob*=(p if val else 1-p)
        return prob

    def ancestors(self, var):
        parents = set()
        if var in self.dependencies:
            keys = list(self.dependencies[var].keys())
            if keys:
                for (p_var, _) in keys[0]:
                    parents.add(p_var)
        
        result = set(parents)
        for p in parents:
            result.update(self.ancestors(p))
        return list(result)

    def individualProb(self, var, val):
        import itertools
        variables = [v for v in self.dependencies.keys() if v != var]
        prob = 0
        for values in itertools.product([True, False], repeat=len(variables)):
            conjunction = [(var, val)] + list(zip(variables, values))
            prob += self.jointProb(conjunction)
        return prob
    
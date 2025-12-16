#encoding: utf8

from semanticnetwork import *
from constraintsearch import *
from bayes_net import *
from collections import Counter


class MySN(SemanticNetwork):
    def __init__(self):
        SemanticNetwork.__init__(self)
        # ADD CODE HERE IF NEEDED
        pass

    def new_query_local(self,e1,relname=None,e2=None):
        results = []
        for d in self.declarations:
            if d.relation.entity1 == e1:
                if (relname == None or d.relation.name == relname) and \
                   (e2 == None or d.relation.entity2 == e2):
                    results.append((d.relation.name,d.relation.entity2))
            if d.relation.entity2 == e1 and d.relation.name in self.inverse:
                inv = self.inverse[d.relation.name]
                if (relname == None or inv == relname) and \
                   (e2 == None or d.relation.entity1 == e2):
                    results.append((inv,d.relation.entity1))
        return sorted(list(set(results)))

    def new_query(self,entity,relname):
        if relname in ['member', 'subtype']:
            return [e2 for (r, e2) in self.new_query_local(entity, relname)]

        # Determine Association Type
        assoc_one_count = 0
        assoc_some_count = 0
        for d in self.declarations:
            if d.relation.name == relname:
                if isinstance(d.relation, AssocOne):
                    assoc_one_count += 1
                elif isinstance(d.relation, AssocSome):
                    assoc_some_count += 1
        
        assoc_type = AssocSome if assoc_some_count > assoc_one_count else AssocOne

        # Get Predecessors (BFS)
        predecessors = [entity]
        visited = set([entity])
        queue = [entity]
        
        while queue:
            curr = queue.pop(0)
            for d in self.declarations:
                if d.relation.entity1 == curr and \
                   (isinstance(d.relation, Member) or isinstance(d.relation, Subtype)):
                    parent = d.relation.entity2
                    if parent not in visited:
                        visited.add(parent)
                        predecessors.append(parent)
                        queue.append(parent)

        # Traverse
        all_vals = set()
        all_opps = set()
        
        inv_relname = self.inverse.get(relname)
        opp_relname = self.opposite.get(relname)
        inv_opp_relname = self.inverse.get(opp_relname) if opp_relname else None

        for e in predecessors:
            local_vals = []
            local_opps = []
            
            for d in self.declarations:
                # Check relname
                if d.relation.entity1 == e and d.relation.name == relname:
                    if isinstance(d.relation, assoc_type):
                        local_vals.append(d.relation.entity2)
                if inv_relname and d.relation.entity2 == e and d.relation.name == inv_relname:
                    local_vals.append(d.relation.entity1)
                
                # Check opp_relname
                if opp_relname:
                    if d.relation.entity1 == e and d.relation.name == opp_relname:
                        local_opps.append(d.relation.entity2)
                    if inv_opp_relname and d.relation.entity2 == e and d.relation.name == inv_opp_relname:
                        local_opps.append(d.relation.entity1)

            if assoc_type == AssocOne:
                if local_vals:
                    c = Counter(local_vals)
                    return [c.most_common(1)[0][0]]
                if local_opps:
                    return []
            else:
                all_vals.update(local_vals)
                all_opps.update(local_opps)
        
        if assoc_type == AssocOne:
            return []
        else:
            return sorted(list(all_vals - all_opps))

    # if needed, auxiliary methods can be added here


class MyCS(ConstraintSearch):

    def __init__(self,domains,constraints):
        ConstraintSearch.__init__(self,domains,constraints)
        # ADD CODE HERE IF NEEDED
        pass

    def search_all(self,domains=None):
        self.calls += 1
        
        if domains==None:
            domains = self.domains

        if any(lv==[] for lv in domains.values()):
            return []

        if all(len(lv)==1 for lv in list(domains.values())):
            return [{ v:lv[0] for (v,lv) in domains.items() }]
       
        # Select the most constrained variable
        vars_with_choices = [v for v in domains if len(domains[v]) > 1]
        if not vars_with_choices:
            return [] 
            
        vars_with_choices.sort(key=lambda v: (len(domains[v]), v))
        var = vars_with_choices[0]
        
        solutions = []
        for val in domains[var]:
            newdomains = dict(domains)
            newdomains[var] = [val]
            self.propagate(newdomains,var)
            solutions.extend(self.search_all(newdomains))
            
        return solutions

    # if needed, auxiliary methods can be added here

class MyBN(BayesNet):

    def __init__(self):
        BayesNet.__init__(self)
        # ADD CODE HERE IF NEEDED
        pass

    def independence_bag(self,v1,v2):
        def get_parents(var):
            if var not in self.dependencies:
                return []
            keys = list(self.dependencies[var].keys())
            if not keys:
                return []
            # keys[0] is a frozenset of (var, val)
            return [p for (p, v) in keys[0]]

        def get_ancestors(var):
            ancestors = set()
            queue = [var]
            while queue:
                curr = queue.pop(0)
                for p in get_parents(curr):
                    if p not in ancestors:
                        ancestors.add(p)
                        queue.append(p)
            return ancestors

        anc_v1 = get_ancestors(v1) | {v1}
        anc_v2 = get_ancestors(v2) | {v2}
        common = anc_v1.intersection(anc_v2)

        lca_set = set()
        for c in common:
            # Check if c is an ancestor of any other node in common
            is_ancestor_of_other = False
            for c_prime in common:
                if c != c_prime and c in get_ancestors(c_prime):
                    is_ancestor_of_other = True
                    break
            if not is_ancestor_of_other:
                lca_set.add(c)

        bag = {v1, v2}
        for x in anc_v1:
            if any(lca in (get_ancestors(x) | {x}) for lca in lca_set):
                bag.add(x)
        for x in anc_v2:
            if any(lca in (get_ancestors(x) | {x}) for lca in lca_set):
                bag.add(x)

        mothers_to_add = set()
        for x in bag:
            mothers_to_add.update(get_parents(x))
        bag.update(mothers_to_add)

        return sorted(list(bag))

    # if needed, auxiliary methods can be added here



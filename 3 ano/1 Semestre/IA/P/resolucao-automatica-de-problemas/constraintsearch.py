# Pesquisa para resolucao de problemas de atribuicao
# 
# Introducao a Inteligencia Artificial
# DETI / UA
#
# (c) Luis Seabra Lopes, 2012-2026
#


class ConstraintSearch:

    # domains é um dicionário com o domínio de cada variável;
    # constaints e' um dicionário com a restrição aplicável a cada aresta;
    def __init__(self,domains,constraints, propagate=True):
        self.domains = domains
        self.constraints = constraints
        self.calls = 0
        self.propagate_constraints = propagate

    # domains é um dicionário com os domínios actuais
    # de cada variável
    # ( ver acetato "Pesquisa com propagacao de restricoes
    #   em problemas de atribuicao - algoritmo" )
    def search(self,domains=None):
        self.calls += 1 
        
        if domains==None:
            domains = self.domains

        # se alguma variavel tiver lista de valores vazia, falha
        if any([lv==[] for lv in domains.values()]):
            return None

        # se nenhuma variavel tiver mais do que um valor possivel, sucesso
        if all([len(lv)==1 for lv in list(domains.values())]):
            # se valores violam restricoes, falha
            # ( verificacao desnecessaria se for feita a propagacao
            #   de restricoes )
            for (var1,var2) in self.constraints:
                constraint = self.constraints[var1,var2]
                if not constraint(var1,domains[var1][0],var2,domains[var2][0]):
                    return None 
            return { v:lv[0] for (v,lv) in domains.items() }
       
        # continuação da pesquisa
        # ( falta fazer a propagacao de restricoes )
        for var in domains.keys():
            if len(domains[var])>1:
                for val in domains[var]:
                    newdomains = dict(domains)
                    newdomains[var] = [val]
                    
                    if self.propagate_constraints:
                        if self.propagate(newdomains,var):
                            solution = self.search(newdomains)
                            if solution != None:
                                return solution
                    else:
                        solution = self.search(newdomains)
                        if solution != None:
                            return solution
        return None

    def propagate(self, domains, var):
        for neighbor in [v for v in domains if (var,v) in self.constraints]:
            constraint = self.constraints[var,neighbor]
            
            # domains[var] has been reduced to a single value
            val_var = domains[var][0]
            
            # Filter neighbor domain
            new_domain = [val for val in domains[neighbor] if constraint(var, val_var, neighbor, val)]
            
            if len(new_domain) < len(domains[neighbor]):
                domains[neighbor] = new_domain
            
            if not domains[neighbor]:
                return False
        return True



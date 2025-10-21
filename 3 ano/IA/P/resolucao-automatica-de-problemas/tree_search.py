
# Module: tree_search
# 
# This module provides a set o classes for automated
# problem solving through tree search:
#    SearchDomain  - problem domains
#    SearchProblem - concrete problems to be solved
#    SearchNode    - search tree nodes
#    SearchTree    - search tree with the necessary methods for searhing
#
#  (c) Luis Seabra Lopes
#  Introducao a Inteligencia Artificial, 2012-2020,
#  Inteligência Artificial, 2014-2026

from abc import ABC, abstractmethod

# Dominios de pesquisa
# Permitem calcular
# as accoes possiveis em cada estado, etc
class SearchDomain(ABC):

    # construtor
    @abstractmethod
    def __init__(self):
        pass

    # lista de accoes possiveis num estado
    @abstractmethod
    def actions(self, state):
        pass

    # resultado de uma accao num estado, ou seja, o estado seguinte
    @abstractmethod
    def result(self, state, action):
        pass

    # custo de uma accao num estado
    @abstractmethod
    def cost(self, state, action):
        pass

    # custo estimado de chegar de um estado a outro
    @abstractmethod
    def heuristic(self, state, goal):
        pass

    # test if the given "goal" is satisfied in "state"
    @abstractmethod
    def satisfies(self, state, goal):
        pass


# Problemas concretos a resolver
# dentro de um determinado dominio
class SearchProblem:
    def __init__(self, domain, initial, goal):
        self.domain = domain
        self.initial = initial
        self.goal = goal
    def goal_test(self, state):
        return self.domain.satisfies(state,self.goal)

# Nos de uma arvore de pesquisa
class SearchNode:
    def __init__(self,state,parent, cost = 0, heuristic = 0, action = None): 
        self.state = state
        self.parent = parent
        self.depth = 0 if parent == None else parent.depth + 1
        self.expanded = False
        self.cost = cost
        self.heuristic = heuristic
        self.action = action if parent == None else parent
    def __str__(self):
        return "no(" + str(self.state) + "," + str(self.parent) + ")"
    def __repr__(self):
        return str(self)

# Arvores de pesquisa
class SearchTree:

    # construtor
    def __init__(self,problem, strategy='breadth'): 
        self.problem = problem
        root = SearchNode(problem.initial, None, cost = 0)
        self.open_nodes = [root]
        self.strategy = strategy
        self.solution = None

        self.terminals = 0
        self.non_terminals = 0

        # lista de todos os nós criados na árvore
        self.all_nodes = [root]

        self._cost = 0
        self.heuristic = 0

        self.highest_cost_nodes = []
        self.average_depth = 0

        self.plan = {}
    
    @property
    def length(self):
        if self.solution != None:
            return self.solution.depth
        
    @property
    def avg_branching(self):
        # número total de nós (exclui a raiz ao calcular filhos)
        total = len(self.all_nodes)
        # número de pais = nós que foram efetivamente expandidos
        parents = len([n for n in self.all_nodes if n.expanded])
        return (total - 1) / parents if parents > 0 else 0.0

    @property
    def cost(self):
        # devolve None se não há solução; caso contrário o custo acumulado do nó solução
        if self.solution is None:
            return None
        return self.solution.cost

    # obter o caminho (sequencia de estados) da raiz ate um no
    def get_path(self,node):
        if node.parent == None:
            return [node.state]
        path = self.get_path(node.parent)
        path += [node.state]
        return(path)

    # procurar a solucao
    def search(self, limit=None):
        while self.open_nodes != []:
            node = self.open_nodes.pop(0)

            # se é objetivo, não o marcamos como expandido (é terminal)
            if self.problem.goal_test(node.state):
                self.solution = node

                # guardar custo total da solução na árvore
                self._cost = node.cost
                # calcular contagens finais quando a solução é encontrada
                self.non_terminals = len([n for n in self.all_nodes if n.expanded])
                self.terminals = len(self.all_nodes) - self.non_terminals
                
                if self.all_nodes:
                    max_cost = max(n.cost for n in self.all_nodes)
                    self.highest_cost_nodes = [n for n in self.all_nodes if n.cost == max_cost]

                    self.average_depth = sum([n.depth for n in self.all_nodes]) / len(self.all_nodes)

                return self.get_path(node)

            # marcar nó como processado (conta como não-terminal)
            node.expanded = True

            lnewnodes = []
            # só geramos filhos se não ultrapassarmos o limite
            if (limit is None) or (node.depth < limit):
                for a in self.problem.domain.actions(node.state):
                    newstate = self.problem.domain.result(node.state, a)
                    if newstate not in self.get_path(node):
                        # newnode = SearchNode(newstate, node)
                        
                        # calcular custo da ação e custo acumulado do filho
                        action_cost = self.problem.domain.cost(node.state, a)
                        # se a implementação do domínio devolve None para custo inválido, ignorar
                        if action_cost is None:
                            continue
                        child_cost = node.cost + action_cost
                        h = self.problem.domain.heuristic(newstate, self.problem.goal)
                        newnode = SearchNode(newstate, node, cost=child_cost, heuristic=h, action=)

                        lnewnodes.append(newnode)
                        self.all_nodes.append(newnode)

                # (não alteramos a flag expanded aqui; já marcámos o nó como processado)
            else:
                # nós que atingem o limite são tratados como terminais (não expandidos)
                pass

            self.add_to_open(lnewnodes)

        # Se esgotou-se a fronteira sem solução, calcular contagens finais
        self.non_terminals = len([n for n in self.all_nodes if n.expanded])
        self.terminals = len(self.all_nodes) - self.non_terminals
        
        if self.all_nodes:
            max_cost = max(n.cost for n in self.all_nodes)
            self.highest_cost_nodes = [n for n in self.all_nodes if n.cost == max_cost]

            self.average_depth = sum([n.depth for n in self.all_nodes]) / len(self.all_nodes)

        return None

    # juntar novos nos a lista de nos abertos de acordo com a estrategia
    def add_to_open(self,lnewnodes):
        if self.strategy == 'breadth':
            self.open_nodes.extend(lnewnodes)
        elif self.strategy == 'depth':
            self.open_nodes[:0] = lnewnodes
        elif self.strategy == 'uniform':
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key=lambda n : n.cost)
        elif self.strategy == 'greedy':
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key=lambda h : h.heuristic)
        elif self.strategy == 'a*':
            self.open_nodes.extend(lnewnodes)
            self.open_nodes.sort(key=lambda a : (a.heuristic + a.cost))

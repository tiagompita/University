#STUDENT NAME: Tiago Pita
#STUDENT NUMBER: 120152

#DISCUSSED TPI-1 WITH: (names and numbers):


from tree_search import *
from strips import *
from blocksworld2 import *

class MyNode(SearchNode):

    def __init__(self,state,parent,action=None,problem=None,arg5=None,arg6=None):
        super().__init__(state,parent)
        self.state = state
        self.parent = parent
        self.depth = 0 if parent == None else parent.depth+1
        self.cost = 0 if parent == None else parent.cost + problem.domain.cost(parent.state, action)
        self.heuristic = problem.domain.heuristic(state, problem.goal)

        self.expanded = False

class MyTree(SearchTree):

    def __init__(self,problem, strategy='breadth'):
        super().__init__(problem,strategy)
        self.greedy_mode = False

    def hybrid_add_to_open(self,lnewnodes):
        for node in lnewnodes:
            if node.cost > self.root_heuristic / 2:
                self.greedy_mode = True
                break

        self.open_nodes.extend(lnewnodes)
        
        if self.greedy_mode:
            self.open_nodes.sort(key=lambda node: (node.heuristic, node.depth, node.state))
        else:
            self.open_nodes.sort(key=lambda node: (node.cost, node.depth, node.state))

    def search2(self):
        self.terminal = 0
        self.non_terminal = 0
        self.greedy_mode = False

        root_node = MyNode(self.problem.initial, None, action=None, problem=self.problem)
        self.open_nodes = [root_node]

        self.root_heuristic = root_node.heuristic

        while self.open_nodes != []:
            node = self.open_nodes.pop(0)
            
            if self.problem.goal_test(node.state):
                self.solution = node
                self.terminal = len(self.open_nodes) + 1
                self.solution_cost = node.cost
                return self.get_path(node)
            self.non_terminal += 1

            lnewnodes = []
            for a in self.problem.domain.actions(node.state):
                newstate = self.problem.domain.result(node.state,a)
                if newstate not in self.get_path(node):
                    newnode = MyNode(newstate,node, action=a, problem=self.problem)
                    lnewnodes.append(newnode)
            self.add_to_open(lnewnodes)

        self.terminal = len(self.open_nodes)
        return None

    def bipolar_search(self):
        self.terminal = 0
        self.non_terminal = 0
        self.greedy_mode = False
    
        forward_root = MyNode(self.problem.initial, None, action=None, problem=self.problem)
        forward_open = [forward_root]
    
        backward_problem = SearchProblem(self.problem.domain, self.problem.goal, self.problem.initial)
        backward_root = MyNode(self.problem.goal, None, action=None, problem=backward_problem)
        backward_open = [backward_root]
        
        self.root_heuristic = forward_root.heuristic
    
        forward_nodes = {self.problem.initial: [forward_root]}
        backward_nodes = {self.problem.goal: [backward_root]}
    
        meeting_state = None
        
        while forward_open != [] and backward_open != []:    
            node = forward_open.pop(0)
    
            if node.state in backward_nodes:
                meeting_state = node.state
                forward_meeting_node = node

                candidates = backward_nodes[meeting_state]
                if self.strategy in ['breadth', 'depth']:
                    backward_meeting_node = min(candidates, key=lambda n: (n.depth, n.cost))
                else:
                    backward_meeting_node = min(candidates, key=lambda n: (n.cost, n.depth))
                
                if self.strategy == 'hybrid':
                    self.terminal = len(forward_open) + len(backward_open) + 2
                else:
                    self.terminal = len(forward_open) + len(backward_open) + 1
                break
            
            self.non_terminal += 1
            lnewnodes = []
            for a in self.problem.domain.actions(node.state):
                newstate = self.problem.domain.result(node.state, a)
                if newstate not in self.get_path(node):
                    newnode = MyNode(newstate, node, action=a, problem=self.problem)
                    lnewnodes.append(newnode)
                    
                    if newstate not in forward_nodes:
                        forward_nodes[newstate] = []
                    forward_nodes[newstate].append(newnode)
            
            
            if self.strategy == 'breadth':
                forward_open.extend(lnewnodes)
            elif self.strategy == 'depth':
                forward_open[:0] = lnewnodes
            elif self.strategy == 'hybrid':
                for new_node in lnewnodes:
                    if new_node.cost > self.root_heuristic / 2:
                        self.greedy_mode = True
                        break
                forward_open.extend(lnewnodes)
                if self.greedy_mode:
                    forward_open.sort(key=lambda node: (node.heuristic, node.depth, node.state))
                else:
                    forward_open.sort(key=lambda node: (node.cost, node.depth, node.state))
            
            
            if backward_open:
                node = backward_open.pop(0)
    
                if node.state in forward_nodes:
                    meeting_state = node.state
                    backward_meeting_node = node
                    
                    candidates = forward_nodes[meeting_state]
                    if self.strategy in ['breadth', 'depth']:
                        forward_meeting_node = min(candidates, key=lambda n: (n.depth, n.cost))
                    else: 
                        forward_meeting_node = min(candidates, key=lambda n: (n.cost, n.depth))
                    
                    if self.strategy == 'hybrid':
                        self.terminal = len(forward_open) + len(backward_open) + 2
                    else:
                        self.terminal = len(forward_open) + len(backward_open) + 1
                    break
                
                self.non_terminal += 1
                lnewnodes = []
                for a in self.problem.domain.actions(node.state):  
                    newstate = self.problem.domain.result(node.state, a) 
                    if newstate not in self.get_path(node):
                        newnode = MyNode(newstate, node, action=a, problem=backward_problem)
                        lnewnodes.append(newnode)
                        
                        if newstate not in backward_nodes:
                            backward_nodes[newstate] = []
                        backward_nodes[newstate].append(newnode)
                
                
                if self.strategy == 'breadth':
                    backward_open.extend(lnewnodes)
                elif self.strategy == 'depth':
                    backward_open[:0] = lnewnodes
                elif self.strategy == 'hybrid':
                    for new_node in lnewnodes:
                        if new_node.cost > self.root_heuristic / 2:
                            self.greedy_mode = True
                            break
                    backward_open.extend(lnewnodes)
                    if self.greedy_mode:
                        backward_open.sort(key=lambda node: (node.heuristic, node.depth, node.state))
                    else:
                        backward_open.sort(key=lambda node: (node.cost, node.depth, node.state))
        
        if meeting_state is None:
            return None
        
        # Ajuste para estratégia hybrid
        if self.strategy == 'hybrid':
            self.non_terminal += 2
            
        forward_path = self.get_path(forward_meeting_node)
        backward_path = self.get_path(backward_meeting_node)
        
        solution = forward_path + backward_path[::-1][1:]
        
        self.solution_cost = forward_meeting_node.cost + backward_meeting_node.cost
        
        return solution

    # if needed, auxiliary methods can be added here


class MySTRIPS(STRIPS):

    def get_instanciations(self,op,state):
        # collect all predicates from the state grouped by type
        predicates_by_type = {}
        for pred in state:
            pred_type = type(pred)
            if pred_type not in predicates_by_type:
                predicates_by_type[pred_type] = []
            predicates_by_type[pred_type].append(pred)
        
        # for each precondition: find matching predicates in the state
        matches_per_pc = []
        for pc in op.pc:
            pc_type = type(pc)
            if pc_type in predicates_by_type:
                matches_per_pc.append(predicates_by_type[pc_type])
            else:
                # No matching predicates for this precondition
                return []
        
        # generate all combinations of matching predicates recursively
        def generate_combinations(lists):
            if not lists:
                return [[]]
            result = []
            for item in lists[0]:
                for rest in generate_combinations(lists[1:]):
                    result.append([item] + rest)
            return result
        
        actions = []
        pred_combinations = generate_combinations(matches_per_pc)
        
        for pred_combination in pred_combinations:
            # try to build a consistent assignment from this combination
            assign = {}
            valid = True
            
            for i, pc in enumerate(op.pc):
                pred = pred_combination[i]
                # map precondition variables to predicate arguments
                for j, var in enumerate(pc.args):
                    if var in assign:
                        # check consistency: variable already has a value
                        if assign[var] != pred.args[j]:
                            valid = False
                            break
                    else:
                        assign[var] = pred.args[j]
                
                if not valid:
                    break
            
            if valid and len(assign) == len(op.args):
                # create the action with this assignment
                argvalues = [assign[a] for a in op.args]
                action = op.instanciate(argvalues)
                if action and action not in actions:
                    actions.append(action)
        
        return sorted(actions, key=lambda a: str(a))

    # if needed, auxiliary methods can be added here

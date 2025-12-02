
class MDP:

    def __init__(self,world,gama,epsilon):
        self.world = world
        self.gama = gama
        self.epsilon = epsilon

    def value_iteration(self):
        # obter todos os estados do mundo
        states = self.world.states()

        util = { s : 0.0 for s in states}

        while True:
            # fazer calculos com uma copia
            # para nao afetar os valores atuais
            util_copy = util.copy()

            # var que mede a maior mudança
            delta = 0

            for s in states:
                action_cost = []
                for ac in self.world.actions():
                    effects = self.world.generate_effects(s,ac) 

                    # Somatório: Σ P(s'|s,a) * util(s')
                    val_action = 0.0
                    for (next_state, prob) in effects.items():
                        val_action += prob * util[next_state]

                    action_cost.append(val_action)


                # equaçao de bellman
                util_copy[s] = self.world.reward(s) + self.gama * max(action_cost)

                # se delta atual for maior que o delta antigo -> atualiza
                diff = abs(util_copy[s] - util[s])
                if diff > delta: delta = diff

            # Atualizar o mundo atual
            util = util_copy

            if delta < self.epsilon * (1 - self.gama) / self.gama:
                return util

    def policy(self, util):
        policy = dict()
        for s in self.world.states():
            best_action = None
            best_value = float('-inf')

            for a in self.world.actions():
                effects = self.world.generate_effects(s,a) 

                # Somatório: Σ P(s'|s,a) * util(s')
                val_action = 0.0
                for (next_state, prob) in effects.items():
                    val_action += prob * util[next_state]
                
                if val_action > best_value:
                    best_value = val_action
                    best_action = a

            policy[s] = best_action
        return policy
        
        

from mdp import *

class GridWorld:

    def __init__(self,width,height,succeed,fail,obstacles,rewards):
        self.width = width
        self.height = height
        inside = lambda p : p[0] in range(width) and p[1] in range(height)
        self.succeed = [p for p in succeed if inside(p)]
        self.fail = [p for p in fail if inside(p) and p not in self.succeed]
        self.obstacles = [ p for p in obstacles if inside(p) and p not in self.succeed+self.fail]
        (success,failure,other) = rewards
        self.reward_succeed = rewards[0]
        self.reward_fail = rewards[1]
        self.reward_other = rewards[2]

    def states(self):
        return [ (c,r) for c in range(self.width)
                       for r in range(self.height)
                       if (c,r) not in self.obstacles ]

    def actions(self):
        return [ (1,0),(0,1),(-1,0),(0,-1) ]

    def generate_effects(self,s,action):
        if s in self.succeed + self.fail:
            return { s:1.0 }
        front = action
        left = (0,front[0]) if front[1]==0 else (-front[1],0)
        right = (-left[0],-left[1])
        def effect(s,a):
            x = (s[0]+a[0],s[1]+a[1])
            if x[0] in range(self.width) and x[1] in range(self.height) \
                    and not x in self.obstacles:
                return x
            return s
        effect_left = effect(s,left)
        effect_front = effect(s,front)
        effect_right = effect(s,right)
        if effect_left==effect_front:
            return { effect_front:0.9,effect_right:0.1 }
        if effect_right==effect_front:
            return { effect_front:0.9,effect_left:0.1 }
        return { effect_front:0.8,effect_left:0.1,effect_right:0.1 }

    def transition_model(self,s,a,x): # returns P(x|s,a)
        effects = self.generate_effects(s,a)
        if x in effects:
            return effects[x]
        return 0

    def reward(self,state):
        if state in self.succeed:
            return self.reward_succeed
        if state in self.fail:
            return self.reward_fail
        return self.reward_other

    def display_utilities(self,utilities):
        for r in reversed(range(self.height)):
            for c in range(self.width):
                if (c,r) in utilities:
                    print("%.4f" % utilities[c,r],end=' ')
                else:
                    print('      ',end=' ')
            print()
        print()


gw = GridWorld( 4,          # grid width
                3,          # grid height
                [(3,2)],    # success states (could be more than 1)
                [(3,1)],    # failure states (could be more than 1)
                [(1,1)],    # obstacles (could be more than 1)
                (1,-1,-0.04) # rewards for sucess, failure and other states
              )

gama = 0.9
epsilon = 0.001

mdp = MDP(gw,gama,epsilon)

utilities = mdp.value_iteration()
print(utilities)
mdp.world.display_utilities(utilities)



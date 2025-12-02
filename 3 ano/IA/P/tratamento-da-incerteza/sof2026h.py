from bayes_net import *

bn = BayesNet()

# Variables:
# wo: Sobrecarga de trabalho
# tp: Processador de texto (SOF2025 Pal)
# nh: Precisa de ajuda
# wf: Cara preocupada
# mf: Frequência de utilização do rato
# ae: Correio electrónico não lido

# Probabilidades marginais
bn.add('wo', [], 0.60)
bn.add('tp', [], 0.05)

# Probabilidades condicionais

# nh depende de tp
bn.add('nh', [('tp', True)], 0.25)
bn.add('nh', [('tp', False)], 0.004)

# wf depende de wo e nh
bn.add('wf', [('wo', True), ('nh', False)], 0.01)
bn.add('wf', [('wo', True), ('nh', True)], 0.02)
bn.add('wf', [('wo', False), ('nh', False)], 0.001)
bn.add('wf', [('wo', False), ('nh', True)], 0.011)

# ae depende de wo
bn.add('ae', [('wo', True)], 0.90)
bn.add('ae', [('wo', False)], 0.001)

# mf depende de tp e nh
bn.add('mf', [('tp', False), ('nh', True)], 0.10)
bn.add('mf', [('tp', False), ('nh', False)], 0.01)
bn.add('mf', [('tp', True), ('nh', True)], 0.90)
bn.add('mf', [('tp', True), ('nh', False)], 0.90)



from bayes_net import *

bn = BayesNet()

# Variables:
# sc: Sobrecarga de trabalho
# pt: Processador de texto
# pa: Precisa de ajuda
# cp: Cara preocupada
# fr: Frequência de utilização do rato
# cnl: Correio electrónico não lido

# Probabilidades marginais
bn.add('sc', [], 0.60)
bn.add('pt', [], 0.05)

# Probabilidades condicionais

# pa depende de pt
bn.add('pa', [('pt', True)], 0.25)
bn.add('pa', [('pt', False)], 0.004)

# cp depende de sc e pa
bn.add('cp', [('sc', True), ('pa', False)], 0.01)
bn.add('cp', [('sc', True), ('pa', True)], 0.02)
bn.add('cp', [('sc', False), ('pa', False)], 0.001)
bn.add('cp', [('sc', False), ('pa', True)], 0.011)

# cnl depende de sc
bn.add('cnl', [('sc', True)], 0.90)
bn.add('cnl', [('sc', False)], 0.001)

# fr depende de pt e pa
bn.add('fr', [('pt', False), ('pa', True)], 0.10)
bn.add('fr', [('pt', False), ('pa', False)], 0.01)
bn.add('fr', [('pt', True), ('pa', True)], 0.90)
bn.add('fr', [('pt', True), ('pa', False)], 0.90)


# Exemplo de expressão lambda e explicação
# Uma expressão lambda é uma função anónima de uma única expressão.
# Sintaxe: lambda argumentos: expressão

# Exemplo simples: função que soma dois números
soma = lambda x, y: x + y  # recebe x e y e retorna x + y
print(soma(2, 3))  # imprime 5

# Exemplo com map: aplica a função a cada elemento da lista
nums = [1, 2, 3]
dobro = list(map(lambda n: n * 2, nums))  # 'lambda n: n * 2' dobra cada elemento
print(dobro)  # imprime [2, 4, 6]

# Nota: expressões lambda são úteis para funções pequenas e de curta duração.
# Para funções mais complexas, prefira definir uma função com 'def'.

#função h que recebe uma função f e um valor x e produz f(x) * x
def h(f, x):
    # chama f com x e multiplica o resultado por x
    return f(x) * x

# Utilização com uma lambda inline (função anónima):
# lambda x: x + 1 recebe um x e devolve x+1
resultado = h(lambda x: x + 1, 7)
print(resultado)  # Resultado esperado: 56, porque (7 + 1) * 7 = 8 * 7

# Explicação passo a passo:
# 1. A lambda é chamada com x=7, calcula 7 + 1 = 8.
# 2. A função h multiplica esse resultado por x: 8 * 7 = 56.
# 3. Portanto h(lambda x: x + 1, 7) devolve 56.

# Exemplo equivalente usando função nomeada:
# def inc(x):
#     return x + 1
# print(h(inc, 7))  # também imprime 56
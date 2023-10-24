
exemp = int(input("Quantos exemplares? "))
PF = 20 * exemp
PC = 24.95 * exemp
IMP = 0.23
SPA = 0.20 * exemp

Lucro = ((PC - SPA) / (1 + IMP)) - PF



PC = (PF + Lucro) * (1 + IMP) + SPA
print("Lucro:", Lucro)
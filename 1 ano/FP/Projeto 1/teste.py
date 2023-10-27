mostrar = ["O", "\\", "X", "/", "|", "/", "\\"]
oculto = [" "," "," "," "," "," "," ",]
oculto[0:1] = mostrar[0:1]
print(mostrar, oculto)

print("Parabéns! Acertaste a palavra ( {} ).". format("A"))
print()
print("\t  +-------+")
print("\t  | ","\t| |")
print("","\t", "\t| |")
print("","\t", "\t| |")
print("\t  {}".format("O"),"\t| |")
print("\t{} {} {}".format("\\", "X", "/"), "\t| |")
print("\t  {}".format("|"), "\t| |")          
print(" ________{}_{}____|_|___".format("/", "\\"))
print(" `````````````````````")
print()
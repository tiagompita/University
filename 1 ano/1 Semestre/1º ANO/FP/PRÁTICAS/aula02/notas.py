#Pedido das notas
ctp = float(input("Nota(CTP)? "))
cp = float(input("Nota(CP)? "))
if ctp < 0 or cp < 0:
    print("Error")
    exit(1)
#Valor das componentes para avaliação
valor_ctp = 0.30
valor_cp = 0.70

#Calculo da nota final

nota_final = int((ctp*0.30) + (cp*0.70))

nota_minima = 6.5

if ctp < nota_minima or cp < nota_minima:
    print("Nota Final: Código 66")
else:
    print("Nota final: ", nota_final)
    if nota_final < 10:
        atpr = float(input("Nota(ATPR)? "))
        atp = float(input("Nota(ATP)? "))
        nota_final_r = int((atpr*0.30) + (atp*0.70))
        print("Nota final de recurso: ", nota_final_r)
    else:
        exit(1)
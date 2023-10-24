CTP= int(input("CTP? "))
CP= int(input("CP? "))


if  CTP >= 65 and CP >= 65:
  nota= 0.3*CTP + 0.7*CP 
  print ("nota final: ", nota/10) 
else: 
  nota= 66
  print("Reprovado na época normal")
if nota < 100:
   ATPR= int(input("ATPR? "))
   APR= int(input("APR? "))

   if  ATPR >= 65 and APR >= 65:
     NR=0.3*max(CTP, ATPR) + 0.7*max(CP, APR) 
     print ("nota final recurso: ", NR/10) 
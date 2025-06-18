import os
import random
from Cryptodome.Cipher import AES

key = os.urandom(16) # 16 bytes
cipher = AES.new(key, AES.MODE_ECB)

number = 23456
data = cipher.encrypt(bytes("%16d" % number, "utf-8"))

print(data) #Prints the encrypted number

value = int(str(cipher.decrypt(data), "utf-8"))
print(value) #Prints the decrypted number
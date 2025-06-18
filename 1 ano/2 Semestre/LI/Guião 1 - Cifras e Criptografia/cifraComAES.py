import os
import sys
from Cryptodome.Cipher import AES
from Cryptodome.Hash import SHA256

# Verifica se é introduzido um nome de ficheiro e uma chave
if len (sys.argv) < 3 :
    print ("Usage: python3 %s filename key" % (sys.argv[0]))
    sys.exit (1)

#Verifica se o ficheiro é válido
fname = sys.argv[1]
if not os.path.exists(fname) or os.path.isdir(fname) or not os.path.isfile(fname):
    print(fname + " is not a file", file=sys.stderr)
    sys.exit (2)



#Verifica se a chave é válida (16, 24 or 32 bytes)
keylen = len(sys.argv[2])
if keylen < 16 :
    h = SHA256.new()
    h.update(sys.argv[2].encode("utf-8"))
    key = h.hexdigest()[:16]
    
    cipher = AES.new(key.encode("utf-8"), AES.MODE_ECB)
elif 16 < keylen < 24:
    h = SHA256.new()
    h.update(sys.argv[2].encode("utf-8"))
    key = h.hexdigest()[:24]
    
    cipher = AES.new(key.encode("utf-8"), AES.MODE_ECB)
elif 24 < keylen < 32:
    h = SHA256.new()
    h.update(sys.argv[2].encode("utf-8"))
    key = h.hexdigest()[:32]
    
    cipher = AES.new(key.encode("utf-8"), AES.MODE_ECB)
else:
    cipher = AES.new(sys.argv[2].encode("utf-8"), AES.MODE_ECB)



#If the last block of the file is not a multiple of 16 bytes, the cipher.encrypt(block) call will raise a ValueError.
#This code will append the necessary number of zero bytes to the end of the last block if its length is not a multiple of 16, allowing the cipher.encrypt(block) call to succeed.
with open(fname, "rb") as f:
    block = f.read(16)
    while len(block) > 0:
        if len(block) % 16 != 0:
            block += b'\x00' * (16 - len(block) % 16)
        cryptogram = cipher.encrypt(block)
        os.write(1, cryptogram)
        block = f.read(16)

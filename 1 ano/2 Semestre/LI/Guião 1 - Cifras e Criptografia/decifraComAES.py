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

if os.path.getsize(fname) % 16 != 0:
    print(fname + " is not a valid file", file=sys.stderr)
    sys.exit (3)



def keyValidate(key):
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

    return cipher

key = keyValidate(sys.argv[2])

with open(fname, "rb") as f:
    block = f.read(16)
    while len(block) > 0:
        cryptogram = key.decrypt(block)
        cryptogram = cryptogram.rstrip(b'\x00')
        os.write(1, cryptogram)
        block = f.read(16)
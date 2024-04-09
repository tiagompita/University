import os
import sys
from Cryptodome.Cipher import ARC4
from Cryptodome.Hash import SHA256

if len (sys.argv) < 3 :
    print ("Usage: python3 %s filename" % (sys.argv[0]))
    sys.exit (1)

fname = sys.argv[1] # verify if it is a file
if not os.path.exists(fname) or os.path.isdir(fname) or not os.path.isfile(fname):
    print(fname + " is not a file", file=sys.stderr)
    sys.exit (2)


if len(sys.argv[2]) < 5:
    h = SHA256.new()
    h.update(sys.argv[2].encode("utf-8"))
    key = h.hexdigest()
    #print(key)
    cipher = ARC4.new(key)


else:
    key = sys.argv[2][0:256]
    #print(bytes(key.encode("utf-8")))
    cipher = ARC4.new(bytes(key.encode("utf-8")))


with open(fname, "rb") as f:
    block = f.read(1024)
    while len(block) > 0:
        cryptogram = cipher.encrypt(block)
        cryptogram = cryptogram.rstrip(b'\x00')
        os.write(1, cryptogram)
        block = f.read(1024)

sys.exit(0)

import os.path
import sys
if len (sys.argv) < 2 :
    print ("Usage: python3 %s filename" % (sys.argv[0]))
    sys.exit (1)

fname = sys.argv[1] # verify if it is a file
if not os.path.exists(fname) or os.path.isdir(fname) or not os.path.isfile(fname):
    print(fname + " is not a file", file=sys.stderr)
    sys.exit (2)

import hashlib

h = hashlib.sha1()
with open(fname, 'rb') as f:
    buffer = f.read(512)

    # len(buffer) == 0 --> End-of-file reached
    # len(buffer) > 0 --> buffer has len(buffer) bytes
    while len(buffer) > 0:
        h.update(buffer)
        buffer = f.read(512)

print(h.hexdigest())
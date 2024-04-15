import os.path
import sys
import hashlib

if len(sys.argv) < 2:
    print("Usage: python3 %s filename" % (sys.argv[0]))
    sys.exit(1)

fname = sys.argv[1]
if not os.path.exists(fname) or os.path.isdir(fname) or not os.path.isfile(fname):
    print(fname + "is not a file", file=sys.stderr)
    sys.exit(2)

h = hashlib.sha1()

with open(fname, "rb") as f:
    for line in f:
        h.update(line)

print(h.hexdigest())
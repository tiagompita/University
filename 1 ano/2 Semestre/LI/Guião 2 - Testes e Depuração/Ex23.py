from subprocess import Popen, PIPE
import sys

# Check that the necessary command-line arguments have been provided
if len(sys.argv) < 3:
    print("Usage: python3 Ex23.py <dir_name> <term>")
    sys.exit(1)

dir_name = sys.argv[1]
termo = sys.argv[2]

proc = Popen("ls -la", stdout=PIPE, shell=True)

return_code = proc.wait()
output = proc.stdout.read().decode("utf-8")

for line in iter(proc.stdout.readline, b""):
    if termo not in line:
        print(line.decode("utf-8"), end="")

### ???
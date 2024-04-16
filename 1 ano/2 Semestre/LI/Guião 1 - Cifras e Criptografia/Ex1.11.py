import os
from Cryptodome.PublicKey import RSA

def generate_keypair(filename, password, keysize):
    keypair = RSA.generate(keysize)
    # Get the directory of the current script
    dir_path = os.path.dirname(os.path.realpath(__file__))
    # Join the directory path and filename
    file_path = os.path.join(dir_path, filename)
    with open(file_path, "wb") as fout:
        kp = keypair.exportKey("PEM", password)
        fout.write(kp)
    return file_path  # return the file path

# Definir parâmetros
filename = "keypair.pem"
password = "senha"
keysize = 1024

# Gerar e salvar o par de chaves
file_path = generate_keypair(filename, password, keysize)

# Use the returned file path to open the file
with open(file_path, "rb") as fin:
    keypair = RSA.importKey(fin.read(), password)
print(keypair)
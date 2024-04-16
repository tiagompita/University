import os
import sys
from Cryptodome.Cipher import AES, PKCS1_OAEP
from Cryptodome.PublicKey import RSA
from Cryptodome.Random import get_random_bytes

# Verifica se é introduzido um nome de ficheiro e uma chave
if len (sys.argv) < 4 :
    print ("Usage: python3 %s filename private_key password" % (sys.argv[0]))
    sys.exit (1)

# Verifica se o ficheiro é válido
fname = sys.argv[1]
if not os.path.exists(fname) or os.path.isdir(fname) or not os.path.isfile(fname):
    print(fname + " is not a file", file=sys.stderr)
    sys.exit (2)

# Carrega a chave privada
private_key = RSA.importKey(open(sys.argv[2]).read(), passphrase=sys.argv[3])

# Gera uma chave simétrica aleatória
symmetric_key = get_random_bytes(16)

# Cria um objeto de cifra AES com a chave simétrica
cipher_aes = AES.new(symmetric_key, AES.MODE_ECB)

# Cria um objeto de cifra RSA com a chave privada
cipher_rsa = PKCS1_OAEP.new(private_key)

# Cifra a chave simétrica com a chave privada RSA
encrypted_key = cipher_rsa.encrypt(symmetric_key)

def pkcs7_padding(data):
    pad_length = 16 - (len(data) % 16)
    return data + bytes([pad_length] * pad_length)

# Cifra o ficheiro com a chave simétrica e acrescenta a chave simétrica cifrada
with open(fname, "rb") as f, open(fname + ".enc", "wb") as fout:
    fout.write(encrypted_key)
    block = f.read(16)
    while block:
        next_block = f.read(16)
        if len(next_block) == 0:
            block = pkcs7_padding(block)
        cryptogram = cipher_aes.encrypt(block)
        fout.write(cryptogram)
        block = next_block

##incompleto
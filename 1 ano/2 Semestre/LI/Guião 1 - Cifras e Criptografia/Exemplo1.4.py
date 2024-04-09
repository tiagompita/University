import os
from Cryptodome.Hash import ARC4

cipher = ARC4.new("chave".encode("utf-8"))
cryptogram = cipher.encrypt("Text".encode("utf-8"))
os.write(1, cryptogram)
print()

decipher = ARC4.new("chave".encode("utf-8"))
decrypthed = decipher.decrypt(cryptogram)
print(decrypthed.decode("utf-8"))
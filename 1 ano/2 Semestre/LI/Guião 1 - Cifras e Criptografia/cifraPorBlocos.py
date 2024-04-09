from Cryptodome.Cipher import AES

#Must provide a valid key (with 16, 24 or 32 bytes)
key = "1234567890acbdef" # 16 bytes

cipher = AES.new(key.encode("utf-8"), AES.MODE_ECB)

#Prints the number of bytes in each block
print(cipher.block_size)

#Prints the cipher mode (1 for ECB)
print(AES.MODE_ECB)

#16 bytes
x = cipher.encrypt("texto para cifra".encode("utf-8"))

#Prints the encrypted text
print(x)

#Prints the decrypted text
print(cipher.decrypt(x))
def num():
    numList = list()
    while True:
        while True:
            try:
                numero = int(input("Numero (0 to quit): "))
                break
            except ValueError:
                print("Por favor, insira um número inteiro válido.")
        if numero == 0:
            break
        numList.append(numero)
    return numList

from Cryptodome.Cipher import ARC4

def cifrarNum(nums):
    key = "chave"
    
    for i in nums:
        cipher_encrypt = ARC4.new(bytes(key.encode("utf-8")))
        i_bytes = i.to_bytes((i.bit_length() + 7) // 8, 'big')  # Convert integer to bytes
        cryptogram = cipher_encrypt.encrypt(i_bytes)
        print("Numero %d Cifrado => %s" % (i, cryptogram))

        cipher_decrypt = ARC4.new(bytes(key.encode("utf-8")))
        decrypto = cipher_decrypt.decrypt(cryptogram)
        decrypto_num = int.from_bytes(decrypto, 'big')  # Convert bytes back to integer
        print("Cifra %s Decrifada => %d" % (cryptogram, decrypto_num))

nums = num()
cifrarNum(nums)
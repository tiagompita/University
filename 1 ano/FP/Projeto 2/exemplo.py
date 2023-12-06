import requests

resp = requests.get("https://www.rfc-editor.org/rfc/rfc16.txt")
print("resp.status_code:", resp.status_code)  # deve ser 200
print("resp.text:\n", resp.text)

from art import *

# Criar um texto de arte
art_text = text2art("Hello")
print(art_text)

# Criar um desenho de arte
art_shape = shape("star")
print(art_shape)
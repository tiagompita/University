import requests
import time
import cherrypy

inicio = time.time()
f = requests.get("http://www.ua.pt/")
print(f.status_code)

fim = time.time()

demora = fim - inicio

print("Status code: ", f.status_code)
print()
print("Headers: ", f.headers)
print()
print("Content type: ", f.headers['Content-Type'])
print()
print("Demora a obter o servidor: ", demora)
print()

url = "http://www.ua.pt/"
values = {"nome": "Ana", "idade": 20}
r = requests.post(url, data=values)
print(r.status_code)

class Root(object):
    @cherrypy.expose
    def index(self):
        return "Hello, World!"

    @cherrypy.expose
    def login(self, username=None, password=None):
        if (username == "admin" and password == "admin"):
            return "Login bem-sucedido!"
        else:
            return "Falha no login."

if __name__ == "__main__":
    cherrypy.quickstart(Root(), "/")

#5.10 está feito
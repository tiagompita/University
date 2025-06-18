import cherrypy
import psutil
import os

PATH = os.path.abspath(os.path.dirname(__file__))

conf = {
    "/documento": {
                    "tools.staticfile.on": True,
                    "tools.staticfile.filename": os.path.join(PATH, "documento.html")
                },
    "/static": { #5.13
                    "tools.staticdir.on": True,
                    "tools.staticdir.dir": os.path.join(PATH, "static")
                },
    "/static/css": {
                    "tools.staticdir.on": True,
                    "tools.staticdir.dir": os.path.join(PATH, "static", "css")
                },
    "/static/js": {
                    "tools.staticdir.on": True,
                    "tools.staticdir.dir": os.path.join(PATH, "static", "js")
                },
    "/static/img": {
                    "tools.staticdir.on": True,
                    "tools.staticdir.dir": os.path.join(PATH, "static", "img")
                }
}
class HTMLDocument():
    @cherrypy.expose
    def index(self):
        return open(conf["/documento"]["tools.staticfile.filename"]).read() #5.12

class Node():
    @cherrypy.expose
    def index(self):
        return f"CPU usage: {psutil.cpu_percent()}%"

    @cherrypy.expose
    def page(self):
        return f"Memory usage: {psutil.virtual_memory().percent}%"
    
class Actions(): #5.8
    @cherrypy.expose
    def doLogin(self, username, password):
        if username == "admin" and password == "admin":
            return "Acesso concedido"
        else:
            return "Acesso negado"

class Root():
    def __init__(self):
        self.node = Node()
        self.html = HTMLDocument()
        self.actions = Actions()

    @cherrypy.expose
    def form(self):
        cherrypy.response.headers["Content-Type"] = "text/html"
        return open("/mnt/c/Universidade/University/1 ano/2 Semestre/LI/Guião 5 - Aplicações e Serviços Web/Semana 1/formulario.html")

    @cherrypy.expose
    def index(self):
        return f"Total CPU cores: {psutil.cpu_count()}"

    @cherrypy.expose
    def page(self):
        return f"Total memory: {psutil.virtual_memory().total / (1024.0 ** 3)} GB"
    
if __name__ == "__main__":
    cherrypy.quickstart(Root(), "/", config=conf)
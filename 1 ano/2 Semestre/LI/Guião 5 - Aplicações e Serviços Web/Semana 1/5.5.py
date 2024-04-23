import cherrypy

class Node():
    @cherrypy.expose
    def index(self):
        return "Eu sou o índice do Node (Node.index)"
    
    @cherrypy.expose
    def page(self):
        return "Eu sou um método do Node (Node.page)"
    
class Root():
    def __init__(self):
        self.node = Node()
        self.html = HTMLDocument()
        self.actions = Actions()

    @cherrypy.expose
    def form(self):
        cherrypy.response.headers["Content-Type"] = "text/html"
        return open("formulario.html")


    @cherrypy.expose
    def index(self):
        return "Eu sou o índice do Root (Root.index)"
    
    @cherrypy.expose
    def page(self):
        return "Eu sou um método do Root (Root.page)"
    
class Actions():
    @cherrypy.expose
    def doLogin(self, username="pita", password="pita"):
        if (username == "pita" and password == "pita"):
            return "Acesso concebido."
        else:
            return "Acesso negado."
        

class HTMLDocument():
    @cherrypy.expose
    def index(self):
        return open("documento.html", "r")


if __name__ == "__main__":
    cherrypy.quickstart(Root(), "/")
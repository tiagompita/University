import cherrypy

class HelloWorld():
    @cherrypy.expose
    def index(self):
        host = cherrypy.request.headers["Host"]
        return "You have successfully reached " + host #Ex 5.4
    
    

cherrypy.quickstart(HelloWorld())
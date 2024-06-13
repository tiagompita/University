# encoding=utf-8
#
# Example of a cherrypy application that serves images.
#
# Adrego da Rocha - Abril de 2023
#
# To run: python3 app.py

import os.path
import cherrypy
import json
import hashlib
import sqlite3 as sql
import time
from datetime import datetime

# The absolute path to this file's base directory
baseDir = os.path.abspath(os.path.dirname(__file__))

# Dictionary with this application's static directories configuration
config = {
			"/":        {   "tools.staticdir.root": baseDir },
			"/html":    {   "tools.staticdir.on": True, "tools.staticdir.dir": "html" },
			"/js":      {   "tools.staticdir.on": True, "tools.staticdir.dir": "js" },
			"/css":     {   "tools.staticdir.on": True, "tools.staticdir.dir": "css" },
			"/images":  {   "tools.staticdir.on": True, "tools.staticdir.dir": "images" },
			"/uploads": {   "tools.staticdir.on": True, "tools.staticdir.dir": "uploads" },          
}

class Root():
	@cherrypy.expose
	def index(self):
		return open("html/index.html")

	@cherrypy.expose
	def start_setup(self):
		db = sql.connect("database.db")
		db.execute("CREATE TABLE images (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, author TEXT, path TEXT, datetime TEXT);")
		db.execute("CREATE TABLE comments (id INTEGER PRIMARY KEY AUTOINCREMENT, idimg INTEGER, user TEXT, comment TEXT, datetime TEXT);")
		db.execute("CREATE TABLE votes (id INTEGER PRIMARY KEY AUTOINCREMENT, idimg INTEGER, ups INTEGER, downs INTEGER);")
		db.close()

	@cherrypy.expose
	def stop_setup(self):
		db = sql.connect("database.db")
		r = input("Delete database? [y/ ]: ")
		if (r.lower() == "y"):
			os.remove("database.db")
			print("Database deleted.")
		else:
			print("Operation cancelled.")
		db.close()

	# UpLoad image
	@cherrypy.expose
	def upload(self, myFile, nameImg, authorImg):
		h = hashlib.sha256()

		filename = baseDir + "/uploads/" + myFile.filename
		fileout = open(filename, "wb")
		while True:
			data = myFile.file.read(8192)
			if not data: break
			fileout.write(data)
			h.update(data)
		fileout.close()

		ext = myFile.filename.split(".")[-1]
		# final path of the image and changing the filename
		path = "uploads/" + h.hexdigest() + "." + ext
		os.rename(filename, baseDir + "/" + path)

		# nameImg and authorImg are input parameters of this method
		# obtain the date and time of loading
		current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

		# insert the file information in the images table
		# eventually initialize the votes tables

		db = sql.connect('database.db')
		db.execute("INSERT INTO images (name, author, path, datetime) VALUES (?, ?, ?, ?)", (nameImg, authorImg, path, current_time))
		db.commit()
		db.close()

	# List requested images
	@cherrypy.expose
	def list(self, id):
		db = sql.connect('database.db')
		if (id == "all"):
			result = db.execute("SELECT * FROM `images`")
		else:
			result = db.execute("SELECT * FROM images WHERE author = ?", (id,))
		rows = result.fetchall()
		db.close()
		# Generate result (list of dictionaries) from rows (list of tuples)
		result = []
		for row in rows:
        # Assuming your table has columns 'id', 'name', 'author', 'path', 'datetime'
			result.append({
				'id': row[0],
				'name': row[1],
				'author': row[2],
				'path': row[3],
				'datetime': row[4]
			})
		
		# eventually sort result by image name before return

		cherrypy.response.headers["Content-Type"] = "application/json"
		return json.dumps({"images": result}).encode("utf-8")
	
	# List comments
	@cherrypy.expose
	def comments(self, idimg):
		db = sql.connect('database.db')
		result = db.execute("SELECT * FROM images WHERE id = ?", (idimg,))
		row = result.fetchone()
		imageinfo = dict(zip([column[0] for column in result.description], row)) if row else {}

		result = db.execute("SELECT * FROM comments WHERE idimg = ?", (idimg,))
		rows = result.fetchall()
		comments = [dict(zip([column[0] for column in result.description], row)) for row in rows] if rows else []

		result = db.execute("SELECT * FROM votes WHERE idimg = ?", (idimg,))
		row = result.fetchone()
		imagevotes = dict(zip([column[0] for column in result.description], row)) if row else {}
		db.close()

		cherrypy.response.headers["Content-Type"] = "application/json"
		return json.dumps({"image": imageinfo, "comments": comments, "votes": imagevotes}).encode("utf-8")

	# UpLoad comment
	@cherrypy.expose
	@cherrypy.tools.json_in()
	@cherrypy.tools.json_out()
	def newcomment(self):
		try:
			# Obter os dados do request
			data = cherrypy.request.json
			idimg = data.get('idimag')
			username = data.get('username')
			comment = data.get('newcomment')
			current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

			# Verificar se todos os campos estão presentes
			if not idimg or not username or not comment:
				raise ValueError("Missing idimag, username, or comment")

			# Conectar ao banco de dados e inserir o novo comentário
			db = sql.connect('database.db')
			db.execute("INSERT INTO comments (idimg, user, comment, datetime) VALUES (?, ?, ?, ?)", (idimg, username, comment, current_time))
			db.commit()
			db.close()

			return {"status": "success", "message": "Comment uploaded successfully"}
		
		except Exception as e:
			cherrypy.response.status = 500
			return {"status": "error", "message": str(e)}

	
	# Increment Up votes
	@cherrypy.expose
	def upvote(self, idimg):
		db = sql.connect('database.db')
		result = db.execute("SELECT * FROM votes WHERE idimg = ?", (idimg,))
		votes = result.fetchone()
		if votes:
			db.execute("UPDATE votes SET ups = ? WHERE idimg = ?", (votes[2] + 1, idimg))
		else:
			db.execute("INSERT INTO votes (idimg, ups, downs) VALUES (?, ?, ?)", (idimg, 1, 0))
		db.commit()
		db.close()
		return "Up vote incremented"
	# Increment Down votes
	@cherrypy.expose
	def downvote(self, idimg):
		db = sql.connect('database.db')
		result = db.execute("SELECT * FROM votes WHERE idimg = ?", (idimg,))
		votes = result.fetchone()
		if votes:
			db.execute("UPDATE votes SET downs = ? WHERE idimg = ?", (votes[3] + 1, idimg))
		else:
			db.execute("INSERT INTO votes (idimg, ups, downs) VALUES (?, ?, ?)", (idimg, 0, 1))
		db.commit()
		db.close()
		return "Down vote incremented"






cherrypy.config.update({'server.socket_host': '127.0.0.1',
						'server.socket_port': 8081,
					   })

cherrypy.engine.subscribe("start", Root().start_setup)
cherrypy.engine.subscribe("stop", Root().stop_setup)
cherrypy.quickstart(Root(), "/", config)
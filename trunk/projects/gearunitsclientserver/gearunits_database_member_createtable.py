import sqlite3 as sqlite

#db = sqlite.connect('sqlitedatabase/name.db')
db = sqlite.connect('gearunits.db')
cur = db.cursor()
cur.execute('CREATE TABLE member (id INTEGER PRIMARY KEY, user TEXT, password TEXT, email TEXT)')
db.commit()
cur.execute('INSERT INTO member (user, password) VALUES( "admin", "admin")')
cur.execute('INSERT INTO member (user, password) VALUES( "gm", "gm")')
cur.execute('INSERT INTO member (user, password) VALUES( "guest", "guest")')
# Save (commit) the changes
db.commit()#save data
cur.execute('SELECT * FROM member')
#print (cur.fetchall())
for t in cur:
	print (t)
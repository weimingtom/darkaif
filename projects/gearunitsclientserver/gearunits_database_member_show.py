import sqlite3 as sqlite

db = sqlite.connect('gearunits.db')
cur = db.cursor()
cur.execute('SELECT * FROM member')

for t in cur:
	print (t)
	print (t[1])#table

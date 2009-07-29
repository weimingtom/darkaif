import sqlite3 as sqlite

#db = sqlite.connect('sqlitedatabase/name.db')
db = sqlite.connect('gearunits.db')
cur = db.cursor()
cur.execute('CREATE TABLE n (id INTEGER PRIMARY KEY, f TEXT, l TEXT)')
#db.commit()
#cur.execute('INSERT INTO n (id, f, l) VALUES(NULL, "john", "smith")')
#db.commit()
cur.execute('SELECT * FROM n')
print (cur.fetchall())
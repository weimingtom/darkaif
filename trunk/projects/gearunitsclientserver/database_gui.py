#!/usr/local/bin/python
'''

Create by: Darknet

This is for basic database access to view the information.
Python version: 3.1.0
'''
from tkinter import *
from tkinter import ttk
from tkinter import tix
import sqlite3 as sqlite
import re

DATABASE = 'gearunits.db'

table = []

db = sqlite.connect('gearunits.db');
cur = db.cursor();

#cur.execute("select * from sqlite_master WHERE type='table' ORDER BY name");
cur.execute("select * from sqlite_master WHERE type='table'");

for t in cur:
	print (t)
	tablename = str(t)
	
	tabledata = tablename.split(" ")
	print (tabledata[6])
	table.append(tabledata[6])
	print (tabledata[7])

title = "Sqlite3 Database";

class Application(Frame):
	#label_serverstatus = Label()
	tablename = ''
	tablerowid = ''
	tablecolid = '0'
	tablerowname = ''
	def say_hi(self):
		print("hi there, everyone!")
		
	def button_start(self):
		serverstatus  = 'On';
		self.label_serverstatus["text"] = serverstatus
		print("starting server...");
	def button_stop(self):
		serverstatus  = 'Off';
		print("stopping server...");
		self.label_serverstatus["text"] = serverstatus

	#Create Widgets
	def createWidgets(self):
		self.text_database = Label(self)
		self.text_database["text"] = "Schemata Database:" + DATABASE
		self.text_database.grid(column=1, row=1, sticky=W)
		
		self.text_table = Label(self)
		self.text_table["text"] = "table:"
		self.text_table.grid(column=1, row=2, sticky=W)
		
		self.button_deletetable = Button(self)
		self.button_deletetable["text"] = "Delete Table"
		self.button_deletetable.grid(column=2, row=2, sticky=W)
		
		self.button_createtable = Button(self)
		self.button_createtable["text"] = "Create Table"
		self.button_createtable.grid(column=3, row=2, sticky=W)
		
		self.button_inserttable = Button(self)
		self.button_inserttable["text"] = "Insert Table"
		self.button_inserttable.grid(column=4, row=2, sticky=W)
		
		self.button_removetable = Button(self)
		self.button_removetable["text"] = "Remove Table"
		self.button_removetable.grid(column=5, row=2, sticky=W)
		'''
		self.button_refresh = Button(self)
		self.button_refresh["text"] = "Refresh"
		self.button_refresh.grid(column=7, row=2, sticky=W)
		'''
		
		self.button_script = Button(self)
		self.button_script["text"] = "script"
		self.button_script.grid(column=6, row=2, sticky=W)
		
		self.button_commit = Button(self)
		self.button_commit["text"] = "Commit"
		self.button_commit.grid(column=7, row=2, sticky=W)
		
		
		#self.button_createtable.configure(text='blah',side='left')
		#self.button_createtable.configure(side="left")
		#self.button_createtable.pack(side="left")#
		
		self.listbox = Listbox(self, exportselection=0, background="white")
		self.listbox.bind("<<ListboxSelect>>",self.listselect_click)
		#self.listbox.bind("<Double-1>",self.listselect_doubleclick)
		self.listbox.grid(column=1, row=4, sticky=W)
		
		self.vbar = Scrollbar(self, name="vbar")
		self.vbar.grid(column=1, row=4, sticky=E)
		self.vbar.master.reqheight = 500
		self.vbar.configure(orient=VERTICAL, command=self.listbox.yview)
		self.listbox.configure(yscrollcommand=self.vbar.set)
		
		#self.combobox = ttk.Combobox(self,values=('one two', 'three'))
		self.combobox = ttk.Combobox(self)
		self.combobox.grid(column=1, row=3, sticky=W)
		self.combobox["values"] = table
		self.combobox.bind('<<ComboboxSelected>>', self.table_click)
		self.combobox.current(1)
		#print(dir(self.combobox.bind()))
		
		self.textbox = Text(self, width=40, height=10)
		self.textbox.grid(column=2, row=3, sticky=W,columnspan=8,rowspan=2)
		
	#SELECT TABLE FROM COMBOBOX
	def table_click(self,event):
		#print("click")
		self.tablename = str(self.combobox.selection_get())
		print(self.tablename)
		self.tableselected(self.tablename);
		return "break"
		
	#SHOW TABLE ROWS IN THE LIST BOX
	def tableselected(self,name):
		print("TABLE SELECT ->" + str(name))
		cur.execute("select * from " + name);
		#spreadsheet = []#clear array
		self.listbox.delete(0, "end")
		for t in cur:
			print (t)
			#print (t[1])#table
			#spreadsheet.append(t[1])
			self.listbox.insert("end", str(t[0]))
		#self.listbox["listvariable"] = spreadsheet
		
	#CLICK TABLE ROW SELECTED ID OR ROW NAME
	def listselect_click(self,event):
		rowid = self.listbox.curselection()
		rowid = self.listbox.index(rowid)
		print(self.listbox.get(rowid))
		self.tablerowid = rowid
		self.tablerowname = self.listbox.get(rowid)
		self.selecttablerow()
		return "break"
		
	#TABLE ROW INFORMATION
	def selecttablerow(self):
		print ("TABLE ROW ->")
		
		cur.execute("select * from sqlite_master WHERE type='table'");
		for t in cur:
			if self.tablename == t[1]:
				#print (t)
				print ("-------")
				print(t[4])
				print ("-------")
				break
		
		#cur.execute("select * from sqlite_master WHERE type='table'");
		#cur.execute("select * " + tablename + " type='table' ORDER BY name");
		#cur.execute('SELECT * FROM ' + self.tablename + '');
		
		query = str('SELECT * FROM ' + self.tablename + " WHERE id=\'" + self.tablerowname + "\'")
		#print(query)
		cur.execute(query);
		for t in cur:
			#print (t)
			self.textbox.delete("1.0","end")
			self.textbox.insert("end",t)
	
	def __init__(self, master=None):
		Frame.__init__(self, master)
		self.master.grid_columnconfigure(0, weight=1)
		self.master.grid_rowconfigure(0, weight=1)
		self.master.title(title)
		self.pack()
		self.createWidgets()
		self.master.geometry("600x480")
		#print(dir(self))

root = Tk()
app = Application(master=root)
app.mainloop()
root.destroy()
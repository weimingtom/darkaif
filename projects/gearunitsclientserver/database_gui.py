#!/usr/local/bin/python
'''
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
spreadsheet = []

db = sqlite.connect('gearunits.db');
cur = db.cursor();

cur.execute("select * from sqlite_master WHERE type='table' ORDER BY name");

for t in cur:
	print (t)
	tablename = str(t)
	
	tabledata = tablename.split(" ")
	print (tabledata[6])
	table.append(tabledata[6])
	
	#m = re.search('CREATE TABLE\w+  ', tablename)
	#m = re.search('(?<=\'CREATE)\S(?<=TABLE)\S', tablename)
	#m = re.search('(?<=TABLE)\S', tablename)
	#m = re.search('(?<=\'CREATE TABLE )', tablename)
	#print (">>>" + m.group(0));
	#print (type(t))
	#print (t[1])#table
	#print(t.index)
	#print(dir(t))


title = "Sqlite3 Database";

class Application(Frame):
	#label_serverstatus = Label()
	tablename = ''
	tablerow = ''
	
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

	def createWidgets(self):
		self.text_database = Label(self)
		self.text_database["text"] = "Database:" + DATABASE
		self.text_database.grid(column=1, row=1, sticky=W)
		
		self.text_table = Label(self)
		self.text_table["text"] = "table:"
		self.text_table.grid(column=1, row=2, sticky=W)
		
		self.button_deletetable = Button(self)
		self.button_deletetable["text"] = "Delete"
		self.button_deletetable.grid(column=2, row=2, sticky=W)
		
		self.button_createtable = Button(self)
		self.button_createtable["text"] = "Create"
		self.button_createtable.grid(column=3, row=2, sticky=W)
		
		self.button_script = Button(self)
		self.button_script["text"] = "script"
		self.button_script.grid(column=4, row=2, sticky=W)
		
		#self.button_createtable.configure(text='blah',side='left')
		#self.button_createtable.configure(side="left")
		#self.button_createtable.pack(side="left")#
		
		self.listbox = Listbox(self, exportselection=0, background="white")
		self.listbox.bind("<<ListboxSelect>>",self.listselect_click)
		self.listbox.bind("<Double-1>",self.listselect_doubleclick)
		self.listbox.grid(column=1, row=4, sticky=W)
		#self.listbox.insert("end", str("Hello1"))
		#self.listbox.insert("end", str("Hello2"))
		
		self.vbar = Scrollbar(self, name="vbar")
		self.vbar.grid(column=1, row=4, sticky=E)
		self.vbar.master.reqheight = 500
		self.vbar.configure(orient=VERTICAL, command=self.listbox.yview)
		self.listbox.configure(yscrollcommand=self.vbar.set)
		
		#print(dir(self.vbar.master))
		
		#self.combobox = ttk.Combobox(self,values=('one two', 'three'))
		self.combobox = ttk.Combobox(self)
		self.combobox.grid(column=1, row=3, sticky=W)
		self.combobox["values"] = table
		self.combobox.bind('<<ComboboxSelected>>', self.table_click)
		self.combobox.current(1)
		#print(dir(self.combobox.bind()))
		
	#just the table selected from query	
	def table_click(self,event):
		#print("click")
		self.tablename = str(self.combobox.selection_get())
		print(self.tablename)
		self.tableselected(self.tablename);
		return "break"
		
	def tableselected(self,name):
		print("TABLE SELECT ->" + str(name))
		cur.execute("select * from " + name);
		#spreadsheet = []#clear array
		self.listbox.delete(0, "end")
		for t in cur:
			print (t)
			#print (t[1])#table
			#spreadsheet.append(t[1])
			#self.combobox["values"] = spreadsheet
			self.listbox.insert("end", str(t[1]))
		#self.listbox["listvariable"] = spreadsheet
		
	def listselect_click(self,event):
		rowid = self.listbox.curselection()
		rowid = self.listbox.index(rowid)
		print(self.listbox.get(rowid))
		return "break"
		
	def listselect_doubleclick(self,event):
		rowid = str(self.listbox.index("active")) #last click index
		print("row id >>>"+rowid)
		return "break"
		
	def select(self, index):
		print(index)
	
	
	def __init__(self, master=None):
		Frame.__init__(self, master)
		self.master.grid_columnconfigure(0, weight=1)
		self.master.grid_rowconfigure(0, weight=1)
		self.master.title(title)
		self.pack()
		self.createWidgets()
		self.master.geometry("300x300")
		#print(dir(self))

root = Tk()
app = Application(master=root)
app.mainloop()
root.destroy()
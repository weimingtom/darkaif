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

print("#==============================#")
print("# Python Version: 3.1.0        #")
print("# sqlite3                      #")
print("#==============================#")


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
	
	tablevarinput = []
	tablevartext = []
	
	tableentrywidgetrow = []
	tablelabelwidgetrow = []
	
	def __init__(self, master=None):
		Frame.__init__(self, master)
		self.master.grid_columnconfigure(0, weight=1)
		self.master.grid_rowconfigure(0, weight=1)
		self.master.title(title)
		self.pack()
		self.createWidgets()
		self.master.geometry("600x480")
		#print(dir(self))
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
		#Schema
		self.Schemaframe = ttk.Labelframe(self, text='Schema', width=600, height=100)
		self.Schemaframe.grid(column=1, row=1, sticky=W)
		self.text_database = Label(self.Schemaframe)
		self.text_database["text"] = "Schema Database:" + DATABASE
		self.text_database.grid(column=1, row=1, sticky=W)
		
		#Table
		self.tableframe = ttk.Labelframe(self, text='Schema Table', width=600, height=100)
		self.tableframe.grid(column=1, row=2, sticky=W)
		self.text_table = Label(self.tableframe)
		self.text_table["text"] = "table:"
		self.text_table.grid(column=1, row=1, sticky=W)
		
		self.combobox = ttk.Combobox(self.tableframe)
		self.combobox.grid(column=2, row=1, sticky=W)
		self.combobox["values"] = table
		self.combobox.bind('<<ComboboxSelected>>', self.table_click)
		self.combobox.current(1)
		
		self.button_deletetable = Button(self.tableframe)
		self.button_deletetable["text"] = "Delete Table"
		self.button_deletetable.grid(column=3, row=1, sticky=W)
		
		self.button_createtable = Button(self.tableframe)
		self.button_createtable["text"] = "Create Table"
		self.button_createtable.grid(column=4, row=1, sticky=W)
		
		
		#Table
		self.scriptframe = ttk.Labelframe(self, text='Schema Script', width=600, height=100)
		self.scriptframe.grid(column=1, row=3, sticky=W)
		self.button_script = Button(self.scriptframe)
		self.button_script["text"] = "Exeute script"
		self.button_script.grid(column=1, row=1, sticky=W)
		
		#self.button_commit = Button(self)
		#self.button_commit["text"] = "Commit"
		#self.button_commit.grid(column=7, row=2, sticky=W)
		
		#TEXT BOX
		self.textbox = Text(self.scriptframe, width=40, height=10)
		self.textbox.grid(column=1, row=2, sticky=W,columnspan=6)
		
		#TABLE FRAME LIST
		self.tablerowframe = ttk.Labelframe(self, text='Table Rows', width=600, height=100)
		self.tablerowframe.grid(column=1, row=4, sticky=W)
		
		#TABLE ROW LIST
		self.listbox = Listbox(self.tablerowframe, exportselection=0, background="white")
		self.listbox.bind("<<ListboxSelect>>",self.listselect_click)
		self.listbox.grid(column=1, row=4, sticky=W)
		
		#vbar
		self.vbar = Scrollbar(self.tablerowframe, name="vbar")
		self.vbar.grid(column=1, row=4, sticky=E)
		self.vbar.configure(orient=VERTICAL, command=self.listbox.yview)
		self.listbox.configure(yscrollcommand=self.vbar.set)
		
		#TABLE FRAME ROW EDIT
		self.tablerowframe = ttk.Labelframe(self, text='Table Rows EDIT', width=256, height=480)
		self.tablerowframe.grid(column=2, row=1, sticky=W, rowspan=4)
		
		'''
		self.button_inserttable = Button(self)
		self.button_inserttable["text"] = "Insert Row Table"
		self.button_inserttable.grid(column=4, row=2, sticky=W)
		
		self.button_removetable = Button(self)
		self.button_removetable["text"] = "Remove Row Table"
		self.button_removetable.grid(column=5, row=2, sticky=W)
		
		self.button_refresh = Button(self)
		self.button_refresh["text"] = "Refresh"
		self.button_refresh.grid(column=7, row=2, sticky=W)
		'''
		
		
		
	#SELECT TABLE FROM COMBOBOX
	def table_click(self,event):
		#print("click")
		self.tablename = str(self.combobox.selection_get())
		print(self.tablename)
		self.tableselected(self.tablename);
		return "break"
		
	#SHOW TABLE ROWS IN THE LIST BOX
	def tableselected(self,name):
		#print("TABLE SELECT ->" + str(name))
		cur.execute("select * from " + name);
		#spreadsheet = []#clear array
		self.listbox.delete(0, "end")
		for t in cur:
			#print (t)
			#print (t[1])#table
			#spreadsheet.append(t[1])
			self.listbox.insert("end", str(t[0]))
		#self.listbox["listvariable"] = spreadsheet
		
	#CLICK TABLE ROW SELECTED ID OR ROW NAME
	def listselect_click(self,event):
		rowid = self.listbox.curselection()
		rowid = self.listbox.index(rowid)
		#print(self.listbox.get(rowid))
		self.tablerowid = rowid
		self.tablerowname = self.listbox.get(rowid)
		self.selecttablerow()
		return "break"
		
	#TABLE ROW INFORMATION
	def selecttablerow(self):
		#print ("TABLE ROW ->")
		self.tablevartext = []
		self.tablevarinput = []
		
		cur.execute("select * from sqlite_master WHERE type='table'");
		for t in cur:
			if self.tablename == t[1]:
				#print (t)
				#print ("-------")
				#print(t[4])
				tablestr = t[4].replace("CREATE TABLE " +self.tablename + " ",'')
				tablestr = tablestr.replace("(","")
				tablestr = tablestr.replace(")","")
				comumndata = tablestr.split(',')
				
				for col in comumndata:
					col = col.strip()
					m = re.match(r"(^(\w+))",col)
					#print (m.group(0))#column name of the table current selected.
					self.tablevartext.append(m.group(0))
				break
		
		query = str('SELECT * FROM ' + self.tablename + " WHERE id=\'" + self.tablerowname + "\'")
		#print(query)
		cur.execute(query);
		#print("===>")
		#table row out put
		for t in cur:
			#print (t)
			#print(t[1])#var data table
			for vardata in t:
				#print(vardata)
				self.tablevarinput.append(vardata)
			#self.textbox.delete("1.0","end")
			#self.textbox.insert("end",t)
		self.deletetablerowinput
		self.createtablerowinput()
		
	def createtablerowinput(self):
		#print (dir(self.tablevarinput))
		rowcount = 0
		self.button_destroy = Button(self.tablerowframe)
		self.button_destroy["text"] = "delete rows"
		#self.button_destroy["command"] = self.deletetablerowinput
		self.button_destroy.grid(column=1, row=1, sticky=W)
		
		self.button_deletetablerow = Button(self.tablerowframe)
		self.button_deletetablerow["text"] = "delete table row"
		#self.button_deletetablerow["command"] = self.deletetablerowinput
		self.button_deletetablerow.grid(column=2, row=1, sticky=W)
		
		self.button_createtablerow = Button(self.tablerowframe)
		self.button_createtablerow["text"] = "insert table rows"
		#self.button_createtablerow["command"] = self.deletetablerowinput
		self.button_createtablerow.grid(column=3, row=1, sticky=W)
		
		
		for columnname in self.tablevartext:
			#print(columnname)
			self.entry_tablevarrow = Entry(self.tablerowframe, width=30, textvariable=columnname)
			self.entry_tablevarrow.delete(0,"end")
			#self.entry_tablevarrow.insert(0,columnname)
			#self.entry_tablevarrow.insert(0,self.tablevarinput[rowcount])
			self.entry_tablevarrow.insert(0,str(self.tablevarinput[rowcount]))
			#self.entry_tablevarrow.insert(0,self.tablevarinput[self.tablevarinput.length-rowcount])
			self.entry_tablevarrow.grid(column=2, row=rowcount+2, sticky=W)
			self.tableentrywidgetrow.append(self.entry_tablevarrow)
			
			self.label_tablevarrow = Label(self.tablerowframe, width=30, textvariable=columnname)
			self.label_tablevarrow['text'] = columnname
			self.label_tablevarrow.grid(column=1, row=rowcount+2, sticky=W)
			self.tablelabelwidgetrow.append(self.label_tablevarrow)
			#print(rowcount)
			rowcount += 1
	def deletetablerowinput(self):
		#print("hello")
		for x in self.tableentrywidgetrow:
			x.destroy()
			#print(x.destroy())
		self.tableentrywidgetrow = []
		for y in self.tablelabelwidgetrow:
			x.destroy()
		self.tablelabelwidgetrow = []
	
root = Tk()
app = Application(master=root)
app.mainloop()
root.destroy()
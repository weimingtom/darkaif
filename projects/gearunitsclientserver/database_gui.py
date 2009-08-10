#!/usr/local/bin/python
'''
Create by: Darknet
	This is for basic database access to view the information.
Python version: 3.1.0

Features:
-view database.
-run script
-update row
-delete row
-insert row

To do list:
-delete table
-create table
-export database
-import database
-primary id need to able to insert to the table

Note:
-It doesn't remove the GUI
-It bit buggy.
-Python version: 3.0.1 -Doesn't support the gui

execute script without '"' ->  INSERT INTO member (user, password) VALUES( "admin", "admin")
'''

from tkinter import *
from tkinter import ttk
from tkinter import tix
import sqlite3 as sqlite
import re

DATABASE = 'gearunits.db'
title = "Sqlite3 Database";

db = sqlite.connect(DATABASE);
cur = db.cursor();

print("#==============================#")
print("# Python Version: 3.1.0        #")
print("# sqlite3                      #")
print("#==============================#")

class Application(Frame):
	#label_serverstatus = Label()
	table = []
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
		self.listtable()#Make a list table
		self.createWidgets()
		self.master.geometry("800x600")
		self.pack()
	def listtable(self):
		self.table = []
		cur.execute("select * from sqlite_master WHERE type='table'");
		for t in cur:
			#print (t[1])
			self.table.append(t[1])

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
		self.combobox["values"] = self.table
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
		self.button_script["command"] = self.executescript
		self.button_script.grid(column=1, row=1, sticky=W)
		
		self.button_commit = Button(self.scriptframe)
		self.button_commit["text"] = "Commit"
		self.button_commit["command"] = self.commit_save
		self.button_commit.grid(column=2, row=1, sticky=W)
		
		#TEXT BOX
		self.textbox = Text(self.scriptframe, width=40, height=10)
		self.textbox.grid(column=1, row=2, sticky=W,columnspan=6)
		
		#TABLE FRAME LIST
		self.tablerowframe = ttk.Labelframe(self, text='Table Rows', width=600, height=100)
		self.tablerowframe.grid(column=2, row=1, sticky=W,rowspan=3)
		
		#TABLE ROW LIST
		self.listbox = Listbox(self.tablerowframe, exportselection=0, background="white")
		self.listbox.bind("<<ListboxSelect>>",self.listselect_click)
		self.listbox.grid(column=1, row=1, sticky=W)
		
		#vbar
		self.vbar = Scrollbar(self.tablerowframe, name="vbar")
		self.vbar.grid(column=1, row=1, sticky=E)
		self.vbar.configure(orient=VERTICAL, command=self.listbox.yview)
		self.listbox.configure(yscrollcommand=self.vbar.set)
		
		self.button_createrow = Button(self.tablerowframe)
		self.button_createrow["text"] = "Create Table Row"
		self.button_createrow["command"] = self.createtablerow
		self.button_createrow.grid(column=1, row=2, sticky=W)
		
		#TABLE FRAME ROW EDIT
		####
		self.tablerowframe = ttk.Labelframe(self, text='Table Rows EDIT', width=256, height=480)
		self.tablerowframe.grid(column=1, row=4, sticky=W,columnspan=2)
		
		self.button_deleterowtable = Button(self.tablerowframe)
		self.button_deleterowtable["text"] = "Delete Table Row"
		self.button_deleterowtable["command"] = self.deletetablerow
		self.button_deleterowtable.grid(column=1, row=1, sticky=W)
		
		self.button_updatetablerow = Button(self.tablerowframe)
		self.button_updatetablerow["text"] = "Update Table Row"
		self.button_updatetablerow["command"] = self.updatetablerow
		self.button_updatetablerow.grid(column=2, row=1, sticky=W)
		
		self.button_inserttablerow = Button(self.tablerowframe)
		self.button_inserttablerow["text"] = "Insert Table Row"
		self.button_inserttablerow["command"] = self.inserttablerow
		self.button_inserttablerow.grid(column=3, row=1, sticky=W)
		
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
		self.listbox.delete(0, "end")
		for t in cur:
			#print (t)
			#print (t[1])#table
			#spreadsheet.append(t[1])
			self.listbox.insert("end", str(t[0]))
		#self.listbox["listvariable"] = spreadsheet
		self.deletetablerowinput()
		
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
				tablestr = t[4].replace("CREATE TABLE " +self.tablename + " ",'')
				tablestr = tablestr.replace("(","")
				tablestr = tablestr.replace(")","")
				comumndata = tablestr.split(',')
				
				for col in comumndata:
					col = col.strip()
					print(col)
					m = re.match(r"(^(\w+))",col)
					#print (m.group(0))#column name of the table current selected.
					self.tablevartext.append(m.group(0))
				break
		
		query = str('SELECT * FROM ' + self.tablename + " WHERE id=\'" + self.tablerowname + "\'")
		#print(query)
		cur.execute(query);
		#table row out put
		for t in cur:
			#print (t)
			for vardata in t:
				#print(vardata)
				self.tablevarinput.append(vardata)
		self.deletetablerowinput
		self.createtablerowinput()
		
	def createtablerowinput(self):
		self.deletetablerowinput()
		rowcount = 0
		
		for columnname in self.tablevartext:
			#print(columnname)
			#entry
			self.entry_tablevarrow = Entry(self.tablerowframe, width=30, textvariable=columnname)
			self.entry_tablevarrow.delete(0,"end")
			self.entry_tablevarrow.insert(0,str(self.tablevarinput[rowcount]))
			self.entry_tablevarrow.grid(column=2, row=rowcount+2, sticky=W)
			self.tableentrywidgetrow.append(self.entry_tablevarrow)
			#Text label
			self.label_var = Label(self.tablerowframe, width=16)
			self.label_var['text'] = columnname
			self.label_var.grid(column=1, row=rowcount+2, sticky=W)
			self.tablelabelwidgetrow.append(self.label_var)
			#print(rowcount)
			rowcount += 1
	def createtablerow(self):
		#print ("TABLE ROW ->")
		self.tablevartext = []
		
		cur.execute("select * from sqlite_master WHERE type='table'");
		for t in cur:
			if self.tablename == t[1]:
				#print (t)
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
		print ("NEW TABLE")
		self.deletetablerowinput()
		rowcount = 0
		for columnname in self.tablevartext:
			#print(columnname)
			#entry
			self.entry_tablevarrow = Entry(self.tablerowframe, width=30, textvariable=columnname)
			self.entry_tablevarrow.delete(0,"end")
			#self.entry_tablevarrow.insert(0,str(self.tablevarinput[rowcount]))
			self.entry_tablevarrow.grid(column=2, row=rowcount+2, sticky=W)
			self.tableentrywidgetrow.append(self.entry_tablevarrow)
			#Text label
			self.label_var = Label(self.tablerowframe, width=16)
			self.label_var['text'] = columnname
			self.label_var.grid(column=1, row=rowcount+2, sticky=W)
			self.tablelabelwidgetrow.append(self.label_var)
			#print(rowcount)
			rowcount += 1
	def updatetablerow(self):
		if len(self.tableentrywidgetrow) > 0:
			count = 0;
			#mysql_query("UPDATE  $db_table SET imageid='{$hashname}' WHERE idhash='{$IDIMAGE}'")
			query = "UPDATE " + self.tablename
			set = " SET "
			where = "WHERE"
			for x in self.tableentrywidgetrow:
				if count == 0:
					where = where + " " + x["textvariable"] + "=\'" + x.get() + "\' "
				else:
					if count == len(self.tableentrywidgetrow)-1:
						set = set + "" + x["textvariable"] + "=\'" + x.get() + "\' "
					else:
						set = set + "" + x["textvariable"] + "=\'" + x.get() + "\', "
				
				print ( x["textvariable"] + "->" +  x.get())
				count += 1
			print (query + set + where)
			querystring = query + set + where
			self.applydata(querystring)
			#print (len(self.tableentrywidgetrow))
		else:
			print ("NO TABLE ROW")
	def deletetablerow(self):
		if len(self.tableentrywidgetrow) > 0:
			count = 0;
			query = "DELETE FROM " + self.tablename + " WHERE "
			delete = ""
			for x in self.tableentrywidgetrow:
				if count == len(self.tableentrywidgetrow)-1:
					delete = delete + "" + x["textvariable"] + "=\'" + x.get() + "\' "
				else:
					delete = delete + "" + x["textvariable"] + "=\'" + x.get() + "\' AND "
				count += 1
			print (query + delete)
			querystring = query + delete
			self.applydata(querystring)
			#print (len(self.tableentrywidgetrow))
		else:
			print ("NO TABLE ROW")
	def inserttablerow(self):
		if len(self.tableentrywidgetrow) > 0:
		#cur.execute('INSERT INTO member (user, password) VALUES( "admin", "admin")')
			count = 0;
			query = "INSERT INTO " + self.tablename + "("
			values = ""
			insert = ""
			#be sure it not the primary key else it will give error
			for x in self.tableentrywidgetrow:
				if count == len(self.tableentrywidgetrow)-1:
					values = values + x["textvariable"] + ''
					insert = insert + '\"' + x.get() + '\"'
				else:
					if count == 0:
						print ("PRIMARY KEY")
					else:
						values = values + x["textvariable"] + ','
						insert = insert + '\"' + x.get() + '\",'
				
				count += 1
		
			querystring = query + values + ") VALUES(" + insert + ")"
			print (querystring)
			self.applydata(querystring)
			#print (len(self.tableentrywidgetrow))
		else:
			print ("NO TABLE ROW")
	
	def deletetablerowinput(self):
		for x in self.tableentrywidgetrow:
			x.destroy()
		self.tableentrywidgetrow = []
		for y in self.tablelabelwidgetrow:
			y.destroy()
		self.tablelabelwidgetrow = []
		#if self.button_deleterowtable != None:
			#self.button_deleterowtable.destroy()
			#self.button_updatetablerow.destroy()
			#self.button_inserttablerow.destroy()
	
	#SCRIPTS ++++++
	def executescript(self):
		print("Execute Script...")
		scripttext = self.textbox.get('1.0', 'end')
		self.applydata(scripttext)
		print(scripttext)
	#COMMIT +++++++
	def commit_save(self):
		print("Sqlite3 Commit")
		db.commit()
	def applydata(self,querystr):
		print("Sqlite3 Commit")
		db = sqlite.connect(DATABASE);
		cur = db.cursor()
		cur.execute(querystr)
		db.commit()

root = Tk()
app = Application(master=root)
app.mainloop()
root.destroy()
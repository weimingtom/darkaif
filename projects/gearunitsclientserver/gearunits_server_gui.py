"""
GUI SERVER BUILD
Python version: 3.1.0
"""

from tkinter import *
from tkinter import ttk

host = '127.0.0.1';
port = 5555;
totalclient = 0;
serverstatus = 'Off';
title = "Gear Units > Flash Game Server";

class Application(Frame):
	#label_serverstatus = Label()
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
		self.text_host = Label(self)
		self.text_host["text"] = "Host IP:"
		self.text_host.grid(column=1, row=1, sticky=W)
		
		self.text_serverip = Entry(self, width=14, textvariable=host)
		self.text_serverip.focus()
		self.text_serverip.insert(0,host)
		self.text_serverip.grid(column=2, row=1, sticky=W)
		
		self.text_serverport = Label(self)
		self.text_serverport["text"] = "Port:"
		self.text_serverport.grid(column=3, row=1, sticky=W)
		
		self.text_serverportnum = Entry(self, width=5, textvariable=port)
		self.text_serverportnum.insert(0,port)
		self.text_serverportnum.grid(column=4, row=1, sticky=W)
		
		self.text_gamestats = Label(self)
		self.text_gamestats["text"] = "Game Server"
		self.text_gamestats.grid(column=1, row=2, sticky=W)
		
		self.text_numberclient = Label(self)
		self.text_numberclient["text"] = "Number of Client:"
		self.text_numberclient.grid(column=1, row=3, sticky=W)
		
		self.text_numclient = Label(self)
		self.text_numclient["text"] = totalclient
		self.text_numclient.grid(column=2, row=3, sticky=W)
		
		self.text_serverstatus = Label(self)
		self.text_serverstatus["text"] = "Server Status:"
		self.text_serverstatus.grid(column=1, row=4, sticky=W)
		
		self.label_serverstatus = Label(self)
		self.label_serverstatus["text"] = serverstatus
		self.label_serverstatus.grid(column=2, row=4, sticky=W)

		self.button_startserver = Button(self)
		self.button_startserver["text"] = "Start Server"
		self.button_startserver["command"] = self.button_start
		self.button_startserver.grid(column=1, row=5, sticky=W)
		#self.button_startserver.pack({"side":"left"})
		
		self.button_stopserver = Button(self)
		self.button_stopserver["text"] = "Stop Server"
		self.button_stopserver["command"] = self.button_stop
		self.button_stopserver.grid(column=2, row=5, sticky=W)
		
	def __init__(self, master=None):
		Frame.__init__(self, master)
		self.master.title(title)
		self.pack()
		self.createWidgets()
		self.master.geometry("300x100")
		#print(dir(self))

root = Tk()
app = Application(master=root)
#app.master['y'] = 500; 
print(dir(app.master));
#root.geometry('+400+300')
#set size:      root.geometry('400x300')
#set position:  root.geometry('+100+100')
#set both:      root.geometry('400x300+100+100')

print(app.master.grid_location)
app.mainloop()
root.destroy()
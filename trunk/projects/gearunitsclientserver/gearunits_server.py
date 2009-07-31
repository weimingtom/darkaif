#!/usr/local/bin/python
"""
Gear Units Server

Information: This is simple server that will be work on.

This btye format build. No struct pack build for this yet.

Python version: 3.1
Actionscript: 3

Current support for client are:
-Away3D (test done)
-Sandy3D (test done)
-Papervision3D (test done)

They are port as the same but papervision fixed odd over lap add for scene add.

Features:
-game server (not yet)
-chat room (part working)
-cmd controls (part working)

Note:
-There might be some network error that kick out the user connection.

"""


from struct import *
import pickle
import queue
import socket
import threading
import time
import re

#host = '127.0.0.1'; #local host
host = socket.gethostname(); #outside network #behind router
#host = ''; #out side network
port = 5555;
#port = 50007;

Client = [];
serverstart = True;
#idclient = 0;

print ("#  ------------- Init... -------------  #");

class GameServer (threading.Thread):
	vlock = threading.Lock();
	id = 0;  # next available thread number
	gametime = 0;
	allClients = [];
	def __init__(self):
		threading.Thread.__init__(self)
		self.name = '';
		self.id += 1
		self.user = '';
	def run(self):
		#print('game start' , self.id);
		while True:
			self.gametime = self.gametime + 1
			if self.gametime > 10000000:
				self.gametime = 0;
				#print(self.gametime);


#thread class for client talking to each other
class ClientThread (threading.Thread):
	allClients = [];
	vlock = threading.Lock();
	id = 0 # next available thread number
	control_left = False;
	control_right = False;
	control_up = False;
	control_down = False;
	control_spacebar = False;
	balive = True;
	x = 0;
	y = 0;
	z = 0;
	rotation_x = 0;
	rotation_y = 0;
	rotation_z = 0;
	
	def __init__(self,clientSocket):
		threading.Thread.__init__(self)
		self.sockfd = clientSocket; #socket client
		self.name = '';
		ClientThread.id += 1
		self.id = ClientThread.id
		self.nickName = '';
		#ClientThread.allClients.append(self.sockfd);
		self.allClients.append(self.sockfd);
	def newClientConnect(self):
		self.sockfd.send(b'Welcome my first chat\n');
		self.sendAll(b'new user\n');
	def sendAll(self,buff):
		#print("sending all");
		for index,clientSock in enumerate(self.allClients):
			try:
				clientSock.send(buff);
				#print ('--->>')#number client for sending them
			except (socket.error):
				print ('error socket %s\n',index,"| clean");
				clientSock.close()
				del self.allClients[index]
				#this deal with object render to not show up
				self.sendAll(b'user left\n');
				rawinput = 'object=none,'+'id=' + str(self.id) + ',balive=false\n'
				print (rawinput)
				b = bytes ( ord(c) for c in rawinput) 
				self.sendAll(b);
	
	def readrawdata(self,buff):
		#print (buff);
		strdata = str(buff)
		if re.search("cmd",strdata):
			strdata = strdata.replace("b\'","");
			strdata = strdata.replace("\\n'","");
			result = strdata.split("=")
			#print (result[0])
			#print (result[0])
			#print (result[1])
			if result[0] == "cmd:left" and result[1] == "True":
				#print ("left ture=>>")
				self.x = self.x -1;
			if result[0] == "cmd:right" and result[1] == "True":
				#print ("left ture=>>")
				self.x = self.x +1;
			if result[0] == "cmd:up" and result[1] == "True":
				#print ("left ture=>>")
				self.z = self.z +1;
			if result[0] == "cmd:down" and result[1] == "True":
				#print ("left ture=>>")
				self.z = self.z -1;
				
			#print("x:",self.x," z:",self.z);
			rawinput ='object=none,' + 'id='  + str(self.id) + ',x=' + str(self.x)+ ',y=' + str(self.y)+',z='+ str(self.z)+ ',balive=true' + '\n'
			print(rawinput)
			b = bytes ( ord(c) for c in rawinput) 
			#strdata =str(rawinput).encode('utf-8')
			#print(type(b))
			#print(type(rawinput))
			self.sendAll(b)
			#self.sendAll(strdata)
			#self.sendAll(pack('hhl', 1, 2, 3))
		else:
			self.sendAll(buff)
	
	def run(self):
		self.newClientConnect();
		while True:
			buff = self.sockfd.recv(2048);
			if not buff:
				print ("connect close...(client side)");
				self.sockfd.close();
				#self.sendAll(b'user left...\n');
				rawinput = 'object=none,'+'id=' + str(self.id) + ',balive=false\n'
				b = bytes ( ord(c) for c in rawinput) 
				#strdata =str(rawinput).encode('utf-8')
				print (b)
				self.sendAll(b)
				#self = None;
				break #incase it loop infinite
			#print(buff);
			print("ID>" + str(self.id))
			self.readrawdata(buff)
			#self.sendAll(buff)
		self.sockfd.close()
		
'''	
print ("#  ------------- Init...gameserver -------------  #\n");
gameserver = GameServer();
gameserver.start();
'''
print ("#  ------------- Init...listen client -------------  #\n");
server = socket.socket( socket.AF_INET, socket.SOCK_STREAM )#this default

server.bind((host,port))
#server.bind((socket.gethostname(),port))
server.listen(5)
print ("Server Up Listen!",host,":",port,"BIND!");

while True:
	(clientSocket, address) = server.accept();
	print("client connect from :",address);
	ct = ClientThread(clientSocket);
	ct.start();

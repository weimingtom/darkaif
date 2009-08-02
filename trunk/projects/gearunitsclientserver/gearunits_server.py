#!/usr/local/bin/python
"""
def 
	Gear Units Server

	Information: This is simple server that will be work on.

	This btye format build. No struct pack build for this yet.

	Python version: 3.1
	Actionscript version: 3

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
	
	b'<policy-file-request/>\x00 = python log
	
	POLICY_REQUEST = "<policy-file-request/>";
	POLICY_XML =
    "<?xml version=\"1.0\"?>" +
    "<cross-domain-policy>" +
    "<allow-access-from domain=\"*\" to-ports=\"*\" />" +
    "</cross-domain-policy>";
	

"""
import sqlite3 as sqlite
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
fps = 30;

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
	def addthread(self,client): #add thread for user clients
		#print("THREADS...=====================");
		self.allClients.append(client);
		for index,clientSock in enumerate(self.allClients):
			#print("ID:" + str(clientSock.id));
			try:
				#print(clientSock.sockfd);
				#print(clientSock.sockfd._closed)#this deal with socket closed if
				
				#if socket is closed
				if clientSock.sockfd._closed == True:
					del self.allClients[index]
				
				#address = clientSock.sockfd
				#print (address)
				#print("TYPE:",clientSock.sockfd.type)
				#print(dir(clientSock.sockfd));
			except (socket.error):
				print ('client > error socket %s\n',index,"| clean");
		
	def boardcast(self):
		print();
	
	def clientcontrol(self):
		#print ('check control');
		for index,clientSock in enumerate(self.allClients):
			#print('client....')
			if clientSock.sockfd._closed == True:
					del self.allClients[index]
			else:
				#bmove = False;
				if clientSock.control_left == True:
					#print ('MOVE>>>>>')
					clientSock.x -= 1;
					#bmove = True
					clientSock.movepoint();
				if clientSock.control_right == True:
					clientSock.x += 1;
					#bmove = True
					clientSock.movepoint();
				if clientSock.control_up == True:
					clientSock.z += 1;
					#bmove = True
					clientSock.movepoint();
				if clientSock.control_down == True:
					clientSock.z -= 1;
					#bmove = True
					clientSock.movepoint();
	def run(self):
		#print('game start' , self.id);
		while True:
			self.gametime += 1
			if self.gametime > 1000000/fps:
			#if self.gametime > 500000/fps:
				self.gametime = 0;
				self.clientcontrol();
				#print(self.gametime);


#thread class for client talking to each other
class ClientThread (threading.Thread):
	allClients = [];
	bused = True;
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
				self.bused = False
				clientSock.close()
				del self.allClients[index]
				#this deal with object render to not show up
				self.sendAll(b'user left\n');
				rawinput = 'object=none,'+'id=' + str(self.id) + ',balive=false\n'
				#print (rawinput)
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
				self.control_left = True;
				#self.x = self.x -1;
			else:
				self.control_left = False;
			if result[0] == "cmd:right" and result[1] == "True":
				#print ("left ture=>>")
				#self.x = self.x +1;
				self.control_right = True;
			else:
				self.control_right = False;
				
			if result[0] == "cmd:up" and result[1] == "True":
				#print ("left ture=>>")
				#self.z = self.z +1;
				self.control_up = True;
			else:
				self.control_up = False;
				
			if result[0] == "cmd:down" and result[1] == "True":
				#print ("left ture=>>")
				#self.z = self.z -1;
				self.control_down = True;
			else:
				self.control_down = False;
			
			#rawinput ='object=none,' + 'id='  + str(self.id) + ',x=' + str(self.x)+ ',y=' + str(self.y)+',z='+ str(self.z)+ ',balive=true' + '\n'
			#b = bytes ( ord(c) for c in rawinput) 
			#self.sendAll(b)
			
			#print("x:",self.x," z:",self.z);
			#print(rawinput)
			#strdata =str(rawinput).encode('utf-8')
			#print(type(b))
			#print(type(rawinput))
			#self.sendAll(strdata)
			#self.sendAll(pack('hhl', 1, 2, 3))
		else:
			self.sendAll(buff)
			
	def movepoint(self):
		#print("x:",self.x," z:",self.z);
		rawinput ='object=none,' + 'id='  + str(self.id) + ',x=' + str(self.x)+ ',y=' + str(self.y)+',z='+ str(self.z)+ ',balive=true' + '\n'
		b = bytes ( ord(c) for c in rawinput) 
		self.sendAll(b)
	
	def run(self):
		buff = self.sockfd.recv(1028);
		if str(buff) == str("b\'<policy-file-request/>\\x00\'"):
			print ('policy FOUND >>> sending...')
			print(buff)
			rawinput = '<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>\x00\n'
			b = bytes ( ord(c) for c in rawinput) 
			print (b)
			self.sockfd.send(b); 
		while True:
			buff = self.sockfd.recv(2048);
			#print(dir(self.sockfd))
			if not buff:
				print ("connect close...(client side)");
				#rawinput = '<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>'
				#b = bytes ( ord(c) for c in rawinput) 
				#self.sockfd.send(b);
				self.sockfd.close();
				#self.sendAll(b'user left...\n');
				rawinput = 'object=none,'+'id=' + str(self.id) + ',balive=false\n'
				b = bytes ( ord(c) for c in rawinput) 
				#strdata =str(rawinput).encode('utf-8')
				#print (b)
				self.sendAll(b)
				#self = None;
				self.bused = False
				break #incase it loop infinite
			#print(str("---b\'<policy-file-request/>\\x00\'"))
			#print(type(buff))
			#print(str(buff))
			#rawinput = '<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>'
			#b = bytes ( ord(c) for c in rawinput) 
			#self.sockfd.send(b);
			if str(buff) == str("b\'<policy-file-request/>\\x00\'"):
				print(buff)
				#print ('policy FOUND >>> sending...')
				rawinput = str('<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>')
				print (rawinput)
				b = bytes ( ord(c) for c in rawinput) 
				#self.sockfd.send();
				self.sockfd.sendall(b"""<?xml version="1.0"?><cross-domain-policy><allow-access-from domain="*" to-ports="*"/></cross-domain-policy>""")
				#self.sockfd.sendall(b)
				
				
			print(buff);
			#print("ID>" + str(self.id))
			self.readrawdata(buff)
			#self.sendAll(buff)
		self.sockfd.close()

print ("#  ------------- Init... Database -------------  #\n");
#database need to be build some way
#db = sqlite.connect('gearunits.db')
#cur = db.cursor()
#cur.execute('SELECT * FROM member')

#for t in cur:
	#print (t)
	#print (t[1])#table
print('database not init...')
	
print ("#  ------------- Init... Games Server -------------  #\n");
gameserver = GameServer();
gameserver.start();
print('Game Server running...' , gameserver.id);

print ("#  ------------- Init... Listen Client -------------  #\n");
server = socket.socket( socket.AF_INET, socket.SOCK_STREAM )#this default
server.bind((host,port))
server.listen(5)

print ("Server Up Listen!",host,":",port," Bind!");

while True:
	(clientSocket, address) = server.accept();
	print("client connect from :",address);
	ct = ClientThread(clientSocket);
	gameserver.addthread(ct);
	print(ct.id);
	ct.start();

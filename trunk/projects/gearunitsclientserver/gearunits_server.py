import pickle
import queue
import socket
import threading
import time

host = '127.0.0.1';
port = 5555;
Client = [];
serverstart = True;

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
	#v = '';
	vlock = threading.Lock();
	id = 0  # next available thread number
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
		self.id += 1
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
			except (socket.error):
				print ('error socket %s\n',index,"| clean");
				clientSock.close()
				del self.allClients[index]
				self.sendAll(b'new user\n');
	
	def readrawdata(self,buff):
		print (buff);
		strdata = str(buff)
		strdata = strdata.replace("b\'","");
		strdata = strdata.replace("\\n'","");
		result = strdata.split("=")
		#print (result[0])
		print (result[0])
		print (result[1])
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
		
		print("x:",self.x," z:",self.z);
		
	
	def run(self):
		self.newClientConnect();
		while True:
			buff = self.sockfd.recv(2048);
			if not buff:
				print ("connect close...(client side)");
				self.sockfd.close();
				#self.sendAll(b'user left...\n');
				rawinput = 'id=' , self.id , ':balive=False\n'
				strdata =str(rawinput).encode('utf-8')
				#print (strdata)
				self.sendAll(strdata)
				#self = None;
				break #incase it loop infinite
			#print(buff);
			self.readrawdata(buff)
			self.sendAll(buff)
		self.sockfd.close()
		
'''	
print ("#  ------------- Init...gameserver -------------  #\n");
gameserver = GameServer();
gameserver.start();
'''

print ("#  ------------- Init...listen client -------------  #\n");
server = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
server.bind ( ( host,port ) )
server.listen ( 5 )
print ("Server Up Listen!",host,":",port,"BIND!");

while True:
	(clientSocket, address) = server.accept();
	print("client connect from :",address);
	ct = ClientThread(clientSocket);
	ct.start();
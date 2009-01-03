import pickle
import queue
import socket
import threading
import time

host = '127.0.0.1';
port = 5555;
Client = [];
serverstart = True;

print ("#---------------------------------------#");
print ("#  ------------- Init... -------------  #");
print ("#---------------------------------------#");

#thread class for client talking to each other
class ClientThread (threading.Thread):
	allClients = [];
	#v = '';
	vlock = threading.Lock();
	id = 0  # next available thread number
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
		self.sendAll(b'new user');
	def sendAll(self,buff):
		print("sending all");
		for index,clientSock in enumerate(self.allClients):
			try:
				clientSock.send(buff);
			except (socket.error):
				print ('error socket %s\n',index,"| clean");
				clientSock.close()
				del self.allClients[index]
	def run(self):
		self.newClientConnect();
		while True:
			buff = self.sockfd.recv(2048);
			if not buff:
				print ("connect close...(client side)");
				self.sockfd.close();
				#self = None;
				break #incase it loop infinite
			print(buff);
			self.sendAll(buff)
		self.sockfd.close()

server = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
server.bind ( ( host,port ) )
server.listen ( 5 )
print ("Server Up Listen!",host,":",port,"BIND!");

while True:
	(clientSocket, address) = server.accept();
	print("client connect from :",address);
	ct = ClientThread(clientSocket);
	ct.start();
#!/usr/local/bin/python
'''
Flash Policy Test
Information: This is partly working. There are some different formats when receiving and sending from the socket
for python version.
python version 3.x.x
'''
import socket
import threading
import sys
import os

host = ''; #out side network
port = 5555;

print ("#  ------------- flash policy 3.1.x Init... -------------  #");
class ClientThread (threading.Thread):
	allClients = [];
	vlock = threading.Lock();
	id = 0 # next available thread number
	def __init__(self,clientSocket):
		threading.Thread.__init__(self)
		self.sockfd = clientSocket; #socket client
		self.name = '';
		ClientThread.id += 1
		self.id = ClientThread.id
		self.nickName = '';
		self.allClients.append(self.sockfd);
	def sendAll(self,buff):
		for index,clientSock in enumerate(self.allClients):
			try:
				clientSock.send(buff);
			except (socket.error):
				print ('error socket %s\n',index,"| clean");
				clientSock.close()
				del self.allClients[index]
	def run(self):
		while True:
			buff = self.sockfd.recv(1028);
			if not buff:
				print ("connect close...(client side)");
				self.sockfd.close();
				break #incase it loop infinite
			if str(buff) == str("b\'<policy-file-request/>\\x00\'"):
				print ('policy FOUND >>> sending...')
				print(buff)
				rawinput = '<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>\x00\n'
				b = bytes ( ord(c) for c in rawinput) 
				print (b)
				self.sockfd.send(b);
			print(buff);
			self.sendAll(buff)
		self.sockfd.close()
print ("#  ------------- Init... Listen Client -------------  #\n");
try:
	server = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
except AttributeError:
	# AttributeError catches Python built without IPv6
	server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
except socket.error:
	# socket.error catches OS with IPv6 disabled
	server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind((host,port))
server.listen(5)
print ("Server Up Listen!",host,":",port," Bind!");
while True:
	(clientSocket, address) = server.accept();
	print("client connect from :",address);
	ct = ClientThread(clientSocket);
	print(ct.id);
	ct.start();
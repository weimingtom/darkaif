#!/usr/local/bin/python

'''
Flash Policy Test
Information: This is partly working. There are some different formats when receiving and sending from the socket
for python version. Note there are some error in the socket.
python version 2.5.x
'''
import socket
import threading
import sys
import os

host = ''; #out side network
#host = socket.gethostname(); #out side network
port = 5555;

print ("#  ------------- flash policy 2.5.x Init... -------------  #");

#thread class for client talking to each other
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
			#buff = self.sockfd.recv(2048);
			buff = self.sockfd.recv(1024);
			if not buff:
				print ("connect close...(client side)");
				self.sockfd.close();
				break #incase it loop infinite
			if str(buff) == str('<policy-file-request/>\x00'):
				print ('policy FOUND >>> sending...')
				print(buff)
				policy = '<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>\x00\n'
				print (policy)
				self.sockfd.sendall(policy);#old version 2.5.x need to socket.sendall()
			print(buff)
			self.sendAll(buff)
		self.sockfd.close()

print ("#  ------------- Init... Listen Client -------------  #\n");
server = socket.socket( socket.AF_INET, socket.SOCK_STREAM )#this default
server.bind((host,port))
server.listen(5)

print ("Server Up Listen!",host,":",port," Bind!");

while True:
	(clientSocket, address) = server.accept();
	print("client connect from :",address);
	ct = ClientThread(clientSocket);
	print(ct.id);
	ct.start();
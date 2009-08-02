#!/usr/local/bin/python

'''
Still under testing...
python version 2.5.x
'''
import socket
import threading
import sys
import os

file_name = 'flashpolicy.xml'
fh = open(file_name, "r")
policy = fh.read(10001)

host = ''; #out side network
port = 5555;

Client = [];
serverstart = True;

print ("#  ------------- Init... -------------  #");

#thread class for client talking to each other
class ClientThread (threading.Thread):
	global policy;
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
				#this deal with object render to not show up

	def run(self):
		while True:
			buff = self.sockfd.recv(2048);
			if not buff:
				print ("connect close...(client side)");
				self.sockfd.close();
				break #incase it loop infinite
			if buff == '<policy-file-request/>':
				print("found policy!")
				print(buff)
				b = b'<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>'
				print (b)
				self.sockfd.send(b); 
				self.sockfd.sendall(b); 
			print("-----");	
			print(buff);
			print (type(policy) )
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

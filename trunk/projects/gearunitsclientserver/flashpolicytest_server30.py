#!/usr/local/bin/python

'''
Still under testing...
python version 3.x.x
'''

import sqlite3 as sqlite
from struct import *
import pickle
import queue
import socket
import threading
import time
import re
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
				self.sendAll(b'user left\n');

	def run(self):
		while True:
			#buff = self.sockfd.recv(2048);
			buff = self.sockfd.recv(1028);
			if not buff:
				print ("connect close...(client side)");
				self.sockfd.close();
				break #incase it loop infinite
			if str(buff) == str("b\'<policy-file-request/>\\x00\'"):
				print(buff)
				
				b = b'<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>'
				print (b)
				self.sockfd.send(b); 
				self.sockfd.sendall(b); 
				
				#print ('policy FOUND >>> sending...')
				#rawinput = str('<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\" /></cross-domain-policy>')
				#print (rawinput)
				#b = bytes ( ord(c) for c in policy) 
				#self.sockfd.sendall(b"""<?xml version="1.0"?><cross-domain-policy><allow-access-from domain="*" to-ports="*"/></cross-domain-policy>""")
				#print(b)
				#self.sockfd.sendall(b)
				
			print(buff);
			self.sendAll(buff)
		self.sockfd.close()

print ("#  ------------- Init... Listen Client -------------  #\n");
#server = socket.socket( socket.AF_INET, socket.SOCK_STREAM )#this default
#server = socket.socket( socket.AF_INET6, socket.SOCK_STREAM )#this default
#server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

try:
	#print("1 - AF_INET6 -> SOCK_STREAM")
	server = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
except AttributeError:
	#print("2 - AF_INET -> SOCK_STREAM")
	# AttributeError catches Python built without IPv6
	server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
except socket.error:
	#print("3 - AF_INET -> SOCK_STREAM")
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


import socket
import sys
import threading

#================================================
class srvr(threading.Thread):
	v = ''
	vlock = threading.Lock()
	id = 0  # next available thread number
	def __init__(self,clntsock):
		threading.Thread.__init__(self)
		self.myid = srvr.id
		srvr.id += 1
		self.myclntsock = clntsock
	def run(self):
		print ("client",srvr.id )
		while 1:
			try:
				k = self.myclntsock.recv(100)
				if not k:
					print("ID:",srvr.id," -(Data Check)Client disconnected...")
					self.myclntsock.close()
					break
				#self.myclntsock.send(b'Hello, world from python server')
				self.myclntsock.send(k);
				#self.myclntsock.close()
			except socket.error as msg:
				self.myclntsock.close()
				s = None
				print("ID:",srvr.id," -Client disconnected...")
				break

#================================================


mySocket = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
mySocket.bind ( ( '127.0.0.1', 5555 ) )
mySocket.listen ( 5 )
print ("Server Up Listen!")
serverstart = True;
mythreads = []  # list of all the threads


while serverstart:
	client, details = mySocket.accept()
	print ('We have opened a connection with', details)
	try:
		client.send(b'Hello, world from python server')
		s = srvr(client)
		#mythreads.append(s)
		s.start()
	except client.error as msg:
		s = None
		#continue
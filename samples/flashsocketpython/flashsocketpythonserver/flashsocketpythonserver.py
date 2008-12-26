import socket

mySocket = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
mySocket.bind ( ( '127.0.0.1', 5555 ) )
mySocket.listen ( 5 )
print ("Server Up Listen!")
while True:
    channel, details = mySocket.accept()
    print ('We have opened a connection with', details)
    txt = channel.recv ( 100 )
    print (txt)
    #channel.send ( str("This is a response test - attempt 1\0") )
    #channel.send(str('This is a response test'))
    channel.send(b'Hello, world from python server')
    channel.close()
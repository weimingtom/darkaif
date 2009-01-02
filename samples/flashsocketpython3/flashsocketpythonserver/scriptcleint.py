# Echo client program
import socket
import sys

HOST = '127.0.0.1'    # The remote host
PORT = 5555              # The same port as used by the server
s = None
for res in socket.getaddrinfo(HOST, PORT, socket.AF_UNSPEC, socket.SOCK_STREAM):
    af, socktype, proto, canonname, sa = res
    try:
     s = socket.socket(af, socktype, proto)
    except socket.error as msg:
     s = None
     continue
    try:
     s.connect(sa)
    except socket.error as msg:
     s.close()
     s = None
     continue
    break
if s is None:
    print('could not open socket')
    sys.exit(1)
s.send(b'Hello, world')
data = s.recv(1024)
s.close()
print('Received', repr(data))

# Introduction #
> I still learning about them. Using sockets in binary code to get a multi-player working will take some time. But your using socket xml that depend if simple game. That it would be easy to write. But it up to every one how to code it. I am writing the mixed stuff that can be use for the game. Although it required to learn those languages. But they are simple once you learn it. Learning how to build them is any is question.

Actionscript3 can't host to save data but it can use url request from php script. It has the security of the sandbox. You search about it.

# php script #
> php is easy don't need to learn a lot. But you do any way if you want save data or any thing else. Like role playing game and real time strategy. Basic use like buying items once it does a query, but you have to setup the interface.

# server java/python #
> Making server with those languages are going good thing but it depend if you want to use them or not. For this you can use with out any script once it connect to the socket to the server. It has the listen function. Meaning it can connect to more then one users. Make sure that client some simple tasks and server does it all to deal with hacking.

## Java server ##
Easy to use once you got one of the IDE for debugging. Compiling to execute jar file. If you want no one to steal it. Packaging is little easy once how to use packages for build class and how functions works. It may take a while to learn it.

## Python server ##
Easy and simple once you get the hang of it. Python is a script. It can be execute by it self. There are two ways and others. Building your Package is bit harder may take a while to get it working if you want to build a rpg or rts.

  * One use create your python script server you made and then create a batch to able to create a server host.

  * Two it required another learning from building the src of python and add support your own server and to have an execute script.

# Security #
> Well, this one I will tell this there are full of holes if you don't build security around it. For hack or steal files or data change. Just built a simple server and client before doing that or during your build. That is up to how to build it.

  * Binary and XML sockets - You need to setup the access if you making a server. You have test if it connect to the server and allow access only your sites and ports.
  * Area access it depend on the browser and the operation system. User will get an error if not setup.

flashpolicy.xml
```
<?xml version="1.0"?>
<!DOCTYPE cross-domain-policy SYSTEM "/xml/dtds/cross-domain-policy.dtd">

<!-- Policy file for xmlsocket://socks.example.com -->
<cross-domain-policy> 

   <!-- This is a master socket policy file -->
   <!-- No other socket policies on the host will be permitted -->
   <site-control permitted-cross-domain-policies="all"/>
   <allow-access-from domain="*"/>
   <!-- Instead of setting to-ports="*", administrator's can use ranges and commas -->
   <!-- This will allow access to ports 123, 456, 457 and 458 -->
   <allow-access-from domain="*" to-ports="*" />

</cross-domain-policy>
```

# Tips #
  * Build your script once at the time else you find your self lost in your code.
  * Build your code one at the time then later added on.
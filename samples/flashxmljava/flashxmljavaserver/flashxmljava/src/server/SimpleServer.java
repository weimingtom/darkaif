package server;

import java.io.*; 
import java.net.*; 
 
class SimpleServer 
{ 
    private static SimpleServer server; 
    ServerSocket socket; 
    Socket incoming; 
    BufferedReader readerIn; 
    PrintStream printOut; 
 
    public static void main(String[] args) 
    { 
        int port = 8080; 
 
        try 
        { 
            port = Integer.parseInt(args[0]); 
        } 
        catch (ArrayIndexOutOfBoundsException e) 
        { 
            // Catch exception and keep going. 
        } 
 
        server = new SimpleServer(port); 
    } 
 
    private SimpleServer(int port) 
    { 
        System.out.println(">> Starting SimpleServer"); 
        try 
        { 
            socket = new ServerSocket(port); 
            incoming = socket.accept(); 
            readerIn = new BufferedReader(new InputStreamReader(incoming.getInputStream())); 
            printOut = new PrintStream(incoming.getOutputStream()); 
            printOut.println("Enter EXIT to exit.\r"); 
            out("Enter EXIT to exit.\r"); 
            boolean done = false; 
            while (!done) 
            { 
                String str = readerIn.readLine(); 
                if (str == null) 
                { 
                    done = true; 
                } 
                else 
                { 
                    out("Echo: " + str + "\r"); 
                    if(str.trim().equals("EXIT")) 
                    { 
                        done = true; 
                    } 
                } 
                incoming.close(); 
            } 
        } 
        catch (Exception e) 
        { 
            System.out.println(e); 
        } 
    } 
 
    private void out(String str) 
    { 
        printOut.println(str); 
        System.out.println(str); 
    } 
}
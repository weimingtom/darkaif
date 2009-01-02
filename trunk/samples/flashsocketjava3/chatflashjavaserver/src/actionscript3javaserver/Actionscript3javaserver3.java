package actionscript3javaserver;
//flash socket binary
//works join and sending clients data to server and back. Can't talk to other client. 
//note the data types are depending on the write format.

import java.net.*;
import java.io.*;

public class Actionscript3javaserver3 {
	ServerSocket m_ServerSocket;
	
	public Actionscript3javaserver3() {
		try
		{
			// Create the server socket.
			m_ServerSocket = new ServerSocket(5555);
		}
		catch(IOException ioe)
		{
			System.out.println("Could not create server socket at 5555. Quitting.");
			System.exit(-1);
		}
		
		System.out.println("Listening for clients on 5555...");
		// Successfully created Server Socket. Now wait for connections.
		
		int id = 0;
		while(true)
		{
			try
			{
				// Accept incoming connections.
				Socket clientSocket = m_ServerSocket.accept();
				
				// accept() will block until a client connects to the server.
                // If execution reaches this point, then it means that a client
                // socket has been accepted.
                
                // For each client, we will start a service thread to
                // service the client requests. This is to demonstrate a
                // multithreaded server, although not required for such a
                // trivial application. Starting a thread also lets our
                // EchoServer accept multiple connections simultaneously.
                
                // Start a service thread
				
				ClientServiceThread cliThread = new ClientServiceThread(clientSocket, id++);
                cliThread.start();
			}
			catch(IOException ioe)
            {
                System.out.println("Exception encountered on accept. Ignoring. Stack Trace :");
                ioe.printStackTrace();
            }			
		}
		
	}
	
	public static void main(String[] args){
		new Actionscript3javaserver3();
	}
	
	class ClientServiceThread extends Thread
	{
		Socket m_clientSocket;  
		int m_clientID = -1;
		boolean m_bRunThread = true;
		
		ClientServiceThread(Socket s, int clientID)
		{
			m_clientSocket = s;
			m_clientID = clientID;
		}
		
		public void run()
		{
            // Obtain the input stream and the output stream for the socket
            // A good practice is to encapsulate them with a BufferedReader
            // and a PrintWriter as shown below.
			
			BufferedReader linein = null; 
            PrintWriter lineout = null;
			
			BufferedInputStream in = null; 
			BufferedOutputStream out = null;
            
            // Print out details of this connection
            System.out.println("Accepted Client : ID - " + m_clientID + " : Address - " + 
                    m_clientSocket.getInetAddress().getHostName());
            try
            {
            	linein = new BufferedReader(new InputStreamReader(m_clientSocket.getInputStream()));
                lineout = new PrintWriter(new OutputStreamWriter(m_clientSocket.getOutputStream()));
                
            	in = new BufferedInputStream(m_clientSocket.getInputStream());
                out = new BufferedOutputStream(m_clientSocket.getOutputStream());
                
                // At this point, we can read for input and reply with appropriate output.
                
                // Run in a loop until m_bRunThread is set to false
                
                String clientCommand = linein.readLine();
                System.out.println("Client Says :" + clientCommand);
                
                // strings are in array AS3 send >'hello' > formated > ['h','e','l','l','o']  
                byte buffer[] = new byte[4096];
                int bytesRead;
                
                //There are two loop one for byte and string
                
                /*
                while ((bytesRead = in.read(buffer)) > 0) {
                	// read incoming stream
                    
                	System.out.println("ID:"+ in.read(buffer));
                	out.write(buffer, 0, bytesRead); // write it back
                	out.flush();    // flush the output buffer
                	//String clientCommand = bytesRead;
                	System.out.println("ID:"+ m_clientID + " Client Says :...");
                }
                */
                while(m_bRunThread){                    
                    // read incoming stream
                    String clientCommand1 = linein.readLine();
                    
                    System.out.println("Client Says :" + clientCommand1);
                    
                    
                    if(clientCommand1.equalsIgnoreCase("quit"))
                    {
                        // Special command. Quit this thread
                        m_bRunThread = false;   
                        System.out.print("Stopping client thread for client : " + m_clientID);
                    }
                    else
                    {
                        // Echo it back to the client.
                        lineout.println(clientCommand1);
                        lineout.flush();
                    }
                }
                
                
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            finally
            {
                // Clean up
                try
                {                    
                    in.close();
                    out.close();
                    m_clientSocket.close();
                    System.out.println("...Stopped");
                }
                catch(IOException ioe)
                {
                    ioe.printStackTrace();
                }
            }
		}
	}
}

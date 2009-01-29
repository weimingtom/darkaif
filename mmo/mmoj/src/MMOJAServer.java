import java.net.*;
import java.util.ArrayList;
import java.util.List;
import java.awt.Graphics;
import java.io.*;

public class MMOJAServer extends java.applet.Applet{
	ServerSocket m_ServerSocket;
	boolean bserver = true;
	static protected List<PrintWriter> writers = new ArrayList<PrintWriter>();
	
	public void init() {
		resize(150,150);
	}
	
	public void paint(Graphics g) {
		g.drawString("Hello world!", 50, 25);
		Server();
	}
	
	public void Server(){
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
		while(bserver)
		{
			System.out.println("main loop");
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
	
	class ClientServiceThread extends Thread
	{
		Socket m_clientSocket;  
		int m_clientID = -1;
		boolean m_bRunThread = true;
		PrintWriter broad = null;
		
		//PrintWriter out = null;
		//BufferedReader in = null;
		
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
			
			BufferedReader in = null; 
            PrintWriter out = null;
            
            // Print out details of this connection
            System.out.println("Accepted Client : ID - " + m_clientID + " : Address - " + 
                    m_clientSocket.getInetAddress().getHostName());
            try
            {
            	in = new BufferedReader(new InputStreamReader(m_clientSocket.getInputStream()));
                out = new PrintWriter(new OutputStreamWriter(m_clientSocket.getOutputStream()));
                
                BufferedInputStream is = new BufferedInputStream(m_clientSocket.getInputStream());
        		BufferedOutputStream os = new BufferedOutputStream(m_clientSocket.getOutputStream());
            	//out = new PrintWriter(m_clientSocket.getOutputStream(), true);
            	//in = new BufferedReader(new InputStreamReader(m_clientSocket.getInputStream()));
                MMOJAServer.writers.add(out);
                // At this point, we can read for input and reply with appropriate output.
                
                // Run in a loop until m_bRunThread is set to false
                while(m_bRunThread)
                {   
                	String clientCommand = in.readLine();
                	
                    // read incoming stream
                    System.out.println(m_clientID+":ID Client Says :" + clientCommand);
                    if(clientCommand.equalsIgnoreCase("quit"))
                    {
                        // Special command. Quit this thread
                        m_bRunThread = false;   
                        System.out.print("Stopping client thread for client : " + m_clientID);
                    }
                    else
                    {
                        // Echo it back to the client.
                        //out.println(clientCommand);
                        //out.flush();
                    	
                        for (int i=0; i<MMOJAServer.writers.size();i++) 
                        {
                           broad = MMOJAServer.writers.get(i);
                           broad.println(clientCommand);
                           broad.flush();
                        }
                        
                    	
                    	/*
                        byte buffer[] = new byte[4096];
                		int bytesRead;
                		
                        while ((bytesRead = is.read(buffer)) > 0) {
                			os.write(buffer, 0, bytesRead); // write it back
                			os.flush();    // flush the output buffer
                		}
                        */
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

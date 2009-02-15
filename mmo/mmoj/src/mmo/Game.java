package mmo;

//import MMOJAServer;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.ArrayList;
import java.util.List;

public class Game {
	public Player[] user;//list of user connect to the server
	static protected List<PrintWriter> writers = new ArrayList<PrintWriter>();
	
	//Player currentPlayer;
	public Game(){
		System.out.println("Game Class Running");
		//while(true){
		//	System.out.println("....");
		//}
	}
	
	public class Player extends Thread {
		double x = 0;
		double y = 0;
		double z = 0;
		String objecttype = "box";
		boolean forward = false;
		boolean backward = false;
		boolean right = false;
		boolean left = false;

		Socket socket;
        BufferedReader input;
        PrintWriter output;
        Socket m_clientSocket;  
		int m_clientID = -1;
		boolean m_bRunThread = true;
		
		public Player(Socket accept,int clientID) {
			m_clientSocket = accept;
			m_clientID = clientID;
		}

		public void cmd(String clientCommand,PrintWriter out){
			if (clientCommand.indexOf( "cmd" )>=0){
            	System.out.print("CMD FOUND! \n");
            	String cmdstring = clientCommand;
            	String[] cmdstr; 
            	int openbracket = 0;
            	int closebracket = 0;
            	openbracket = cmdstring.indexOf("{")+1;
            	//System.out.print("---" +cmdstring.indexOf("{")+"\n");
            	//System.out.print("["+cmdstring.substring(openbracket)+"] \n" );
            	cmdstring = cmdstring.substring(openbracket);
            	closebracket = cmdstring.indexOf("}");
            	cmdstring = cmdstring.substring(0,closebracket);
            	//System.out.print(cmdstring+"\n");
            	
            	cmdstr = cmdstring.split(":");
            	//System.out.print(cmdstr[0].toString()+"------------");
            	String cmdmove = cmdstr[0];
            	String cmdbool = cmdstr[1];
            	//System.out.print("[-"+cmdmove.length()+ "-]");
            	if (cmdmove.indexOf("forward") >= 0){
            		if (cmdbool.indexOf("true") >= 0 ){
            			forward = true;
            			y--;
            			//System.out.print("[-forward--TRUE-]" +"\n");
            		}else if (cmdbool.indexOf("false") >= 0 ){
            			//y++;
            			forward = false;
            			//System.out.print("[-forward--FALSE-]" +"\n");
            		}
            		//System.out.print("----forward---" +"\n");
            	}
            	if (cmdmove.indexOf("backward") >= 0){//||(cmdstr[1] == "true")){
            		if (cmdbool.indexOf("true") >= 0 ){
            			backward = true;
            			y++;
            			//System.out.print("[-forward--TRUE-]" +"\n");
            		}else if (cmdbool.indexOf("false") >= 0 ){
            			//y++;
            			backward = false;
            			//System.out.print("[-forward--FALSE-]" +"\n");
            		}
            		//System.out.print("----forward---" +"\n");
            	}
            	
            	//=================================================================================
            	if (cmdmove.indexOf("left") >= 0){
            		if (cmdbool.indexOf("true") >= 0 ){
            			left = true;
            			x--;
            			//System.out.print("[-forward--TRUE-]" +"\n");
            		}else if (cmdbool.indexOf("false") >= 0 ){
            			//y++;
            			left = false;
            			//System.out.print("[-forward--FALSE-]" +"\n");
            		}
            		//System.out.print("----forward---" +"\n");
            	}
            	if (cmdmove.indexOf("right") >= 0){//||(cmdstr[1] == "true")){
            		if (cmdbool.indexOf("true") >= 0 ){
            			right = true;
            			x++;
            			//System.out.print("[-forward--TRUE-]" +"\n");
            		}else if (cmdbool.indexOf("false") >= 0 ){
            			//y++;
            			right = false;
            			//System.out.print("[-forward--FALSE-]" +"\n");
            		}
            		//System.out.print("----forward---" +"\n");
            	}
            	//=================================================================================
            	
            	System.out.print(x + ":" + y +"\n");
            	out.println(objecttype + "{id:"+ m_clientID +",x:" + x + ",y:"+y+"}"+"\n");
                out.flush();
            }
		}
		
		public void run() {
			BufferedReader in = null; 
            PrintWriter out = null;
            
            try
            {
            	in = new BufferedReader(new InputStreamReader(m_clientSocket.getInputStream()));
                out = new PrintWriter(new OutputStreamWriter(m_clientSocket.getOutputStream()));
                
                BufferedInputStream is = new BufferedInputStream(m_clientSocket.getInputStream());
        		BufferedOutputStream os = new BufferedOutputStream(m_clientSocket.getOutputStream());
            	//out = new PrintWriter(m_clientSocket.getOutputStream(), true);
            	//in = new BufferedReader(new InputStreamReader(m_clientSocket.getInputStream()));
                //MMOJAServer.writers.add(out);
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
                        out.println(clientCommand);
                        out.flush();
                        //System.out.print(clientCommand.indexOf( "cmd" ) + ":");
                        //System.out.print(clientCommand.indexOf( "forward" ) + ":");
                        //System.out.print(clientCommand.indexOf( "true" ) + ":");
                        //System.out.print("\n");
                        //if cmd is found
                        cmd(clientCommand,out);
                        
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

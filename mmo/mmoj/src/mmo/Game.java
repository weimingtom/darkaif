package mmo;

//import MMOJAServer;

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

public class Game extends Thread{
	public boolean m_bRunThread = true;
	public static Player[] user= new Player[64];//list of user connect to the server
	static protected List<PrintWriter> writers = new ArrayList<PrintWriter>();
	public static List<Player> list = new ArrayList<Player>();
	 //ArrayList<?> al = new ArrayList();
	public double time = 0;
	public double maxtime = 1000000;
	//Player currentPlayer;
	public Game(){
		System.out.println("Game Class Running...");
		/*
		while(true){
			for (int iplayer=0; iplayer<list.size();iplayer++) {
				System.out.print("++++ id:>"+list.get(iplayer).m_clientID+"\n");
			}
		}
		*/
	}
	public void run() {
		while(m_bRunThread){
			time++;
			if (time > maxtime ){
				time = 0;
				for (int iplayer=0; iplayer<list.size();iplayer++) {
					System.out.print("++++ id:>"+list.get(iplayer).m_clientID+"x:"+list.get(iplayer).x+"y:"+list.get(iplayer).y +"\n");
					if (list.get(iplayer).forward == true){
					list.get(iplayer).y--;
					}
					if (list.get(iplayer).backward == true){
						list.get(iplayer).y++;
					}
					if (list.get(iplayer).right == true){
						list.get(iplayer).x++;
					}
					if (list.get(iplayer).left == true){
						list.get(iplayer).x--;
					}
					String senddata = list.get(iplayer).objecttype + "{id:"+ list.get(iplayer).m_clientID +",x:" + list.get(iplayer).x + ",y:"+list.get(iplayer).y+"}"+"\n";
					list.get(iplayer).sendallclient(senddata);
				}
			}
		}
	}

	public class Player extends Thread {
		public double x = 0;
		public double y = 0;
		public double z = 0;
		public String objecttype = "box";
		public boolean forward = false;
		public boolean backward = false;
		public boolean right = false;
		public boolean left = false;

		public Socket socket;
		public BufferedReader input;
		public PrintWriter output;
		public Socket m_clientSocket;  
		public int m_clientID = -1;
		public boolean m_bRunThread = true;
		public PrintWriter broad = null;
		
		public Player(Socket accept,int clientID) {
			m_clientSocket = accept;
			m_clientID = clientID;
		}

		public void cmd(String clientCommand,PrintWriter out){
			if (clientCommand.indexOf( "cmd" )>=0){
            	//System.out.print("CMD FOUND! \n");
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
            			//y--;
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
            			//y++;
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
            			//x--;
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
            			//x++;
            			//System.out.print("[-forward--TRUE-]" +"\n");
            		}else if (cmdbool.indexOf("false") >= 0 ){
            			//y++;
            			right = false;
            			//System.out.print("[-forward--FALSE-]" +"\n");
            		}
            		//System.out.print("----forward---" +"\n");
            	}
            	//=================================================================================
            	
            	//System.out.print(x + ":" + y +"\n");
            	out.println(objecttype + "{id:"+ m_clientID +",x:" + x + ",y:"+y+"}"+"\n");
                out.flush();
                String senddata = objecttype + "{id:"+ m_clientID +",x:" + x + ",y:"+y+"}"+"\n";
                sendallclient(senddata);
            }
		}
		
		public void sendallclient(String clientCommand){
			for (int i=0; i<Game.writers.size();i++) 
            {
               broad = Game.writers.get(i);
               broad.println(clientCommand);
               broad.flush();
            }
			
			//System.out.print("player numbers:"+list.toArray().length+"\n");
			for (int iplayer=0; iplayer<list.size();iplayer++) {
				System.out.print("array client id:>"+list.get(iplayer).m_clientID+"\n");
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
                Game.writers.add(out);
                // At this point, we can read for input and reply with appropriate output.
                
                // Run in a loop until m_bRunThread is set to false
                while(m_bRunThread)
                {   
                	/*
                	if (forward == true){
                		y--;
                	}
                	
                	if (backward == true){
                		y++;
                	}
                	
                	if (right == true){
                		x++;
                	}
                	
                	if (left == true){
                		x--;
                	}
                	*/
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
                    //clean out the socket just currently on the list player disconnect to the server
                    for (int iplayer=0; iplayer<list.size();iplayer++) {
        				System.out.print("array:>"+list.get(iplayer).m_clientID+"\n");
        				if (m_clientID == list.get(iplayer).m_clientID){
        					list.remove(iplayer);
        				}
        			}
                }
                catch(IOException ioe)
                {
                    ioe.printStackTrace();
                }
            }
		}
	}

}

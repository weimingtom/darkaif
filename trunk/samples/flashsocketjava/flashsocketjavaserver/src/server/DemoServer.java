package server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import java.net.ServerSocket;
import java.net.Socket;

public class DemoServer 
{
	private ServerSocket server;
	private Socket client;
	
	private BufferedReader in;
	private PrintWriter out;
	
	public void start()
	{
		create();
		run();
	}
	
	private void create()
	{
		try
		{
			server = new ServerSocket( 5555 );
		}
		catch ( Exception e )
		{
			e.printStackTrace();
			System.exit( -1 );
		}
	}
	
	// sets up a server socket at PORT and listens to it
	public void run()
	{
		try
		{
			client = server.accept();
			in = new BufferedReader( new InputStreamReader( client.getInputStream() ) );
			out = new PrintWriter( client.getOutputStream() );
		}
		catch ( Exception e )
		{
			e.printStackTrace();
			System.exit( 0 );
		}
		
		String line;
		while ( true )
		{
			try
			{
				line = in.readLine();
				
				if ( line != null )
				{
					System.out.println( "Line received: " + line );
				    out.write( "Line was received." );
				    out.flush();
				}
				
			}
			catch ( Exception e )
			{
				e.printStackTrace();
				System.exit( 0 );
			}
		}
	}
	
	protected void finalize()
	{	 
		try
		{
			in.close();
			server.close();    
		}
		catch (IOException e) 
		{
			e.printStackTrace();
			System.exit(-1);
		}
	}
	
	/**
	 * Entry-point.
	 */
	public static void main( String[] args )
	{
		try
		{
			DemoServer server = new DemoServer();
			server.start();
		}
		catch ( Exception e )
		{
			// if we fail, print wtf happened and exit
			e.printStackTrace();
			System.exit( 0 );
		}
	}
}

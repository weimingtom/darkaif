package 
{
	import flash.events.Event;
	import flash.net.Socket;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		private var host:String;
		private var port:int;
		
		private var socket:Socket;
		
		public function Main()
		{
			host = "127.0.0.1";
			port = 5555;
			
			connect();
		}
		
		private function sendMessage( message:String ):void
		{
			message = "message" + ";" + message + "\n";
			
			if ( socket && socket.connected )
				socket.writeUTFBytes( message );
		}
		
		private function receiveMessage( message:String ):void
		{
			trace( message );
		}
		
		private function connect():void
		{
			socket = new Socket();
	
			socket.addEventListener(Event.CONNECT, socketConnect);
			//socket.addEventListener(Event.CLOSE, socketClose);
			socket.addEventListener(IOErrorEvent.IO_ERROR, socketError );
				
			try 
			{
				socket.connect(host, port);
			}
			catch (e:Error) 
			{}
		}
		
		private function socketConnect( event:Event ):void
		{
			// handle connection connected
			socket.addEventListener( ProgressEvent.SOCKET_DATA, socketData );
			sendMessage( "Hello Server from cleint" );
		}

		private function socketData( event:ProgressEvent ):void
		{
			receiveMessage( socket.readUTFBytes( socket.bytesAvailable ) );
		}
		
		private function socketClose( event:Event ):void
		{
			// handle connection closed
			trace( "Socket Closed" );
		}
		
		private function socketError( event:IOErrorEvent ):void
		{
			// handle connection error
			trace( "Socket has run into an Error" );
		}
	}
}

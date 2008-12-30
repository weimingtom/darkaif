package 
{
	import flash.events.Event;
	import flash.net.Socket;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	
	public class Main extends Sprite
	{
		private var host:String;
		private var port:int;
		public var socket:Socket;
		
		public var text_log:TextField = new TextField();
		public var text_submit:TextField = new TextField();
		//public var 
		public var chatPort:int = 5555;
		public var policyPort:int = chatPort + 1;
		
		public function Main()
		{
			host = "127.0.0.1";
			port = 5555;
			flash.system.Security.loadPolicyFile("xmlsocket://" + host + ":" + policyPort)
			
			connect();
			text_log.text = "";
			text_log.border = true;
			text_log.height = 256;
			text_log.width = 256;
			
			text_submit.height = 24;
			text_submit.border = true;
			text_submit.y = 256;
			text_submit.width = 256;
			text_submit.type = TextFieldType.INPUT;
			
			addChild(text_log);
			addChild(text_submit);
			
			text_submit.addEventListener(KeyboardEvent.KEY_UP, onInputLineKey);
			
			function onInputLineKey(e:KeyboardEvent):void {
				if (e.keyCode == 13) { // ENTER was pressed
					socket.writeUTFBytes(text_submit.text);
					socket.flush();
					trace("send..");
				}
			}
		}
		
		private function receiveMessage( message:String ):void
		{
			text_log.appendText("\n"+message );
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
			{
				trace("Error");
			}
		}
		
		private function socketConnect( event:Event ):void
		{
			// handle connection connected
			socket.addEventListener( ProgressEvent.SOCKET_DATA, socketData );
			//sendMessage( "Hello Server from cleint" );
		}

		private function socketData( event:ProgressEvent ):void
		{
			receiveMessage( socket.readUTFBytes( socket.bytesAvailable ) );
			trace("incoming data...");
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
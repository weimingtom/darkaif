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
	import flash.events.Event;
	import flash.net.XMLSocket;
	import flash.events.DataEvent;
	
	public class Main extends Sprite
	{
		private var host:String;
		private var port:int;
		public var xmlsocket:XMLSocket;
		
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
					xmlsocket.send(text_submit.text + '\n');
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
			xmlsocket = new XMLSocket();
			
			xmlsocket.addEventListener(DataEvent.DATA, onData); 
			xmlsocket.addEventListener(Event.CLOSE, socketClose);
			xmlsocket.addEventListener(IOErrorEvent.IO_ERROR, socketError );
			
			try 
			{
				xmlsocket.connect("127.0.0.1", 5555);
			}
			catch (e:Error) 
			{
				trace("Error");
			}
		}
		
		private function onData(event:DataEvent):void 
		{
			trace("[" + event.type + "] " + event.data); 
			text_log.appendText("\n"+event.data );
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
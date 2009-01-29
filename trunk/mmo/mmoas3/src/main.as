package 
{
	//{ packages
	import as3gui.Button;
	import flash.events.Event;
	import flash.net.Socket;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	//}
	
	public class Main extends Sprite {
		//{ variables
		private var host:String;
		private var port:int;
		public var socket:Socket;
		
		public var text_log:TextField = new TextField();
		public var text_submit:TextField = new TextField();
		//public var 
		public var chatPort:int = 5555;
		public var policyPort:int = chatPort + 1;
		public var buttonconnect:Button = new Button("Connect");
		public var buttondisconnect:Button = new Button("Disconnect");
		public var buttonsendtext:Button = new Button("send");
		public var buttonclearlog:Button = new Button("Clear Log");
		//}
		
		public function Main(){
			host = "127.0.0.1";
			port = 5555;
			//flash.system.Security.loadPolicyFile("xmlsocket://" + host + ":" + policyPort)
			flash.system.Security.allowDomain(host);
			//flash.system.Security.loadPolicyFile("*");
			//flash.system.Security.loadPolicyFile('flashpolicy.xml')
			
			connect();
			
			//{text_log
			text_log.text = "";
			text_log.y = 302;
			text_log.border = true;
			text_log.height = 150;
			text_log.width = 256;
			//}
			
			//{text_submit
			text_submit.height = 24;
			text_submit.border = true;
			text_submit.y = 456;
			text_submit.width = 256;
			text_submit.type = TextFieldType.INPUT;
			//}
			
			addChild(text_log);
			addChild(text_submit);
			
			//{buttonconnect
			buttonconnect.x = 0;
			buttonconnect.addEventListener(MouseEvent.CLICK,clickconnect);
			addChild(buttonconnect);
			//}
			
			//{buttondisconnect
			buttondisconnect.x = 60;
			//buttondisconnect.y = 20;
			buttondisconnect.addEventListener(MouseEvent.CLICK,clickdisconnect);
			addChild(buttondisconnect);
			//}
			
			//{buttonsendtext
			buttonsendtext.x = 256;
			buttonsendtext.y = 456;
			addChild(buttonsendtext);
			//}
			
			//{buttonclearlog
			buttonclearlog.x = 256+40;
			buttonclearlog.y = 456;
			buttonclearlog.addEventListener(MouseEvent.CLICK,clickclearlog);
			addChild(buttonclearlog);
			//}
			
			text_submit.addEventListener(KeyboardEvent.KEY_UP, onInputLineKey);
			
			function onInputLineKey(e:KeyboardEvent):void {
				if (e.keyCode == 13) { // ENTER was pressed
					//text_submit.text 
					socket.writeUTFBytes("\n" + text_submit.text); //
					//socket.writeUTF("\n"+text_submit.text);
					socket.flush();
					text_submit.text = '';
					trace("send..");
				}
			}
		}
		
		public function clickclearlog(event:MouseEvent):void {
			text_log.text = '';
		}
		
		public function clickconnect(event:MouseEvent):void {
			connect();
		}
		
		public function clickdisconnect(event:MouseEvent):void {
			try 
			{
			socket.close();
			}
			catch (e:Error) 
			{
				trace("Error! d/c");
			}
		}
		
		private function receiveMessage( message:String ):void{
			//text_log.appendText("\n" + message );
			text_log.appendText(message );
			
			trace( message );
		}
		
		private function connect():void{
			socket = new Socket();
			
			socket.addEventListener(Event.CONNECT, socketConnect);
			socket.addEventListener(Event.CLOSE, socketClose);
			socket.addEventListener(IOErrorEvent.IO_ERROR, socketError );
			
			try 
			{
				socket.connect(host, port);
				socket.writeUTFBytes("Hello Server");
				socket.flush();
			}
			catch (e:Error) 
			{
				trace("Error! can't connect...");
			}
		}
		
		private function socketConnect( event:Event ):void{
			// handle connection connected
			socket.addEventListener( ProgressEvent.SOCKET_DATA, socketData );
			//sendMessage( "Hello Server from cleint" );
		}

		private function socketData( event:ProgressEvent ):void{
			receiveMessage( socket.readUTFBytes( socket.bytesAvailable ) );
			trace("incoming data...");
		}
		
		private function socketClose( event:Event ):void{
			// handle connection closed
			trace( "Socket Closed" );
			text_log.appendText("\n"+"server disconnected..." );
		}
		
		private function socketError( event:IOErrorEvent ):void{
			// handle connection error
			trace( "Socket has run into an Error" );
			text_log.appendText("\n"+"Error! can't connect...");
		}
	}
}
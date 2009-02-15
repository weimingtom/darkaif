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
		
		public var button_forward:Button = new Button("Forward");
		public var button_backward:Button = new Button("Backward");
		public var button_right:Button = new Button("Right");
		public var button_left:Button = new Button("Left");
		public var objectmesh:Array = new Array();
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
			
			//{CMD 
			button_forward.x = 20;
			button_forward.y = 20;
			button_forward.addEventListener(MouseEvent.MOUSE_UP, cmd_obj_forwardf);
			button_forward.addEventListener(MouseEvent.MOUSE_DOWN, cmd_obj_forwardt);
			addChild(button_forward);
			
			button_backward.x = 20;
			button_backward.y = 50;
			button_backward.addEventListener(MouseEvent.MOUSE_UP, cmd_obj_backwardf);
			button_backward.addEventListener(MouseEvent.MOUSE_DOWN, cmd_obj_backwardt);
			addChild(button_backward);
			
			button_left.x = 0;
			button_left.y = 35;
			button_left.addEventListener(MouseEvent.MOUSE_UP, cmd_obj_leftf);
			button_left.addEventListener(MouseEvent.MOUSE_DOWN, cmd_obj_leftt);
			addChild(button_left)
			
			button_right.x = 50;
			button_right.y = 35;
			button_right.addEventListener(MouseEvent.MOUSE_UP, cmd_obj_rightf);
			button_right.addEventListener(MouseEvent.MOUSE_DOWN, cmd_obj_rightt);
			addChild(button_right);
			//}
			
			text_submit.addEventListener(KeyboardEvent.KEY_UP, onInputLineKey);
			
			function onInputLineKey(e:KeyboardEvent):void {
				if (e.keyCode == 13) { // ENTER was pressed
					//text_submit.text 
					socket.writeUTFBytes(text_submit.text+"\n"); //
					//socket.writeUTF("\n"+text_submit.text);
					socket.flush();
					text_submit.text = '';
					//trace("send..");
				}
			}
		}
		
		//{cmd test
		public function cmd_obj_rightt(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{right:true}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		public function cmd_obj_rightf(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{right:false}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		public function cmd_obj_leftt(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{left:true}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		public function cmd_obj_leftf(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{left:false}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		public function cmd_obj_forwardt(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{forward:true}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		public function cmd_obj_forwardf(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{forward:false}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		
		public function cmd_obj_backwardt(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{backward:true}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		public function cmd_obj_backwardf(event:MouseEvent):void {
			socket.writeUTFBytes('cmd{backward:false}'+ "\n"); //
			socket.flush();
			trace('send cmd...');
		}
		//}
		
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
			filterdata(message);
			//trace("[-"+ message +"-]");
		}
		
		public function filterdata(str:String):void {
			var strarray:Array = new Array();
			//trace("=========");
			//trace("[" + str + "]");
			var cmdstring:String = new String();
			cmdstring = str;
			strarray = cmdstring.split("\n");
			for (var arrayno:int = 0; arrayno < strarray.length ; arrayno++) {
				//trace("[+]" + strarray[arrayno])
				var str:String = new String(strarray[arrayno]);
				//trace("[+-]" + str.indexOf('cmd'));
				if (str.indexOf('cmd') >= 0) {
					cmd(str);
				}
				if (str.indexOf('box') >= 0) {
					objbox(str);
				}
			}
			//cmdstring.
		}
		
		public function cmd(str:String):void {
			//trace("[cmd+>]"+str)
		}
		
		public function objbox(str:String):void {
			var data:Array = new Array();
			var datavar:Array = new Array();
			//var strdata:String = new String();
			var openbracket:int = 0
			var closebracket:int = 0;
			var objbox:boxsprite = new boxsprite();
			//trace(str.indexOf("{")+"-:-"+str.indexOf("}"))
			//trace("-:-" + str.substr(str.indexOf("{") + 1, str.indexOf("}")));
			
			//looks for open/close bracket and remove part of where it hold data
			openbracket = str.indexOf("{")+1;
			str = str.substr(openbracket);
			closebracket = str.indexOf("}");
			str = str.substr(0, closebracket);
			
			//data.push(str);
			//trace("ID:" + data);
			
			data = str.split(",");
			for (var datano:int = 0; datano < data.length; datano++ ) {
				var tmpvar:Array = new Array();
				//trace("raw data:" + data[datano]);
				tmpvar = data[datano].split(":");
				//trace(tmpvar[0] + "[:]" + tmpvar[1]);
				if (tmpvar[0] == 'id') {
					//trace("MATCHES! id");
					objbox.id = tmpvar[1];
				}
				if (tmpvar[0] == 'x') {
					//trace("MATCHES! x");
					objbox.x = tmpvar[1];
				}
				if (tmpvar[0] == 'y') {
					//trace("MATCHES! y");
					objbox.y = tmpvar[1];
				}
			}
			//trace("obj:" + objbox.id);
			trace("NUMBER OF OBJECTS:"+objectmesh.length)
			
			var bobjfound:Boolean = false;
			for (var meshno:int = 0; meshno < objectmesh.length; meshno++) {
				if (objbox.id == objectmesh[meshno].id) {
					objectmesh[meshno].x = objbox.x;
					objectmesh[meshno].y = objbox.y;
					trace("update object");
					
					//trace("ID:"+objbox.id +"|"+objbox.x+ ":" +objbox.y);
					bobjfound = true;
					//trace("list no:"+objectmesh.length)
				}
			}
			
			if (bobjfound == false) {
				trace("push object-----");
				objectmesh.push(objbox);
				addChild(objbox.baseshape);
			}
			
			//trace("[obj+>] "+str)
			//trace("cut|"+str);
		}
		
		private function connect():void{
			socket = new Socket();
			
			socket.addEventListener(Event.CONNECT, socketConnect);
			socket.addEventListener(Event.CLOSE, socketClose);
			socket.addEventListener(IOErrorEvent.IO_ERROR, socketError );
			
			try 
			{
				socket.connect(host, port);
				socket.writeUTFBytes("Hello Server"+'\n');
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
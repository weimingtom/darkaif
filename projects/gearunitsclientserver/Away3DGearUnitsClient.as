package
{
	//{
	import away3d.containers.View3D;
	import away3d.core.math.Number3D;
	import away3d.primitives.Cube;
	import darkaif.core.display.Button;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.Socket;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	import gearunits.away3d.entity.AStructureUnit;
	import gearunits.away3d.entity.infantry.AUnitBlock;
	//}
	
	/**
	 * @author Darknet
	 * 
	 * Information:
	 * 
	 * Away3D Engine
	 * 
	 */
	
	public class Away3DGearUnitsClient extends Sprite
	{
		//{
		private var host:String;
		private var port:int;
		//public var socket:Socket;
		public var socket:Socket = new Socket();
		
		public var text_log:TextField = new TextField();
		public var text_submit:TextField = new TextField();
		//public var 
		public var chatPort:int = 5555;
		public var policyPort:int = chatPort + 1;
		
		public var button_connect:Button = new Button("Con.");
		public var button_disconnect:Button = new Button("Discon.");
		
		public var view:View3D = new View3D( { x:320, y:240 } );
		
		public var unit:Vector.<AStructureUnit> = new Vector.<AStructureUnit>();
		
		//}
		
		public function Away3DGearUnitsClient()
		{
			host = "127.0.0.1";
			port = 5555;
			//flash.system.Security.loadPolicyFile("xmlsocket://" + host + ":" + policyPort)
			flash.system.Security.allowDomain(host);
			//flash.system.Security.loadPolicyFile("*");
			//flash.system.Security.loadPolicyFile('flashpolicy.xml')
			
			connect();
			init_textbox();
			addChild(view);
			view.camera.y = 64;
			view.camera.z = -64;
			view.camera.lookAt(new Number3D(0, 0, 0));
			
			var cube:Cube = new Cube( { height:8, width:8, depth:8 } );
			view.scene.addChild(cube);
			var cube1:Cube = new Cube( { height:8, width:8, depth:8 } );
			cube1.x = 16;
			cube1.z = 16;
			view.scene.addChild(cube1);
			var cube2:Cube = new Cube( { height:8, width:8, depth:8 } );
			cube2.x = 16;
			cube2.z = -16;
			view.scene.addChild(cube2);
			init_buttons();
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypressdown );
			stage.addEventListener(KeyboardEvent.KEY_UP, keypressup );
		}
		
		public function init_buttons():void {
			button_connect.addEventListener(MouseEvent.MOUSE_DOWN, connect);
			addChild(button_connect);
			button_disconnect.addEventListener(MouseEvent.MOUSE_DOWN, socketclose);
			button_disconnect.y = 14;
			addChild(button_disconnect);
		}
		
		public function keypressdown(event:KeyboardEvent):void {
			if (event.keyCode == 38) {//up
				socket.writeUTFBytes('cmd:up=True' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 40) {//down
				socket.writeUTFBytes('cmd:down=True' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 37) {//left
				socket.writeUTFBytes('cmd:left=True' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 39) {//right
				socket.writeUTFBytes('cmd:right=True' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 32) {//spacebar
				socket.writeUTFBytes('cmd:spacebar=True' + "\n");
				socket.flush();
				//trace("send..");
			}
		}
		
		public function keypressup(event:KeyboardEvent):void {
			if (event.keyCode == 38) {//up
				socket.writeUTFBytes('cmd:up=False' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 40) {//down
				socket.writeUTFBytes('cmd:down=False' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 37) {//left
				socket.writeUTFBytes('cmd:left=False' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 39) {//right
				socket.writeUTFBytes('cmd:right=False' + "\n");
				socket.flush();
				//trace("send..");
			}
			
			if (event.keyCode == 32) {//spacebar
				socket.writeUTFBytes('cmd:spacebar=False' + "\n");
				socket.flush();
				//trace("send..");
			}
		}
		
		public function enterFrameHandler(event:Event):void {
			
			for (var i:int = 0; i < unit.length;i++ ) {
				unit[i].update();
			}
			
			view.render();
			
		}
		
		public function init_textbox():void {
			
			text_log.text = "";
			text_log.border = true;
			text_log.height = 128;
			text_log.width = 256;
			text_log.y = 128+192;
			
			text_submit.height = 24;
			text_submit.border = true;
			text_submit.y = 256+192;
			text_submit.width = 256;
			text_submit.type = TextFieldType.INPUT;
			
			addChild(text_log);
			addChild(text_submit);
			
			text_submit.addEventListener(KeyboardEvent.KEY_UP, onInputLineKey);
			
			function onInputLineKey(e:KeyboardEvent):void {
				if (e.keyCode == 13) { // ENTER was pressed
					socket.writeUTFBytes('chat:'+text_submit.text+"\n"); //
					//socket.writeUTF("\n"+text_submit.text);
					socket.flush();
					//trace("send..");
				}
			}
		}
		
		private function receiveMessage( message:String ):void {
			var rawdata:String = message;
			//trace(rawdata.match('id')+'-----')
			var idtag:Array = rawdata.match('object');
			if (idtag != null) {
				//text_log.appendText(String(message));
				//text_log.scrollV = text_log.numLines;
				
				var data:Array = rawdata.split(",");
				var objectalive:Boolean = true;
				var objectid:String;
				var objectposition:Number3D = new Number3D();
				
				for (var datano:int = 0; datano < data.length; datano++ ) {
					//trace('>>>' + data[0])
					var tmpvar:Array = new Array();
					tmpvar = data[datano].split("=");
					//trace(tmpvar[0])
					if (tmpvar[0] == 'id') {
						objectid = tmpvar[1];
						trace('ID OBJECT:>'+tmpvar[1])
					}
					//trace(tmpvar[0] + '-------------')
					if (tmpvar[0] == 'balive') {
						//trace(">>>" + tmpvar[1] +'<<<<<< set balive');
						var strbool:String = tmpvar[1];
						strbool = strbool.replace('\n', '');
						//trace('>>>' + strbool + '<<<---');
						if (strbool == 'false') {
							objectalive = false;
							trace('set false');
						}
						if (strbool == 'true') {
							objectalive = true;
							trace('set true');
						}
					}
					
					if (tmpvar[0] == 'x') {
						objectposition.x = tmpvar[1];
					}
					
					if (tmpvar[0] == 'y') {
						objectposition.y = tmpvar[1];
					}
					
					if (tmpvar[0] == 'z') {
						objectposition.z = tmpvar[1];
					}
				}
				
				//trace('id object:'+objectid)
				
				var objectfound:Boolean = false;
				
				for (var i:int = 0; i < unit.length; i++ ) {
					//trace(unit.length+'lllllllllllllll')
					if (unit[i].onlineid == String(objectid)) {
						//trace('object fount.....');
						unit[i].x = objectposition.x;
						unit[i].y = objectposition.y;
						unit[i].z = objectposition.z;
						//trace(objectalive+'<<<< remiove?')
						if (objectalive == false) {
							trace('remove............');
							view.scene.removeChild(unit[i].mesh);
						}
						if (objectalive == true) {
							trace('remove............');
							view.scene.addChild(unit[i].mesh);
						}
						
						objectfound = true;
						break;
					}
				}
				
				if (objectfound == false) {
					var buildunit:AUnitBlock = new AUnitBlock();
					buildunit.onlineid = objectid;
					buildunit.x = objectposition.x;
					buildunit.y = objectposition.y;
					buildunit.z = objectposition.z;
					if (objectalive == true) {
						view.scene.addChild(buildunit.mesh);
					}
					unit.push(buildunit);
				}
				
			}else {
				text_log.appendText(String(message));
				text_log.scrollV = text_log.numLines;
				//trace( message +'>');
			}
			//trace( message +'>')
		}
		
		private function connect(event:Event = null):void{
			//socket = new Socket();
			
			socket.addEventListener(Event.CONNECT, socketConnect);
			socket.addEventListener(Event.CLOSE, socketClose);
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
		
		private function socketConnect( event:Event ):void{
			// handle connection connected
			socket.addEventListener( ProgressEvent.SOCKET_DATA, socketData );
			//sendMessage( "Hello Server from cleint" );
		}

		private function socketData( event:ProgressEvent ):void{
			receiveMessage( socket.readUTFBytes( socket.bytesAvailable ) );
			//trace("incoming data...");
		}
		
		private function socketClose( event:Event ):void{
			// handle connection closed
			trace( "Socket Closed" );
			text_log.appendText("server disconnected..." +"\n");
		}
		
		private function socketError( event:IOErrorEvent ):void{
			// handle connection error
			trace( "Socket has run into an Error" );
		}
		
		private function socketclose( event:Event = null):void{
			// handle connection error
			socket.close();
			trace( "close network..." );
			removeunits();
		}
		
		public function removeunits():void {
			for (var i:int = 0; i < unit.length;i++ ) {
				view.scene.removeChild(unit[i].mesh);
			}
		}
		
	}
}
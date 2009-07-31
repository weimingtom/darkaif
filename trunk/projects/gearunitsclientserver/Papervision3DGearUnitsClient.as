package
{
	//{
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
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.view.BasicView;
	//}
	
	/**
	 * @author Darknet
	 * 
	 * Information:
	 * 
	 * Papervision3d Engine Version: 2.0
	 * 
	 * Note: Error in loop add objects that all ready there. It will slow down.
	 * 
	 */
	
	public class Papervision3DGearUnitsClient extends BasicView
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
		
		public var unit:Vector.<PUnitBlock> = new Vector.<PUnitBlock>();
		
		//}
		
		public function Papervision3DGearUnitsClient()
		{
			host = "127.0.0.1";
			port = 5555;
			//flash.system.Security.loadPolicyFile("xmlsocket://" + host + ":" + policyPort)
			flash.system.Security.allowDomain(host);
			//flash.system.Security.loadPolicyFile("*");
			//flash.system.Security.loadPolicyFile('flashpolicy.xml')
			
			connect();
			init_textbox();
			
			camera.y = 64;
			camera.z = -64;
			camera.lookAt(new DisplayObject3D());
			
			var matcolor:ColorMaterial =  new ColorMaterial(0x00CC00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			
			var materiallist:MaterialsList = new MaterialsList({all:compMat});
			
			var cube:Cube = new Cube(materiallist,16,16,16);
			scene.addChild(cube);
			var cube1:Cube = new Cube(materiallist,16,16,16);
			cube1.x = 16;
			cube1.z = 16;
			scene.addChild(cube1);
			var cube2:Cube = new Cube(materiallist,16,16,16);
			cube2.x = 16;
			cube2.z = -16;
			scene.addChild(cube2);
			init_buttons();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypressdown );
			stage.addEventListener(KeyboardEvent.KEY_UP, keypressup );
			startRendering();
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
		
		override protected function onRenderTick(event:Event=null):void
		{
			for (var i:int = 0; i < unit.length;i++ ) {
				unit[i].update();
			}
			super.onRenderTick(event);
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
							scene.removeChild(unit[i].mesh);
						}
						if (objectalive == true) {
							
							var bobjectfound:Boolean = false;
							var meshes:Array = scene.objects;
							for (var o:int = 0; o < meshes.length; o++ ) {
								if (meshes[o].name == unit[i].mesh.name) {
									bobjectfound = true;
								}
							}
							
							if(!bobjectfound){
								//trace('remove............');
								scene.addChild(unit[i].mesh);
								//trace('name:' + unit[i].mesh.name);
							}
						}
						
						objectfound = true;
						break;
					}
				}
				
				if (objectfound == false) {
					var buildunit:PUnitBlock = new PUnitBlock();
					buildunit.onlineid = objectid;
					buildunit.x = objectposition.x;
					buildunit.y = objectposition.y;
					buildunit.z = objectposition.z;
					if (objectalive == true) {
						scene.addChild(buildunit.mesh);
					}
					unit.push(buildunit);
				}
				trace('Unit'+unit.length+ ' Objects:'+scene.numChildren);
				
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
				scene.removeChild(unit[i].mesh);
			}
		}
		
	}
}
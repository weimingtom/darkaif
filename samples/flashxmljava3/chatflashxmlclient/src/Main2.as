package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.XMLSocket;
	import flash.events.DataEvent;
	
	import flash.events.Event;
	import flash.net.Socket;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.events.KeyboardEvent;
	import flash.system.System;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Main2 extends Sprite 
	{
		public var text_log:TextField = new TextField();
		public var text_submit:TextField = new TextField();
		public var xmlsocket:XMLSocket = new XMLSocket('127.0.0.1', 5555);
		public function Main2():void 
		{
			flash.system.Security.loadPolicyFile("xmlsocket://" + '127.0.0.1' + ":" + 5555)
			xmlsocket.connect("127.0.0.1", 5555);
			xmlsocket.addEventListener(DataEvent.DATA, onData); 
			
			
			text_log.text = "";
			text_log.border = true;
			text_log.height = 256;
			text_log.width = 256;
			
			text_submit.height = 24;
			text_submit.border = true;
			text_submit.y = 256;
			text_submit.width = 256;
			text_submit.type = TextFieldType.INPUT;
			
			text_submit.addEventListener(KeyboardEvent.KEY_UP, onInputLineKey);
			function onInputLineKey(e:KeyboardEvent):void {
				if (e.keyCode == 13) { // ENTER was pressed
					//xmlsocket.connect("127.0.0.1", 5555);
					//xmlsocket.addEventListener(DataEvent.DATA, onData); 
					trace(text_submit.text);
					xmlsocket.send(text_submit.text + '\n');
				}
			}
			
			addChild(text_log);
			addChild(text_submit);
			
			function onData(event:DataEvent):void 
			{ 
				trace("[" + event.type + "] " + event.data); 
			}
			//xmlsocket.send("<x>Data</x>");
			
		}
		
	}
	
}
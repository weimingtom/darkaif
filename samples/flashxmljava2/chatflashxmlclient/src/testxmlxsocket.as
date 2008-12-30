package  
{
	import flash.display.Sprite;
	import flash.net.XMLSocket;
	import flash.events.DataEvent;
	import flash.system.System;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class testxmlxsocket extends Sprite
	{
		flash.system.Security.loadPolicyFile("xmlsocket://" + '127.0.0.1' + ":" + 5555)
		public function testxmlxsocket() 
		{
			var xmlsocket:XMLSocket =  new XMLSocket();
			xmlsocket.connect("127.0.0.1", 5555);
			xmlsocket.addEventListener(DataEvent.DATA, onData);
			xmlsocket.send('<data><ship>name</ship></data>' + '\n');
		}
		private function onData(event:DataEvent):void 
		{ 
			trace("[" + event.type + "] " + event.data); 
		}
	}
	
}
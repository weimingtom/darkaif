package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.XMLSocket;
	import flash.events.DataEvent;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var xmlsocket:XMLSocket = new XMLSocket();
			xmlsocket.connect("127.0.0.1", 8080);
			xmlsocket.addEventListener(DataEvent.DATA, onData); 
			
			function onData(event:DataEvent):void 
			{ 
				trace("[" + event.type + "] " + event.data); 
			}
			xmlsocket.send("<x>Data</x>");
			
		}
		
	}
	
}
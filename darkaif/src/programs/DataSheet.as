/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  programs
{
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	import flash.xml.XMLNodeType;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	public class DataSheet extends Sprite
	{
		
		public function DataSheet() 
		{
			FlashConnect.trace("hello");
			var xmlstring:URLRequest = new URLRequest("data/database/animals.xml");
			var xmlloader:URLLoader = new URLLoader(xmlstring);
			xmlloader.addEventListener("complete",init);
			
			function init(event:Event):void {
				
				FlashConnect.trace(event.target.data);
				var animalsXML:XML = XML(event.target.data);
				//FlashConnect.trace(animalsXML.children[0].type);
				FlashConnect.trace("type:"+animalsXML.children[0]);
				//FlashConnect.trace(animalsXML);
			}
		}
	}
	
}
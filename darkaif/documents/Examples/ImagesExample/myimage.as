/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	import flash.display.Sprite;	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.display.LoaderInfo;
	import flash.net.URLRequest;
	import org.flashdevelop.utils.FlashConnect;

	public class myimage extends Sprite{
		//public var mypic:
		
		public function myimage() {
			FlashConnect.trace('RUNNING');
			ExampleImage01();
			
		}
		
		public function ExampleImage01():void{
			loadImage("data/images/imagejpg.jpg");
		}
		
		public function loadImage(u:String):void{
			var _loader:Loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			var request:URLRequest = new URLRequest(u);
			_loader.load(request);
			addChild(_loader);
		}
		private function onComplete(ev:Event):void{
			var loader:LoaderInfo = LoaderInfo(ev.target);
		}
	}
}

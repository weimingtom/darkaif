/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.core.display{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* Not Finish code.
	*/
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	import org.flashdevelop.utils.FlashConnect;

	public class GraphicButton extends Sprite {
		public var upimage:String = 'data/images/imagejpg.jpg';
		public var overimage:String = 'data/images/imagegif.gif';
		public var downimage:String = 'data/images/imagepng.png';
		
		public var upimageloader:Loader = new Loader();
		public var overimageloader:Loader = new Loader();
		public var downimageloader:Loader = new Loader();
		
		public function GraphicButton() {
			upimageloader = loadImage(upimage);
			addChild(upimageloader);
			
		}
		
		public function loadImage(u:String):void{
			var _loader:Loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			var request:URLRequest = new URLRequest(u);
			_loader.load(request);
			//addChild(_loader);
			return _loader;
		}
		private function onComplete(ev:Event):void{
			var loader:LoaderInfo = LoaderInfo(ev.target);
		}
		
	}
	
}

package gearunits.sandy3d.shop 
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class STexture 
	{
		public static var stage:Stage;
		public var name:String = "";
		public var matid:int = 0;
		public var id:String = "";
		public var location:String = "";
		public var texture:Bitmap;
		public var bloaded:Boolean = false;
		public var loader:Loader = new Loader();
		
		public function STexture() 
		{
			
		}
		
		public function load(fileurl:String):void {
			location = fileurl;
			//trace("url:" + fileurl);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest(fileurl));
		}
		
		public function onComplete(e:Event):void {
			trace('file image loaded');
			texture = new Bitmap(e.target.loader.contentLoaderInfo.content.bitmapData.clone());
			bloaded = true;
			//stage.addChild(texture)
		}
		
	}
	
}
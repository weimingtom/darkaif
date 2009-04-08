/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package programs {
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* php script required for host to able download or full address site
	* 
	*/
	
	//{ package
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import org.flashdevelop.utils.FlashConnect;
	//}

	public class captchaimage extends Sprite {
		
		public var loader:Loader = new Loader();
		
		public function captchaimage() {
			
			var request:URLRequest = new URLRequest();
			var siteurl:String = 'http://localhost/darkaif/';
			//var siteurl:String = '';
			var pageurl:String = 'scripts/captcha.php';
			//var pageurl:String = "data/images/imagejpg.jpg";
			request.url = siteurl+ pageurl;
			loader.load(request);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			
			function onLoadComplete(event:Event):void {
				FlashConnect.trace('LOAD IMAGE FINISH');
				addChild(loader);
			}
		}
	}
}

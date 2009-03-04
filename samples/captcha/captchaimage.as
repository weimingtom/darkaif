/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* php script requred for host to enable iamge to be download or be execute
	* 
	*/
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import org.flashdevelop.utils.FlashConnect;

	public class captchaimage extends Sprite{
		
		public function captchaimage() {
			var _loader:Loader = new Loader();
			var request:URLRequest = new URLRequest();
			var pageurl:String = 'captcha.php';
			//var pageurl:String = "data/images/imagejpg.jpg";
			request.url = pageurl;
			_loader.load(request);
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, doneLoading);
			function doneLoading(event:Event):void {
				//insert code here
				FlashConnect.trace('LOAD IMAGE');
				addChild(_loader);
			}
		}
	}
}

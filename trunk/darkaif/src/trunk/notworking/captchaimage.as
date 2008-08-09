/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* Not Work Yet!
	* does not work
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
			var pageurl:String = 'scripts/captchahrash.php';
			//var pageurl:String = "data/images/color16x16.jpg";
			request.url = pageurl;
			_loader.load(request);
			loader.addEventListener(Event.COMPLETE, doneLoading);
			
			function doneLoading(event:Event):void {
			//insert code here
			FlashConnect.trace('LOAD IMAGE');
			addChild(event.target.data);
			}
		}
	}
}

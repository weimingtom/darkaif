/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* NEEDED!
	*/
	
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;

	public class testregister extends Sprite{
		
		public function testregister() {
			var variables:URLVariables = new URLVariables();
			variables.username = "Admin"
			variables.password = "admin"
			
			var request:URLRequest = new URLRequest();
			//File here
			request.url = "http://localhost/darkaif/scripts/php/register_account.php";
			//////////////////////////////////////////
			//File here
			
			request.data = variables;
			var loader:URLLoader = new URLLoader();
			loader.load(request); //sends the request
			
			//when the request is done loading, it goes to the doneLoading function
			loader.addEventListener(Event.COMPLETE, doneLoading);
			function doneLoading(event:Event):void {
			//insert code here
			FlashConnect.trace('Register Account Done!');
			} 			
			
		}
		
	}
	
}

/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* This file works!
	* #required scripts/database/checkid.php
	*/
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.events.KeyboardEvent;
	import org.flashdevelop.utils.FlashConnect;

	public class CheckID extends Sprite {
		public var pagename:String = 'scripts/database/checkid.php';
		public var variables:URLVariables =  new URLVariables();
		public var _loader:URLLoader = new URLLoader();
		public var request:URLRequest = new URLRequest();
		
		public function CheckID() {
			var label_namemember:TextField = new TextField();
			label_namemember.text = 'Check Member:';
			addChild(label_namemember);
			
			var input_namemember:TextField = new TextField();
			input_namemember.background = true;
			input_namemember.x = 80;
			//input_namemember.autoSize = TextFieldAutoSize.CENTER;
			input_namemember.height = 20;
			input_namemember.border = true;
			input_namemember.type = TextFieldType.INPUT; 
			input_namemember.text = 'CheckName';
			addChild(input_namemember);	
			
			var label_output:TextField = new TextField();
			label_output.y = 20;
			label_output.autoSize = TextFieldAutoSize.CENTER;
			label_output.text = '[Checking...]';
			addChild(label_output);
			
			input_namemember.addEventListener(KeyboardEvent.KEY_DOWN, CheckIDHandler);
			function CheckIDHandler(e:KeyboardEvent):void {
				FlashConnect.trace('KEY NO:' + e.charCode);
				if (e.charCode == 13) {
					request.url = pagename;
					variables.checkid = input_namemember.text;
					request.data = variables;	
					_loader.load(request);
					_loader.addEventListener(Event.COMPLETE,checkingidhandler);
				}
			}
			
			
			function checkingidhandler(e:Event):void {
				FlashConnect.trace('DATA:' + e.target.data);
				label_output.text = e.target.data;				
			}
		}
		
		
		
	}
	
}

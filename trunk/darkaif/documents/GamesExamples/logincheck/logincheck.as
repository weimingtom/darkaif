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
	import flash.display.Shape;
	import flash.display.Loader;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.text.TextFieldAutoSize;
	
	import darkaif.interact.RectButton;
	
	import org.flashdevelop.utils.FlashConnect;

	public class logincheck extends Sprite{
		public var variables:URLVariables = new URLVariables();
		public var request:URLRequest = new URLRequest();
		public var loader:URLLoader = new URLLoader();
		public var xml_member:XML;
		public var member_php:String = 'scripts/player/logincheck.php';
		//{VARIABLE
		private var overColor_fill:uint = 0xEFEFEF;
		private var overColor_line:uint = 0xBBCCAA;
		private var downColor_fill:uint = 0xDFEFCF;
		private var downColor_line:uint = 0xBBCCAA;
		private var upColor_fill:uint = 0xEFEFEF;
		private var upColor_line:uint = 0xAAAAAA;
		//}VARIABLE
		
		public function logincheck() {
			//variables.username = 'admin';
			//variables.password = 'admin';
			
			Form_login();
			//CheckMember();
			
		}
		
		public function CheckMember():void{
			request.url = member_php;
			//variables.username = 'admin';
			//variables.password = 'admin';
			request.data = variables;
			loader.load(request);
			loader.addEventListener(Event.COMPLETE,LoadGameID);
		}
		public function LoadGameID(event:Event):void {
			xml_member = new XML(event.target.data);
			FlashConnect.trace('MEMBER:' + xml_member.username);			
			FlashConnect.trace('MEMBER:' + xml_member.gameid);
		} 
		
		public function Form_login():void{
			var MenuPanel:Shape = new Shape();
			MenuPanel.graphics.lineStyle(2, upColor_line);
			MenuPanel.graphics.beginFill(upColor_fill);
			MenuPanel.graphics.drawRect(0,0,3*88 -44,3*22 + 16);
			addChild(MenuPanel);			
			//FlashConnect.trace(String(Input_User.x +":"+Input_User.height));
			
			//{LABEL
			var Label_User:TextField = createLabel();
			Label_User.text = "User:";
			Label_User.x = 0*88;
			Label_User.y = 0*22;
			addChild(Label_User);
			
			var Label_Password:TextField = createLabel();
			Label_Password.text = "Password:";
			Label_Password.x = 0*88;
			Label_Password.y = 1*22;
			addChild(Label_Password);
			//}LABEL
			
			//{INPUT
			var Input_User:TextField = createinput();
			Input_User.text = "User";
			Input_User.x = 1*88;
			Input_User.y = 0*22;
			addChild(Input_User);
			
			var Input_Password:TextField = createinput();
			Input_Password.text = "Password";
			Input_Password.x = 1*88;
			Input_Password.y = 1*22;
			addChild(Input_Password);
			//}INPUT
			
			//{BUTTON
			var Button_Login:RectButton = new RectButton("Login");
			Button_Login.x = 0*88 + 16;
			Button_Login.y = 2*22 + 8;
			addChild(Button_Login);
			
			var Button_Cancel:RectButton = new RectButton("Cancel");
			Button_Cancel.x = 1*88 + 16 + 8;
			Button_Cancel.y = 2*22 + 8;
			addChild(Button_Cancel);
			//}BUTTON
			
			//{LISTENER
			Button_Login.addEventListener("click",checklogin);
			Button_Cancel.addEventListener("click",checkcancel);
			
			function checklogin():void{
				FlashConnect.trace("Login Click");
				variables.username = Input_User.text;
				variables.password = Input_Password.text;
				
				CheckMember();
			}
			function checkcancel():void{
				FlashConnect.trace("Cancel Click");				
			}
			//}LISTENER
		}
		
		public function createinput():TextField {
			var label_txt:TextField = new TextField();
			//label_txt.autoSize = TextFieldAutoSize.CENTER;
			//label_txt.selectable = false;
			label_txt.border = true;
			label_txt.background = true;
			label_txt.type = TextFieldType.INPUT; 
			label_txt.height = 18;
			var format:TextFormat = label_txt.getTextFormat();
			//format.font = "_sans";
			//format.align = TextFormatAlign.CENTER;
			//label_txt.setTextFormat(format);
			return label_txt;
		}
		
		public function createLabel():TextField {
			var label_txt:TextField = new TextField();
			label_txt.autoSize = TextFieldAutoSize.CENTER;
			label_txt.selectable = false;
			//label_txt.border = true;
			//label_txt.background = true;
			//Input_User.type = TextFieldType.INPUT; 
			var format:TextFormat = label_txt.getTextFormat();
			//format.font = "_sans";
			//format.align = TextFormatAlign.CENTER;
			//label_txt.setTextFormat(format);
			return label_txt;
		}
	}
	
}

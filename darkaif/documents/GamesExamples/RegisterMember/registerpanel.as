/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* NEEDED!
	* 
	* Information: Working on login fail. Error.
	* Need work out flow chart.
	*/
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.net.URLVariables;
	import flash.text.TextFieldAutoSize;
	import flash.events.Event;
	import darkaif.interact.RectButton;
	import org.flashdevelop.utils.FlashConnect;

	public class registerpanel extends Sprite{
		//{VARIABLE
		private var overColor_fill:uint = 0xEFEFEF;
		private var overColor_line:uint = 0xBBCCAA;
		private var downColor_fill:uint = 0xDFEFCF;
		private var downColor_line:uint = 0xBBCCAA;
		private var upColor_fill:uint = 0xEFEFEF;
		private var upColor_line:uint = 0xAAAAAA;
		public var variables:URLVariables = new URLVariables();
		public var request:URLRequest = new URLRequest();
		public var loader:URLLoader = new URLLoader();
		//}VARIABLE		
		public function registerpanel() {
			variables.username;
			variables.password;
			variables.retypepassword;
			variables.email;
			variables.retype;
			variables.gender;
			variables.birthday;
			
			request.url = "scripts/php/register_account.php";
			request.data = variables;
			
			Form_Register();
		}
		
		public function Form_Register():void{
			var MenuPanel:Shape = new Shape();
			MenuPanel.graphics.lineStyle(2, upColor_line);
			MenuPanel.graphics.beginFill(upColor_fill);
			MenuPanel.graphics.drawRect(0,0,3*88 -44,8*22 + 16);
			addChild(MenuPanel);
			
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
			
			var Label_RetypePassword:TextField = createLabel();
			Label_RetypePassword.text = "Re-Password:";
			Label_RetypePassword.x = 0*88;
			Label_RetypePassword.y = 2*22;
			addChild(Label_RetypePassword);
			
			var Label_Email:TextField = createLabel();
			Label_Email.text = "EMail:";
			Label_Email.x = 0*88;
			Label_Email.y = 3*22;
			addChild(Label_Email);
			
			var Label_RetypeEmail:TextField = createLabel();
			Label_RetypeEmail.text = "Re-Email:";
			Label_RetypeEmail.x = 0*88;
			Label_RetypeEmail.y = 4*22;
			addChild(Label_RetypeEmail);
			
			var Label_Gender:TextField = createLabel();
			Label_Gender.text = "Gender:";
			Label_Gender.x = 0*88;
			Label_Gender.y = 5*22;
			addChild(Label_Gender);
			
			var Label_Birth:TextField = createLabel();
			Label_Birth.text = "Birth:";
			Label_Birth.x = 0*88;
			Label_Birth.y = 6*22;
			addChild(Label_Birth);
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
			
			var Input_RetypePassword:TextField = createinput();
			Input_RetypePassword.text = "RetypePassword";
			Input_RetypePassword.x = 1*88;
			Input_RetypePassword.y = 2*22;
			addChild(Input_RetypePassword);
			
			var Input_Email:TextField = createinput();
			Input_Email.text = "Email";
			Input_Email.x = 1*88;
			Input_Email.y = 3*22;
			addChild(Input_Email);
			
			var Input_RetypeEmail:TextField = createinput();
			Input_RetypeEmail.text = "RetypeEmail";
			Input_RetypeEmail.x = 1*88;
			Input_RetypeEmail.y = 4*22;
			addChild(Input_RetypeEmail);
			
			var Input_Sgender:TextField = createinput();
			Input_Sgender.text = "S";
			Input_Sgender.width = 24;
			Input_Sgender.x = 1*88-45;
			Input_Sgender.y = 5*22;
			addChild(Input_Sgender);
			
			var Input_Birth:TextField = createinput();
			Input_Birth.text = "DDMMYYYY";
			//Input_Birth.width = 24;
			Input_Birth.height = 16;
			Input_Birth.x = 1*88;
			Input_Birth.y = 6*22+2;
			addChild(Input_Birth);
			//}INPUT
			
			//{BUTTON
			var Button_Male:RectButton = new RectButton("Male");
			Button_Male.width = 50;
			Button_Male.x = 1*88;
			Button_Male.y = 5*22;
			addChild(Button_Male);
			
			var Button_Female:RectButton = new RectButton("Female");
			Button_Female.width = 50;
			Button_Female.x = 1*88 + 60;
			Button_Female.y = 5*22;
			addChild(Button_Female);
			
			var Button_Register:RectButton = new RectButton("Register");
			Button_Register.width = 50;
			Button_Register.x = 1*88;
			Button_Register.y = 7*22;
			addChild(Button_Register);
			
			var Button_Cancel:RectButton = new RectButton("Cancel");
			Button_Cancel.width = 50;
			Button_Cancel.x = 1*88 + 60;
			Button_Cancel.y = 7*22;
			addChild(Button_Cancel);
			//}BUTTON
			
			//{LISTENER
			Button_Register.addEventListener("click",listencheckregister);
			Button_Cancel.addEventListener("click",listencancel);
			
			function listencheckregister():void{
				variables.username = Input_User.text;
				variables.password = Input_Password.text;
				variables.retypepassword = Input_RetypePassword.text;
				variables.email = Input_Email.text;
				variables.retype = Input_RetypeEmail.text;
				variables.gender = Input_Sgender.text;
				variables.birthday = Input_Birth.text;
				
				loader.load(request); //sends the request
				loader.addEventListener(Event.COMPLETE, doneLoading);
				function doneLoading(event:Event):void {
				//insert code here
				FlashConnect.trace('Register Account Done!');
				}
				
				for each(var value:* in variables){
				FlashConnect.trace(value);
				}	
				
				FlashConnect.trace("Register Submit");
			}
			function listencancel():void{
				FlashConnect.trace("register cancel");
			}
			
			Button_Female.addEventListener("click",changefemale);
			Button_Male.addEventListener("click",changemale);
			
			function changefemale():void{
				Input_Sgender.text = "f";
			}
			function changemale():void{
				Input_Sgender.text = "m";
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

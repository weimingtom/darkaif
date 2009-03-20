/**
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  
{
	//{IMPORT PACKAGE
	import darkaif.core.display.Button;
	import darkaif.frame.MenuToolPanel;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import darkaif.interact.RectButton;
	import org.flashdevelop.utils.FlashConnect;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.ui.Keyboard;
	//}IMPORT	
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class Main extends Sprite 
	{
		//{ variables
		public var MenuList:Array = new Array('Login','Register','Board','Settings','Credits');		
		private var overColor_fill:uint = 0xEFEFEF; //Mouse over button color
		private var overColor_line:uint = 0xBBCCAA; //Mouse over button color
		private var downColor_fill:uint = 0xDFEFCF; //Mouse down button color
		private var downColor_line:uint = 0xBBCCAA; //Mouse down button color
		private var upColor_fill:uint = 0xEFEFEF;   //Mouse up button color
		private var upColor_line:uint = 0xAAAAAA;   //Mouse up button color
		
		public var panel_main:Sprite =  new Sprite();
		public var panel_gameaccess:Sprite =  new Sprite();
		public var panel_gamelogin:Sprite =  new Sprite();
		public var panel_gameregister:Sprite =  new Sprite();
		public var panel_gameboard:Sprite =  new Sprite();
		public var panel_gamesettings:Sprite =  new Sprite();
		public var panel_gamecredits:Sprite =  new Sprite();
		//500x375 swf default
		public var _stageheight:Number = stage.width;
		private var GAME_HEIGHT:Number = 375;
		private var GAME_WIDTH:Number = 500;
		public var variables:URLVariables =  new URLVariables();
		public var urlaccesslink:String = 'http://localhost/darkaif/scripts/member/gamelogin.php';
		public var urlregisteraccess:String = 'http://localhost/darkaif/scripts/member/register.php';
		//public var loader:URLLoader = new URLLoader();
		//public var request:URLRequest = new URLRequest();
		public var mainmenu:MenuToolPanel = new MenuToolPanel();
		//}
		
		public function Main() {
			addChild(mainmenu);
			gameaccess();
		}
		
		//lanuch basic game menu
		public function gameaccess():void{
			var Panel_Width:Number = 1*88;
			var Panel_Height:Number = 3*22;
			var Panel_x:Number = 5;//(GAME_WIDTH/2) - (Panel_Width/2);
			var Panel_y:Number = 2;//(GAME_HEIGHT/2) - (Panel_Height/2);
			var count:int = 0;
			for (var p:int = 0; p < MenuList.length; p++) {
				var Button_Tmp:RectButton = new RectButton(MenuList[count]);
				Button_Tmp.x = Panel_x + 0*88; 
				Button_Tmp.y = Panel_y + count * 16;
				Button_Tmp.name = MenuList[count];
				Button_Tmp.addEventListener(MouseEvent.CLICK, displayMessage);
				panel_gameaccess.addChild(Button_Tmp);
				// Increase the count.
				count++;
				mainmenu._pheight = count * 22;
			}
			mainmenu.x = (GAME_WIDTH / 2) - (Panel_Width / 2);
			mainmenu.y = (GAME_HEIGHT/2) - (Panel_Height/2);
			mainmenu._pwidth = Panel_Width;
			mainmenu._pheight = Panel_Height;
			mainmenu.contentholder.addChild(panel_gameaccess);
		}//END gameaccess function
		
		/**
		 * Display a message in the Output window in trace event. 
		 */
		public function displayMessage(event:MouseEvent):void {
			FlashConnect.trace(event.currentTarget.name + ' [-] ');
			if (event.currentTarget.name == 'Login') {
				removeChild(mainmenu);
				panel_gameaccess =  new Sprite(); //clear sprite that will resuse the current added on -might reduce space file
				Form_login();
			}
			if (event.currentTarget.name == 'Register') {
				removeChild(mainmenu);
				panel_gameaccess =  new Sprite();
				Form_Register();
			}
		}
		
		//show tmp login test
		public function panel_login():void {
			var Panel_Width:Number = 1*88;
			var Panel_Height:Number = 3*22;
			var Panel_x:Number = (GAME_WIDTH/2) - (Panel_Width/2);
			var Panel_y:Number = (GAME_HEIGHT/2) - (Panel_Height/2);
			//{BUTTON
			var Button_Login:RectButton = new RectButton("ID");
			Button_Login.x = Panel_x + 0*88; 
			Button_Login.y = Panel_y + 0*22; 
			//}
			Button_Login.addEventListener(MouseEvent.CLICK,Action_Login);			
			function Action_Login():void{
				FlashConnect.trace("Click L");
				removeChild(panel_gameaccess);
			}
			panel_gameaccess.addChild(Button_Login);
			addChild(mainmenu);
			
		}
		
		public function Form_login():void {
			var heightp:Number = 90;
			var widthp:Number = 210;
			var offsetx:Number = 10;
			var offsety:Number = 0;
			var messagepanel:MenuToolPanel = new MenuToolPanel();
			var closemessagepanel:Button = new Button("OK");
			var messagetext:TextField = new TextField();
			closemessagepanel.x = 70;
			closemessagepanel.y = 35;
			closemessagepanel._width = 50;
			messagetext.text = "Testing..";
			messagepanel.x = stage.stageWidth / 2 - (widthp / 2);
			messagepanel.y = stage.stageHeight / 2 -(heightp/2);
			messagepanel._pheight = 80;
			messagepanel._pwidth = 200;
			closemessagepanel.addEventListener("click",messagepanelclose);
			messagepanel.contentholder.addChild(messagetext);
			messagepanel.contentholder.addChild(closemessagepanel);
			
			var loginpanel:MenuToolPanel = new MenuToolPanel();
			loginpanel.x = stage.stageWidth / 2 - (widthp/2);
			loginpanel.y = stage.stageHeight / 2 -(heightp/2);
			loginpanel._pheight =heightp; 
			loginpanel._pwidth = widthp;
			
			//{LABEL
			var Label_User:TextField = createLabel();
			Label_User.text = "User:";
			Label_User.x = 0*88+offsetx;
			Label_User.y = 0*22+offsety;
			loginpanel.contentholder.addChild(Label_User);
			
			var Label_Password:TextField = createLabel();
			Label_Password.text = "Pass:";
			Label_Password.x = 0*88+offsetx;
			Label_Password.y = 1*22+offsety;
			loginpanel.contentholder.addChild(Label_Password);
			//}LABEL
			
			//{INPUT
			var Input_User:TextField = createinput();
			Input_User.text = "User";
			Input_User.x = 1*88+offsetx;
			Input_User.y = 0*22+offsety;
			loginpanel.contentholder.addChild(Input_User);
			
			var Input_Password:TextField = createinput();
			Input_Password.text = "Password";
			Input_Password.x = 1*88+offsetx;
			Input_Password.y = 1*22+offsety;
			loginpanel.contentholder.addChild(Input_Password);
			//}INPUT
			
			//{BUTTON
			var Button_Login:RectButton = new RectButton("Login");
			Button_Login.x = 0*88 + offsetx;
			Button_Login.y = 2*22 + offsety;
			loginpanel.contentholder.addChild(Button_Login);
			
			var Button_Cancel:RectButton = new RectButton("Cancel");
			Button_Cancel.x = 1*88 +  8+offsetx;
			Button_Cancel.y = 2*22 + offsety;
			loginpanel.contentholder.addChild(Button_Cancel);
			//}BUTTON
			
			//{LISTENER
			Button_Login.addEventListener("click",checklogin);
			Button_Cancel.addEventListener("click",checkcancel);
			addChild(loginpanel);
			
			function checklogin():void{
				FlashConnect.trace("Login Click");
				variables.username = 'dark';
				variables.password = 'dark';
				var request:URLRequest = new URLRequest();
				var loader:URLLoader = new URLLoader();
				request.url = urlaccesslink;
				request.data = variables;
				loader.load(request); //sends the request
				trace(request);
				loader.addEventListener(Event.COMPLETE, logindata);
			}
			
			function messagepanelclose():void {
				removeChild(loginpanel);
				removeChild(messagepanel);
			}
			
			function checkcancel():void{
				FlashConnect.trace("Cancel Click");	
				removeChild(loginpanel);
				addChild(mainmenu);
			}
			//}LISTENER
			
			function logindata(e:Event):void {
				trace("-"+e.target.data);
				messagetext.text = "Welcome to the server.";
				messagetext.width = 150;
				addChild(messagepanel);
			}
			
		}
		
		public function Form_Register():void {
			variables = new URLVariables();
			var dataxml:XML = new XML()
			var heightp:Number = 199;
			var widthp:Number = 220;
			var offsetx:Number = 10;
			var offsety:Number = 0;
			var messagepanel:MenuToolPanel = new MenuToolPanel();
			var closemessagebutton:Button = new Button("OK");
			var messagetext:TextField = new TextField();
			closemessagebutton.addEventListener("click", messagepanelclose);
			
			messagetext.text = "Hello";
			messagetext.width = 150;
			messagetext.height = 150;
			closemessagebutton._width = 30;
			closemessagebutton.x = 60;
			closemessagebutton.y = 50;
			messagepanel.x = stage.stageWidth / 2 - (widthp / 2);
			messagepanel.y = stage.stageHeight / 2 -(heightp/2);
			messagepanel._pheight = 100;
			messagepanel._pwidth = 150;
			messagepanel.contentholder.addChild(messagetext);
			messagepanel.contentholder.addChild(closemessagebutton);
			var registerpanel:MenuToolPanel = new MenuToolPanel();
			registerpanel.x = stage.stageWidth / 2 - (widthp/2);
			registerpanel.y = stage.stageHeight / 2 -(heightp/2);
			registerpanel._pheight = heightp;
			registerpanel._pwidth = widthp;
			
			//{LABEL
			var Label_User:TextField = createLabel();
			Label_User.text = "User:";
			Label_User.x = 0*88+offsetx;
			Label_User.y = 0*22+offsety;
			registerpanel.contentholder.addChild(Label_User);
			
			var Label_Password:TextField = createLabel();
			Label_Password.text = "Password:";
			Label_Password.x = 0*88+offsetx;
			Label_Password.y = 1*22+offsety;
			registerpanel.contentholder.addChild(Label_Password);
			
			var Label_RetypePassword:TextField = createLabel();
			Label_RetypePassword.text = "Re-Password:";
			Label_RetypePassword.x = 0*88+offsetx;
			Label_RetypePassword.y = 2*22+offsety;
			registerpanel.contentholder.addChild(Label_RetypePassword);
			
			var Label_Email:TextField = createLabel();
			Label_Email.text = "Mail:";
			Label_Email.x = 0*88+offsetx;
			Label_Email.y = 3*22+offsety;
			registerpanel.contentholder.addChild(Label_Email);
			
			var Label_RetypeEmail:TextField = createLabel();
			Label_RetypeEmail.text = "Re-Email:";
			Label_RetypeEmail.x = 0*88+offsetx;
			Label_RetypeEmail.y = 4*22+offsety;
			registerpanel.contentholder.addChild(Label_RetypeEmail);
			
			var Label_Gender:TextField = createLabel();
			Label_Gender.text = "Gender:";
			Label_Gender.x = 0*88+offsetx;
			Label_Gender.y = 5*22+offsety;
			registerpanel.contentholder.addChild(Label_Gender);
			
			var Label_Birth:TextField = createLabel();
			Label_Birth.text = "Birth:";
			Label_Birth.x = 0*88+offsetx;
			Label_Birth.y = 6*22+offsety;
			registerpanel.contentholder.addChild(Label_Birth);
			//}LABEL
			
			//{INPUT
			var Input_User:TextField = createinput();
			Input_User.text = "User";
			Input_User.x = 1*88+offsetx;
			Input_User.y = 0*22+offsety;
			registerpanel.contentholder.addChild(Input_User);
			
			var Input_Password:TextField = createinput();
			Input_Password.text = "Password";
			Input_Password.x = 1*88+offsetx;
			Input_Password.y = 1*22+offsety;
			registerpanel.contentholder.addChild(Input_Password);
			
			var Input_RetypePassword:TextField = createinput();
			Input_RetypePassword.text = "Password";
			Input_RetypePassword.x = 1*88+offsetx;
			Input_RetypePassword.y = 2*22+offsety;
			registerpanel.contentholder.addChild(Input_RetypePassword);
			
			var Input_Email:TextField = createinput();
			Input_Email.text = "Email";
			Input_Email.x = 1*88+offsetx;
			Input_Email.y = 3*22+offsety;
			registerpanel.contentholder.addChild(Input_Email);
			
			var Input_RetypeEmail:TextField = createinput();
			Input_RetypeEmail.text = "Email";
			Input_RetypeEmail.x = 1*88+offsetx;
			Input_RetypeEmail.y = 4*22+offsety;
			registerpanel.contentholder.addChild(Input_RetypeEmail);
			
			var Input_Sgender:TextField = createinput();
			Input_Sgender.text = "S";
			Input_Sgender.width = 24;
			Input_Sgender.x = 1*88-45+offsetx;
			Input_Sgender.y = 5*22+offsety;
			registerpanel.contentholder.addChild(Input_Sgender);
			
			var Input_Birth:TextField = createinput();
			Input_Birth.text = "DDMMYYYY";
			//Input_Birth.width = 24;
			Input_Birth.height = 16;
			Input_Birth.x = 1*88+offsetx;
			Input_Birth.y = 6*22+offsety;
			registerpanel.contentholder.addChild(Input_Birth);
			//}INPUT
			
			//{BUTTON
			var Button_Male:RectButton = new RectButton("Male");
			Button_Male.width = 50;
			Button_Male.x = 1*88+offsetx;
			Button_Male.y = 5*22+offsety;
			registerpanel.contentholder.addChild(Button_Male);
			
			var Button_Female:RectButton = new RectButton("Female");
			Button_Female.width = 50;
			Button_Female.x = 1*88 + 60+offsetx;
			Button_Female.y = 5*22+offsety;
			registerpanel.contentholder.addChild(Button_Female);
			
			var Button_Register:RectButton = new RectButton("Register");
			Button_Register.width = 50;
			Button_Register.x = 1*88+offsetx;
			Button_Register.y = 7*22+offsety;
			registerpanel.contentholder.addChild(Button_Register);
			
			var Button_Cancel:RectButton = new RectButton("Cancel");
			Button_Cancel.width = 50;
			Button_Cancel.x = 1*88 + 60+offsetx;
			Button_Cancel.y = 7*22+offsety;
			registerpanel.contentholder.addChild(Button_Cancel);
			//}BUTTON
			
			addChild(registerpanel);
			
			//{LISTENER
			Button_Register.addEventListener("click",listencheckregister);
			Button_Cancel.addEventListener("click",listencancel);
			
			function listencheckregister():void {
				variables.username = Input_User.text;
				variables.password = Input_Password.text;
				variables.retypepassword = Input_RetypePassword.text;
				variables.email = Input_Email.text;
				variables.retype = Input_RetypeEmail.text;
				variables.gender = Input_Sgender.text;
				variables.birthday = Input_Birth.text;
				
				var request:URLRequest = new URLRequest();
				var loader:URLLoader = new URLLoader();
				request.url = urlregisteraccess;
				request.data = variables;
				loader.load(request); //sends the request
				loader.addEventListener(Event.COMPLETE, registerdata);
				FlashConnect.trace("register submit");
			}
			
			function registerdata(event:Event):void {
				FlashConnect.trace("DATA:LOADDED:"+event.target.data);
				dataxml = new XML(event.target.data);
				FlashConnect.trace("->"+dataxml.register);
				messagetext.text = dataxml.register;
				addChild(messagepanel);
			}
			
			function listencancel():void{
				FlashConnect.trace("register cancel");
				//addChild(panel_gameaccess);
				removeChild(registerpanel);
				addChild(mainmenu);
			}
			
			Button_Female.addEventListener("click",changefemale);
			Button_Male.addEventListener("click",changemale);
			
			function changefemale():void{
				Input_Sgender.text = "f";
			}
			
			function changemale():void{
				Input_Sgender.text = "m";
			}
			
			function messagepanelclose():void {
				removeChild(messagepanel);
				//removeChild(registerpanel);
			}
			//}LISTENER
		}
		
		public function panel_board():void{
			//This will add all the buttons into sprite for easy to remove
			//addChild(panel_gameboard);
		}
		
		public function panel_settings():void{
			//This will add all the buttons into sprite for easy to remove
			//addChild(panel_gamesettings);
		}
		
		public function panel_credits():void{
			//This will add all the buttons into sprite for easy to remove
			//addChild(panel_gamecredits);
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
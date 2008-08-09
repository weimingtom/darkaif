/**
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  
{
	//{IMPORT PACKAGE
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.net.URLRequest;
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
	public class MainGame extends Sprite 
	{
	//{ VAR
		private var overColor_fill:uint = 0xEFEFEF; //Mouse over button color
		private var overColor_line:uint = 0xBBCCAA; //Mouse over button color
		private var downColor_fill:uint = 0xDFEFCF; //Mouse down button color
		private var downColor_line:uint = 0xBBCCAA; //Mouse down button color
		private var upColor_fill:uint = 0xEFEFEF;   //Mouse up button color
		private var upColor_line:uint = 0xAAAAAA;   //Mouse up button color
		
		public var panel_gameaccess:Sprite =  new Sprite();
		public var panel_gamealogin:Sprite =  new Sprite();
		public var panel_gameboard:Sprite =  new Sprite();
		public var panel_gamesettings:Sprite =  new Sprite();
		public var panel_gamecredits:Sprite =  new Sprite();
		//500x375 swf default
		public var _stageheight:Number = stage.width;
		private var GAME_HEIGHT:Number = 375;
		private var GAME_WIDTH:Number = 500;
		public var MenuList:Array = new Array('Login','Register','Board','Settings','Credits');
		//MenuList[0] = 'Login';
		//MenuList[1] = 'Register';
		//MenuList[2] = 'Board';
		//MenuList[3] = 'Settings';
		//MenuList[4] = 'Credits';
	//}
		public function MainGame() {
			gameaccess();
		}
		
		//lanuch basic game menu
		public function gameaccess():void{
			var Panel_Width:Number = 1*88;
			var Panel_Height:Number = 3*22;
			var Panel_x:Number = (GAME_WIDTH/2) - (Panel_Width/2);
			var Panel_y:Number = (GAME_HEIGHT/2) - (Panel_Height/2);
			
			var count:int = 0;
			for (var p:int = 0; p < MenuList.length; p++) {
				var Button_Tmp:RectButton = new RectButton(MenuList[count]);
				Button_Tmp.x = Panel_x + 0*88; 
				Button_Tmp.y = Panel_y + count * 22;
				Button_Tmp.name = MenuList[count];
				Button_Tmp.addEventListener(MouseEvent.CLICK, displayMessage);
				panel_gameaccess.addChild(Button_Tmp);
				// Increase the count.
				count++;
			}
			addChild(panel_gameaccess);
			
		}//END gameaccess function
	}
	
}
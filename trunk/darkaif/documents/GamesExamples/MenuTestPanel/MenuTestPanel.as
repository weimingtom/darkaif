/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* ONLY FOR MENU TEST AREA FOR FIXED AND BUGS
	*/
	import darkaif.display.Dialog;
	import darkaif.display.GraphicLoadingBar;
	import darkaif.interact.GraphicButton;
	import darkaif.interact.MenuFrame;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.net.LocalConnection;
	import flash.utils.Timer;
	import org.flashdevelop.utils.FlashConnect;
	//import darkaif.display.MenuPanel;

	public class MenuTestPanel extends Sprite {
		public var NumberPercent:Number = 0;
		
		public function MenuTestPanel() {
			var send:LocalConnection;
			var t:Timer = new Timer(100);
			//var Menu:darkaif.display.MenuPanel = new darkaif.display.MenuPanel();
			//addChild(Menu);
			
			var MenuLoadingBar:GraphicLoadingBar = new GraphicLoadingBar();
			addChild(MenuLoadingBar);
			
			t.start();
			t.addEventListener(TimerEvent.TIMER,UpdateLoadingBar);
			
			function UpdateLoadingBar():void{ //Graphic 	
				NumberPercent++;
				if (NumberPercent >= 100){
					NumberPercent = 100;
					t.stop();
					FlashConnect.trace("STOP TIMER");
				}
				MenuLoadingBar.precent = NumberPercent;
				//FlashConnect.trace(MenuLoadingBar.precent + '%');
			}

			
			//var imagebutton:GraphicButton = new GraphicButton();
			//addChild(imagebutton);
			
			var dragmenu:MenuFrame = new MenuFrame();
			addChild(dragmenu);
			
			
			//var dialog:Dialog = new Dialog();
			//addChild(dialog);
		}
		
		
	}//END PULBIC ClASS MenuTestPanel
}//END PACKAGE

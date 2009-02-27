/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  programs{
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* This section test out the classes from the darkaif 
	* darkaif code might br name differently later on.
	* 
	* THIS SECTION IS TO TEST OUT THE CLASSES
	*/
	
	//{PACKAGE
	import darkaif.frame.*;
	import darkaif.core.node.*;
	import darkaif.core.display.*;
	import darkaif.interact.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	//flash files
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.ui.ContextMenuItem;
	import flash.text.TextField;

	import org.flashdevelop.utils.FlashConnect;
	//}
	
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class ToolPanelDemo extends Sprite {
		
		public var buttoncheck:Button = new Button("Check");
		public var textbox:TextField = new TextField();
		public var toolpanel:ToolPanel = new ToolPanel();
		public var paneltest:Sprite = new Sprite();
		public var srcollpanel:ScrollPanel  = new ScrollPanel();
		
		public function ToolPanelDemo() {
			
			
			paneltest.graphics.beginFill(0x000000);
			paneltest.graphics.drawRect(0, 0, 40, 150);
			paneltest.graphics.beginFill(0x0000F0);
			paneltest.graphics.drawRect(0, 0, 10, 10);
			paneltest.graphics.beginFill(0x0000FF);
			paneltest.graphics.drawRect(0, 150, 200, 100);
			paneltest.graphics.beginFill(0x00FFF0);
			paneltest.graphics.drawRect(0, 240, 10, 10);
			paneltest.graphics.endFill();
			
			textbox.x = 128;
			textbox.text = "none";
			toolpanel.y = 14;
			toolpanel._pheight = 150;
			toolpanel.content(paneltest);
			addChild(toolpanel);
			//addChild(textbox);
			srcollpanel.x = 100;
			srcollpanel.y = 14;
			//addChild(srcollpanel);
			
			toolpanel.closepanelbutton.addEventListener(MouseEvent.CLICK, removetoolpanel);
			buttoncheck.addEventListener(MouseEvent.CLICK, addtoolpanel);
			addChild(buttoncheck)
		}
		
		public function testtext(event:Event):void {
			//textbox.text = dropbox.getboxname(); 
		}
		
		public function addtoolpanel(event:Event):void {
			//textbox.text = dropbox.getboxname(); 
			addChild(toolpanel);
		}
		
		public function removetoolpanel(event:Event):void {
			//textbox.text = dropbox.getboxname(); 
			removeChild(toolpanel);
		}
	}
	
}

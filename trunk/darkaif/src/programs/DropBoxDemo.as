/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package programs {
	
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
	//import darkaif.frame.*;
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
	
	public class DropBoxDemo extends Sprite {
		
		public var buttoncheck:Button = new Button("Check");
		public var textbox:TextField = new TextField();
		public var dropbox:DropBox = new DropBox();
		
		public function DropBoxDemo() {
			textbox.x = 128;
			textbox.text = "none";
			dropbox.y = 14;
			dropbox.boxlist.push("Male");
			dropbox.boxlist.push("Female");
			dropbox.boxlist.push("Boy");
			dropbox.boxlist.push("Girl");
			dropbox.boxlist.push("Kid");
			dropbox.boxlist.push("Teen");
			dropbox.boxlist.push("Adult");
			dropbox.boxlist.push("Lim test");
			addChild(dropbox);
			addChild(textbox);
			buttoncheck.addEventListener(MouseEvent.CLICK, testtext);
			addChild(buttoncheck)
		}
		
		public function testtext(event:Event):void {
			textbox.text = dropbox.getboxname(); 
		}
	}
	
}

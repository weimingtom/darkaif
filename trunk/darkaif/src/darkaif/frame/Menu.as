/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.frame {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Menu Panel
	* Menu Content Panel
	* 
	* Drag and Drop option may not work because it infers with text some reason still looking for solutions. There are other factor in the menu built code.
	*/	
	//{ PACKAGE
	import flash.display.Sprite;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextField;
	import flash.display.Graphics;
	import flash.display.Shape;	
	import flash.events.MouseEvent;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	//}

	public class Menu extends Sprite {
		public var tilte_label:TextField = new TextField();
		public var title_name:String = 'Menu Panel';
		public var panel_space:int = 2;
		public var menu_panel:Sprite = new Sprite();
		
		public function Menu() {
			//Draw Text Menu Name
			tilte_label.autoSize = TextFieldAutoSize.LEFT;
			tilte_label.selectable = false;
			tilte_label.defaultTextFormat = new TextFormat();
			tilte_label.text = title_name;
			//mouseChildren = false;
			
			//Draw Menu Panel Image
			menu_panel.graphics.beginFill(0x00FFFF);
			menu_panel.graphics.drawRect(0, 0, 100, 22);
			
			//Basic Menu Frame button default
			//close button
			var close_button:Button = new Button('x');
			close_button.height = 16;
			close_button.width = 16;
			close_button.y = (22 - (close_button.height))/2;
			
			//minimize mode
			var minimize_button:Button = new Button('_');
			minimize_button.height = 16;
			minimize_button.width = 16;
			minimize_button.y = (22 - (minimize_button.height))/2;
			
			close_button.x = menu_panel.width - close_button.width - panel_space ;
			minimize_button.x = menu_panel.width - close_button.width - minimize_button.width - 2*panel_space;
			
			//menu_panel.width
			//Add Main Menu frame
			addChild(menu_panel);
			//Add Label to Menu to title
			menu_panel.addChild(tilte_label);
			menu_panel.addChild(close_button);
			menu_panel.addChild(minimize_button);
			//Add button for close or minimze window 
			addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			addEventListener(MouseEvent.MOUSE_UP ,displayDrageupState);
		}
		
		private function displayDragedownState(event:MouseEvent):void {
			//mouseChildren = true;
			//mouseChildren = false;
			//event.target.startDrag();
			startDrag();
		}
		
		private function displayDrageupState(event:MouseEvent):void {
			//mouseChildren = false;
			//mouseChildren = true;
			//event.target.stopDrag();
			stopDrag();
		}
		
	}
	
}

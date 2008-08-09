/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.frame {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* work on the basic of the menu build error
	* 
	* Creating multi button to use one action button for event trigger area.
	*/
	//{ PACKAGE
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.events.MouseEvent;
	import org.flashdevelop.utils.FlashConnect;
	//}

	public class navigationmenu extends Sprite {
		public var menupanel:Sprite = new Sprite();
		public var button_count:int = 0;
		public var button_height:Number = 24;
		public var button_width:Number = 92;
		
		public function navigationmenu() {
			
			addChild(menupanel);
			
			/* TesT BUTON FUNTION
			//{TEXT FORMAT
			// Create text formatting for the text fields in the menu.
			var format:TextFormat = new TextFormat();
			
			var label:TextField = new TextField();
			label.autoSize = TextFieldAutoSize.LEFT;
			label.selectable = false;
			label.defaultTextFormat = format;
			label.text = 'NAV_MENU';
			//}
			
			//{ BUTTON SPRITE
			var button:Sprite = new Sprite();
			button.name = 'NAV_MENU';
			// Disable the mouse events of all the objects within the button.
			button.mouseChildren = false;
			// Make the sprite behave as a button.
			button.buttonMode = true;
			//}
			
			//{ UP/DOWN SPRITE
			// Create a up state for the button.
			var up:Sprite = new Sprite();
			//up.graphics.lineStyle(1, 0x000000);
			up.graphics.beginFill(0x00FF00);
			up.graphics.drawRect(0, 0, 100, 30);
			up.name = "up";
			
			// Create a over state for the button.
			var over:Sprite = new Sprite();
			//over.graphics.lineStyle(1, 0x000000);
			over.graphics.beginFill(0xFFCC00);
			over.graphics.drawRect(0, 0, 100, 30);
			over.name = "over";
			//}
			
			//ADD TO THE BUTTON
			// Adder the states and label to the button.
			button.addChild(up);
			button.addChild(over);
			button.addChild(label);	
			
			//You need to add button listener to detect action to user input
			// Add mouse events to the button.
			button.addEventListener(MouseEvent.MOUSE_OVER, displayActiveState);
			button.addEventListener(MouseEvent.MOUSE_OUT, displayInactiveState);
			button.addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			button.addEventListener(MouseEvent.MOUSE_UP ,displayDrageupState);
			button.addEventListener(MouseEvent.CLICK, displayMessage);
			
			//ADD TO THE MENU
			menupanel.addChild(button);	
			*/
		}
		
		//This will add the menu button
		public function addbutton(Name:String):void {
			// Create text formatting for the text fields in the menu.
			var format:TextFormat = new TextFormat();
			
			var label:TextField = new TextField();
			label.autoSize = TextFieldAutoSize.LEFT;
			label.selectable = false;
			label.defaultTextFormat = format;
			label.text = Name;
			
			//{
			var button:Sprite = new Sprite();
			button.name = Name;
			// Disable the mouse events of all the objects within the button.
			//button.mouseChildren = false;
			
			// Make the sprite behave as a button.
			button.buttonMode = true;
			button.y = button_count * button_height;
			//}
			
			// Create a up state for the button.
			var up:Sprite = new Sprite();
			//up.graphics.lineStyle(1, 0x000000);
			up.graphics.beginFill(0x00FF00);
			up.graphics.drawRect(0, 0, 100, 22);
			up.name = "up";
				
			// Create a over state for the button.
			var over:Sprite = new Sprite();
			//over.graphics.lineStyle(1, 0x000000);
			over.graphics.beginFill(0xFFCC00);
			over.graphics.drawRect(0, 0, 100, 22);
			over.alpha = 0; //fixed not activite mouse dectect area
			over.name = "over";
			
			//ADD TO THE BUTTON
			// Adder the states and label to the button.
			button.addChild(up);
			button.addChild(over);
			button.addChild(label);	
			
			//You need to add button listener to detect action to user input
			// Add mouse events to the button.
			button.addEventListener(MouseEvent.MOUSE_OVER, displayActiveState);
			button.addEventListener(MouseEvent.MOUSE_OUT, displayInactiveState);
			button.addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			button.addEventListener(MouseEvent.MOUSE_UP ,displayDrageupState);
			button.addEventListener(MouseEvent.CLICK, displayMessage);
			
			//ADD TO THE MENU
			menupanel.addChild(button);	
			
			button_count++;
		}
		
		//This will remove menu button
		public function removebutton():void {
			//menupanel.removeChild();
		}
		
		private function displayDragedownState(event:MouseEvent):void {
			//event.target.startDrag();
		}
		
		private function displayDrageupState(event:MouseEvent):void {
			//event.target.stopDrag();
		}
		
		// Show the active state of the button. 
		private function displayActiveState(event:MouseEvent):void {
			// Hide the over state of the button.
			event.currentTarget.getChildByName("over").alpha = 100;
		}
		
		// Hide the active state of the button. 
		private function displayInactiveState(event:MouseEvent):void {
			
			// Show the over state of the button.
			event.currentTarget.getChildByName("over").alpha = 0;
			//event.target.stopDrag();
		}
		
		//Display a message in the Output window. 
		private function displayMessage(event:MouseEvent):void {
			FlashConnect.trace(event.currentTarget.name);
			/*
			// Output the name of the clicked button.
			FlashConnect.trace(event.currentTarget.name);
			if (event.currentTarget.name == 'button1') {
				FlashConnect.trace(event.currentTarget.name + 'Hello World');
			}
			if (event.currentTarget.name == 'button0') {
				FlashConnect.trace('Hello World');
			}
			*/
		}
		
	}
	
}

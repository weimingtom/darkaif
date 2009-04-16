/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.frame {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	//{ PACKAGE
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import org.flashdevelop.utils.FlashConnect;
	import flash.events.MouseEvent;
	//}

	public class Button extends Sprite {
		//{VARIABLE
		public var label_name:String = 'Button';
		public var text_label:TextField = new TextField();
		public var Height:int = 22;
		public var Width:int = 0;
		public var Space:int = 2;
		public var spritebutton:Sprite = new Sprite();
		//}
		
		public function Button(stringname:String) {
			//Text Field
			if (stringname == null)
			{
				stringname = 'Labal Button';
			}
			text_label.autoSize = TextFieldAutoSize.LEFT;
			text_label.selectable = false;
			text_label.alwaysShowSelection = false;
			text_label.defaultTextFormat = new TextFormat();
			text_label.text = stringname;
			//FlashConnect.trace(String(text_label.width)+ ':'+String(text_label.height));
			//this.Height = text_label.height + Space;
			this.Width = text_label.width + Space;
			// Create a up state for the button.
			var up:Sprite = new Sprite();
			//up.graphics.lineStyle(1, 0x000000);
			up.graphics.beginFill(0x00FF00);
			up.graphics.drawRect(0, 0,this.Width, this.Height);
			up.name = "up";
				
			// Create a over state for the button.
			var over:Sprite = new Sprite();
			//over.graphics.lineStyle(1, 0x000000);
			over.graphics.beginFill(0xFFCC00);
			over.graphics.drawRect(0, 0,this.Width, this.Height);
			over.alpha = 0; //fixed not activite mouse dectect area
			over.name = "over";
			
			//ADD TO THE BUTTON
			// Adder the states and label to the button.
			addChild(up);
			addChild(over);
			addChild(text_label);	
			
			//EVENT
			addEventListener(MouseEvent.MOUSE_OVER, displayActiveState);
			addEventListener(MouseEvent.MOUSE_OUT, displayInactiveState);
			addEventListener(MouseEvent.MOUSE_DOWN, displayDragedownState);
			addEventListener(MouseEvent.MOUSE_UP ,displayDrageupState);
			addEventListener(MouseEvent.CLICK, displayMessage);
		}
		
		public function set Name(num:String):void {
			this.label_name = num;
		}	
		public function get Name():String {
			return this.label_name;
		}
		public function set _height(num:int):void {
			this.Height = num;
		}
		public function get _height():int {
			return this.Height;
		}
		
		public function set _width(num:int):void {
			this.Width = num;
		}
		
		public function get _width():int {
			return this.Width;
		}
		private function displayDragedownState(event:MouseEvent):void {
			event.currentTarget.getChildByName("over").alpha = 50;
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
			// Output the name of the clicked button.
			
			FlashConnect.trace(event.currentTarget.name);
			/*
			if (event.currentTarget.name == 'button1') {
				FlashConnect.trace(event.currentTarget.name + 'Hello World');
			}
			if (event.currentTarget.name == 'button0') {
				FlashConnect.trace('Hello World');
			}
			*/
		}
		
		public function getsprite():void
		{
			
		}
	}
	
}

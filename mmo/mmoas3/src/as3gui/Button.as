/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package as3gui {
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
		public var Height:int = 13;
		public var Width:int = 0;
		public var Space:int = 2;
		public var spritebutton:Sprite = new Sprite();
		
		public var bcolorover:uint = 0x808080;
		public var bcolorout:uint = 0x363430;
		public var bcolorup:uint = 0xd3d3d3;
		public var bcolordown:uint = 0xa9a9a9;
		
		public var bbcolor:uint = 0xFFFFFF;
		//}
		
		public function Button(stringname:String) {
			//Text Field
			if (stringname == null)
			{
				stringname = 'Labal Button';
			}
			//text format
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0xF5F5F5;
			
			text_label.autoSize = TextFieldAutoSize.LEFT;
			text_label.selectable = false;
			text_label.alwaysShowSelection = false;
			text_label.text = stringname;
			//text_label.defaultTextFormat = new TextFormat();
			text_label.setTextFormat(format);
			
			//FlashConnect.trace(String(text_label.width)+ ':'+String(text_label.height));
			//this.Height = text_label.height + Space;
			this.Width = text_label.width + Space;
			
			spritebutton.graphics.beginFill(bbcolor);
			spritebutton.graphics.lineStyle(1);
			spritebutton.graphics.beginFill(0x363430);
			spritebutton.graphics.drawRect(0, 0,this.Width, this.Height);
			
			// Create a up state for the button.
			//var up:Sprite = new Sprite();
			//up.graphics.lineStyle(1, 0x000000);
			//up.graphics.beginFill(0x00FF00);
			//up.graphics.drawRect(0, 0,this.Width, this.Height);
			//up.name = "up";
				
			// Create a over state for the button.
			//var over:Sprite = new Sprite();
			//over.graphics.lineStyle(1, 0x000000);
			//over.graphics.beginFill(0xFFCC00);
			//over.graphics.drawRect(0, 0,this.Width, this.Height);
			//over.alpha = 0; //fixed not activite mouse dectect area
			//over.name = "over";
			
			//ADD TO THE BUTTON
			// Adder the states and label to the button.
			//addChild(up);
			//addChild(over);
			//addChild(text_label);	
			spritebutton.addChild(text_label);	
			
			//EVENT
			spritebutton.addEventListener(MouseEvent.MOUSE_OVER, displayOverState);
			spritebutton.addEventListener(MouseEvent.MOUSE_OUT, displayOutState);
			spritebutton.addEventListener(MouseEvent.MOUSE_DOWN, displayDownState);
			spritebutton.addEventListener(MouseEvent.MOUSE_UP ,displayUpState);
			spritebutton.addEventListener(MouseEvent.CLICK, displayMessage);
			
			addChild(spritebutton);
		}
		
		public function set Name(num:String):void {
			this.label_name = num;
		}	
		public function get Name():String {
			return this.label_name;
		}
		public function set _height(num:Number):void {
			this.Height = num;
			spritebutton.graphics.clear();
			spritebutton.graphics.beginFill(bbcolor);
			spritebutton.graphics.lineStyle(1);
			spritebutton.graphics.beginFill(bcolorout);
			spritebutton.graphics.drawRect(0, 0,this.Width, this.Height);
		}
		public function get _height():Number {
			return this.Height;
		}
		
		public function set _width(num:Number):void {
			this.Width = num;
			spritebutton.graphics.clear();
			spritebutton.graphics.beginFill(bbcolor);
			spritebutton.graphics.lineStyle(1);
			spritebutton.graphics.beginFill(bcolorout);
			spritebutton.graphics.drawRect(0, 0,this.Width, this.Height);
		}
		
		public function get _width():Number {
			return this.Width;
		}
		
		private function displayDownState(event:MouseEvent):void {
			//event.currentTarget.getChildByName("over").alpha = 50;
			//event.target.startDrag();
			spritebutton.graphics.clear();
			spritebutton.graphics.beginFill(bbcolor);
			spritebutton.graphics.lineStyle(1);
			spritebutton.graphics.beginFill(bcolordown);
			spritebutton.graphics.drawRect(0, 0,this.Width, this.Height);
		}
		
		private function displayUpState(event:MouseEvent):void {
			//event.target.stopDrag();
			spritebutton.graphics.clear();
			spritebutton.graphics.beginFill(bbcolor);
			spritebutton.graphics.lineStyle(1);
			spritebutton.graphics.beginFill(bcolorup);
			spritebutton.graphics.drawRect(0, 0,this.Width, this.Height);
		}
		
		// Show the active state of the button. 
		private function displayOverState(event:MouseEvent):void {
			// Hide the over state of the button.
			//event.currentTarget.getChildByName("over").alpha = 100;
			spritebutton.graphics.clear();
			spritebutton.graphics.beginFill(bbcolor);
			spritebutton.graphics.lineStyle(1);
			spritebutton.graphics.beginFill(bcolorover);
			spritebutton.graphics.drawRect(0, 0,this.Width, this.Height);
			
		}
		
		// Hide the active state of the button. 
		private function displayOutState(event:MouseEvent):void {
			// Show the over state of the button.
			//event.currentTarget.getChildByName("over").alpha = 0;
			//event.target.stopDrag();
			spritebutton.graphics.clear();
			spritebutton.graphics.beginFill(bbcolor);
			spritebutton.graphics.lineStyle(1);
			spritebutton.graphics.beginFill(bcolorout);
			spritebutton.graphics.drawRect(0, 0,this.Width, this.Height);
		}
		
		//Display a message in the Output window. 
		private function displayMessage(event:MouseEvent):void {
			// Output the name of the clicked button.
			
			//FlashConnect.trace(event.currentTarget.name);
			/*
			if (event.currentTarget.name == 'button1') {
				FlashConnect.trace(event.currentTarget.name + 'Hello World');
			}
			if (event.currentTarget.name == 'button0') {
				FlashConnect.trace('Hello World');
			}
			*/
		}
		
		public function getsprite():Sprite
		{
			return this.spritebutton;
		}
	}
	
}

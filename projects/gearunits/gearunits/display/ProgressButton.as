package gearunits.display{
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	//{ PACKAGE
	import darknet.core.event.GameButtonEvent;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import flash.events.MouseEvent;
	//}

	public class ProgressButton extends Sprite {
		//{VARIABLE
		public var label_name:String;
		public var text_label:TextField = new TextField();
		public var Height:int = 13;
		public var Width:int = 0;
		public var Space:int = 2;
		public var datastring:String;
		
		public var bcolorover:uint = 0x808080;
		public var bcolorout:uint = 0x363430;
		public var bcolorup:uint = 0xd3d3d3;
		public var bcolordown:uint = 0xa9a9a9;
		public var bbcolor:uint = 0xFFFFFF;
		//}
		
		public function ProgressButton(stringname:String = 'button') {
			this.name = stringname;
			text = stringname;
			drawgraphicbutton(bbcolor,bcolorout);
			addChild(text_label);	
			
			//EVENT
			addEventListener(MouseEvent.MOUSE_OVER, displayOverState);
			addEventListener(MouseEvent.MOUSE_OUT, displayOutState);
			addEventListener(MouseEvent.MOUSE_DOWN, displayDownState);
			addEventListener(MouseEvent.MOUSE_UP ,displayUpState);
		}
		
		public function set tag(t:String):void {
			datastring = t;
		}
		
		public function set Name(num:String):void {
			text = num;
		}	
		public function get Name():String {
			return label_name;
		}
		
		public function set _height(num:Number):void {
			Height = num;
			drawgraphicbutton(bbcolor,bcolorout);
		}
		public function get _height():Number {
			return Height;
		}
		public function set _width(num:Number):void {
			Width = num;
			drawgraphicbutton(bbcolor,bcolorout);
		}
		public function get _width():Number {
			return Width;
		}
		
		// Show down state of the button. 
		private function displayDownState(event:MouseEvent):void {
			drawgraphicbutton(bbcolor, bcolordown);
			//dispatchEvent(new GameButtonEvent(GameButtonEvent.TAG,datastring));
		}
		// Show up state of the button. 
		private function displayUpState(event:MouseEvent):void {
			drawgraphicbutton(bbcolor,bcolorup);
		}
		// Show over state of the button. 
		private function displayOverState(event:MouseEvent):void {
			drawgraphicbutton(bbcolor,bcolorover);
		}
		// Show out state button. 
		private function displayOutState(event:MouseEvent):void {
			drawgraphicbutton(bbcolor,bcolorout);
		}
		
		//set text button
		public function set text(name:String):void {
			label_name = name;
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0xF5F5F5;
			
			text_label.autoSize = TextFieldAutoSize.LEFT;
			text_label.selectable = false;
			text_label.alwaysShowSelection = false;
			text_label.text = String(name);
			text_label.setTextFormat(format);
			//Width = text_label.width + Space;
		}
		
		//draw button
		private function drawgraphicbutton(fill:uint,color:uint):void {
			graphics.clear();
			graphics.beginFill(fill);
			graphics.lineStyle(1);
			graphics.beginFill(color);
			graphics.drawRect(0, 0, Width, Height);
			graphics.endFill();
		}
		
	}
	
}

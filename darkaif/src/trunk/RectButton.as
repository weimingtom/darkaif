/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/

package {
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;

	public class RectButton extends SimpleButton{
		static public var label_str:String;
		private var overColor_fill:uint = 0xEFEFEF;
		private var overColor_line:uint = 0xBBCCAA;
		private var downColor_fill:uint = 0xDFEFCF;
		private var downColor_line:uint = 0xBBCCAA;
		private var upColor_fill:uint = 0xEFEFEF;
		private var upColor_line:uint = 0xAAAAAA;
		private var _height:uint = 22;
		private var _width:uint = 88;
		
		public function RectButton(labelText:String = "Submit") {
			label_str = labelText;
			useHandCursor = true;
			upState = ButtonDisplayState(upColor_fill,upColor_line,_width,_height);
			overState = ButtonDisplayState(overColor_fill,overColor_line,_width,_height);
			downState = ButtonDisplayState(downColor_fill,downColor_line,_width,_height);
			hitTestState = ButtonDisplayState(overColor_fill,overColor_line,_width,_height);
		}
		
		public function ButtonDisplayState(bgColor_fill:uint, bgColor_line:uint,_width:uint,_height:uint):Sprite{
			var state:Sprite = new Sprite();
			var upShape:Shape = new Shape();
			upShape.graphics.lineStyle(2, bgColor_line);
			upShape.graphics.beginFill(bgColor_fill);
			upShape.graphics.drawRect(0,0, _width,_height);
			var label_txt:TextField = createLabel();
			positionLabel(label_txt, upShape);
			state.addChild(upShape);
			state.addChild(label_txt);
			return state;
		}
		
		private function createLabel():TextField {
			var label_txt:TextField = new TextField();
			label_txt.autoSize = TextFieldAutoSize.CENTER;
			label_txt.selectable = false;
			label_txt.text = label_str;
			//label_txt.border = true;
			//label_txt.background = true;
			var format:TextFormat = label_txt.getTextFormat();
			format.font = "_sans";
			format.align = TextFormatAlign.CENTER;
			label_txt.setTextFormat(format);
			return label_txt;
		}
		private function positionLabel(label:TextField, state:DisplayObject):void {
			label.x = state.width/2 - label.width/2;
			label.y = state.height/2 - label.height/2;
		}
		
		
	}
	
}

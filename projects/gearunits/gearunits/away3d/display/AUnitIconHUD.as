package gearunits.away3d.display 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AUnitIconHUD extends Sprite
	{
		
		public var _text:TextField = new TextField();
		public var format:TextFormat = new TextFormat();
		public var progressbar:AProgressBar = new AProgressBar();
		
		public function AUnitIconHUD() 
		{
			text = 'test'
			addChild(_text);
			progressbar.y = 14;
			addChild(progressbar);
		}
		
		public function set text(textname:String):void {//to adjust text later
			graphics.clear();
			graphics.beginFill(0x87ceeb);
			
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0x404040;
			
			_text.selectable = false;
			_text.alwaysShowSelection = false;
			_text.text = String(textname);
			_text.setTextFormat(format);
			_text.autoSize = TextFieldAutoSize.LEFT;
			graphics.drawRect(0,0,_text.textWidth+4,14);
			graphics.endFill();
		}
		
		public function set percent(num:Number):void {
			progressbar.precent = num;
		}
		
		public function setbar(_height:Number,_width:Number):void {
			progressbar.setbar(_height,_width);
		}
		
		//public function 
		
		
	}
	
}
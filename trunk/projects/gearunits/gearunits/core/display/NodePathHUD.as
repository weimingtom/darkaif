package gearunits.core.display 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class NodePathHUD extends Sprite
	{
		public var ftext:TextField = new TextField();
		public var gtext:TextField = new TextField();
		public var htext:TextField = new TextField();
		public var bvisitedtext:TextField = new TextField();
		
		public var format:TextFormat = new TextFormat();
		
		public function NodePathHUD() {
			init_fontformat();
			init_draw();
			init_setup();
		}
		
		public function init_setup():void {
			addChild(ftext);
			gtext.y = 20;
			addChild(gtext);
			htext.y = 20 * 2;
			addChild(htext);
			//bvisitedtext.y = 20 * 3;
			//addChild(bvisitedtext);
			
			setf('0');
			setg('0');
			seth('0');
			//setbvisited('-');
		}
		
		public function init_draw():void {
			graphics.clear();
			//graphics.beginFill(0xFFFFFF);
			graphics.lineStyle(2)
			graphics.drawRect(0, 0, 100, 100);
			//graphics.
			graphics.endFill();
			//alpha = 0.5;
		}
		
		public function init_fontformat():void {
			format.size = 24;
			format.font = "OCR A Extended";
			format.color = 0x404040;
		}
		
		public function setf(t:String):void {
			customtextset(ftext,'F:'+t);
		}
		
		public function setg(t:String):void {
			customtextset(gtext,'G:'+t);
		}
		
		public function seth(t:String):void {
			customtextset(htext,'H:'+t);
		}
		
		public function setbvisited(t:String):void {
			customtextset(bvisitedtext,'Visited:'+t);
		}
		
		//TEXTFEILD AND SET TEXT
		public function customtextset(textpro:TextField,name:String):void {
			textpro.autoSize = TextFieldAutoSize.LEFT;
			textpro.selectable = false;
			textpro.alwaysShowSelection = false;
			textpro.text = String(name);
			textpro.setTextFormat(format);
		}
		
		
		
	}
	
}
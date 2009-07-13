package gearunits.away3d.display  {
	/**
	* ...
	* @author Darknet
	* 
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Simple Bar Loading Code DONE! Sweet! XD!
	* 
	* this code need to be improve a bit
	*/
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import org.flashdevelop.utils.FlashConnect;

	public class AProgressBar extends Sprite{
		public var SpaceX:Number = 2;
		public var SpaceY:Number = 2;
		public var Height:Number = 6;
		public var Width:Number = 100;
		public var BHeight:Number = Height - SpaceY;
		public var BWidth:Number = Width - SpaceX;
		public var _percent:Number = 0;
		public var bar_bg_fill:uint = 0xEFEFEF; //BackGround Color
		public var bar_fg_fill:uint = 0xadd8e6; //ForeGround Color
		public var bar_color:uint = 0x7ed44b;	//Draw Loading Bar Color
		
		public function AProgressBar() {
			DrawLoadingBar();
			//FlashConnect.trace(NumberPercent + "%");
		}
		
		public function set precent(number:Number):void {
			if (number < 0) {number = 0;}
			if (number > 1) {number = 1;}
			this._percent = number;
			DrawLoadingBar(); //This Will Render when new variable is added
			//FlashConnect.trace(this.NumberPercent + "%");
		}
		
		public function get precent():Number{
			return this._percent;
			//FlashConnect.trace(this.NumberPercent + "%");
		}
		
		public function DrawLoadingBar():void{ //Graphic 
			graphics.clear(); //This will clear out the graphic
			graphics.beginFill(bar_bg_fill);
			graphics.drawRect(0, 0, Width, Height); 
			graphics.beginFill(bar_color);
			graphics.drawRect(1,1, Math.floor((BWidth - SpaceX) * (_percent)), (BHeight - 1)); //First Image Layer
			graphics.endFill();//close draw
		}
		
		public function setbar(_height:Number,_width:Number):void {
			Height = _height;
			Width = _width;
			BWidth = Width - SpaceX;
			BHeight = Height - SpaceY;
		}
		
	}
}

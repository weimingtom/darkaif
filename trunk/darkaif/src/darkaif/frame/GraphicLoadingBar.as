package darkaif.frame {
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

	public class GraphicLoadingBar extends Sprite{
		public var SpaceX:Number = 4;
		public var SpaceY:Number = 4;
		public var Height:Number = 22;
		public var Width:Number = 100;
		public var BHeight:Number = 22;
		public var BWidth:Number = 100;
		public var NumberPercent:Number = 0;
		public var bar_bg_fill:uint = 0xEFEFEF; //BackGround Color
		public var bar_fg_fill:uint = 0xadd8e6; //ForeGround Color
		public var bar_color:uint = 0x00008b;	//Draw Loading Bar Color
		
		
		public function GraphicLoadingBar() {
			DrawLoadingBar();
			//FlashConnect.trace(NumberPercent + "%");
		}
		
		public function set precent(number:Number):void{
			this.NumberPercent = number;
			DrawLoadingBar(); //This Will Render when new variable is added
			//FlashConnect.trace(this.NumberPercent + "%");
		}
		
		public function get precent():Number{
			return this.NumberPercent;
			//FlashConnect.trace(this.NumberPercent + "%");
		}
		
		public function DrawLoadingBar():void{ //Graphic 
			graphics.clear(); //This will clear all the data from the object
			graphics.beginFill(bar_bg_fill); //Fill the first Layer
			graphics.drawRect(0,0,(Width),Height); //First Image Layer
			graphics.beginFill(bar_fg_fill); //Fill Second Layer
			graphics.drawRect((SpaceX/2),(SpaceY/2),Math.floor((BWidth - SpaceX)*(NumberPercent/100)),(BHeight - SpaceY)); //Image Second Layer
		}		
	}
}

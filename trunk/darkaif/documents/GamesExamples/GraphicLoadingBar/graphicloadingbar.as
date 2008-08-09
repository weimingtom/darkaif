/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
* 
* Information: This the loading bar image.
* This code need to be refine a bit
* 
*/

/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

package  {
	import flash.display.Shape;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import org.flashdevelop.utils.FlashConnect;
	
	public class graphicloadingbar extends Sprite{
		public var t:Timer = new Timer(100);
		public var LoadPercent:Number = 0;
		
		public function graphicloadingbar() {//main setup
			ImageLoadingBar();
		}
		
		public function ImageLoadingBar():void{
			var LoadBarImage:Shape = new Shape;
			UpdateLoadingBar();		
			addChild(LoadBarImage);
			
			t.start();
			t.addEventListener(TimerEvent.TIMER,UpdateLoadingBar);
			
			function UpdateLoadingBar():void{ //Graphic 
				var bar_bg_fill:uint = 0xEFEFEF;
				var bar_fg_fill:uint = 0xadd8e6;
				var bar_borderline:uint = 0x00008b;
				
				LoadPercent = LoadPercent + 1;
				if (LoadPercent >= 100){
					LoadPercent = 100;
					t.stop();
					//LoadPercent = 0;					
				}
				//{IMAGE GRAPHIC
				LoadBarImage.graphics.clear(); //This will clear all the data from the object
				LoadBarImage.graphics.beginFill(bar_bg_fill);
				LoadBarImage.graphics.drawRect(12,12,(100),22);
				LoadBarImage.graphics.beginFill(bar_fg_fill);
				LoadBarImage.graphics.drawRect(14,14,Math.floor(96*(LoadPercent/100)),18);
				//}IMAGE GRAPHIC
				//FlashConnect.trace(LoadPercent + "%"+ (96*(LoadPercent/100)) );
				//FlashConnect.trace(LoadPercent + "%"+ Math.floor(96*(LoadPercent/100)) );
			}
		}
		
	}	
}

/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*
	* NOT YET BUILD
	* 
	* This for the player,object, npc, etc. ainmation code that will support it or not
	* image counter
	* key timer
	* framecouter
	* 
	* tranparent
	* keyboard control
	* check what ever the if action is working or stand still
	* 
	* Working file.
	* 
	* Action State
	* -IDLE
	* -Moving
	* -Ingure
	* -Skills
	* -actions
	* -emotion
	*/
	//{ PACKAGES
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLLoader;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import org.flashdevelop.utils.FlashConnect;
	//}

	public class object_animation extends Sprite {
		//{ VARIBLES
		//KEYBOARD
		public var KB_RIGHT:Boolean = false;
		public var KB_LEFT:Boolean = false;
		public var KB_DOWN:Boolean = false;
		public var KB_UP:Boolean = false;
		
		//KEYBOARD ARRAY FOR KEY FOR BOOLEAN
		public var keysDown:Array = new Array();
		//image data
		public var ImageRender:BitmapData;
		public var ImageData:BitmapData;
		public var ImageScreen:Bitmap;
		
		//render data
		public var frametime:int = 0;
		public var framestart:int = 0;
		public var frameend:int = 0;
		public var framecounter:int = 0;
		public var framename:String = 'idle';
		public var frameaction:String = 'idle';
		public var frame_height:int = 32;
		public var frame_width:int = 32;
		
		public var pixelwidth:int = 32;
		public var pixelheight:int = 32;
		
		public var gridheight:int = 8;
		public var gridwidth:int = 8;
		
		//file data 
		public var imagedir:String = 'data/images/playeranimation.png';
		public var request:URLRequest = new URLRequest();
		public var loader:Loader =  new Loader();
		//}
		
		public function object_animation() {
			keyboard_event();
			var t:Timer = new Timer(100);
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			
			loader.load(new URLRequest(imagedir));
			loader.contentLoaderInfo.addEventListener(Event.INIT, InitTilesLoad);	
			//addChild(loader);
			
			ImageRender = new BitmapData(frame_width, frame_height, true, 0x000000);
			ImageScreen =  new Bitmap(ImageRender);
			addChild(ImageScreen);
			
			//This will render the images
			function tick():void {
				//FlashConnect.trace('Framecoutner:' + framecounter);
				removeChild(ImageScreen);
				ImageScreen = ImageTileRender(); //this is a bitmap data
				addChild(ImageScreen);
			}
		}
		
		//check action for moving 
		public function keyboard_event():void {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			
			function addKey(e:KeyboardEvent):void {
				keysDown[e.keyCode] = true;
				//FlashConnect.trace(String(keysDown[e.keyCode]));
				//FlashConnect.trace("addKey!");
				//imagetest.x = player[0];
				//imagetest.y = player[1];
			}
			function removeKey(e:KeyboardEvent):void {
				keysDown[e.keyCode] = false;
				//FlashConnect.trace(String(keysDown[e.keyCode]));
				//FlashConnect.trace("removeKey");
			}
			
			/*
			var t:Timer = new Timer(25);
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			
			function tick(e:TimerEvent):void {
				//FlashConnect.trace("tick");
				//This will update player postion
				//oldplayer[0] = player[0];
				//oldplayer[1] = player[1];
				
				if (keysDown[Keyboard.RIGHT]) {
					//FlashConnect.trace("right key is down!");
					KB_RIGHT = true;
					//player[0] = player[0] + 1;
				}else if (keysDown[Keyboard.LEFT]) {
					//FlashConnect.trace("Left key is down!");
					KB_LEFT = true;
					//player[0] = player[0] - 1;
				}else{
					KB_LEFT = false;
					KB_RIGHT = false;
				}
				if (keysDown[Keyboard.UP]) {
					//FlashConnect.trace("Up key is down!");
					KB_UP = true;
					//player[1] = player[1] - 1;
				}else if (keysDown[Keyboard.DOWN]) {
					//FlashConnect.trace("Down key is down!");
					KB_DOWN = true;
					//player[1] = player[1] + 1;
				}else{
					KB_DOWN = false;
					KB_UP = false;
				}
			}
			*/
		}
		
		//this return bitmap data with timer every time is execute
		public function ImageTileRender():Bitmap{
			ImageRender = new BitmapData(frame_width, frame_height, true, 0x000000);//Create data image
			
			framecounter++;
			//if (framecounter > 5) {
			//	framecounter = 0;
			//}
			//Need to work on the image action list area
			//keysDown[40] array from the public for keyboard
			if (keysDown[40] == true) { //40 = down
				if (framecounter <= 0) {
					framecounter = 0;
				}
				if (framecounter > 5) {
					framecounter = 0;
				}
				//FlashConnect.trace('Animtion Down'+framecounter);
			}else if (keysDown[38] == true) { //38 = up
				if (framecounter <= 6) {
					framecounter = 6;
				}
				if (framecounter > 11) {
					framecounter = 6;
				}
				//FlashConnect.trace('Animtion UP'+framecounter);
			}else if (keysDown[39] == true) { //39 = right
				if (framecounter <= 12) {
					framecounter = 12;
				}
				if (framecounter > 17) {
					framecounter = 12;
				}
				//FlashConnect.trace('Animtion RIGHT'+framecounter);
			}else if (keysDown[37] == true) { //37 = left
				if (framecounter <= 18) {
					framecounter = 18;
				}
				if (framecounter > 23) {
					framecounter = 18;
				}
				//FlashConnect.trace('Animtion LEFT'+framecounter);
			}else {
				if (framecounter < 0) {
					framecounter = 0;
				}
				if (framecounter > 5) {
					framecounter = 0;
				}
				//FlashConnect.trace('Animtion IDLE'+framecounter);
			}
			
			
			//FlashConnect.trace('Framecoutner:' + framecounter);
			
			//tile index images 
			var sourcex:int=(framecounter % gridwidth)*pixelwidth; //Tile layout is 6 by 6 and 32x32 pixel
			var sourcey:int = (int(framecounter / gridheight)) * pixelheight; //tile layout 6 by 6 and 32x32 pixel
			
			var destinationx:int = 0; //New position
			var destinationy:int = 0; //new position
			
			ImageRender.copyPixels(ImageData, //this the src image file to get from
			new Rectangle(sourcex, sourcey, pixelwidth, pixelheight), //this is from src image tile where the location to place new image
			new Point(destinationx, destinationy)); // this the position to start from 0,0 for adding on new image
			
			ImageScreen =  new Bitmap(ImageRender); //convert image to the format
			return ImageScreen;
		}
		
		public function InitTilesLoad(e:Event):void {
			FlashConnect.trace('IMAGE LOADED');
			ImageData = Bitmap(e.target.content).bitmapData;
		}
		
	}
	
}

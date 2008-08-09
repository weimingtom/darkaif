/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* Create Map basic Function.
	* 
	* Loading files order.
	* First loading: XML MAP
	* Second loading: Image
	* 
	* Working on player position
	*/
	//{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import org.flashdevelop.utils.FlashConnect;
	//}

	public class mytile extends Sprite{
		//{VAR
		public var xmlmap:XML = new XML();						//xml load data for map
		public var maploader:URLLoader = new URLLoader();
		public var maptile:Array =  new Array();				//Map table tile
		public var mapcollision:Array = new Array();			//map collision
		
		//IMAGE DATA
		public var tileimagedata:BitmapData;					//This for image tile src
		public var imagedata:BitmapData;						//image data
		public var screendata:Bitmap;							//Create Map Image For Screen Output
		
		// Map Data format
		public var maprow:int = 10;								//set map row for limit
		public var mapcol:int = 10;								//set map col for limit
		public var tileheight:int = 32;						//Create tile height
		public var tilewidth:int = 32;						//Create tile width
		public var screenmapheight:int = maprow*tileheight; //Create image size for tile screen
		public var screenmapwidth:int = mapcol * tilewidth;	//Create Image Size for tile screen
		
		//MAP VARIABLES
		public var variables:URLVariables = new URLVariables();
		
		//FOR LOADING DATA
		public var loader:Loader = new Loader();
		public var request:URLRequest =  new URLRequest();
		
		//Map Data Information
		public var mapdir:String = 'data/maps/';
		public var mapext:String = '.xml';
		public var mapname:String = 'map_med';
		public var mapfile:String = mapdir + mapname + mapext;
		//}VAR
		
		public function mytile() {
			/* TesT VAR
			FlashConnect.trace('MAP SETUP');
			variables.mapname = 'test_none';
			variables.mapdata = xmlmap;
			variables.memberid = 'admin';
			variables.access = '0';
			variables.submittype = 'save';
			
			TILE TABLE
			maptile = [
			[1,2,3,4,5],
			[1,1,1,0,0],
			[1,0,0,0,0],
			[1,0,0,0,0],
			[1,0,0,0,35]
			];
			*/
			
			FlashConnect.trace('MAP TEST!');
			loadmapxml();
			//KEY_EVENT();
			
			//{LOADED IMAGE TEST
			//loader.load(new URLRequest("images/colorlayer6x6.jpg"));
			//loader.contentLoaderInfo.addEventListener(Event.INIT, tilesLoadInit);
			
			//DrawTile()
			//request.load();
			//addChild(loader);
			//request.load("images/colorlayer6x6.jpg");
			//addChild(request);
			//}
			
		}
		
		private function DrawTile():void{
			FlashConnect.trace('DRAW TILE');
			//Create Image Size For Map											//Black
			imagedata = new BitmapData(screenmapwidth,screenmapheight,false,0x000000);//Create data image
			FlashConnect.trace("TILE:"+maptile);
			//FlashConnect.trace("mapltile Y:" + maptile.length);
			//FlashConnect.trace("mapltile X:" + maptile[0].length);
			
			var screentileheight:int = 0;
			var screentilewidth:int = 0;
			
			if (maptile.length < maprow){// row = y
				screentileheight = maptile.length;
			}else{
				screentileheight = maprow;
			}
			if (maptile[0].length < mapcol){ //col = x
				screentilewidth = maptile[0].length;
			}else{
				screentilewidth = mapcol;
			}
			//FlashConnect.trace('Height:' +screentileheight + 'Width'+ screentilewidth);
			//draw every new image block
			//beware that if the map tile is smaller from the map image size it will cause an error which will not render
			for (var rowCtr:int = 0; rowCtr < screentileheight; rowCtr++) {
				//FlashConnect.trace("ROW:"+rowCtr);
				for (var colCtr:int=0 ;colCtr <= screentilewidth; colCtr++) {
					//FlashConnect.trace("COL:"+colCtr);
					//Create Image Localtion
					var tilenum:int = int(maptile[rowCtr][colCtr]); //becareful in which order is it.
					//var tilenum:int = int(maptile[colCtr][rowCtr]);
					//FlashConnect.trace('Tile:' + tilenum);
					//set image position 
					var destinationx:int = colCtr*tilewidth;
					var destinationy:int = rowCtr*tileheight;
					//src from image to draw position
					var sourcex:int=(tilenum % 6)*tilewidth; //Tile layout is 6 by 6 and 32x32 pixel
					var sourcey:int=(int(tilenum/6))*tileheight; //tile layout 6 by 6 and 32x32 pixel
					//FlashConnect.trace('Tile postion:'+ sourcex + ':' + sourcey)
					
					//using src data image to add on to the current data tileimagedata > imagedata from the table
					imagedata.copyPixels(tileimagedata,
					new Rectangle(sourcex,sourcey,tilewidth,tileheight),
					new Point(destinationx,destinationy));
				}
			}
			
			//tileimagedata
			screendata =  new Bitmap(imagedata); //convert image to the format
			//screendata =  new Bitmap(tileimagedata);
			//add to the screen
			addChild(screendata);
			//SaveMapXml();
		}
		
		//SETUP LOADING THE MAP DATA
		private function loadmapxml():void{ 
			maploader.load(new URLRequest(mapfile));			
			maploader.addEventListener(Event.COMPLETE,loadmapxmlcomplete);			
			//FlashConnect.trace('LOAD MAP XML');			
		}
		
		//EXECUTE LOAD MAP DATA BASE FROM FILE
		private function loadmapxmlcomplete(e:Event):void { 
			//NOTE ADD IMAGE FILE FROM MAP DATA FILE
			xmlmap = new XML(e.target.data);
			FlashConnect.trace('LOAD MAP DATA XML COMPLETE');
			//{
			//FlashConnect.trace('MAP DATA:' + xmlmap);
			//FlashConnect.trace("X|"+ xmlmap.name());
			//FlashConnect.trace("X|"+ xmlmap.children().length());
			//FlashConnect.trace("R|"+ xmlmap.children()[0].name() + ":" + xmlmap.children().length());
			//show the name of the table												//show first table and count the table with in
			//FlashConnect.trace("C|"+ xmlmap.children().children()[0].name() + ":" + xmlmap.children()[0].children().length() );
			//																			//This will count same type of data in total		
			//FlashConnect.trace("X|"+ xmlmap.children().children()[0].name() + ":" + xmlmap.children().children().length() );
			//FlashConnect.trace("C|"+ xmlmap.children().children()[0].name() + ":" + xmlmap.children()[0].children()[2] );			
			//}
			var aTileMap:Array = new Array();
			//LOOP ADD MAP TILE TABLE DATABASE
			for (var rowCtr:int = 0; rowCtr < xmlmap.children().children().length(); rowCtr++) {
				var tempArray:Array=new Array();
				//FlashConnect.trace("row=" + rowCtr);
				for (var colCtr:int = 0;colCtr < xmlmap.children().children()[0].children().length(); colCtr++) {
					//FlashConnect.trace("col=" + colCtr);
					tempArray.push(xmlmap.children().children()[rowCtr].children()[colCtr]);
					//FlashConnect.trace('COL:' + xmlmap.children()[rowCtr].children());
				}
				aTileMap.push(tempArray);
				//FlashConnect.trace('COL:' + tempArray.length);
			}
			//{ DEBUG
			//FlashConnect.trace("aTileMap:" + aTileMap);
			//FlashConnect.trace("aTileMap:" + aTileMap[0][1]);
			//FlashConnect.trace("aTileMap:" + aTileMap[1]);
			//FlashConnect.trace("aTileMap:" + aTileMap[2]);
			//}
			//for making a new map to load this would be easy when codes are added on more later
			maptile = aTileMap;
			//FlashConnect.trace("mapltile:" + maptile.length);
			//This will execute image load area
			//loader.load(new URLRequest("data/images/colorlayer6x6.jpg"));
			
			//Loading up with image from map file data
			loader.load(new URLRequest(xmlmap.image.location));
			loader.contentLoaderInfo.addEventListener(Event.INIT, tilesLoadInit);			
		}
		
		//SAVE MAP DATA TO THE DATABASE
		public function SaveMapXml():void {
			FlashConnect.trace('MAP SETUP');
			variables.mapname = mapname;
			variables.mapdata = xmlmap;
			variables.memberid = 'admin';
			variables.access = '0';
			variables.submittype = 'save';
			request.url = 'scripts/map/map.php';
			request.data = variables;
			loader.load(request);
			loader.addEventListener(Event.COMPLETE,SaveMapCOMPLETE);
		}
		
		//Tell you when the file is save
		public function SaveMapCOMPLETE(event:Event):void {
			FlashConnect.trace("DONE");
			//playerxml = new XML(event.target.data);
		} 
		
		private function tilesLoadInit (e:Event):void {
			FlashConnect.trace('LOAD IMAGE');
			tileimagedata=Bitmap(loader.content).bitmapData;
			//{ DEBUG
			//Test if image work when loaded correctly
			//screendata =  new Bitmap(tileimagedata); //convert image to the format
			//screendata =  new Bitmap(imagedata); //convert image to the format
			//addChild(screendata);			
			//}
			DrawTile();
			KEY_EVENT();
		}
		
		public function KEY_EVENT():void{
			FlashConnect.trace('KEYBOARD');
			var KB_RIGHT:Boolean = false;
			var KB_LEFT:Boolean = false;
			var KB_DOWN:Boolean = false;
			var KB_UP:Boolean = false;
			var keysDown:Array = new Array();
			
			var image_url:String = "data/images/darkaif_player_tmp.png";
			var imagetest:Loader = new Loader();
			var request:URLRequest = new URLRequest(image_url);
			imagetest.load(request);
			addChild(imagetest);
			
			
			var key:TextField = new TextField();
			key.width = 200;
			key.text = "Key:[R]" + KB_RIGHT + "[L]" + KB_LEFT + "[U]" + KB_UP + "[D]" + KB_DOWN;
			//addChild(key);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			
			function addKey(e:KeyboardEvent):void {
				keysDown[e.keyCode] = true;
				//FlashConnect.trace(String(keysDown[e.keyCode]));
				//FlashConnect.trace("addKey!");
			}
			function removeKey(e:KeyboardEvent):void {
				keysDown[e.keyCode] = false;
				//FlashConnect.trace(String(keysDown[e.keyCode]));
				//FlashConnect.trace("removeKey");
			}
			// here's how you'd implement it:
			var t:Timer = new Timer(25);
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			
			function tick(e:TimerEvent):void {
				//FlashConnect.trace("tick");
				// old way- if (Key.isDown(Key.RIGHT)) {
				if (keysDown[Keyboard.RIGHT]) {
					//FlashConnect.trace("right key is down!");
					KB_RIGHT = true;
					imagetest.x = imagetest.x + 1;
				}else if (keysDown[Keyboard.LEFT]) {
					//FlashConnect.trace("Left key is down!");
					KB_LEFT = true;
					imagetest.x = imagetest.x - 1;
				}else{
					KB_LEFT = false;
					KB_RIGHT = false;
				}
				if (keysDown[Keyboard.UP]) {
					//FlashConnect.trace("Up key is down!");
					KB_UP = true;
					imagetest.y = imagetest.y - 1;
				}else if (keysDown[Keyboard.DOWN]) {
					//FlashConnect.trace("Down key is down!");
					KB_DOWN = true;
					imagetest.y = imagetest.y + 1;
				}else{
					KB_DOWN = false;
					KB_UP = false;
				}
				
				//Check for border limit area
				if (imagetest.x <= 0) {
					imagetest.x = 0;
				}else if (imagetest.x >= (maptile.length) * tileheight) {
					imagetest.x = (maptile.length) * tileheight;
					
				}
				//check for border limit
				if (imagetest.y <= 0) {
					imagetest.y = 0;
				}else if (imagetest.y >= (maptile[0].length) * tilewidth) {
					imagetest.y = (maptile[0].length) * tilewidth;
				}
				
				key.text = "Key:[R]" + KB_RIGHT + "[L]" + KB_LEFT + "[U]" + KB_UP + "[D]" + KB_DOWN;
			// etc.
			}			
		}
		
	}
	
}

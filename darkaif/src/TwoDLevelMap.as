/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* Work on the flow of the map tiles images.
	* Requried:
	* -xml
	* -images
	*/
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: 
	* 	This game editor will deal with the debugger and full function area. This area can be unstable
	* and underdeterime functions that the game can crash or show error durig game play. This will build
	* for maps, interacting object and creating menu and submenu that apply for parent code and branch 
	* off as the child.
	* 
	* To DO list:
	* Add/Remove Row and Colum to the map
	* Save, Load, and New Map function
	* Loading:
	* -Map Data
	* -Image Data
	* Collision:
	* -Tiles
	* -Monster
	* -NPC
	* -Player
	* 
	* Screen Size: 375:500
	* 
	*/
	//{IMPORT PACKAGE
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLLoader;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.events.Event;
	import org.flashdevelop.utils.FlashConnect;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	//}

	public class TwoDLevelMap extends Sprite{
		//{VARIABLE
		private var Name:String = "Level Editor";
		//private var _height:uint = 375;
		//private var _width:uint = 500;
		public var EditorDebug:Boolean = true;
		public var keysDown:Array = new Array();
		
		public var player:Array = new Array(0, 0);
		public var oldplayer:Array = new Array(0,0);
		
		//{MAP OUTPUT DATA		
		public var MapArray_Layout:Array;		
		public var MapArray_Layer_Image:Array;
		public var MapArray_Layer_Object:Array;
		
		public var xmlmap:XML = new XML();						//xml load data for map
		public var maploader:URLLoader = new URLLoader();
		public var maptile:Array =  new Array();				//Map table tile
		public var mapcollision:Array = new Array();			//map collision
		//}
		
		//{Map Data format
		public var maprow:int = 10;								//set map row for limit
		public var mapcol:int = 10;								//set map col for limit
		public var tilesize:int = 32;
		public var tileheight:int = 32;						//Create tile height
		public var tilewidth:int = 32;						//Create tile width
		public var screenmapheight:int = maprow * tileheight; //Create image size for tile screen
		public var screenmapwidth:int = mapcol * tilewidth;	//Create Image Size for tile screen
		//}
		
		//{IMAGE DATA
		public var tileimagedata:BitmapData;					//This for image tile src
		public var imagedata:BitmapData;						//image data
		public var screendata:Bitmap;							//Create Map Image For Screen Output
		//}
		
		//{MUSIC INFORMATION
		public var musicdir:String = 'data/audio/sounds/';
		public var musicext:String = '.mp3';
		public var musicname:String = 'Bliss';
		public var musicfile:String = musicdir + musicname + musicext;
		
		public var s:Sound = new Sound();
		public var song:SoundChannel = new SoundChannel();
		//}
		
		//{SOUND INFORMATION
		public var sounddir:String = 'data/audio/sounds';
		public var soundext:String = '.mp3';
		public var soundname:String = 'map_med';
		public var soundfile:String = mapdir + mapname + mapext;
		//}
		
		//{MAP FILE INFORMATION
		public var mapdir:String = 'data/maps/';
		public var mapext:String = '.xml';
		public var mapname:String = 'map_med';
		public var mapfile:String = mapdir + mapname + mapext;
		//}
		
		//{DATA TRANSFAR
		public var loader:Loader = new Loader();
		public var xmlloader:URLLoader = new URLLoader();
		public var imageloader:URLLoader = new URLLoader();
		public var request:URLRequest = new URLRequest();
		public var variables:URLVariables = new URLVariables();
		//}
		
		//{GAMEDATA
		public var GameData:Array = new Array();
		//GameData = (['soundlevel' = 0, 'musiclevel' = 0, 'bgmlevel' = 0]);
		//}GAMEDATA		
		//}VARIABLE
		
		//Basic Setup.
		public function TwoDLevelMap() {
			FlashConnect.trace("INIT..");
			FlashConnect.trace(stage.stageHeight + ":" + stage.stageWidth);
			IntMapXML();
			//InitBGM();
		}
		
		//loading the basic data information
		public function InitData():void {
			/**
			 * GAME DATA BASIC
			 * object id -This is an important code for cleaning up stuff from ram used
			 * object name
			 * object basic information
			 * object collision
			 * object position 
			 * status bar
			 * object actions
			 * image size
			 * image show/show off
			 * 
			 */
			var MonstersData:Array = new Array();
			var NpcsData:Array = new Array();
			var PlayesrData:Array = new Array();
			var BuildingData:Array = new Array();
			var ObjectData:Array = new Array();
			
		}
		
		//INIT PLAYER IMAGE
		public function InitPlayerImage():void {
			var image_url:String = "data/images/darkaif_player_tmp.png";
			var imagetest:Loader = new Loader();
			imagetest.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			var request:URLRequest = new URLRequest(image_url);
			imagetest.load(request);
			addChild(imagetest);
			
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
			// here's how you'd implement it:
			var t:Timer = new Timer(25);
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			
			function tick(e:TimerEvent):void {
				//FlashConnect.trace("tick");
				//This will update player postion
				oldplayer[0] = player[0];
				oldplayer[1] = player[1];
				
				if (keysDown[Keyboard.RIGHT]) {
					//FlashConnect.trace("right key is down!");
					//KB_RIGHT = true;
					player[0] = player[0] + 1;
				}else if (keysDown[Keyboard.LEFT]) {
					//FlashConnect.trace("Left key is down!");
					//KB_LEFT = true;
					player[0] = player[0] - 1;
				}else{
					//KB_LEFT = false;
					//KB_RIGHT = false;
				}
				if (keysDown[Keyboard.UP]) {
					//FlashConnect.trace("Up key is down!");
					//KB_UP = true;
					player[1] = player[1] - 1;
				}else if (keysDown[Keyboard.DOWN]) {
					//FlashConnect.trace("Down key is down!");
					//KB_DOWN = true;
					player[1] = player[1] + 1;
				}else{
					//KB_DOWN = false;
					//KB_UP = false;
				}
				
				//Check for border limit area
				/*
				if (player[1] <= 0) {
					player[1] = 0;
				}else if (player[1] >= (maptile.length) * tileheight) {
					player[1] = (maptile.length) * tileheight;					
				//IF map tile matches the collision tile to not move
				}else if (mapcollision[[int(player[1]/tileheight)]][int(player[0]/tilewidth)]  == '01' ) {
					player[1] = oldplayer[1];					
				}
				
				//check for border limit
				if (player[0]<= 0) {
					player[0] = 0;
				}else if (player[0] >= (maptile[0].length) * tilewidth) {
					imagetest.y = (maptile[0].length) * tilewidth;
				//IF map tile matches the collision tile to not move
				}else if (mapcollision[[int(player[1]/tileheight)]][int(player[0]/tilewidth)]  == '01' ) {
					player[0] = oldplayer[0];					
				}
				*/
				//player image
				//imagetest.x = player[0];
				//imagetest.y = player[1];
				
				var imagex:int = player[0];
				var imagey:int = player[1];
				
				//player x position
				if (player[0] < (int(mapcol*tilesize)/2) ) {
					imagetest.x = player[0];
					//FlashConnect.trace("1:");
				}else if ( (player[0] >= (mapcol * tilesize) / 2) && (player[0] <= ((maptile[0].length - int(mapcol / 2)) * tilesize)) ) {
					imagetest.x = ((mapcol * tilesize) / 2);
					//FlashConnect.trace("2:");
				}else if (player[0] > ((maptile[0].length - int(mapcol / 2)) * tilesize)){
					//FlashConnect.trace("3:");
					imagetest.x = player[0] -  ((maptile[0].length - (mapcol) ) * tilesize);
					//{
					//imagetest.x = ((mapcol / 2) * tilesize) * (player[0] / (maptile[0].length * tilesize)) * 1;
					//imagetest.x =  ((maptile[0].length - int(mapcol/2))* tilesize) + player[0];
					//imagetest.x = ((mapcol / 2) * tilesize) + ((mapcol / 2) * tilesize) * (player[0] / (maptile[0].length * tilesize));
					//imagetest.x = ((mapcol * tilesize / 2) + ((mapcol * tilesize / 2) * (player[0] / (maptile[0].length * tilesize))));
					//FlashConnect.trace(("D" + ((mapcol * tilesize / 2) * (player[0] / (maptile[0].length * tilesize))) );
					//FlashConnect.trace("D:"+(maptile[0].length - int(mapcol / 2))+":"+player[0]);
					//}
				}
				
				//player  y position
				if (player[1] < (int(maprow*tilesize)/2) ) {
					imagetest.y = player[1];
					//FlashConnect.trace("1:");
				}else if ( (player[1] >= (mapcol * tilesize) / 2) && (player[1] <= ((maptile.length - int(mapcol / 2)) * tilesize)) ) {
					imagetest.y = ((maprow * tilesize) / 2);
					//FlashConnect.trace("2:");
				}else if (player[1] > ((maptile.length - int(maprow / 2)) * tilesize)){
					//FlashConnect.trace("3:");
					imagetest.y = player[1] -  ((maptile.length - (maprow) ) * tilesize);
					//FlashConnect.trace("D:"+(maptile.length - int(maprow / 2))+":"+player[1]);
				}
				
				screendata.x = player[0];
				screendata.y = player[1];
				removeChild(imagetest);
				removeChild(screendata);
				screendata = TileRender();
				addChild(screendata);
				addChild(imagetest);
			}
			
			function onComplete(ev:Event):void{
				var imagetest:LoaderInfo = LoaderInfo(ev.target);
				//FlashConnect.trace('DONE-');
			}
			
		}
		
		public function IntMapXML():void {
			FlashConnect.trace('INIT... MAP...');
			//Loading the data map from xml file
			xmlloader.load(new URLRequest(mapfile));
			xmlloader.addEventListener(Event.COMPLETE,MapXMLComplete);
		}
		
		//LOADING MAP DATA INTO ARRAY
		public function MapXMLComplete(e:Event):void {
			FlashConnect.trace('LOAD MAP DATA XML COMPLETE');
			xmlmap = new XML(e.target.data);
			
			var aTileMap:Array = new Array();
			var cTileMap:Array = new Array();
			
			//mapcollision
			//LOOP ADD MAP TILE TABLE DATABASE
			for (var rowCtr:int = 0; rowCtr < xmlmap.tile.children().length(); rowCtr++) {
				var tempArray:Array=new Array();
				for (var colCtr:int = 0;colCtr < xmlmap.children().children()[0].children().length(); colCtr++) {
					tempArray.push(xmlmap.children().children()[rowCtr].children()[colCtr]);
				}
				aTileMap.push(tempArray);
			}
			
			for (var crowCtr:int = 0; crowCtr < xmlmap.collision.children().length(); crowCtr++) {
				var ctempArray:Array=new Array();
				for (var ccolCtr:int = 0;ccolCtr < xmlmap.collision.children()[0].children().length(); ccolCtr++) {
					ctempArray.push(xmlmap.collision.children()[crowCtr].children()[ccolCtr]);
					//FlashConnect.trace('C:' + xmlmap.collision.children()[crowCtr].children()[ccolCtr]);
				}
				cTileMap.push(ctempArray);
			}
			mapcollision = cTileMap;
			
			
			//FlashConnect.trace('C:' + mapcollision.length + ":" + mapcollision[0].length);
			//for making a new map to load this would be easy when codes are added on more later
			maptile = aTileMap;
			//This will execute image load area
			//loader.load(new URLRequest("data/images/colorlayer6x6.jpg"));
			
			FlashConnect.trace("TILE:X" + maptile.length +" MAP WIDTH:" +(maptile.length * tilesize));
			FlashConnect.trace("TILE:Y" + maptile[0].length +" MAP HEIGHT:" +(maptile[0].length * tilesize));
			FlashConnect.trace("TILE:Height:" +(maprow * tilesize));
			FlashConnect.trace("TILE:Width:" +(mapcol * tilesize));
			
			//Loading up with image from map file data
			//FlashConnect.trace('IMAGE DATA XML:' +xmlmap.image.location);
			//FlashConnect.trace('IMAGE DATA XML:' +xmlmap.name);
			loader.load(new URLRequest(xmlmap.image.location));
			loader.contentLoaderInfo.addEventListener(Event.INIT, InitTilesLoad);						
		}
		
		//MAP START LOADING IMAGE
		public function InitTilesLoad(e:Event):void {
			FlashConnect.trace('IMAGE LOADED');
			tileimagedata = Bitmap(e.target.content).bitmapData;
			screendata = TileRender();
			addChild(screendata);
			
			InitPlayerImage();
			//DrawTile();
		}
		
		//DRAW IMAGE TILE
		public function DrawTile():void{
			FlashConnect.trace('DRAW TILE');
			//Create Image Size For Map											//Black screen 0x000000
			imagedata = new BitmapData(screenmapwidth,screenmapheight,false,0x000000);//Create data image
			//FlashConnect.trace("TILE:"+maptile);
			//FlashConnect.trace("mapltile Y:" + maptile.length);
			//FlashConnect.trace("mapltile X:" + maptile[0].length);
			
			var screentileheight:int = 0;
			var screentilewidth:int = 0;
			
			if (maptile.length < maprow){// row = y
				screentileheight = maptile[0].length;
			}else{
				screentileheight = maprow;
			}
			if (maptile[0].length < mapcol){ //col = x
				screentilewidth = maptile.length;
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
					var sourcex:int= ((tilenum % 6)*tilewidth); //Tile layout is 6 by 6 and 32x32 pixel
					var sourcey:int=((tilenum/6)*tileheight); //tile layout 6 by 6 and 32x32 pixel
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
			
			InitPlayerImage();
		}
		
		//IMAGE RETURN TO BITMAP
		public function TileRender():Bitmap{
			//FlashConnect.trace('DRAW TILE');
			//Create Image Size For Map											//Black
			//imagedata = new BitmapData(screenmapwidth + 32 * 2, screenmapheight + 32 * 2, false, 0x000000);//Create data image
			imagedata = new BitmapData(screenmapwidth, screenmapheight, false, 0x000000);//Create data image
			//FlashConnect.trace('Width:'+(screenmapwidth)+'Height:'+ (screenmapheight));
			var TileStart_x:int = 0;		
			var TileStart_y:int = 0;
			var bg_x:int = 0;
			var bg_y:int = 0;
			
			//THIS MOVE THE TILE MAP ONLY USING PLAYER POSITION
			//IF Map is half screen do not move
			if (player[0] <= ((mapcol * tilesize)/2)) {
				TileStart_x = 0; //Image Block Render
				bg_x = 0; //image move in pixel
				//if map is half is mini from map size and map size is half mini screen then move the tile map
			}else if ((player[0] > ((mapcol * tilesize)/2)) && (player[0] < (((maptile[0].length - int(mapcol/2)) * tilesize))) ){
				TileStart_x = int((player[0] / tilesize)) - int(maprow / 2); //Image Block Render
				bg_x =  player[0] - int(mapcol / 2)*32; //image move in pixel
				//if map size maap mini screen map do not move the tile map at the end
			}else if (player[0] >= (((maptile[0].length - int(mapcol/2)) * tilesize))){
				TileStart_x = maptile[0].length - mapcol; //Image Block Render
				bg_x = int(maptile[0].length - mapcol)*32; //image move in pixel
			}
			
			//THIS MOVE THE TILE MAP ONLY USING PLAYER POSITION
			if (player[1] <= ((maprow * tilesize)/2)) {
				TileStart_y = 0; //Image Block Render
				//This will move the map image position
				bg_y = 0; //image move in pixel
				//if map is half is mini from map size and map size is half mini screen then move the tile map
			}else if ((player[1] > ((maprow * tilesize)/2)) && (player[1] < (((maptile.length - int(maprow/2)) * tilesize))) ){
				TileStart_y = int((player[1] / tilesize)) - int(maprow / 2);//Image Block Render
				bg_y =  player[1] - int(maprow / 2)*32; //image move in pixel
				//if map size maap mini screen map do not move the tile map at the end
			}else if (player[1] >= (((maptile.length - int(maprow/2)) * tilesize))){
				TileStart_y = maptile.length - maprow;//Image Block Render
				bg_y = int(maptile.length - maprow)*32; //image move in pixel
			}
			
			var TileEnd_x:int = TileStart_x + mapcol;
			var TileEnd_y:int = TileStart_y + maprow + 1; //fix error on array iusse or not or image bitmap
			
			//FlashConnect.trace("X:" + TileStart_x + ":" + TileEnd_x);
			//FlashConnect.trace("X:"+TileStart_y+":"+TileEnd_y);
			
			//this will check if the map is bigger than the player or less if the map is too small.
			if (TileEnd_x > maptile[0].length) {
				TileEnd_x > maptile[0].length;
			}else if (TileEnd_x < maptile[0].length) {
				TileEnd_x = maptile[0].length;
			}
			//this will check if the map is bigger than the player or less if the map is too small.
			if (TileEnd_y > maptile.length) {
				TileEnd_y = maptile.length;
			}else if (TileEnd_y < maptile.length) {
				TileEnd_y = maptile.length;
			}
			
			//FlashConnect.trace('Width:'+(TileEnd_x)+'Height:'+ (TileEnd_y));
			
			//{DRAW IMAGE TILE
			//draw every new image block
			//beware that if the map tile is smaller from the map image size it will cause an error which will not render
			for (var rowCtr:int = TileStart_y; rowCtr < TileEnd_y; rowCtr++) {
				//FlashConnect.trace("ROW:"+rowCtr);
				for (var colCtr:int=TileStart_x ;colCtr <= TileEnd_x; colCtr++) {
					//FlashConnect.trace("COL:"+colCtr);
					//Create Image Localtion
					var tilenum:int = int(maptile[rowCtr][colCtr]); //becareful in which order is it.
					//var tilenum:int = int(maptile[colCtr][rowCtr]);
					//FlashConnect.trace('Tile:' + tilenum);
					//set image position 
					//var destinationx:int = ((colCtr - TileStart_x) * tilewidth);
					//var destinationy:int = ((rowCtr - TileStart_y) * tileheight);
					
					var destinationx:int = ((colCtr) * tilewidth) - bg_x;
					var destinationy:int = ((rowCtr) * tileheight) - bg_y;
					
					//src from image to draw position
					var sourcex:int=(tilenum % 6)*tilewidth; //Tile layout is 6 by 6 and 32x32 pixel
					var sourcey:int=(int(tilenum/6))*tileheight; //tile layout 6 by 6 and 32x32 pixel
					//FlashConnect.trace('Tile postion:'+ sourcex + ':' + sourcey)
					
					//using src data image to add on to the current data tileimagedata > imagedata from the table
					imagedata.copyPixels(tileimagedata,
					new Rectangle(sourcex, sourcey, tilewidth, tileheight),
					new Point(destinationx,destinationy));
				}
			}
			//}
			
			//tileimagedata
			screendata =  new Bitmap(imagedata); //convert image to the format
			//screendata =  new Bitmap(tileimagedata);
			//add to the screen
			return screendata; //RETURN Bitmap IMAGE DATA
		}
		
		//BACKGROUNG MUSIC
		public function InitBGM():void {
			FlashConnect.trace('SOUND..' + musicfile);
			s.load(new URLRequest(musicfile));
			var song:SoundChannel = s.play();			
		}
		
	}
}

/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* Information:Creating simple version just with the graphics.
	* 
	* Stage 1:
	* Build player image and return current postion.
	* 
	* Stage 2:
	* work on muilt player iamges
	* 
	* -AdminMultiPlayerTest.as
	* -MultiPlayerTest.as
	*/
	//{PACKAGE
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import org.flashdevelop.utils.FlashConnect;
	//}PACKAGE
	public class AdminMultiPlayerTest extends Sprite{
		//{VARIABLES
		public var PColor:uint = 0xEFEFEF;
		public var PHeight:Number = 16;
		public var PWidth:Number = 16;
		public var variables:URLVariables = new URLVariables();
		public var request:URLRequest = new URLRequest();
		public var loader:URLLoader = new URLLoader();
		public var KB_RIGHT:Boolean = false;
		public var KB_LEFT:Boolean = false;
		public var KB_DOWN:Boolean = false;
		public var KB_UP:Boolean = false;
		public var Player_x:Number = 0;
		public var Player_y:Number = 0;
		public var keysDown:Array = new Array();
		public var tr:Timer =  new Timer(25);
		public var t:Timer = new Timer(50);
		public var Player:Array = new Array();
		public var playerxml:XML = new XML();
		//}VARIABLES
		
		public function AdminMultiPlayerTest() {
			
			//{VARIABLES
			variables.name = 'admin';
			variables.map = 'none';
			variables.x;
			variables.y;			
			
			//request.url = 'scripts/player/update_player.php';
			//variables.x = Player_x;
			//variables.y = Player_y;
			//request.data = variables;
			//loader.load(request);
			//loader.addEventListener(Event.COMPLETE,LoadDataPlayer);
			
			//}VARIABLES
			//Player[0] = ['name01',0,0];
			//Player[1] = ['name02',32,32];
			//Player[2] = ['name03',64,64];
			PlayerMove();
			
			tr.start();
			tr.addEventListener(TimerEvent.TIMER,RenderPlayerImage, false, 0, true);
			
			//Draw PLayer Images Just For Basic Graphic
			function RenderPlayerImage():void{
				//FlashConnect.trace('CALL');	
				graphics.clear();
				for(var i:int ;i < Player.length;i++){
					//DrawObjectPostion(Player[i][1],Player[i][2]);
					//FlashConnect(Player[i][1] + ":" +Player[i][2])
					DrawObjectPostion(Player[i][1],Player[i][2]);
					//FlashConnect.trace("Player:" + Player[i][0] + ":" +Player[i][1] + ":" +Player[i][2]);
				}
				//FlashConnect.trace("Player Image");
				//FlashConnect.trace("LOAD DATA");
			}
			
		}
		
		//Load Player Data for xml to array
		public function LoadDataPlayer(event:Event):void {
			//FlashConnect.trace("DONE");
			playerxml = new XML(event.target.data);
			var objectplayer:Array = new Array();
			//FlashConnect.trace("X:" + playerxml.children().children().length());
			//FlashConnect.trace("X:" + playerxml.children().length());
			//Update Data Array
			for(var i:int ;i < playerxml.children().length() ;i++){					
				objectplayer[i] = [playerxml.children()[i].children()[0],playerxml.children()[i].children()[2],playerxml.children()[i].children()[3]];
				//If player match name set player position
				if (playerxml.children()[i].children()[0] == variables.name){
					Player_x = playerxml.children()[i].children()[2];
					Player_y = playerxml.children()[i].children()[3];
				}
				//FlashConnect.trace("Player:" + playerxml.children()[i].children()[0]);
				//FlashConnect.trace("Player:" + i);
			}
			Player = objectplayer;
		} 
		
		public function PlayerMove():void{			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			t.start();
			t.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			
			//If key is true set key true
			function addKey(e:KeyboardEvent):void {
				keysDown[e.keyCode] = true; //FlashConnect.trace(String(keysDown[e.keyCode]));
				//FlashConnect.trace("addKey!");
			}
			//If key is release set key false
			function removeKey(e:KeyboardEvent):void {
				keysDown[e.keyCode] = false; //FlashConnect.trace(String(keysDown[e.keyCode]));
				//FlashConnect.trace("removeKey");
			}
			
			//Key Event
			function tick(e:TimerEvent):void {
				//FlashConnect.trace("tick");
				if (keysDown[Keyboard.RIGHT]) {
					//FlashConnect.trace("right key is down!");
					KB_RIGHT = true;
					Player_x = Player_x + 1;
				}else if (keysDown[Keyboard.LEFT]) {
					//FlashConnect.trace("Left key is down!");
					KB_LEFT = true;
					Player_x = Player_x - 1;
				}else{
					KB_LEFT = false;
					KB_RIGHT = false;
				}
				if (keysDown[Keyboard.UP]) {
					//FlashConnect.trace("Up key is down!");
					KB_UP = true;
					Player_y = Player_y - 1;
				}else if (keysDown[Keyboard.DOWN]) {
					//FlashConnect.trace("Down key is down!");
					KB_DOWN = true;
					Player_y = Player_y + 1;
				}else{
					KB_DOWN = false;
					KB_UP = false;
				}
				//DrawObjectPostion(Player_x,Player_y);
				request.url = 'http://localhost/darkaif/scripts/player/update_player.php';
				variables.x = Player_x;
				variables.y = Player_y;
				request.data = variables;
				loader.load(request);
				loader.addEventListener(Event.COMPLETE,LoadDataPlayer);
				
			}//tick timer			
		}//End player move
		
		public function DrawObjectPostion(x:Number,y:Number):void{ //Graphic 
			//graphics.clear(); //This will clear all the data from the object
			graphics.beginFill(PColor); //Fill the first Layer
			graphics.drawRect(x,y,(PWidth),PHeight); //First Image Layer
		}
	}
	
}

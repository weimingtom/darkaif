package darkaif.gametype.rpg.item {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Leave get data from server later just build simple or some what.
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
	public class ItemDataBase {
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
		
		public function ItemDataBase() {
			request.url = 'http://localhost/darkaif/scripts/player/update_player.php';
			variables.x = Player_x;
			variables.y = Player_y;
			request.data = variables;
			loader.load(request);
			loader.addEventListener(Event.COMPLETE,LoadDataPlayer);
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
		
		public function get playerx():int {
			FlashConnect.trace(String(this.Player_x));
			return this.Player_x;
		}
		
	}
	
}

/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/

/*
* Information: This is added controls for keyboard events.
* 
* Error: While the file is still downloading if you seek ahead it will cause an error that the file is still not done.
* I have not fix this part yet.
* 
* Controls:
* space - pause or resume
* right - seek ahead
* left - seek back
* 
*/

/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

package  {
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.text.TextField;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import org.flashdevelop.utils.FlashConnect;

	public class flvsimple01 extends Sprite{
		public var Flv_Url:String = "http://purecodeas3.googlecode.com/svn/trunk/videos/flashtest.flv";
		public var Flv_TotalTime:Number = 0;
		public var Flv_DefaultSeek:Number = 5;
		
		public function flvsimple01() {
			SimpleFlv();
		}
		
		public function SimpleFlv():void{
			var myVideo:Video = new Video();
            addChild(myVideo);
            var nc:NetConnection = new NetConnection();
            nc.connect(null);
            var ns:NetStream = new NetStream(nc);
            myVideo.attachNetStream(ns);
			var request:URLRequest = new URLRequest(Flv_Url);
            ns.play(Flv_Url); //This has be url site else it will work not work.

            // onMetaData - need this to not show error
            var netClient:Object = new Object();
            netClient.onMetaData = function(meta:Object):void {
            Flv_TotalTime = meta.duration; //total time for .flv
			//trace(meta.duration); //total time for .flv
            };
            ns.client = netClient;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN,flv_keycontrol);
			
			var t:Timer = new Timer(25);
			t.start(); //Start Timer
			t.addEventListener(TimerEvent.TIMER,UpDateTime); //Update Text Time

			function flv_keycontrol(event:KeyboardEvent):void{
				FlashConnect.trace("KEY:" + event.keyCode);
				
				if (event.keyCode == 32){ //Space key
					ns.togglePause();
				}
				if (event.keyCode == 39){ //Right key
					//This check current time is bigger then total Time.
					FlashConnect.trace("TIME:" + ns.time);
					if (ns.time +  Flv_DefaultSeek <= Flv_TotalTime){ 
						ns.seek(ns.time + Flv_DefaultSeek); //Seek time + 5 sec
					}
				}
				if (event.keyCode == 37){ //Left key
					ns.seek(ns.time - Flv_DefaultSeek); //Seek time - 5 sec
					FlashConnect.trace("TIME:" + ns.time); 
				}
			}
			
			var Text_Time:TextField = new TextField();
			Text_Time.y = myVideo.height;
			Text_Time.text = "0/0";
			addChild(Text_Time);
			
			function UpDateTime():void{
				Text_Time.text = "Time:[" + Math.floor(ns.time) + "/" + Math.floor(Flv_TotalTime) + "]"; // this in secconds
			}
		}
	}
}

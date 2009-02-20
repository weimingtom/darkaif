/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/

/*
* Information: This is more detail about file loading. How Much time you play while the file is download loading.
* 
* Error: Some error seek if you press to quick. Fixed Seek a bit.
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

	public class flvsimple02 extends Sprite{
		public var Flv_Url:String = "http://purecodeas3.googlecode.com/svn/trunk/videos/flashtest.flv";
		//public var Flv_Url:String = "http://localhost/flashtest.flv";
		public var Flv_TotalTime:Number = 0;
		public var Flv_DefaultSeek:Number = 5;
		public var Flv_LoadPercent:Number = 0;
		
		public function flvsimple02() {
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
			t.addEventListener(TimerEvent.TIMER,UpdateLoadPercent);
			
			function flv_keycontrol(event:KeyboardEvent):void{
				FlashConnect.trace("KEY:" + event.keyCode);
				
				if (event.keyCode == 32){ //Space key
					ns.togglePause();
				}
				if (event.keyCode == 39){ //Right key
					//This check current time is bigger then total Time.
					
					// If loaded byte download that is current load do not seek ahead.
					var TimeLine:Number = Math.floor(Flv_TotalTime*(Flv_LoadPercent/100));
					if ((ns.time + Flv_DefaultSeek) > TimeLine){ //If time seek out the video time show error
						//ns.seek(ns.time - 0.1);
						FlashConnect.trace("TIME:ERROR");
					}else{ //else seek 
						ns.seek(ns.time + Flv_DefaultSeek); //Seek time + 5 sec
						FlashConnect.trace("TIME:ADEAD");
					}
					FlashConnect.trace("TIME:" + ns.time + ":"+TimeLine);
				}
				if (event.keyCode == 37){ //Left key
					ns.seek(ns.time - Flv_DefaultSeek); //Seek time - 5 sec
					FlashConnect.trace("TIME:" + ns.time); 
				}
			}
			
			var Text_Time:TextField = new TextField(); //Create Text Time
			Text_Time.y = myVideo.height;
			Text_Time.text = "Time:[0/0]";
			addChild(Text_Time);
			
			var Text_LoadBtye:TextField = new TextField(); //Create Text for loading much byte is download
			Text_LoadBtye.y = myVideo.height + 22;
			Text_LoadBtye.width = 256; //This create more space than the deafult width.
			Text_LoadBtye.text = "Byte:[0/0]";
			addChild(Text_LoadBtye);
			
			function UpdateLoadPercent():void{ //Show Loaded Byte, Percent, LoadTime
				Flv_LoadPercent = Math.round((ns.bytesLoaded/ns.bytesTotal)*100);
				Text_LoadBtye.text = "Byte:[" + ns.bytesLoaded + "/" + ns.bytesTotal + "]" + Flv_LoadPercent + "% Time Load:" + Math.floor(Flv_TotalTime*(Flv_LoadPercent/100));
				//FlashConnect.trace("DELAY:" + ns.bufferLength);				
			}
			function UpDateTime():void{ //Show Current Time
				Text_Time.text = "Time:[" + Math.floor(ns.time) + "/" + Math.floor(Flv_TotalTime) + "]"; // this in secconds
				
			}
		}
	}
}
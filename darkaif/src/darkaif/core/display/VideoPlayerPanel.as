/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.core.display {
	
	//{ package
	import darkaif.core.display.Button;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.media.SoundTransform;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	//}
	import org.flashdevelop.utils.FlashConnect;
	
	/**
	 * ...
	 * @author @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	 */
	
	[SWF(width="320", height="256", backgroundColor="#FFFFFF", frameRate="30")]
	public class VideoPlayerPanel extends Sprite
	{
		
		//{ variables
		public var urlvideo:String = "http://purecodeas3.googlecode.com/svn/trunk/videos/flashtest.flv";
		//public var urlvideo:String = "";
		public var myVideo:Video = new Video(320,240);
		//public var request:URLRequest = new URLRequest(urlvideo);
		public var Flv_TotalTime:Number = 0;
		public var Flv_DefaultSeek:Number = 5;
		public var Flv_LoadPercent:Number = 0;
		public var Flv_toggle:Boolean = false;
		public var LoadPercent:Number = 0;
		public var netClient:Object = new Object();
		public var nc:NetConnection = new NetConnection();
		//public var ns:NetStream = new NetStream(nc);
		public var ns:NetStream;
		public var LoadBarImage:Shape = new Shape;
		public var Text_LoadBtye:TextField = new TextField(); //Create Text for loading much byte is download
		public var Text_Time:TextField = new TextField(); //Create Text Time
		public var Button_volup:Button = new Button("+");
		public var Button_voldown:Button = new Button("-");
		public var videovolume:SoundTransform = new SoundTransform();
		//}
		
		public function VideoPlayerPanel(){
			graphics.beginFill(0x808080);
			graphics.drawRect(0, 0, 320, 240+14);
			
            addChild(myVideo);
			
			try{
            nc.connect(null);
			ns = new NetStream(nc);
			ns.soundTransform = videovolume;
            myVideo.attachNetStream(ns);
			
            ns.play(urlvideo); //This has be url site else it will work not work.
            }
			catch (error:Error) {
				
			}
            netClient.onMetaData = function(meta:Object):void {
            Flv_TotalTime = meta.duration; //total time for .flv
			//trace(meta.duration); //total time for .flv
            };
            ns.client = netClient;
			
			
			//{TEXT
			//Text_Time.x = myVideo.width - 2*16;
			Text_Time.x = myVideo.width - 5*16;
			Text_Time.y = myVideo.height + -2;
			Text_Time.text = "Time:[0/0]";
			
			//Text_LoadBtye.y = myVideo.height + 2*22;
			//Text_LoadBtye.width = 256; //This create more space than the deafult width.
			//Text_LoadBtye.text = "Byte:[0/0]";
			//addChild(Text_LoadBtye);
			//}TEXT
			
			//{BUTTON
			var Button_Pause:Button = new Button("||");
			Button_Pause.y = myVideo.height + 0*16;
			Button_Pause.x = 10;
			Button_Pause.height = 17;
			Button_Pause.width = 16;
			
			Button_volup.y = myVideo.height + 0 * 16;
			Button_volup.x = myVideo.width - 16 * 1;
			
			Button_voldown.y = myVideo.height + 0 * 16;
			Button_voldown.x = myVideo.width - 16 * 2;
			
			//var Button_Play:Button = new Button(">");
			//Button_Play.y = myVideo.height + 0 * 16;
			//Button_Play.x = 8;
			//Button_Play.height = 17;
			//Button_Play.width = 16;
			
			//}
			
			addEventListener( Event.ENTER_FRAME, UpdateLoadingBar );
			addEventListener(KeyboardEvent.KEY_DOWN, flv_keycontrol);
			Button_Pause.addEventListener(MouseEvent.CLICK,ActionKeyPause);
			//Button_Play.addEventListener(MouseEvent.CLICK, ActionKeyPlay);
			
			Button_voldown.addEventListener(MouseEvent.CLICK,ActionVoldown);
			Button_volup.addEventListener(MouseEvent.CLICK, ActionVolup);
			
			addChild(Button_volup);
			addChild(Button_voldown);
			addChild(LoadBarImage);
			//addChild(Text_Time);
			addChild(Button_Pause);
			//addChild(Button_Play);
		}
		
		public function UpdateLoadingBar(event : Event ):void{ //Graphic 
			var bar_bg_fill:uint = 0xEFEFEF;
			var bar_fg_fill:uint = 0x778899;
			var bar_bg2_fill:uint = 0xd3d3d3;
			var bar_borderline:uint = 0x00008b;
			var Bar_TimeColor:uint = 0xf08080;
			//LoadPercent = LoadPercent + 1;
			LoadPercent = Math.floor(Flv_TotalTime*(Flv_LoadPercent/100));
				//FlashConnect.trace(LoadPercent + "%");
			if (LoadPercent >= 100){
				LoadPercent = 100;
				//t.stop();
				//LoadPercent = 0;					
			}
			//{IMAGE GRAPHIC
			LoadBarImage.graphics.clear(); //This will clear all the data from the object
			LoadBarImage.graphics.beginFill(bar_bg_fill);
			LoadBarImage.graphics.drawRect(2*16,myVideo.height,Math.floor(myVideo.width  - 4 * 16),16);				
			//FlashConnect.trace(LoadPercent + "%"+ (Math.floor(myVideo.width*(LoadPercent/100)) - 4 * 16 ));
			LoadBarImage.graphics.beginFill(bar_bg2_fill);
			LoadBarImage.graphics.drawRect(2*16 + 2,myVideo.height + 2,Math.floor(myVideo.width  - 4 * 16 - 4),12);
			LoadBarImage.graphics.beginFill(bar_fg_fill);
			LoadBarImage.graphics.drawRect(2*16 + 2,myVideo.height + 2,Math.floor((myVideo.width  - 4 * 16 - 4)*(LoadPercent/100)),12);
			//FlashConnect.trace(Math.round((myVideo.width  - 4 * 16 - 4)*(ns.time/Flv_TotalTime)) + "-");
			LoadBarImage.graphics.beginFill(Bar_TimeColor);
			LoadBarImage.graphics.drawRect(2*16 + 2,myVideo.height + 2,Math.round((myVideo.width  - 4 * 16 - 4)*(ns.time/120)),12);
			//FlashConnect.trace(((ns.time/TotalTime)*100)+"-");
			//}IMAGE GRAPHIC
			
			UpdateLoadPercent();
			UpDateTime();
		}
		
		public function UpdateLoadPercent():void{ //Show Loaded Byte, Percent, LoadTime
			Flv_LoadPercent = Math.round((ns.bytesLoaded/ns.bytesTotal)*100);
			//Text_LoadBtye.text = "Byte:[" + ns.bytesLoaded + "/" + ns.bytesTotal + "]" + Flv_LoadPercent + "% Time Load:" + Math.floor(Flv_TotalTime*(Flv_LoadPercent/100));
			//FlashConnect.trace("DELAY:" + ns.bufferLength);				
		}
		
		public function UpDateTime():void{ //Show Current Time
			//Text_Time.text = "Time:[" + Math.floor(ns.time) + "/" + Math.floor(Flv_TotalTime) + "]"; // this in secconds
			Text_Time.text = "[" + (Math.floor(Flv_TotalTime) - Math.floor(ns.time))   + "]"; // this in secconds				
		}
		
		public function ActionKeyPause(event : Event):void{
			ns.togglePause();
		}
		
		public function ActionKeyPlay(event : Event):void{
			ns.resume();
		}
		
		public function ActionVolup(event : Event):void{
			videovolume.volume += 0.1;
			ns.soundTransform = videovolume;
			trace(videovolume.volume);
			if (videovolume.volume > 1) {
				videovolume.volume = 1;
			}
		}
		
		public function ActionVoldown(event : Event):void{
			videovolume.volume -= 0.1;
			if (videovolume.volume < 0) {
				videovolume.volume = 0;
			}
			ns.soundTransform = videovolume;
			trace(videovolume.volume);
		}
		
		public function flv_keycontrol(event:KeyboardEvent):void{
			//FlashConnect.trace("KEY:" + event.keyCode);
			if (event.keyCode == 32){ //Space key
				ns.togglePause();
			}
			if (event.keyCode == 39){ //Right key
				//This check current time is bigger then total Time.
			//FlashConnect.trace("TIME:" + ns.time);
				// If loaded byte download that is current load do not seek ahead.
				var TimeLine:Number = Math.floor(Flv_TotalTime*(Flv_LoadPercent/100));
				if ((ns.time + Flv_DefaultSeek) > TimeLine){ //If time seek out the video time show error
					//ns.seek(ns.time - 0.1);
					//FlashConnect.trace("TIME:ERROR");
				}else{ //else seek 
					ns.seek(ns.time + Flv_DefaultSeek); //Seek time + 5 sec
					///FlashConnect.trace("TIME:ADEAD");
				}
			}
			if (event.keyCode == 37){ //Left key
				ns.seek(ns.time - Flv_DefaultSeek); //Seek time - 5 sec
				//FlashConnect.trace("TIME:" + ns.time); 
			}
		}
		
	}
	
}
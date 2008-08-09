/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.audio {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: Not Build Yet
	*/
	//{
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.events.Event
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.Graphics;
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;
	import org.flashdevelop.utils.FlashConnect;
	//}

	public class audio extends Sprite {
		public var s:Sound = new Sound();
		public var ba:ByteArray = new ByteArray();
		public var gr:Sprite = new Sprite();
		public var song:SoundChannel =  new SoundChannel();
		public var audiourl:String = "data/audio/sounds/Bliss.mp3";
		
		public function audio() {
			s.load(new URLRequest("data/audio/sounds/Bliss.mp3"));
			//var song:SoundChannel = s.play();
			
			song.addEventListener(Event.SOUND_COMPLETE, soundCompleteHandler);
			s.addEventListener(Event.SOUND_COMPLETE, completeHandler);
			
			var time:Timer = new Timer(50);
			time.addEventListener(TimerEvent.TIMER, timerHandler);
			time.start();
			
		}
		
		public function playaudio():void {
			var song:SoundChannel = s.play();
		}
		public function playloop():void {
			
		}
		public function playstop():void {
			
		}
		
		//This draw show sound output
		public function timerHandler(event:TimerEvent):void {
			SoundMixer.computeSpectrum(ba, true);
			var i:int;
			gr.graphics.clear();
			gr.graphics.lineStyle(0, 0xFF0000);
			gr.graphics.beginFill(0xFF0000);	
			gr.graphics.moveTo(0, 0);
			var w:uint = 2;
			for (i=0; i<512; i+=w) {
				var t:Number = ba.readFloat();
				var n:Number = (t * 100);
				gr.graphics.drawRect(i, 0, w, -n);
			}
		}
		
		public function completeHandler(event:Event):void {
			//event.target.load(new URLRequest("data/audio/sounds/Bliss.mp3"));
			event.target.load(new URLRequest("audio/sounds/Bliss.mp3"));
			event.target.play();	
		}
		
		public function soundCompleteHandler(event:Event):void {
			//time.stop();				
			//s.load(new URLRequest("audio/sounds/Bliss.mp3"));
			var song:SoundChannel = s.play();
			FlashConnect.trace('LOOP ME');
		}
		
	}
	
}

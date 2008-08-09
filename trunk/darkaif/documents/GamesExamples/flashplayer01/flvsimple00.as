/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/

/**
 * Information this the simple player using url. Simple test that flv is playing the file.
 */

package  {
	import flash.display.Sprite;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;

	public class flvsimple00 extends Sprite{
		public var Flv_Url:String = "http://purecodeas3.googlecode.com/svn/trunk/videos/flashtest.flv";
		
		public function flvsimple00(){
			MyFlv();
		}
        public function MyFlv():void{
            var myVideo:Video = new Video();
            addChild(myVideo);
            var nc:NetConnection = new NetConnection();
            nc.connect(null);
            var ns:NetStream = new NetStream(nc);
            myVideo.attachNetStream(ns);
            ns.play(Flv_Url); //This has be url site else it will work not work.
			
            // onMetaData - need this to not show error
            var netClient:Object = new Object();
            netClient.onMetaData = function(meta:Object):void {
            trace(meta.duration); //total time for .flv
            };
            ns.client = netClient;
        }		
		
	}
	
}

package  
{
	import flash.display.StageScaleMode;	
	import flash.display.StageAlign;	
	import flash.text.TextFormat;	
	import flash.events.MouseEvent;	
	import flash.text.TextFieldType;	
	import flash.text.TextField;	
	import flash.events.ProgressEvent;	
	import flash.net.Socket;	
	import flash.display.Sprite;
	
	/**
	 * @author kris@neuroproductions.be
	 */
	public class SocketTest extends Sprite 
	{
		private var s:Socket
		private var status_txt : TextField
		private var send_txt : TextField
		public function SocketTest()
		{
			//stage.nativeWindow.title ="socketTest"
			stage.align = StageAlign.TOP_LEFT
			stage.scaleMode = StageScaleMode.NO_SCALE
			status_txt  = new TextField()
			status_txt.width =250
			status_txt.height =300
	
			status_txt.defaultTextFormat = new  TextFormat("_sans",12)
			addChild(status_txt)
			
			s = new Socket("localhost",9999)
			s.addEventListener(ProgressEvent.SOCKET_DATA, getData)
		}
		
	
		private function getData(event : ProgressEvent) : void
		{
			var output:String =s.readUTFBytes(s.bytesAvailable)
			trace(output.length)
			setStatus("receiving: "+ output)	
		}
		
		private function setStatus(status:String):void
		{
		 status_txt.appendText("\n" + status)
		}
	}
}

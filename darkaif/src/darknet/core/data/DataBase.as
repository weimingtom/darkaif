package darknet.core.data 
{
	import flash.display.Sprite;
	import darknet.core.event.DataBaseEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DataBase extends Sprite
	{
		public var query:String;
		
		public function DataBase() 
		{
			
		}
		
		public function set requestquery(data:String):void {
			dispatchEvent(new DataBaseEvent(DataBaseEvent.OPEN, 'HI'));
		}
		
	}
	
}
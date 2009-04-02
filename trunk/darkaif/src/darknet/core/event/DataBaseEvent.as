package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DataBaseEvent extends Event
	{
		public static const CLOSE:String = "close";
		public static const OPEN:String = "open";
		
		public var query:String;
		
		
		
		public function DataBaseEvent(type:String, queryname:String ) 
		{
			super( type );
			query = queryname;
			
			trace(type);
		}
		
	}
	
}
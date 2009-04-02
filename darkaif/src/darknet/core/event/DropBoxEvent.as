package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DropBoxEvent extends Event
	{
		// events
		//public static const CHANGE:String = "change";
		public static const SELECT:String = "select";
		
		
		/**
         * Read-Only
         */
		public var selectname:String;
		
		
		/**
         * Constructor
         */
		public function DropBoxEvent(type:String, action:String ) 
		{
			super( type );
            selectname = action;
		}
		
	}
	
}
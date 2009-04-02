package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PanelEvent extends Event
	{
		// events
		public static const CLOSE:String = "close";
		public static const OPEN:String = "open";
		
		protected var action:String;
		
		public function PanelEvent(type:String, actionname:String ) 
		{
			super( type );
            action = actionname;
		}
		
	}
	
}
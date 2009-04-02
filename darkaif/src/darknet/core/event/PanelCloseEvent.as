package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PanelCloseEvent extends Event
	{
		// events
		public static const CHANGE:String = "change";
		public static const ACTION:String = "action";
		
		
		/**
         * Read-Only
         */
		public var actionpanel:String;
		
		
		/**
         * Constructor
         */
		public function PanelCloseEvent(type:String, action:String ) 
		{
			super( type );
				actionpanel = action;
		}
		
	}
	
}
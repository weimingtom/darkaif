package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ScrollEvent extends Event
	{
		public static const PERCENT:String = "percent";
		
		public var percentage:Number;
		
		public function ScrollEvent(type:String, percent:Number ) 
		{
			super( type );
            percentage = percent;
		}
		
		public function get percent():Number {
			return percentage;
		}
	}
	
}
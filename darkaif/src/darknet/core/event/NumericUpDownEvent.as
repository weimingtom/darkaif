package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	* ...
	* @author Darknet
	*/
	
	public class NumericUpDownEvent extends Event
	{
		public static const CHANGE:String = "change";
		
		public var numberchange:Number;
		
		public function get number():Number {
			return numberchange
		}
		
		public function NumericUpDownEvent(type:String, number:Number )
		{
			super(type);
			numberchange = number;
		}
		
	}
	
}
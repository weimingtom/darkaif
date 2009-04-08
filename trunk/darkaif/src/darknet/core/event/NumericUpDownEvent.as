package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	* ...
	* @author Darknet
	*/
	
	public class NumericUpDownEvent extends Event
	{
		public static const VALUE:String = "value";
		public static const ENTER:String = "enter";
		
		public var numberchange:Number;
		public var enternumberchange:Number;
		
		public function get number():Number {
			return numberchange;
		}
		
		public function NumericUpDownEvent(type:String, number:Number )
		{
			super(type);
			//trace("event:" + type);
			numberchange = number;
			
		}
		
	}
	
}
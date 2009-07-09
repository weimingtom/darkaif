package gearunits.away3d.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AUnitEvent extends Event
	{
		public static const CHECK:String = "check";
		public static const TIME:String = "time";
		public var unitid:String = '';
		public var unitclass:String = '';
		
		public var percent:Number = 0;
		public var time:Number = 0;
		//public var value:Number = 0;
		
		public function AUnitEvent(type:String,unit:*) 
		{
			super(type, bubbles, cancelable);
			
			trace(unit['unitid']);
			
			if (unit['unitid']) {
				unitid = unit['unitid'];
			}
			
			if (unit['unitclass']) {
				unitclass = unit['unitclass'];
			}
			
			if (unit['time']) {
				time = unit['time'];
			}
			
			if (unit['percent']) {
				percent = unit['percent'];
			}
			
			
			//this.unitid = unitid;
			//this.unitclass = unitclass;
		}
		
	}
	
}
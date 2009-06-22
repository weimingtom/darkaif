package gearunits.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class StructureUnitEvent extends Event 
	{
		public static const PERCENT:String = "percent";
		public static const TIME:String = "time";
		public var percent:Number = 0;
		public var time:Number = 0;
		//public var value:Number = 0;
		
		public function StructureUnitEvent(type:String,value:Number, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
			if(type == PERCENT){
				percent = value;
			}
			if(type == TIME){
				time = value;
			}
		}
		
		public override function toString():String 
		{ 
			return formatToString("StructureunitEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
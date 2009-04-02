package darknet.core.event 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BoxListEvent extends Event
	{
		public static const SELECT:String = "select";
		
		public var buttonname:String = '';
		public var idname:String = '';
		
		public function BoxListEvent(type:String, name:String ) 
		{
			super( type );
			idname = name;
		}
		
		public function get _idname():String {
			return idname;
		}
		
	}
	
}
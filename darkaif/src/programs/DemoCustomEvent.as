package  programs
{
	import darknet.core.data.DataBase;
	import darknet.core.event.DataBaseEvent;
	import flash.display.Sprite;
	import darknet.core.event.DataBaseEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoCustomEvent extends Sprite
	{
		
		public function DemoCustomEvent() 
		{
			var database:DataBase = new DataBase();
			
			database.requestquery = 'hi';
			
			database.addEventListener(DataBaseEvent.CLOSE, closeevent);
			database.addEventListener(DataBaseEvent.OPEN, openevent);
			
			function closeevent(event:DataBaseEvent):void {
				trace('close...'+event.query);
			}
			
			function openevent(event:DataBaseEvent):void {
				//event.query;
				trace('open...'+event.query);
			}
			database.requestquery = 'hi';
			database.requestquery = 'hi';
			database.requestquery = 'hi';
			
			
		}
		
	}
	
}
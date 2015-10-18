# Introduction #
Basic and simple format.

MyClassEvent.as
```

package
{
  	import flash.events.EventDispatcher;
 	import flash.events.Event;
  	public class MyClassEvent {
    		protected static var disp:EventDispatcher;
    		public static function addEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean=false, p_priority:int=0, p_useWeakReference:Boolean=false):void {
      			if (disp == null) { disp = new EventDispatcher(); }
      			disp.addEventListener(p_type, p_listener, p_useCapture, p_priority, p_useWeakReference);
      		}
    		public static function removeEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean=false):void {
      			if (disp == null) { return; }
      			disp.removeEventListener(p_type, p_listener, p_useCapture);
      		}
    		public static function dispatchEvent(p_event:Event):void {
      			if (disp == null) { return; }
      			disp.dispatchEvent(p_event);
      		}
    		
  		// Public API that dispatches an event
  		public static function loadSomeData():void {
   			dispatchEvent(new Event(Event.COMPLETE));
   		}
    }
}
```

ClasDemoEvent.as
```
package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ClasDemoEvent extends Sprite
	{
		
		public function ClasDemoEvent () 
		{
			//var testclass:MyClassEvent
			MyClassEvent.addEventListener(Event.COMPLETE, onComplete, false, 0, true);
			function onComplete(p_event:Event):void {
				trace("Complete!");
			}
			MyClassEvent.loadSomeData();
		}
		
	}
	
}
```
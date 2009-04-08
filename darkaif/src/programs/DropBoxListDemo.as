package  programs
{
	import darknet.core.display.Button;
	import darknet.core.display.DropBoxList;
	import darknet.core.event.DropBoxEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DropBoxListDemo extends Sprite
	{
		public var dropboxlist:DropBoxList = new DropBoxList();
		public var buttoncheck:Button = new Button("Check");
		public function DropBoxListDemo() 
		{
			
			dropboxlist.y = 14;
			dropboxlist.boxlist.push( { name:"Male", id:'1' });
			dropboxlist.boxlist.push( { name:"Female", id:'2'} );
			dropboxlist.boxlist.push( { name:"Kid", id:'3' });
			dropboxlist.boxlist.push( { name:"Boy", id:'4' });
			dropboxlist.boxlist.push( { name:"Girl", id:'5' } );
			dropboxlist.boxlist.push( { name:"Adult", id:'6' } );
			dropboxlist.addEventListener(DropBoxEvent.SELECT,selecttext)
			
			buttoncheck.addEventListener(MouseEvent.CLICK, selecttext);
			addChild(dropboxlist);
			addChild(buttoncheck);
		}
		
		public function testtext(event:Event):void {
			trace(dropboxlist.getboxname()); 
			trace(dropboxlist.getidname()); 
		}
		
		public function selecttext(event:Event):void {
			trace(dropboxlist.getboxname()); 
			trace(dropboxlist.getidname()); 
		}
		
	}
	
}
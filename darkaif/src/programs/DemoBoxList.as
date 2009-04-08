package programs
{
	import darknet.core.display.BoxList;
	import flash.display.Sprite;
	import darknet.core.event.BoxListEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoBoxList extends Sprite
	{
		
		public function DemoBoxList() 
		{
			var boxlist:BoxList = new BoxList();
			
			boxlist.addlist( { name:'test1', id:'id1' } );
			boxlist.addlist( { name:'test2', id:'id2' } );
			boxlist.addlist( { name:'test3', id:'id3' } );
			boxlist.addlist( { name:'test4', id:'id4' } );
			boxlist.addlist( { name:'test5', id:'id5' } );
			
			boxlist.addEventListener(BoxListEvent.SELECT, selectitem);
			function selectitem(event:BoxListEvent):void {
				trace("nameid:"+event._idname);
			}
			
			addChild(boxlist);
		}
		
	}
	
}
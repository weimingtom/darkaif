package  programs
{
	import darknet.core.display.BoxList;
	import flash.display.Sprite;
	import darknet.core.event.BoxListEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DemoSelectList extends Sprite
	{
		public var selectbox:BoxList = new BoxList();
		public function DemoSelectList() 
		{
			
			selectbox.addlist( { name:'test', id:'101' } );
			selectbox.addlist( { name:'test', id:'10' } );
			selectbox.clearlist();
			selectbox.addlist( { name:'test1', id:'1' } );
			selectbox.addlist( { name:'test2', id:'2' } );
			selectbox.addlist( { name:'test3', id:'3' } );
			selectbox.addlist( { name:'test3', id:'3' } );
			selectbox.addlist( { name:'test3', id:'3' } );
			selectbox.addlist( { name:'test3', id:'3' } );
			selectbox.addlist( { name:'test3', id:'3' } );
			selectbox.addlist( { name:'test3', id:'3' } );
			selectbox.addlist( { name:'test3', id:'3' } );
			
			selectbox.addEventListener(BoxListEvent.SELECT,selectlist);
			
			function selectlist(event:BoxListEvent):void {
				//trace('::' + event.idname);
			}
			
			selectbox.drawlist();
			addChild(selectbox);
		}
		
	}
	
}
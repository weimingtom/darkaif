package  programs
{
	import darknet.core.display.DropBoxList;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DropboxListDemo2 extends Sprite
	{
		public var dropbox:DropBoxList = new DropBoxList();
		public function DropboxListDemo2() 
		{
			dropbox.boxlist.push( { name:'hello', id:'1' } );
			dropbox.boxlist.push( { name:'hello', id:'1' } );
			//dropbox.boxlist.push( { name:'hello', id:'1' } );
			
			addChild(dropbox);
		}
		
	}
	
}
package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class DataCheckImageExt extends Sprite
	{
		
		public function DataCheckImageExt() 
		{
			imagecheckext('.jpgk');
		}
		
		public function imagecheckext(ext:String):Boolean {
			var bext:Boolean = false;
			var extimage:Array = new Array('.jpg', '.png', '.gif');
			for (var imgextno:int = 0; imgextno < extimage.length ; imgextno++) {
				if (extimage[imgextno] == ext) {
					bext = true;
					break;
				}
			}
			if (bext) {
				//trace('found...')
				return true;
			}else {
				//trace('not there...');
				return false;
			}
		}
		
		
	}
	
}
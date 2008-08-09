/**
* ...
* @author Darknet
* Copy Rights (c) http://darkaif.googlecode.com
*/
/** 
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

package  {
	import flash.display.Sprite;
	import org.flashdevelop.utils.FlashConnect;
	import org.flashdevelop.utils.xtrace;

	public class flashobject extends Sprite{
		
		public function flashobject() {
			var object:Object = new Object();
			object.name = "Name me";
			object.id = 2867;
			object.isModerator = true;
			
			for each(var value:* in object){
				FlashConnect.trace(value);
			}			
			//FlashConnect.trace(" " + object);
		}		
	}	
}

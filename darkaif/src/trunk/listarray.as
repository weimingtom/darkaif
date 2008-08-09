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

	public class listarray extends Sprite{
		
		public function listarray() {
			var array_a:Array = new Array(0,1,2,3,4,5,6,7,8,9,10);
			//FlashConnect.trace("A lenght:" + array_a.length + " :" + array_a[5]);
			
			var array_b:Array = new Array();
			array_b[0] = 1;
			array_b[1] = 2;
			array_b[2] = 3;
			//FlashConnect.trace("B lenght:" + array_b.length + " :" + array_b[2]);
			
			var array_c:Array = new Array();
			array_c[0] = [0,1,2,3,4,5];
			array_c[1] = [0,1,2,3,4,5];
			array_c['test'] = [0,1,2,3,4,5];
			FlashConnect.trace("C lenght:" + array_c.length + " :" + array_c[2]);
			
			FlashConnect.trace("C lenght:" + array_c[0].length + " :" + array_c[0][1]);
			FlashConnect.trace("C lenght:" + array_c['test'].length + " :" + array_c['test'][1]);
			
		}
		
	}
	
}

/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.classes {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	//{
	import org.flashdevelop.utils.FlashConnect
	//}
	public class ItemScript {
		public var attack:Number = 0;
		public var defence:Number = 0;
		public var speed:Number = 0;
		public var delay:Number = 0;
		public var critical:Number = 0;
		
		public var stat:Array = new Array();
		public var bonusstat:Array = new Array();
		public var status:Array = new Array();
		public var effect:Array = new Array();
		
		public var engery:Number = 0;
		public var stamina:Number = 0;
		public var dexterity:Number = 0;
		public var durability:Number = 0;
		
		public var magic_attack:Number = 0;
		public var magic_defence:Number = 0;
		
		public function ItemScript() {
			
		}
		
	}
	
}

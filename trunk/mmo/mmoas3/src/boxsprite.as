package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class boxsprite 
	{
		public var id:int = 0;
		//public var x:Number = 0;
		//public var y:Number = 0;
		public var baseshape:Sprite = new Sprite();
		
		public function boxsprite() 
		{
			baseshape.graphics.beginFill(0xFFFF00);
			baseshape.graphics.drawRect(0, 0, 10, 10);
		}
		
		public function set x(_x:Number):void {
			baseshape.x = _x;
		}
		public function get x():Number {
			return baseshape.x;
		}
		public function set y(_y:Number):void {
			baseshape.y = _y;
		}
		public function get y():Number {
			return baseshape.y;
		}
		
		
	}
	
}
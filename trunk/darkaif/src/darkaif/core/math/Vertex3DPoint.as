package darkaif.core.math 
{
	
	/**
	 * ...
	 * @author @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class Vertex3DPoint 
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public function Vertex3DPoint(_x:Number = 0, _y:Number = 0, _z:Number = 0) 
		{
			x = _x;
			y = _y;
			z = _z;
		}
		
		public function point(_x:Number = 0, _y:Number = 0, _z:Number = 0):void {
			x = _x;
			y = _y;
			z = _z;
		}
		
	}
	
}
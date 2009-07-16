package gearunits.core 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Vertex3DMath 
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var x:Number = 0;
		
		/*
		public var cx:Number = 0;
		public var cy:Number = 0;
		public var cz:Number = 0;
		
		public var sx:Number = 0;
		public var sy:Number = 0;
		public var sz:Number = 0;
		
		public var rx:Number = 0;
		public var ry:Number = 0;
		public var rz:Number = 0;
		
		public var idx:Number = 0;
		public var idy:Number = 0;
		public var idz:Number = 0;
		*/
		
		public var matrix:Array = new Array(
		1, 0, 0, 0,
		0, 1, 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1
		);
		
		public function Vertex3DMath() 
		{
			
		}
		
		/**
		 * 
		 * @param  x
		 * |  	1  	0  	0  	0  	|
		 * |  	0  	cos(x)  	-sin(x}  	0  	|
		 * |  	0  	sin(x)  	cos(x)  	0  	|
		 * |  	0  	0  	0  	1  	|
		 */
		public function rotateX(x:Number):void {
			matrix[5] = Math.cos(angle);
			matrix[6] = -Math.sin(angle);
			matrix[9] = Math.sin(angle);
			matrix[10] = Math.cos(angle);
		}
		
		/**
		 * 
		 * @param	y
		 * 
		 * |  	cos(y)  	0  	sin(y)  	0  	|
		 * |  	0  	1  	0  	0  	|
		 * |  	-sin(y)  	0  	cos(y)  	0  	|
		 * |  	0  	0  	0  	1  	|
		 */
		public function rotateY(angle:Number):void {
			matrix[0] = Math.cos(angle);
			matrix[2] = Math.sin(angle);
			matrix[8] = -Math.sin(angle);
			matrix[10] = Math.cos(angle);
		}
		
		/**
		 * 
		 * @param	z
		 * 
		 * |  	cos(z)  	-sin(z)  	0  	0  	|
		 * |  	sin(z)  	cos(z)  	0  	0  	|
		 * |  	0  	0  	1  	0  	|
		 * |  	0  	0  	0  	1  	|
		 * 
		 */
		public function rotateZ(angle:Number):void {
			matrix[0] = Math.cos(angle);
			matrix[1] = -Math.sin(angle);
			matrix[4] = Math.sin(angle);
			matrix[5] = Math.cos(angle);
		}
		
		/**
		 * 
		 * @param	x
		 * @param	y
		 * @param	z
		 */
		public function scale(x:Number, y:Number, z:Number):void {
			matrix[0] = x;
			matrix[5] = x;
			matrix[10] = x;
		}
		
		/**
		 * 
		 * @param	x
		 * @param	y
		 * @param	z
		 * 
		 */
		public function translation(x:Number, y:Number, z:Number):void {
			matrix[3] = x;
			matrix[7] = y;
			matrix[11] = z;
		}
		
		
		
	}
	
}
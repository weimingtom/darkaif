package gearunits.away3d.math 
{
	import away3d.core.math.Number3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Away3DIntersectMath 
	{
		
		public function Away3DIntersectMath() 
		{
			
		}
		
		public static function Normal3D(V0:Number3D,V1:Number3D,V2:Number3D):Number3D {
			//normal vector n = (V1-V0)×(V2-V0)
			return new Number3D((V1.x - V0.x)*(V2.x - V0.x), (V1.y - V0.y)*(V2.y - V0.y), (V1.z - V0.z)*(V2.z - V0.z));
			//return
		}
		
		public static function U3D(V0:Number3D,V1:Number3D):Number3D {
			//u = (V1-V0)
			return new Number3D( V0.x-V1.x, V0.y-V1.y,V0.z-V1.z);
		}
		
		public static function V3D(V2:Number3D,V0:Number3D):Number3D {
			//u = (V1-V0)
			return new Number3D( V2.x-V0.x, V2.y-V0.y,V2.z-V0.z);
		}
		
		
		public static function RayIntersectionTriangle3D(R:Number3D,V0:Number3D,V1:Number3D,V2:Number3D):void {
			
		}
		
		
		
		
	}
	
}
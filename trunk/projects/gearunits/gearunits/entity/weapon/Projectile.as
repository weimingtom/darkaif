package gearunits.entity.weapon 
{
	import sandy.core.data.Point3D;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Projectile 
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		public var name:String = 'Projectile';
		public var startpoint:Point3D = new Point3D();
		public var endpoint:Point3D = new Point3D();
		
		public var damage:Number = 0;
		public var defence:Number = 0;
		public var materialtype:String = '';
		public var mesh:Shape3D;
		
		public var velocity:Point3D = new Point3D(0,0,1);
		
		public function Projectile() 
		{
			
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
			
			x += velocity.x;
			y += velocity.y;
			z += velocity.z;
			
		}
		
		public function setposition(point:Point3D):void {
			x = point.x;
			y = point.y;
			z = point.z;
		}
		
	}
	
}
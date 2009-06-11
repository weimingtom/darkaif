package gearunits.entity.weapon 
{
	import sandy.core.data.Point3D;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * TODOLIST:
	 * -distance range check
	 * -distance line check
	 * 
	 * 
	 */
	public class Projectile 
	{
		//{
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		public var name:String = 'Projectile';
		public var startpoint:Point3D = new Point3D();
		public var endpoint:Point3D = new Point3D();
		public var targetpoint:Point3D = new Point3D(0,0,0);
		//public var targetpoint:Point3D = new Point3D();
		public var balive:Boolean = true;
		public var radiansToDegrees:Number = 180/Math.PI;
		
		public var damage:Number = 0;
		public var defence:Number = 0;
		public var materialtype:String = '';
		public var mesh:Shape3D;
		
		public var velocity:Point3D = new Point3D();
		
		public var speed:Number = 1;
		
		public var distance:Number = 0;
		public var mindistance:Number = 0
		public var maxdistance:Number = 0;
		
		public var angle:Number = 0;//direction to point to face object
		public var degree:Number = 0;
		//}
		
		public function Projectile() {
			//getdistance();
			updatetragetpoint();
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
			
			velocity.x = speed * Math.sin(angle* Math.PI / 180);
			velocity.z = speed * Math.cos(angle* Math.PI / 180);
			
			x += velocity.x;
			y += velocity.y;
			z += velocity.z;
			getdistance();
			
			//updatetragetpoint();
			
			if (Math.abs(distance) > maxdistance) {
				balive = false;
			}
			
		}
		
		//calculate distance
		//this will either clean up mesh when reach border line
		public function getdistance():void {
			distance = Math.abs((((startpoint.x - x) * 2)+((startpoint.y - y) * 2)+((startpoint.z - z) * 2))/2);
			//trace(distance);
		}
		
		//not use
		public function directionangle(x:Number, y:Number, x2:Number, y2:Number):void {
			angle = Math.atan2(x-x2,y-y2);
		}
		
		//2d function //target a point
		public function anglepoint(point1:Point3D, point2:Point3D):Number {
			var facedirection:Number = 0;
			//facedirection = Math.atan2(x - point2.x, z - point2.z);
			facedirection = Math.atan2(z - point2.z, x - point2.x);
			facedirection = facedirection * 180 / Math.PI;
			
			//default    
			//270 to 360  |z| 00 to  090
			//-------x--top-view-x-------
			//270 to 180  |z| 90 to -180
			
			//0 to -90 || 91 to -180 (Fixed area)
			//----------------------
			//0 to 90  || 91 to -180
			
			if ((facedirection < -91)&&(facedirection > -180) ){
				//trace('angle:' + Math.abs(90 + facedirection));
				facedirection = Math.abs(90 + facedirection);
			}else {
				//trace('angle:' + (180 + (90 - facedirection)) + '[:]' + facedirection);
				facedirection = (180 + (90 - facedirection));
			}
			
			//trace('angle:' + facedirection);
			return facedirection;
		}
		
		//update target point
		public function updatetragetpoint():void {
			angle = anglepoint(startpoint, targetpoint);
			//trace('angle:'+angle);
			//trace('angle:'+angle+' start point:'+startpoint+'//'+ x+'/'+ y+'/'+ z + ' targetpoint:'+targetpoint);
		}
		
		//Set position for spawn and cleaning for life draw
		public function setposition(p3d:Point3D):void {
			x = p3d.x;
			y = p3d.y;
			z = p3d.z;
			
			startpoint.x = p3d.x;
			startpoint.y = p3d.y;
			startpoint.z = p3d.z;
			
			updatetragetpoint();
		}
		
	}
	
}
package gearunits.papervision3d.entity 
{
	import org.papervision3d.core.geom.TriangleMesh3D;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.papervision3d.core.math.Number3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PStructureUnit 
	{
		protected static var disp:EventDispatcher; //listener function
		public var name:String = 'PStructureUnit';
		public var mesh:TriangleMesh3D;
		
		public var x:Number = 0
		public var y:Number = 0;
		public var z:Number = 0;
		public var order:String = 'none';
		public var movepoint:Number3D = new Number3D();
		public var angle:Number = 0;
		public var distance:Number = 0;
		public var movespeed:Number = 0;
		public var velocity:Number3D = new Number3D();
		
		public function PStructureUnit() 
		{
			
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
		}
		
		//this will move to point in angle
		public function pointmove(p3d:Number3D):void {
			//trace(p3d);
			order = 'move';
			movepoint = p3d;
			angle = rotationpoint(p3d);
		}
		
		//get distance point to go there in 3d space// MATH
		public function distancepoint():void {
			distance = Math.abs((((x - movepoint.x) * 2) + ((y - movepoint.y) * 2) + ((z - movepoint.z) * 2)) / 2);
			//trace(distance);
		}
		
		public function rotationpoint(p3d:Number3D):Number {
			var facedirection:Number = 0;
			facedirection = Math.atan2(z - p3d.z, x - p3d.x);
			facedirection = facedirection * 180 / Math.PI;
			
			//default    
			//270 to 360  |z| 00 to  090
			//-------x--top-view-x-------
			//270 to 180  |z| 90 to -180
			
			// as3 from Math.atan2(z,x)
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
			//trace('facedirection:'+facedirection);
			return facedirection;
		}
		
		// GLOBAL VIEW SCENE
		/*
		public function set gview(g_view:View3D):void {
			view = g_view;
		}
		//Global unit
		public function set gunit(g_unit:Vector.<AStructureUnit>):void {
			units = g_unit;
		}
		//global projectile(
		public function set gprojectile(g_projectile:Vector.<AProjectile>):void {
			projectile = g_projectile;
		}
		*/
		
		//DISPATCHER
		public function addEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean = false, p_priority:int = 0, p_useWeakReference:Boolean = false):void {
			if (disp == null) { disp = new EventDispatcher(); }
			disp.addEventListener(p_type, p_listener, p_useCapture, p_priority, p_useWeakReference);
		}
		public function removeEventListener(p_type:String, p_listener:Function, p_useCapture:Boolean=false):void {
			if (disp == null) { return; }
			disp.removeEventListener(p_type, p_listener, p_useCapture);
		}
		public function dispatchEvent(p_event:Event):void {
			if (disp == null) { return; }
			disp.dispatchEvent(p_event);
		}
		
	}
	
}
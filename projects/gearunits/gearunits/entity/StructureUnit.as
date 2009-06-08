package gearunits.entity 
{
	import gearunits.entity.weapon.Weapon;
	import sandy.core.data.Point3D;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 * this is for the vehicle unit and Infantry unit
	 * 
	 * The code will be divide up into function and var for gourps
	 * 
	 * This wil be convert into sandy engine later other ones.
	 * 
	 */
	public class StructureUnit
	{
		public var faction:String = 'none';
		public var ownerid:String = '';
		public var classtype:String = 'StructureUnit';
		public var name:String = '';
		public var teamcolor:uint;
		
		public var weapon:Vector.<Weapon> = new Vector.<Weapon>();
		
		public var mesh:Shape3D;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var dirx:Number = 0;
		public var diry:Number = 0;
		public var dirz:Number = 0;
		
		public var movespeed:Number = 0;
		
		public var bselected:Boolean = false;
		public var order:String = 'none';
		public var query:Array = new Array();
		
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var spawntime:Number = 0;
		public var range:Number = 0;
		public var detectrange:Number = 0;
		
		public var movepoint:Point3D = new Point3D();
		
		public var minpoint:Point3D = new Point3D();
		public var maxpoint:Point3D = new Point3D();
		
		public function StructureUnit() 
		{
			
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
			followpoint();
		}
		
		public function gettarget():void {
			
		}
		
		public function followpoint():void {
			if (order == 'move'){
				if (movepoint.z < z) {
					z --;
				}else if(movepoint.z > z){
					z++;
				}else {}
				
				if (movepoint.x < x) {
					x --;
				}else if(movepoint.x > x){
					x++;
				}else { }
				
				//fixed follow when finish move point
				
				if ((x > movepoint.x-1) && (x < movepoint.x+1)&&(z > movepoint.z-1) && (z < movepoint.z+1)) {
					order = 'none';
					trace('finish move point');
				}
			}
		}
		
		//basic collision
		public function interset(unit:StructureUnit):void {
			
		}
		
		public function resouce():void {
			
		}
		
		public function point():Point3D {
			var point:Point3D = new Point3D();
			point.x = x;
			point.y = y;
			point.z = z;
			
			return point;
		}
		
	}
	
}
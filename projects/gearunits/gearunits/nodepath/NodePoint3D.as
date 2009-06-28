package gearunits.nodepath 
{
	import gearunits.entity.StructureUnit;
	import sandy.core.data.Point3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class NodePoint3D 
	{
		public static var gridsize:Number = 32;//this will effect all class size
		public var parent:NodePoint3D;
		//public var gridsize:Number = 32;
		public var diagonal:Number = 1.414;
		
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		public var f:Number;
		public var g:Number;
		public var h:Number;
		public var cost:Number; //cost = distance from start position + distance to end position + terrain cost (example height map)
		
		public var walkable:Boolean = true;
		public var start:Boolean = false;
		public var destination:Boolean = false;
		public var path:Boolean = false;
		public var bvisited:Boolean = false;
		
		public function NodePoint3D(px:Number = 0, py:Number = 0, pz:Number = 0) 
		{
			x = px;
			y = py;
			z = pz;
		}
		
		public function gridpoint():NodePoint3D {
			var gridpoint:NodePoint3D = new NodePoint3D();
			return gridpoint
		}
		
		public function toString():String {
			return '{' + x + ',' + y + ',' + z + '}';
		}
		
		public function distcost(start:NodePoint3D, end:NodePoint3D):void {
			g = Math.abs(x - start.x) + Math.abs(y - start.y) + Math.abs(z - start.z);
			//h = (Math.abs(x - end.x) + Math.abs(y - end.y) + Math.abs(z - end.z));//working
			//h = (Math.abs(x - end.x) + Math.abs(y - end.y) + Math.abs(z - end.z));
			//H = Math.sqrt(Math.pow((start.x - destination.x), 2) + Math.pow((start.y - destination.y), 2));//other
			
			h = Math.sqrt(Math.pow((x - end.x), 2) + Math.pow((y - end.y), 2) + Math.pow((z - end.z), 2));//working -diagonal
			//h = Math.floor(h) * 32;
			h = h*gridsize;//this for how much grid space
			f = g + h;
		}
		
		public function sandypointgrid(point:Point3D):void {
			x = Math.floor(point.x / gridsize);
			y = Math.floor(point.y / gridsize);
			z = Math.floor(point.z / gridsize);
		}
		
		public function unitpointgrid(point:StructureUnit):void {
			x = Math.floor(point.x / gridsize);
			y = Math.floor(point.y / gridsize);
			z = Math.floor(point.z / gridsize);
		}
		
		public function set gridunit(spaceunit:Number):void {
			gridsize = spaceunit;
		}
		
		public function get gridunit():Number {
			return gridsize;
		}
	}
	
}
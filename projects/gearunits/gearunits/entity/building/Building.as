package gearunits.entity.building
{
	import gearunits.entity.Commander;
	import gearunits.entity.EntityPoint3D;
	import gearunits.entity.StructureUnit;
	import gearunits.technologytree.TechnologyTree;
	import sandy.core.data.Point3D;
	import sandy.core.scenegraph.Shape3D;
	
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Building extends Commander
	{
		public var healthpoint:Number = 100;
		public var healthpointmax:Number = 100;
		
		public var spawnpoint:Vector.<Point3D> = new Vector.<Point3D>();
		public var queryunit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		
		public var tech:Vector.<TechnologyTree> = new Vector.<TechnologyTree>();
		
		public var attackpoint:Number = 0;
		public var defencepoint:Number = 0;
		
		public var objecttype:String = 'building';
		public var buildingtype:String = 'none';
		
		public var mesh:Shape3D;
		
		public var time:Number = 0;
		public var timemax:Number = 0;
		public var buildtime:Number = 0;
		public var producetime:Number = 0;
		public var bproduction:Boolean = false;
		public var bbuild:Boolean = false;
		public var bdisable:Boolean = false;// for power use or stop build
		
		public var entitypoint:Vector.<EntityPoint3D> = new Vector.<EntityPoint3D>();
		
		public function Building() 
		{
			name = 'Building';
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
		}
		
	}
	
}
package gearunits.entity.building
{
	import flash.display.Bitmap;
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
	
	public class Building extends StructureUnit
	{
		
		//[Embed(source = "../../../system/icon/building_rts_icon32.jpg")]
		//private var buildingimage:Class; //need to be private to work
		//public var buildingicon:Bitmap = new buildingimage();
		public var tech:Vector.<TechnologyTree> = new Vector.<TechnologyTree>();
		
		public var attackpoint:Number = 0;
		public var defencepoint:Number = 0;
		
		public var objecttype:String = 'building';
		public var buildingtype:String = 'none';
		
		//public var mesh:Shape3D;
		
		//public var time:Number = 0;
		//public var timemax:Number = 0;
		public var buildtime:Number = 0;
		public var producetime:Number = 0;
		public var bproduction:Boolean = false;
		public var bbuild:Boolean = false;
		public var bdisable:Boolean = false;// for power use or stop build
		
		
		public function Building() 
		{
			name = 'Building';
		}
		
		
	}
	
}
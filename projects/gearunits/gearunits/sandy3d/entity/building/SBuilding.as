package gearunits.sandy3d.entity.building
{
	import flash.display.Bitmap;
	import gearunits.sandy3d.entity.SCommander;
	import gearunits.sandy3d.entity.SEntityPoint3D;
	import gearunits.sandy3d.entity.SStructureUnit;
	import sandy.core.data.Point3D;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class SBuilding extends SStructureUnit
	{
		
		//[Embed(source = "../../../system/icon/building_rts_icon32.jpg")]
		//private var buildingimage:Class; //need to be private to work
		//public var buildingicon:Bitmap = new buildingimage();
		
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
		
		
		public function SBuilding() 
		{
			name = 'Building';
		}
		
		
	}
	
}
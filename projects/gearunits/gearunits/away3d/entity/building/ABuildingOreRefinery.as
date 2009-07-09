package gearunits.away3d.entity.building 
{
	import gearunits.models.AMeshBuildingOreRefinery;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuildingOreRefinery extends ABuilding
	{
		public static const NAME:String = 'ABuildingOreRefinery';
		public static const TYPE:String = 'Building';
		
		public function ABuildingOreRefinery() 
		{
			name = 'BuildingOreRefinery';
			mesh = new AMeshBuildingOreRefinery();
		}
		
	}
	
}
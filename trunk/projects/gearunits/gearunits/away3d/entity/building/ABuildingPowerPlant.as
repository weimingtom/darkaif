package gearunits.away3d.entity.building 
{
	import gearunits.models.AMeshBuildingPowerPlant;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuildingPowerPlant extends ABuilding
	{
		public static const NAME:String = 'ABuildingPowerPlant';
		public static const TYPE:String = 'Building';
		
		public function ABuildingPowerPlant() 
		{
			name = 'ABuildingPowerPlant';
			mesh = new AMeshBuildingPowerPlant();
		}
		
	}
	
}
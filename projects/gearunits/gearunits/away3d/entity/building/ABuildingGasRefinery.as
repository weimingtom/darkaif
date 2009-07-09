package gearunits.away3d.entity.building 
{
	import gearunits.models.AMeshBuildingGasRefinery;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuildingGasRefinery extends ABuilding
	{
		public static const NAME:String = 'ABuildingGasRefinery';
		public static const TYPE:String = 'Building';
		
		public function ABuildingGasRefinery() 
		{
			name = 'Gas Refinery';
			mesh = new AMeshBuildingGasRefinery();
		}
		
	}
	
}
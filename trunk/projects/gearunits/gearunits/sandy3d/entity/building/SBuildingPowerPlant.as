package gearunits.sandy3d.entity.building 
{
	import gearunits.models.SMeshBuildingPowerPlant;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingPowerPlant extends SBuilding
	{
		//[Embed(source = "../../../system/icon/powerplant_rts_icon32.jpg")]
		//private var buildingimage:Class;
		
		public function SBuildingPowerPlant() 
		{
			//buildingicon = new buildingimage();
			name = 'Power Plant';
			mesh = new SMeshBuildingPowerPlant();
			
			powerlevel = 10;
		}
		
	}
	
}
package gearunits.entity.building 
{
	import gearunits.models.MeshPowerPlant;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingPowerPlant extends Building
	{
		//[Embed(source = "../../../system/icon/powerplant_rts_icon32.jpg")]
		//private var buildingimage:Class;
		
		public function BuildingPowerPlant() 
		{
			//buildingicon = new buildingimage();
			name = 'Power Plant';
			mesh = new MeshPowerPlant();
			
			powerlevel = 10;
		}
		
	}
	
}
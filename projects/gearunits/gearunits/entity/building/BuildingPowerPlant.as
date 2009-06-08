package gearunits.entity.building 
{
	import gearunits.models.MeshPowerPlant;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingPowerPlant extends Building
	{
		public function BuildingPowerPlant() 
		{
			name = 'Power Plant';
			mesh = new MeshPowerPlant();
			
			powerlevel = 10;
		}
		
	}
	
}
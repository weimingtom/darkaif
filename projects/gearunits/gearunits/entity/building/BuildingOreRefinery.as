package gearunits.entity.building 
{
	import gearunits.models.MeshOreRefinery;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingOreRefinery extends Building
	{
		public function BuildingOreRefinery() 
		{
			name = 'Ore Refinery';
			buildingtype = 'Ore Refinery';
			buildtime = 120;
			producetime = 100;
			mesh = new MeshOreRefinery();
			poweruse = 2;
			//metal = 10;
			ore = 10
		}
		
	}
	
}
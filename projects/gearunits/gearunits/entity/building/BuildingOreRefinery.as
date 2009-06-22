package gearunits.entity.building 
{
	import gearunits.models.MeshOreRefinery;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingOreRefinery extends Building
	{
		//[Embed(source = "../../../system/icon/orerefinery_rts_icon32.jpg")]
		//private var buildingimage:Class;
		
		public function BuildingOreRefinery() 
		{
			//buildingicon = new buildingimage();
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
package gearunits.sandy3d.entity.building 
{
	import gearunits.models.MeshOreRefinery;
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingGasRefinery extends SBuilding
	{
		//[Embed(source = "../../../system/icon/gasrefinery_rts_icon32.jpg")]
		//private var buildingimage:Class;
		//public var buildingicon:Bitmap = new buildingimage();
		
		public function SBuildingGasRefinery() 
		{
			//buildingicon = new buildingimage();
			name = 'Gas Refinery';
			buildingtype = 'Gas Refinery';
			
			mesh = new MeshOreRefinery();
			
			buildtime = 120;
			producetime = 100;
			poweruse = 2;
			gas = 10
			poweruse = 2;
		}
		
	}
	
}
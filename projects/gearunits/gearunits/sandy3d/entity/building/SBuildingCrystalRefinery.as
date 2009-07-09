package gearunits.sandy3d.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	import gearunits.sandy3d.technologytree.STechPowerPlant;
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingCrystalRefinery extends SBuilding
	{
		//[Embed(source = "../../../system/icon/crystalrefinery_rts_icon32.jpg")]
		//private var buildingimage:Class;
		//public var buildingicon:Bitmap = new buildingimage();
		
		public function SBuildingCrystalRefinery() 
		{
			//buildingicon = new buildingimage();
			name = 'Crystal Refinery';
			mesh = new MeshConstructionYard();
			
			//tech
			var techpowerplant:STechPowerPlant = new STechPowerPlant();
			tech.push(techpowerplant);
			
			buildtime = 120;
			producetime = 100;
			crystal = 10;
			poweruse = 2;
		}
		
	}
	
}
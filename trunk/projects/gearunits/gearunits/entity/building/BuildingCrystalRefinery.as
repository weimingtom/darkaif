package gearunits.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	import gearunits.technologytree.TechPowerPlant;
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingCrystalRefinery extends Building
	{
		//[Embed(source = "../../../system/icon/crystalrefinery_rts_icon32.jpg")]
		//private var buildingimage:Class;
		//public var buildingicon:Bitmap = new buildingimage();
		
		public function BuildingCrystalRefinery() 
		{
			//buildingicon = new buildingimage();
			name = 'Crystal Refinery';
			mesh = new MeshConstructionYard();
			
			//tech
			var techpowerplant:TechPowerPlant = new TechPowerPlant();
			tech.push(techpowerplant);
			
			buildtime = 120;
			producetime = 100;
			crystal = 10;
			poweruse = 2;
		}
		
	}
	
}
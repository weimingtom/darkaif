﻿package gearunits.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	import gearunits.technologytree.TechPowerPlant;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingConstructionYard extends Building
	{
		//[Embed(source = "../../../system/icon/constructionyard_rts_icon32.jpg")]
		//private var buildingimage:Class;
		//public var buildingicon:Bitmap = new buildingimage();
		
		public function BuildingConstructionYard() 
		{
			//buildingicon = new buildingimage();
			name = 'Construction Yard';
			mesh = new MeshConstructionYard();
			
			//tech
			var techpowerplant:TechPowerPlant = new TechPowerPlant();
			tech.push(techpowerplant);
		}
		
	}
	
}
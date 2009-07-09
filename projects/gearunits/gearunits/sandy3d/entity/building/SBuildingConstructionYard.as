package gearunits.sandy3d.entity.building 
{
	import gearunits.models.SMeshBuildingConstructionYard;
	import gearunits.sandy3d.technologytree.STechPowerPlant;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingConstructionYard extends SBuilding
	{
		//[Embed(source = "../../../system/icon/constructionyard_rts_icon32.jpg")]
		//private var buildingimage:Class;
		//public var buildingicon:Bitmap = new buildingimage();
		
		public function SBuildingConstructionYard() 
		{
			//buildingicon = new buildingimage();
			name = 'Construction Yard';
			mesh = new SMeshBuildingConstructionYard();
			
			//tech
			var techpowerplant:STechPowerPlant = new STechPowerPlant();
			tech.push(techpowerplant);
		}
		
	}
	
}
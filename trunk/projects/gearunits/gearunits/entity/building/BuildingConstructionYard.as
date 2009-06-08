package gearunits.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	import gearunits.technologytree.TechPowerPlant;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingConstructionYard extends Building
	{
		public function BuildingConstructionYard() 
		{
			
			name = 'Construction Yard';
			mesh = new MeshConstructionYard();
			
			//tech
			var techpowerplant:TechPowerPlant = new TechPowerPlant();
			tech.push(techpowerplant);
		}
		
	}
	
}
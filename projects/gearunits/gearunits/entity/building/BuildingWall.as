package gearunits.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingWall extends Building
	{
		public function BuildingWall() 
		{
			name = 'Wall';
			mesh = new MeshConstructionYard();
		}
		
	}
	
}
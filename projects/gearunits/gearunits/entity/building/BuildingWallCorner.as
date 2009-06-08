package gearunits.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingWallCorner extends Building
	{
		public function BuildingWallCorner() 
		{
			name = 'Wall Corner';
			mesh = new MeshConstructionYard();
		}
		
	}
	
}
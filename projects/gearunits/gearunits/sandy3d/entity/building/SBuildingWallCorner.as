package gearunits.sandy3d.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingWallCorner extends SBuilding
	{
		public function SBuildingWallCorner() 
		{
			name = 'Wall Corner';
			mesh = new MeshConstructionYard();
		}
		
	}
	
}
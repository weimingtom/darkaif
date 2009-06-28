package gearunits.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	import sandy.primitive.Box;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingWall extends Building
	{
		public function BuildingWall() 
		{
			name = 'Wall';
			mesh = new Box(null, 32, 32, 32);
			
			mesh.enableForcedDepth = true;
			mesh.depth = 1;
		}
		
	}
	
}
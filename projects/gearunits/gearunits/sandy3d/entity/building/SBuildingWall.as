package gearunits.sandy3d.entity.building 
{
	import sandy.primitive.Box;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingWall extends SBuilding
	{
		public function SBuildingWall() 
		{
			name = 'Wall';
			mesh = new Box(null, 32, 32, 32);
			
			mesh.enableForcedDepth = true;
			mesh.depth = 1;
		}
		
	}
	
}
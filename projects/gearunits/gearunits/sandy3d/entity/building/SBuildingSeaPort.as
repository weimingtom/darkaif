package gearunits.sandy3d.entity.building 
{
	import gearunits.models.MeshAirPort;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingSeaPort extends SBuilding
	{
		public function SBuildingSeaPort() 
		{
			name = 'Sea Port';
			mesh = new MeshAirPort();
		}
		
	}
	
}
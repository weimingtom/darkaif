package gearunits.sandy3d.entity.building
{
	import gearunits.models.MeshAirPort;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingAirPort extends SBuilding
	{
		public function SBuildingAirPort() 
		{
			name = 'Air Port';
			mesh = new MeshAirPort();
		}
		
	}
	
}
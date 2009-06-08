package gearunits.entity.building 
{
	import gearunits.models.MeshAirPort;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingSeaPort extends Building
	{
		public function BuildingSeaPort() 
		{
			name = 'Sea Port';
			mesh = new MeshAirPort();
		}
		
	}
	
}
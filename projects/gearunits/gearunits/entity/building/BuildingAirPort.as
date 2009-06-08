package gearunits.entity.building
{
	import gearunits.models.MeshAirPort;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingAirPort extends Building
	{
		public function BuildingAirPort() 
		{
			name = 'Air Port';
			mesh = new MeshAirPort();
		}
		
	}
	
}
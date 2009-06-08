package gearunits.entity.building 
{
	import gearunits.models.MeshMechFactory;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingMechFactory extends Building
	{
		public function BuildingMechFactory() 
		{
			name = 'Mech Factory';
			mesh = new MeshMechFactory();
		}
		
	}
	
}
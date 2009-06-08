package gearunits.entity.building 
{
	import gearunits.entity.infantry.Engineer;
	import gearunits.entity.infantry.Marine;
	import gearunits.entity.infantry.Sniper;
	import gearunits.models.MeshBarracks;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingBarracks extends Building
	{
		public function BuildingBarracks() 
		{
			name = 'Barracks';
			mesh = new MeshBarracks();
		}
		
	}
	
}
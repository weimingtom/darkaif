package gearunits.entity.building 
{
	import gearunits.models.MeshConstructionYard;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class BuildingTurret extends Building
	{
		public function BuildingTurret() 
		{
			name = 'Turret';
			mesh = new MeshConstructionYard();
		}
		
	}
	
}
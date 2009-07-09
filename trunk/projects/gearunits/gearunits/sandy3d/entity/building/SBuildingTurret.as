package gearunits.sandy3d.entity.building 
{
	import gearunits.models.SMeshBuildingConstructionYard;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingTurret extends SBuilding
	{
		public function SBuildingTurret() 
		{
			name = 'Turret';
			mesh = new SMeshBuildingConstructionYard();
		}
		
	}
	
}
package gearunits.away3d.entity.building 
{
	import gearunits.models.AMeshBuildingConstructionYard;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuildingConstructionYard extends ABuilding
	{
		public static const NAME:String = 'ABuildingConstructionYard';
		public static const TYPE:String = 'Building';
		
		public function ABuildingConstructionYard() 
		{
			name = 'ConstructionYard';
			mesh = new AMeshBuildingConstructionYard();
			
			
		}
		
	}
	
}
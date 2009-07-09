package gearunits.away3d.entity.building 
{
	import gearunits.away3d.entity.AEntityPoint3D;
	import gearunits.models.AMeshBuildingMechFactory;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuildingMechFactory extends ABuilding
	{
		public static const NAME:String = 'ABuildingMechFactory';
		public static const TYPE:String = 'Building';
		
		public function ABuildingMechFactory() 
		{
			name = 'ABuildingMechFactory';
			mesh = new AMeshBuildingMechFactory();
			type.push({name:'landvehicle'});
			
			var entpoint:AEntityPoint3D;
			entpoint = new AEntityPoint3D();
			entpoint.x = 0;
			entpoint.y = 0;
			entpoint.z = -32;
			entpoint.bexit = true;
			entityPoint.push(entpoint);
		}
		
	}
	
}
package gearunits.away3d.entity.building 
{
	import away3d.primitives.Cube;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ABuildingWall extends ABuilding
	{
		public static const NAME:String = 'ABuildingWall';
		public static const TYPE:String = 'Building';
		public function ABuildingWall() 
		{
			mesh = new Cube( { height:32, width:32, depth:32 } );
		}
		
	}
	
}
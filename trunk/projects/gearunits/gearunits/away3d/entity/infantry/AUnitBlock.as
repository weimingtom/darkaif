package gearunits.away3d.entity.infantry 
{
	import away3d.primitives.Cube;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AUnitBlock extends AInfantry
	{
		public static const NAME:String = 'AUnitBlock';
		public static const TYPE:String = 'Infantry';
		
		public function AUnitBlock() 
		{
			mesh = new Cube( {name:id,height:32, width:32, depth:32 } );
			movespeed = 2;
		}
		
	}
	
}
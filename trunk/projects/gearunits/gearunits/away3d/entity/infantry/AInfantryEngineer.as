package gearunits.away3d.entity.infantry 
{
	import away3d.primitives.Cube;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AInfantryEngineer extends AInfantry
	{
		public static const NAME:String = 'AInfantryEngineer';
		public static const TYPE:String = 'Infantry';
		
		public function AInfantryEngineer() 
		{
			name = 'Engineer';
			mesh = new Cube( { height:16, width:16, depth:16 } );
			spawntime = 10;
			movespeed = 2;
		}
		
	}
	
}
package gearunits.sandy3d.entity.infantry 
{
	import gearunits.sandy3d.entity.SStructureUnit;
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Information: Beware the code need to be all in there. Any missing information it will cause an event error.
	 * 
	 */
	public class SInfantry extends SStructureUnit
	{
		public static const NAME:String = 'SInfantry';
		public function SInfantry() 
		{
			name = 'Infantry';
			classtype = 'Infantry';
		}
		
	}
	
}
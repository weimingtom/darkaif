package gearunits.entity.spacecraft 
{
	import gearunits.models.MeshSpacecraftFedBaseCamp;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Baseship extends Spacecraft
	{
		
		public function Baseship() 
		{
			mesh = new MeshSpacecraftFedBaseCamp();
		}
		
	}
	
}
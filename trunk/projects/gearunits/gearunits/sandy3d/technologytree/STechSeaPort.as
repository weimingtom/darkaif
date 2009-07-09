package gearunits.sandy3d.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class STechSeaPort extends STechnologyTree
	{
		
		public function STechSeaPort() 
		{
			name = 'Sea Port';
			
			var orerefinery:STechOreRefinery = new STechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
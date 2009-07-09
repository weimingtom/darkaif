package gearunits.sandy3d.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class STechAirPort extends STechnologyTree
	{
		
		public function STechAirPort() 
		{
			name = 'Air Port';
			
			var orerefinery:STechOreRefinery = new STechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
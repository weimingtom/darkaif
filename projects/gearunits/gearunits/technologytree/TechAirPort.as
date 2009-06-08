package gearunits.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class TechAirPort extends TechnologyTree
	{
		
		public function TechAirPort() 
		{
			name = 'Air Port';
			
			var orerefinery:TechOreRefinery = new TechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
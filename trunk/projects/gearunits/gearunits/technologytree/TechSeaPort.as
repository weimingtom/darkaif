package gearunits.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class TechSeaPort extends TechnologyTree
	{
		
		public function TechSeaPort() 
		{
			name = 'Sea Port';
			
			var orerefinery:TechOreRefinery = new TechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
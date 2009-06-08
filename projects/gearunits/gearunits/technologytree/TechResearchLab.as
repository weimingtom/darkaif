package gearunits.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class TechResearchLab extends TechnologyTree
	{
		
		public function TechResearchLab() 
		{
			name = 'Research Lab';
			
			var orerefinery:TechOreRefinery = new TechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
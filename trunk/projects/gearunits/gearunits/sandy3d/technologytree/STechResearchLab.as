package gearunits.sandy3d.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class STechResearchLab extends STechnologyTree
	{
		
		public function STechResearchLab() 
		{
			name = 'Research Lab';
			
			var orerefinery:STechOreRefinery = new STechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
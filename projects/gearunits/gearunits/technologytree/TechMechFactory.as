package gearunits.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class TechMechFactory extends TechnologyTree
	{
		
		public function TechMechFactory() 
		{
			name = 'Mech Factory';
			
			var orerefinery:TechOreRefinery = new TechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
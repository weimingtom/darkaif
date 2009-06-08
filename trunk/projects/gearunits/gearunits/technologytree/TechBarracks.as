package gearunits.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class TechBarracks extends TechnologyTree
	{
		
		public function TechBarracks() 
		{
			name = 'Barracks';
			
			var constructionyard:TechConstructionYard = new TechConstructionYard();
			tech.push(constructionyard);
		}
		
	}
	
}
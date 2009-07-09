package gearunits.sandy3d.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class STechBarracks extends STechnologyTree
	{
		
		public function TechBarracks() 
		{
			name = 'Barracks';
			
			var constructionyard:STechConstructionYard = new STechConstructionYard();
			tech.push(constructionyard);
		}
		
	}
	
}
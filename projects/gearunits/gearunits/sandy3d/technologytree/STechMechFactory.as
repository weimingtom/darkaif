package gearunits.sandy3d.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class STechMechFactory extends STechnologyTree
	{
		
		public function STechMechFactory() 
		{
			name = 'Mech Factory';
			
			var orerefinery:STechOreRefinery = new STechOreRefinery();
			tech.push(orerefinery);
		}
		
	}
	
}
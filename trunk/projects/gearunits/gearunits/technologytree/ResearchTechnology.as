package gearunits.technologytree
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ResearchTechnology 
	{
		public var name:String = 'none';
		public var cost:Number = 0;
		public var time:Number = 0;
		public var level:Number = 0;
		public var description:String = '';
		
		public var tech:Vector.<TechnologyName> = new Vector.<TechnologyName>();
		
		public function ResearchTechnology() 
		{
			
		}
		
	}
	
}
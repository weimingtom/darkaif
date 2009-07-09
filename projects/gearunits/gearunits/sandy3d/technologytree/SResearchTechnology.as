package gearunits.sandy3d.technologytree
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SResearchTechnology 
	{
		public var name:String = 'none';
		public var cost:Number = 0;
		public var time:Number = 0;
		public var level:Number = 0;
		public var description:String = '';
		
		public var tech:Vector.<STechnologyName> = new Vector.<STechnologyName>();
		
		public function SResearchTechnology() 
		{
			
		}
		
	}
	
}
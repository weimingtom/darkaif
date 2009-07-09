package gearunits.away3d.technologytree 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ATechnologyTree 
	{
		public var name:String = 'TechnologyTree';
		public var bresearch:Boolean = false;
		public var blocked:Boolean = false;
		public var brequiredtech:Boolean = false;
		public var level:int = 0;
		public var faction:String = 'none';
		public var description:String = 'none';
		
		public var tech:Vector.<ATechnologyTree> = new Vector.<ATechnologyTree>();
		
		public function ATechnologyTree() 
		{
			
		}
		
	}
	
}
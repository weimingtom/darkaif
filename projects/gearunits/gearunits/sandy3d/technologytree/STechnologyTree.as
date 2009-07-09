package gearunits.sandy3d.technologytree
{
	/**
	 * ...
	 * @author Darknet
	 * 
	 * buildings and units
	 */
	public class STechnologyTree 
	{
		public var name:String = 'none';
		public var cost:Number = 0;
		public var time:Number = 0;
		public var level:Number = 0;
		public var description:String = '';
		public var tech:Vector.<STechnologyTree> = new Vector.<STechnologyTree>();//sub branches
		//public var unit:Vector.<Infantry> = new Vector.<Infantry>();
		//public var vehicle:Vector.<Vehicle> = new Vector.<Vehicle>();
		
		public function STechnologyTree() 
		{
			
		}
		
	}
	
}
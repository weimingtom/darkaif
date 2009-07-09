package gearunits.sandy3d.entity
{
	import sandy.core.data.Point3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SEntityPoint3D 
	{
		public var name:String = 'EntityPoint3D';
		
		public var x:Number = 0;
		public var y:Number = 0
		public var z:Number = 0;
		
		public var rotationx:Number = 0;
		public var rotationy:Number = 0;
		public var rotationz:Number = 0;
		
		public var min:Point3D = new Point3D();
		public var max:Point3D = new Point3D();
		
		public var tag:String = 'none';
		public var tagname:String = 'none';
		public var tagid:String = '';
		
		public var bexit:Boolean = false;
		public var bentry:Boolean = false;
		
		public function SEntityPoint3D() 
		{
			
		}
		
	}
	
}
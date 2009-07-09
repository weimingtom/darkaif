package gearunits.papervision3d.entity 
{
	import org.papervision3d.core.math.Number3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PEntityPoint3D 
	{
		public var name:String = 'EntityPoint3D';
		
		public var x:Number = 0;
		public var y:Number = 0
		public var z:Number = 0;
		
		public var rotationx:Number = 0;
		public var rotationy:Number = 0;
		public var rotationz:Number = 0;
		
		//box collision
		public var min:Number3D = new Number3D();
		public var max:Number3D = new Number3D();
		
		public var tag:String = 'none';
		public var tagname:String = 'none';
		public var tagid:String = '';
		
		public var bexit:Boolean = false;
		public var bentry:Boolean = false;
		
		public function PEntityPoint3D() 
		{
			
		}
		
	}
	
}
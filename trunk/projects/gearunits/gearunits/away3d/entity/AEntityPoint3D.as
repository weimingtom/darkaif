package gearunits.away3d.entity 
{
	import away3d.core.base.Mesh;
	import away3d.core.math.Number3D;
	import gearunits.models.AMesh_2DBox;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AEntityPoint3D 
	{
		public var name:String = 'EntityPoint3D';
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var meshbox:Mesh = new AMesh_2DBox();//2d and 3d collision
		
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
		
		public function AEntityPoint3D() 
		{
			
		}
		
		
	}
	
}
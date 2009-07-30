package
{
	import sandy.core.scenegraph.Shape3D;
	import sandy.materials.Appearance;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
	import sandy.primitive.Box;
	/**
	 * ...
	 * @author Darknet
	 */
	public class SUnitBlock
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var mesh:Shape3D;
		public var onlineid:String = '';
		
		public function SUnitBlock() 
		{
			var material:Material = new ColorMaterial(0xadff2f);
			var appearance:Appearance = new Appearance(material);
			mesh = new Box(null,32,32,32);
			mesh.appearance = appearance;
			//mesh.enableForcedDepth = true;
			//mesh.depth = 1;
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
		}
		
	}
	
}
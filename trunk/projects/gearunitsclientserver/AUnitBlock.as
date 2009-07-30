package{
	import away3d.core.base.Mesh;
	import away3d.primitives.Cube;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class AUnitBlock
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var mesh:Mesh;
		public var onlineid:String = '';
		public static var _id:Number = 0;
		public var id:Number = 0;
		
		public function AUnitBlock() 
		{
			_id++;
			id = _id;
			mesh = new Cube( {name:id,height:32, width:32, depth:32 } );

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
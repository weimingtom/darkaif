package  gearunits.models{
	import away3d.core.base.Face;
	import away3d.core.base.Mesh;
	import away3d.core.base.UV;
	import away3d.core.base.Vertex;
	import away3d.core.utils.Init;
	
	/*
	 * collision model for 2d
	 */

	public class AMesh_2DBox extends Mesh {
		private var ve:Array;
		private var fa:Array;

		public function AMesh_2DBox(init:Object = null) {
			super( init );
			init = Init.parse(init);
			ve = [];
			v(16.000000,0.000000,16.000000);
			v(16.000000,0.000000,-16.000000);
			v(-16.000000,0.000000,-16.000000);
			v(-16.000000,0.000000,16.000000);

			f(0,3,2,0.000000,0.000000,0.800000,0.000000,0.800000,1.000000,-0.000000,0.000000,1.000000);
			f(0,2,1,0.000000,0.000000,0.800000,1.000000,0.000000,1.000000,0.000000,-0.000000,1.000000);

			this.x = 0.000000;
			this.y = 0.000000;
			this.z = 0.000000;

			this.rotationX = 0.000000;
			this.rotationY = 0.000000;
			this.rotationZ = 0.000000;

			this.scaleX = 1.000000;

			this.scaleY = 1.000000;

			this.scaleZ = 1.000000;
		}
		public function v(x:Number, y:Number, z:Number):void {
			ve.push(new Vertex(x, y, z));
		}

		public function f(vertexIndex1:int, vertexIndex2:int, vertexIndex3:int, uv00:Number, uv01:Number, uv10:Number, uv11:Number, uv20:Number, uv21:Number, normalx:Number, normaly:Number, normalz:Number):void {
			var face:Face = new Face( ve[vertexIndex1], ve[vertexIndex2], ve[vertexIndex3], null, new UV(uv00, uv01), new UV(uv10, uv11), new UV(uv20, uv21) );
			addFace(face);
		}

		public function f2(vertexIndex1:int, vertexIndex2:int, vertexIndex3:int):void {
			addFace( new Face(ve[vertexIndex1], ve[vertexIndex2], ve[vertexIndex3]) );
		}

	}
}
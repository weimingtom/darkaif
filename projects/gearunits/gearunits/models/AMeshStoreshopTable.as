package  gearunits.models{
	import away3d.core.base.Face;
	import away3d.core.base.Mesh;
	import away3d.core.base.UV;
	import away3d.core.base.Vertex;
	import away3d.core.utils.Init;

	public class AMeshStoreshopTable extends Mesh {
		private var ve:Array;
		private var fa:Array;

		public function AMeshStoreshopTable(init:Object = null) {
			super( init );
			init = Init.parse(init);
			ve = [];
			v(32.000000,0.000000,31.999998);
			v(32.000000,0.000000,-32.000000);
			v(-32.000004,0.000000,-31.999994);
			v(-31.999989,0.000000,32.000011);
			v(32.000015,64.000000,31.999983);
			v(31.999979,64.000000,-32.000019);
			v(-32.000011,64.000000,-31.999989);
			v(-31.999998,64.000000,32.000000);

			f(3,7,4,0.000000,0.334353,0.332314,0.333333,0.333333,0.665647,0.000000,1.000000,0.000000);
			f(4,0,3,0.333333,0.665647,0.001020,0.666667,0.000000,0.334353,0.000000,1.000000,0.000000);
			f(2,6,7,0.000000,0.332314,0.001020,0.000000,0.333333,0.001019,-1.000000,0.000000,-0.000000);
			f(2,7,3,0.000000,0.332314,0.333333,0.001019,0.332314,0.333333,-1.000000,0.000000,-0.000000);
			f(1,5,2,0.998981,0.000000,1.000000,0.332314,0.666667,0.001020,-0.000000,-1.000000,-0.000000);
			f(5,6,2,1.000000,0.332314,0.667686,0.333333,0.666667,0.001020,-0.000000,-1.000000,0.000000);
			f(0,4,1,0.665647,0.000000,0.666667,0.332314,0.333333,0.001020,1.000000,0.000000,-0.000000);
			f(4,5,1,0.666667,0.332314,0.334353,0.333333,0.333333,0.001020,1.000000,-0.000001,0.000000);
			f(4,7,5,1.000000,0.334353,0.998981,0.666667,0.667686,0.333333,-0.000000,-0.000000,1.000000);
			f(7,6,5,0.998981,0.666667,0.666667,0.665647,0.667686,0.333333,0.000000,-0.000000,1.000000);
			f(3,0,2,0.666667,0.665647,0.334353,0.666667,0.665647,0.333333,0.000000,0.000000,-1.000000);
			f(2,0,1,0.665647,0.333333,0.334353,0.666667,0.333333,0.334353,-0.000000,0.000000,-1.000000);

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
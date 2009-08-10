package  gearunits.models{
	import away3d.core.base.Face;
	import away3d.core.base.Mesh;
	import away3d.core.base.UV;
	import away3d.core.base.Vertex;
	import away3d.core.utils.Init;

	public class AMeshStoreshopWall extends Mesh {
		private var ve:Array;
		private var fa:Array;

		public function AMeshStoreshopWall(init:Object = null) {
			super( init );
			init = Init.parse(init);
			ve = [];
			v(-319.999939,320.000000,-1.000000);
			v(-320.000122,0.000061,-1.000061);
			v(319.999817,-0.000092,-0.999817);
			v(320.000122,319.999939,-0.999756);
			v(-319.999878,320.000061,1.000000);
			v(-320.000000,0.000031,0.999939);
			v(320.000000,0.000000,1.000183);
			v(320.000000,320.000000,1.000244);

			f(7,6,4,0.001529,0.500000,0.000000,0.001529,0.500000,0.498471,-0.000000,1.000000,-0.000000);
			f(6,5,4,0.000000,0.001529,0.498471,0.000000,0.500000,0.498471,-0.000000,1.000000,-0.000000);
			f(3,0,2,0.001529,0.500000,0.500000,0.501529,0.000000,0.998471,0.000000,-1.000000,0.000000);
			f(0,1,2,0.500000,0.501529,0.498471,1.000000,0.000000,0.998471,0.000000,-1.000000,0.000000);
			f(7,3,6,0.501529,0.000000,0.503087,0.000005,0.500000,0.498471,1.000000,0.000061,-0.000000);
			f(3,2,6,0.503087,0.000005,0.501558,0.498476,0.500000,0.498471,1.000000,-0.000092,-0.000001);
			f(6,2,5,0.506174,0.000005,0.507732,0.000000,0.507703,0.498476,-0.000000,0.000046,-1.000000);
			f(2,1,5,0.507732,0.000000,0.509261,0.498471,0.507703,0.498476,-0.000000,-0.000015,-1.000000);
			f(1,0,5,0.504645,0.000000,0.506174,0.498471,0.503087,0.000005,-1.000000,0.000061,0.000001);
			f(5,0,4,0.503087,0.000005,0.506174,0.498471,0.504616,0.498476,-1.000000,0.000031,0.000000);
			f(7,0,3,0.510790,0.498476,0.510819,0.000000,0.512348,0.498471,0.000000,-0.000031,1.000000);
			f(4,0,7,0.509261,0.000005,0.510819,0.000000,0.510790,0.498476,0.000000,-0.000031,1.000000);

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
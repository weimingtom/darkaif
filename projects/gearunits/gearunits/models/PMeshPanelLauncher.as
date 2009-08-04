package  gearunits.models{
	import org.papervision3d.core.math.NumberUV;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.proto.MaterialObject3D;

	public class PMeshPanelLauncher extends TriangleMesh3D {
		private var ve:Array;
		private var fa:Array;

		public function PMeshPanelLauncher(material : MaterialObject3D ) {
			super( material, new Array(), new Array() );
			ve = this.geometry.vertices;
			fa = this.geometry.faces;
			v(8.000000,-8.000000,1.600000);
			v(8.000000,-8.000000,-1.600000);
			v(-8.000001,-8.000000,-1.600000);
			v(-7.999996,-8.000000,1.600000);
			v(8.000004,8.000000,1.599999);
			v(7.999995,8.000000,-1.600001);
			v(-8.000003,8.000000,-1.599999);
			v(-7.999999,8.000000,1.600000);

			f(4,0,3,0.001529,0.500000,0.000000,0.001529,0.498471,0.000000,0.000000,1.000000,0.000000);
			f(4,3,7,0.001529,0.500000,0.498471,0.000000,0.500000,0.498471,0.000000,1.000000,0.000000);
			f(2,6,7,0.500000,0.998471,0.501529,0.500000,0.601224,0.500306,-1.000000,0.000001,-0.000000);
			f(2,7,3,0.500000,0.998471,0.601224,0.500306,0.599694,0.998777,-1.000000,0.000001,-0.000000);
			f(1,5,2,0.998471,0.000000,1.000000,0.498471,0.500000,0.001529,-0.000000,-1.000000,-0.000000);
			f(5,6,2,1.000000,0.498471,0.501529,0.500000,0.500000,0.001529,-0.000000,-1.000000,0.000000);
			f(0,4,5,0.498471,0.500000,0.500000,0.998471,0.400306,0.998777,1.000000,-0.000003,-0.000000);
			f(0,5,1,0.498471,0.500000,0.400306,0.998777,0.398777,0.500306,1.000000,0.000000,0.000000);
			f(4,7,5,0.702447,0.500306,0.700918,0.998777,0.602753,0.500000,-0.000000,-0.000000,1.000000);
			f(7,6,5,0.700918,0.998777,0.601224,0.998471,0.602753,0.500000,0.000000,-0.000000,1.000000);
			f(0,1,3,0.101223,0.998471,0.001529,0.998777,0.099694,0.500000,0.000000,0.000000,-1.000000);
			f(1,2,3,0.001529,0.998777,0.000000,0.500306,0.099694,0.500000,0.000000,-0.000000,-1.000000);

			this.x = 0.000000;
			this.y = 0.000000;
			this.z = 0.000000;

			this.rotationX = 0.000000;
			this.rotationY = 0.000000;
			this.rotationZ = 0.000000;

			this.scaleX = 1.000000;
			this.scaleY = 1.000000;
			this.scaleZ = 1.000000;

			this.geometry.ready = true;
		}
		public function v(x:Number, y:Number, z:Number):void {
			ve.push(new Vertex3D(x, y, z));
		}

		public function f(vertexIndex1:Number, vertexIndex2:Number, vertexIndex3:Number, uv00:Number, uv01:Number, uv10:Number, uv11:Number, uv20:Number, uv21:Number, normalx:Number, normaly:Number, normalz:Number):void {
			var face : Triangle3D = new Triangle3D(this, [ve[vertexIndex1], ve[vertexIndex2], ve[vertexIndex3]], null, [ new NumberUV(uv00, uv01), new NumberUV(uv10, uv11), new NumberUV(uv20, uv21) ] );
			face.faceNormal = new Number3D(normalx,normaly,normalz);
			fa.push(face);
		}

		public function f2(vertexIndex1:Number, vertexIndex2:Number, vertexIndex3:Number):void {
			var face:Triangle3D = new Triangle3D(this, [ve[vertexIndex1], ve[vertexIndex2], ve[vertexIndex3]], null, []);
			fa.push(face);
		}

	}
}
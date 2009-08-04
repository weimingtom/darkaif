package  gearunits.models{
	import org.papervision3d.core.math.NumberUV;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.proto.MaterialObject3D;

	public class PMeshBaseLauncher extends TriangleMesh3D {
		private var ve:Array;
		private var fa:Array;

		public function PMeshBaseLauncher(material : MaterialObject3D ) {
			super( material, new Array(), new Array() );
			ve = this.geometry.vertices;
			fa = this.geometry.faces;
			v(8.000000,-2.400000,8.000000);
			v(8.000000,-2.400000,-8.000000);
			v(-8.000001,-2.400000,-7.999998);
			v(-7.999996,-2.400000,8.000003);
			v(8.000004,2.400000,7.999996);
			v(7.999995,2.400000,-8.000005);
			v(-8.000003,2.400000,-7.999997);
			v(-7.999999,2.400000,8.000000);

			f(4,0,7,0.802141,0.998471,0.652600,0.998930,0.800612,0.500000,0.000000,1.000000,0.000001);
			f(0,3,7,0.652600,0.998930,0.651071,0.500459,0.800612,0.500000,0.000000,1.000000,0.000001);
			f(2,6,7,0.501529,0.500000,0.651071,0.500459,0.649541,0.998930,-1.000000,0.000000,-0.000000);
			f(2,7,3,0.501529,0.500000,0.649541,0.998930,0.500000,0.998471,-1.000000,0.000000,-0.000001);
			f(1,5,2,0.000000,0.500459,0.149541,0.500000,0.001529,0.998930,-0.000000,-1.000000,-0.000001);
			f(5,6,2,0.149541,0.500000,0.151071,0.998471,0.001529,0.998930,-0.000000,-1.000000,0.000000);
			f(0,4,1,0.802141,0.500459,0.951682,0.500000,0.803670,0.998930,1.000000,0.000000,-0.000001);
			f(4,5,1,0.951682,0.500000,0.953212,0.998471,0.803670,0.998930,1.000000,-0.000001,0.000001);
			f(4,7,5,0.501529,0.000000,1.000000,0.001529,0.500000,0.498471,-0.000000,-0.000000,1.000000);
			f(7,6,5,1.000000,0.001529,0.998471,0.500000,0.500000,0.498471,0.000000,-0.000000,1.000000);
			f(0,1,2,0.001529,0.500000,0.000000,0.001529,0.498471,0.000000,0.000000,0.000000,-1.000000);
			f(0,2,3,0.001529,0.500000,0.498471,0.000000,0.500000,0.498471,0.000000,-0.000000,-1.000000);

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
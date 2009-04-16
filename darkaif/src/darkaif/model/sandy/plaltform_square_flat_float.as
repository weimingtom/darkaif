package darkaif.model.sandy{
	import sandy.primitive.Primitive3D;
	import sandy.core.scenegraph.Geometry3D;
	import sandy.core.scenegraph.Shape3D;

	public class plaltform_square_flat_float extends Shape3D implements Primitive3D {
		private var l:Geometry3D;

		private function f(v1:Number,v2:Number,v3:Number,uv00:Number,uv01:Number,uv10:Number,uv11:Number,uv20:Number,uv21:Number,normX:Number,normY:Number,normZ:Number):void {
			var uv1:Number = l.getNextUVCoordID();
			var uv2:Number = uv1 + 1;
			var uv3:Number = uv2 + 1;

			l.setUVCoords(uv1,uv00,1-uv01);
			l.setUVCoords(uv2,uv10,1-uv11);
			l.setUVCoords(uv3,uv20,1-uv21);

			l.setFaceVertexIds(l.getNextFaceID(), v1,v2,v3);
			l.setFaceUVCoordsIds(l.getNextFaceUVCoordID(), uv1,uv2,uv3);
			l.setFaceNormal(l.getNextFaceNormalID(), normX,normZ,normY);
		}

		private function f2(v1:Number,v2:Number,v3:Number):void {
			l.setFaceVertexIds(l.getNextFaceID(), v1,v2,v3);
		}

		private function v(vx:Number,vy:Number,vz:Number):void {
			l.setVertex(l.getNextVertexID(),vx,vz,vy);
		}

		public function plaltform_square_flat_float( p_Name:String=null ) {
			super( p_Name );
			geometry = generate();
		}

		public function generate(... arguments):Geometry3D {
			l = new Geometry3D();
			v(16.000000,16.000000,-1.000000);
			v(16.000000,-16.000000,-1.000000);
			v(-16.000002,-15.999996,-1.000000);
			v(-15.999992,16.000006,-1.000000);
			v(16.000008,15.999992,1.000000);
			v(15.999990,-16.000010,1.000000);
			v(-16.000006,-15.999994,1.000000);
			v(-15.999998,16.000000,1.000000);

			f(4,0,3,0.500134,0.499866,0.503063,0.557709,0.060772,0.557709,0.000000,1.000000,0.000004);
			f(4,3,7,0.500134,0.499866,0.060772,0.557709,0.057843,0.499866,0.000000,1.000000,0.000003);
			f(2,6,7,0.000000,0.060503,0.057843,0.057575,0.057843,0.499866,-1.000000,0.000000,-0.000002);
			f(2,7,3,0.000000,0.060503,0.057843,0.499866,0.000000,0.502794,-1.000000,0.000000,-0.000003);
			f(1,5,2,0.504066,0.000000,0.500134,0.057575,0.061775,0.000000,-0.000000,-1.000000,-0.000005);
			f(5,6,2,0.500134,0.057575,0.057843,0.057575,0.061775,0.000000,-0.000000,-1.000000,0.000001);
			f(0,4,1,0.557709,0.503797,0.500134,0.499866,0.557709,0.061506,1.000000,0.000000,-0.000004);
			f(4,5,1,0.500134,0.499866,0.500134,0.057575,0.557709,0.061506,1.000000,-0.000001,0.000005);
			f(4,7,5,0.500134,0.499866,0.057843,0.499866,0.500134,0.057575,0.000000,0.000000,1.000000);
			f(7,6,5,0.057843,0.499866,0.057843,0.057575,0.500134,0.057575,0.000000,0.000000,1.000000);
			f(0,1,2,0.442291,1.000000,0.000000,1.000000,0.000000,0.557709,0.000000,0.000000,-1.000000);
			f(0,2,3,0.442291,1.000000,0.000000,0.557709,0.442291,0.557709,0.000000,0.000000,-1.000000);

			this.x = 0.000000;
			this.y = 0.000000;
			this.z = 0.000000;

			this.rotateX = 0.000000;
			this.rotateY = 0.000000;
			this.rotateZ = 0.000000;

			this.scaleX = 1.000000;
			this.scaleY = 1.000000;
			this.scaleZ = 1.000000;
			return (l);
		}
	}
}
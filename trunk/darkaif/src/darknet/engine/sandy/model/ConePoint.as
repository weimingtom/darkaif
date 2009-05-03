package  darknet.engine.sandy.model{
	import sandy.primitive.Primitive3D;
	import sandy.core.scenegraph.Geometry3D;
	import sandy.core.scenegraph.Shape3D;

	public class ConePoint extends Shape3D implements Primitive3D {
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

		private function f4(v1:Number,v2:Number,v3:Number,v4:Number,uv00:Number,uv01:Number,uv10:Number,uv11:Number,uv20:Number,uv21:Number,uv30:Number,uv31:Number,normX:Number,normY:Number,normZ:Number):void {
			var uv1:Number = l.getNextUVCoordID();
			var uv2:Number = uv1 + 1;
			var uv3:Number = uv2 + 1;
			var uv4:Number = uv3 + 1;

			l.setUVCoords(uv1,uv00,1-uv01);
			l.setUVCoords(uv2,uv10,1-uv11);
			l.setUVCoords(uv3,uv20,1-uv21);
			l.setUVCoords(uv4,uv30,1-uv31);

			l.setFaceVertexIds(l.getNextFaceID(),v1,v2,v3,v4);
			l.setFaceUVCoordsIds(l.getNextFaceUVCoordID(),uv1,uv2,uv3,uv4);
			l.setFaceNormal(l.getNextFaceNormalID(),normX,normZ,normY);
		}

		private function f2(v1:Number,v2:Number,v3:Number):void {
			l.setFaceVertexIds(l.getNextFaceID(), v1,v2,v3);
		}

		private function v(vx:Number,vy:Number,vz:Number):void {
			l.setVertex(l.getNextVertexID(),vx,vz,vy);
		}

		public function ConePoint( p_Name:String=null ) {
			super( p_Name );
			geometry = generate();
		}

		public function generate(... arguments):Geometry3D {
			l = new Geometry3D();
			v(2.000073,-2.000073,2.828531);
			v(0.732077,2.732152,2.828531);
			v(-2.732151,-0.732079,2.828531);
			v(0.000000,-0.000000,0.000000);

			f(1,0,3,0.577350,0.254644,0.000000,0.490712,0.136294,0.000000,0.863950,0.231495,-0.447214);
			f(3,2,1,0.934172,0.618034,0.493116,0.872678,0.577350,0.254644,-0.632456,0.632455,-0.447214);
			f(3,0,2,0.000000,1.000000,0.000000,0.490712,0.493116,0.872678,-0.231495,-0.863950,-0.447214);
			f(0,1,2,0.000000,0.490712,0.577350,0.254644,0.493116,0.872678,0.000000,0.000000,1.000000);

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
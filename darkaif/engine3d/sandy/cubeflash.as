package  {
	import sandy.primitive.Primitive3D;
	import sandy.core.scenegraph.Geometry3D;
	import sandy.core.scenegraph.Shape3D;

	public class cubeflash extends Shape3D implements Primitive3D {
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

		public function cubeflash( p_Name:String=null ) {
			super( p_Name );
			geometry = generate();
		}

		public function generate(... arguments):Geometry3D {
			l = new Geometry3D();
			v(1.000000,1.000000,-1.000000);
			v(1.000000,-1.000000,-1.000000);
			v(-1.000000,-1.000000,-1.000000);
			v(-1.000000,1.000000,-1.000000);
			v(1.000000,0.999999,1.000000);
			v(0.999999,-1.000001,1.000000);
			v(-1.000000,-1.000000,1.000000);
			v(-1.000000,1.000000,1.000000);

			f(4,0,3,0.333333,0.332314,0.001020,0.333333,0.000000,0.001020,0.000000,1.000000,0.000000);
			f(4,3,7,0.333333,0.332314,0.000000,0.001020,0.332314,0.000000,0.000000,1.000000,0.000000);
			f(2,6,7,0.000000,0.665647,0.001020,0.333333,0.333333,0.334353,-1.000000,0.000000,-0.000000);
			f(2,7,3,0.000000,0.665647,0.333333,0.334353,0.332314,0.666667,-1.000000,0.000000,-0.000000);
			f(1,5,2,0.665647,0.333333,0.666667,0.665647,0.333333,0.334353,-0.000000,-1.000000,-0.000000);
			f(5,6,2,0.666667,0.665647,0.334353,0.666667,0.333333,0.334353,-0.000000,-1.000000,0.000000);
			f(0,4,1,0.998981,0.000000,1.000000,0.332314,0.666667,0.001019,1.000000,0.000000,-0.000000);
			f(4,5,1,1.000000,0.332314,0.667686,0.333333,0.666667,0.001019,1.000000,-0.000001,0.000000);
			f(4,7,5,1.000000,0.334353,0.998981,0.666667,0.667686,0.333333,0.000000,0.000000,1.000000);
			f(7,6,5,0.998981,0.666667,0.666667,0.665647,0.667686,0.333333,0.000000,0.000000,1.000000);
			f(0,1,2,0.334353,0.333333,0.333333,0.001019,0.665647,0.000000,0.000000,0.000000,-1.000000);
			f(0,2,3,0.334353,0.333333,0.665647,0.000000,0.666667,0.332314,0.000000,0.000000,-1.000000);

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
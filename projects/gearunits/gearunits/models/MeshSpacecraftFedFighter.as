package  gearunits.models{
	import sandy.primitive.Primitive3D;
	import sandy.core.scenegraph.Geometry3D;
	import sandy.core.scenegraph.Shape3D;

	public class MeshSpacecraftFedFighter extends Shape3D implements Primitive3D {
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

		public function MeshSpacecraftFedFighter( p_Name:String=null ) {
			super( p_Name );
			geometry = generate();
		}

		public function generate(... arguments):Geometry3D {
			l = new Geometry3D();
			v(-4.180003,-13.629498,-4.180000);
			v(-4.180001,1.418501,-4.180000);
			v(4.180000,1.418498,-4.180000);
			v(4.179996,-13.629504,-4.180000);
			v(-4.180004,-13.629497,4.180000);
			v(-4.179997,1.418504,4.180000);
			v(4.180001,1.418498,4.180000);
			v(4.179997,-13.629502,4.180000);
			v(12.539993,-13.629504,-1.254000);
			v(12.539997,-13.629502,1.254000);
			v(12.540002,1.418497,-1.254000);
			v(12.540004,1.418497,1.254000);
			v(-12.540002,-13.629498,-1.254000);
			v(-12.540008,-13.629497,1.254000);
			v(-12.540000,1.418502,-1.254000);
			v(-12.539992,1.418505,1.254000);
			v(-4.179996,15.630501,4.179999);
			v(-12.539990,15.630503,1.253999);
			v(-12.539998,15.630501,-1.254001);
			v(-4.179998,15.630499,-4.180002);
			v(12.540004,15.630497,-1.254001);
			v(4.180003,15.630499,-4.180002);
			v(12.540006,15.630495,1.253999);
			v(4.180003,15.630497,4.179999);
			v(-4.180004,-15.719500,-4.179999);
			v(-12.540002,-15.719498,-1.253999);
			v(-12.540008,-15.719496,1.254001);
			v(-4.180004,-15.719498,4.180001);
			v(4.179997,-15.719500,4.180001);
			v(12.539997,-15.719501,1.254001);
			v(12.539993,-15.719503,-1.253999);
			v(4.179996,-15.719501,-4.179999);

			f(28,31,30,0.154676,0.888828,0.000473,0.888355,0.054917,0.734318,-0.000000,-1.000000,0.000000);
			f(28,30,29,0.154676,0.888828,0.054917,0.734318,0.101178,0.734459,0.000000,-1.000000,0.000001);
			f(24,27,25,0.761979,0.580115,0.916182,0.579642,0.816423,0.734152,-0.000000,-1.000000,0.000000);
			f(27,26,25,0.916182,0.579642,0.862684,0.734010,0.816423,0.734152,-0.000000,-1.000000,0.000001);
			f(0,4,24,0.154676,0.733845,0.155149,0.579642,0.193227,0.733963,1.000000,-0.000000,0.000000);
			f(4,27,24,0.155149,0.579642,0.193700,0.579760,0.193227,0.733963,1.000000,0.000000,0.000000);
			f(7,3,31,0.258739,0.733963,0.258265,0.579760,0.296816,0.579642,-1.000000,0.000000,0.000000);
			f(7,31,28,0.258739,0.733963,0.296816,0.579642,0.297289,0.733845,-1.000000,0.000000,0.000000);
			f(3,8,30,0.287825,0.540593,0.450309,0.541091,0.450191,0.579642,0.330350,-0.000000,-0.943858);
			f(3,30,31,0.287825,0.540593,0.450191,0.579642,0.287707,0.579143,0.330350,-0.000000,-0.943858);
			f(8,9,29,0.904048,0.539710,0.950309,0.539852,0.950191,0.578403,1.000000,-0.000000,-0.000002);
			f(8,29,30,0.904048,0.539710,0.950191,0.578403,0.903930,0.578261,1.000000,-0.000000,-0.000002);
			f(9,7,29,0.902275,0.038551,0.764632,0.038973,0.902156,0.000000,0.330350,0.000000,0.943858);
			f(7,28,29,0.764632,0.038973,0.764513,0.000422,0.902156,0.000000,0.330351,0.000001,0.943858);
			f(4,13,26,0.614568,0.039433,0.452083,0.039932,0.451965,0.001381,-0.330350,0.000000,0.943858);
			f(4,26,27,0.614568,0.039433,0.451965,0.001381,0.614450,0.000883,-0.330350,0.000001,0.943858);
			f(13,12,26,0.998344,0.038551,0.952083,0.038693,0.998226,0.000000,-1.000000,-0.000000,-0.000002);
			f(12,25,26,0.952083,0.038693,0.951965,0.000142,0.998226,0.000000,-1.000000,-0.000000,-0.000002);
			f(12,0,24,0.000118,0.539710,0.137761,0.540132,0.137643,0.578683,-0.330350,-0.000000,-0.943858);
			f(12,24,25,0.000118,0.539710,0.137643,0.578683,0.000000,0.578261,-0.330350,-0.000000,-0.943858);
			f(21,23,20,0.297762,0.734791,0.451965,0.734318,0.352206,0.888828,0.000000,1.000000,0.000000);
			f(23,22,20,0.451965,0.734318,0.398467,0.888686,0.352206,0.888828,0.000000,1.000000,0.000001);
			f(16,19,17,0.916182,0.888189,0.761979,0.888662,0.861738,0.734152,0.000000,1.000000,-0.000000);
			f(19,18,17,0.761979,0.888662,0.815477,0.734294,0.861738,0.734152,-0.000000,1.000000,-0.000001);
			f(5,1,19,0.761175,0.842259,0.606972,0.841786,0.607776,0.579642,1.000000,-0.000000,-0.000000);
			f(5,19,16,0.761175,0.842259,0.607776,0.579642,0.761979,0.580115,1.000000,-0.000000,-0.000000);
			f(2,6,23,0.451965,0.580115,0.606168,0.579642,0.606972,0.841786,-1.000000,0.000000,0.000000);
			f(2,23,21,0.451965,0.580115,0.606972,0.841786,0.452769,0.842259,-1.000000,0.000000,0.000000);
			f(6,11,22,0.765483,0.316538,0.903126,0.316116,0.903930,0.578261,0.330350,-0.000000,0.943858);
			f(6,22,23,0.765483,0.316538,0.903930,0.578261,0.766287,0.578683,0.330350,0.000000,0.943858);
			f(11,10,22,0.951161,0.262287,0.904900,0.262145,0.951965,0.000142,1.000000,-0.000000,-0.000001);
			f(10,20,22,0.904900,0.262145,0.905704,0.000000,0.951965,0.000142,1.000000,-0.000000,-0.000001);
			f(10,2,21,0.451161,0.263526,0.288676,0.263027,0.289481,0.000883,0.330350,-0.000000,-0.943858);
			f(10,21,20,0.451161,0.263526,0.289481,0.000883,0.451965,0.001381,0.330351,-0.000000,-0.943858);
			f(1,14,18,0.138613,0.262567,0.000970,0.262145,0.001774,0.000000,-0.330350,0.000000,-0.943858);
			f(1,18,19,0.138613,0.262567,0.001774,0.000000,0.139417,0.000422,-0.330351,-0.000000,-0.943858);
			f(14,15,18,0.952935,0.316258,0.999196,0.316116,0.953739,0.578402,-1.000000,0.000000,0.000003);
			f(15,17,18,0.999196,0.316116,1.000000,0.578261,0.953739,0.578402,-1.000000,0.000000,0.000003);
			f(15,5,16,0.452935,0.317497,0.615419,0.316998,0.616224,0.579143,-0.330351,0.000000,0.943858);
			f(15,16,17,0.452935,0.317497,0.616224,0.579143,0.453739,0.579642,-0.330351,0.000000,0.943858);
			f(12,13,14,0.952083,0.038693,0.998344,0.038551,0.952935,0.316258,-1.000000,0.000000,-0.000002);
			f(13,15,14,0.998344,0.038551,0.999196,0.316116,0.952935,0.316258,-1.000000,0.000001,0.000003);
			f(10,11,9,0.904900,0.262145,0.951161,0.262287,0.950309,0.539852,1.000000,-0.000000,-0.000001);
			f(10,9,8,0.904900,0.262145,0.950309,0.539852,0.904048,0.539710,1.000000,-0.000001,-0.000002);
			f(1,0,12,0.138613,0.262567,0.137761,0.540132,0.000118,0.539710,-0.330350,0.000000,-0.943858);
			f(1,12,14,0.138613,0.262567,0.000118,0.539710,0.000970,0.262145,-0.330350,0.000000,-0.943858);
			f(3,2,8,0.287825,0.540593,0.288676,0.263027,0.450309,0.541091,0.330350,-0.000000,-0.943858);
			f(2,10,8,0.288676,0.263027,0.451161,0.263526,0.450309,0.541091,0.330350,-0.000000,-0.943858);
			f(4,5,15,0.614568,0.039433,0.615419,0.316998,0.452935,0.317497,-0.330351,0.000000,0.943858);
			f(4,15,13,0.614568,0.039433,0.452935,0.317497,0.452083,0.039932,-0.330350,0.000000,0.943858);
			f(6,7,9,0.765483,0.316538,0.764632,0.038973,0.902275,0.038551,0.330350,-0.000000,0.943858);
			f(6,9,11,0.765483,0.316538,0.902275,0.038551,0.903126,0.316116,0.330350,-0.000000,0.943858);
			f(4,0,3,0.154676,0.733845,0.000473,0.734318,0.000000,0.580115,-0.000001,-1.000000,0.000000);
			f(4,3,7,0.154676,0.733845,0.000000,0.580115,0.154203,0.579642,-0.000001,-1.000000,0.000000);
			f(1,5,2,0.451492,0.579642,0.451965,0.733845,0.297289,0.580115,0.000000,1.000000,-0.000000);
			f(5,6,2,0.451965,0.733845,0.297762,0.734318,0.297289,0.580115,0.000001,1.000000,-0.000000);
			f(4,7,6,0.614568,0.039433,0.764632,0.038973,0.765483,0.316538,0.000000,0.000000,1.000000);
			f(4,6,5,0.614568,0.039433,0.765483,0.316538,0.615419,0.316998,0.000000,0.000000,1.000000);
			f(0,1,2,0.137761,0.540132,0.138613,0.262567,0.288676,0.263027,-0.000000,0.000000,-1.000000);
			f(0,2,3,0.137761,0.540132,0.288676,0.263027,0.287825,0.540593,-0.000000,0.000000,-1.000000);

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
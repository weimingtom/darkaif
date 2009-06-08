package gearunits.models {
	import sandy.primitive.Primitive3D;
	import sandy.core.scenegraph.Geometry3D;
	import sandy.core.scenegraph.Shape3D;

	public class MeshConstructionYard extends Shape3D implements Primitive3D {
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

		public function MeshConstructionYard( p_Name:String=null ) {
			super( p_Name );
			geometry = generate();
		}

		public function generate(... arguments):Geometry3D {
			l = new Geometry3D();
			v(9.842934,9.842933,-0.426301);
			v(12.860409,5.326961,-0.426301);
			v(13.920007,0.000006,-0.426301);
			v(12.860409,-5.326949,-0.426301);
			v(9.842934,-9.842921,-0.426301);
			v(5.326961,-12.860398,-0.426301);
			v(0.000008,-13.919992,-0.426301);
			v(-5.326944,-12.860398,-0.426301);
			v(-9.842918,-9.842924,-0.426301);
			v(-12.860398,-5.326949,-0.426301);
			v(-13.919995,0.000007,-0.426301);
			v(-12.860395,5.326964,-0.426301);
			v(-9.842917,9.842937,-0.426301);
			v(-5.326941,12.860415,-0.426301);
			v(0.000015,13.920010,-0.426301);
			v(5.326971,12.860407,-0.426301);
			v(9.842943,9.842924,0.443700);
			v(12.860415,5.326946,0.443700);
			v(13.920007,-0.000011,0.443700);
			v(12.860401,-5.326965,0.443700);
			v(9.842918,-9.842937,0.443700);
			v(5.326938,-12.860409,0.443700);
			v(-0.000021,-13.919992,0.443700);
			v(-5.326973,-12.860387,0.443700);
			v(-9.842943,-9.842899,0.443700);
			v(-12.860409,-5.326915,0.443700);
			v(-13.919995,0.000043,0.443700);
			v(-12.860384,5.326996,0.443700);
			v(-9.842893,9.842961,0.443700);
			v(-5.326909,12.860426,0.443700);
			v(0.000051,13.920010,0.443700);
			v(5.327004,12.860393,0.443700);
			v(0.000006,0.000007,-0.426301);
			v(5.327004,12.860393,8.708701);
			v(0.000051,13.920010,8.708701);
			v(-5.326909,12.860426,8.708701);
			v(-9.842893,9.842961,8.708701);
			v(-12.860384,5.326996,8.708701);
			v(-13.919995,0.000043,8.708701);
			v(-12.860409,-5.326915,8.708701);
			v(-9.842943,-9.842899,8.708701);
			v(-5.326973,-12.860387,8.708701);
			v(-0.000021,-13.919992,8.708701);
			v(5.326938,-12.860409,8.708701);
			v(9.842918,-9.842937,8.708701);
			v(12.860401,-5.326965,8.708701);
			v(13.920007,-0.000011,8.708701);
			v(12.860415,5.326946,8.708701);
			v(9.842943,9.842924,8.708701);
			v(8.957079,8.957063,11.608700);
			v(11.702980,4.847522,11.608700);
			v(12.667208,-0.000009,11.608700);
			v(11.702967,-4.847538,11.608700);
			v(8.957057,-8.957071,11.608700);
			v(4.847514,-11.702971,11.608700);
			v(-0.000018,-12.667193,11.608700);
			v(-4.847546,-11.702952,11.608700);
			v(-8.957078,-8.957038,11.608700);
			v(-11.702971,-4.847492,11.608700);
			v(-12.667195,0.000040,11.608700);
			v(-11.702950,4.847567,11.608700);
			v(-8.957031,8.957096,11.608700);
			v(-4.847486,11.702990,11.608700);
			v(0.000047,12.667211,11.608700);
			v(4.847575,11.702959,11.608700);
			v(3.926538,9.479400,14.508699);
			v(0.000040,10.260444,14.508699);
			v(-3.926462,9.479424,14.508699);
			v(-7.255194,7.255251,14.508699);
			v(-9.479388,3.926532,14.508699);
			v(-10.260427,0.000034,14.508699);
			v(-9.479406,-3.926467,14.508699);
			v(-7.255232,-7.255199,14.508699);
			v(-3.926511,-9.479390,14.508699);
			v(-0.000013,-10.260426,14.508699);
			v(3.926488,-9.479405,14.508699);
			v(7.255219,-7.255226,14.508699);
			v(9.479404,-3.926504,14.508699);
			v(10.260440,-0.000005,14.508699);
			v(9.479415,3.926495,14.508699);
			v(7.255236,7.255223,14.508699);
			v(5.078668,5.078659,15.958698);
			v(6.635593,2.748550,15.958698);
			v(7.182311,-0.000000,15.958698);
			v(6.635586,-2.748549,15.958698);
			v(5.078655,-5.078655,15.958698);
			v(2.748544,-6.635581,15.958698);
			v(-0.000006,-7.182294,15.958698);
			v(-2.748555,-6.635569,15.958698);
			v(-5.078660,-5.078636,15.958698);
			v(-6.635581,-2.748523,15.958698);
			v(-7.182296,0.000027,15.958698);
			v(-6.635569,2.748576,15.958698);
			v(-5.078633,5.078679,15.958698);
			v(-2.748521,6.635600,15.958698);
			v(0.000030,7.182313,15.958698);
			v(2.748579,6.635583,15.958698);
			v(0.000007,0.000009,15.958698);

			f(32,0,1,0.221553,0.221553,0.177484,0.443107,0.096053,0.409377,-0.000000,0.000000,-1.000000);
			f(32,1,2,0.221553,0.221553,0.096053,0.409377,0.033729,0.347053,-0.000000,0.000000,-1.000000);
			f(32,2,3,0.221553,0.221553,0.033729,0.347053,0.000000,0.265623,0.000000,0.000000,-1.000000);
			f(32,3,4,0.221553,0.221553,0.000000,0.265623,0.000000,0.177484,0.000000,0.000000,-1.000000);
			f(32,4,5,0.221553,0.221553,0.000000,0.177484,0.033729,0.096053,0.000000,0.000000,-1.000000);
			f(32,5,6,0.221553,0.221553,0.033729,0.096053,0.096053,0.033730,0.000000,0.000000,-1.000000);
			f(32,6,7,0.221553,0.221553,0.096053,0.033730,0.177484,0.000000,0.000000,0.000000,-1.000000);
			f(32,7,8,0.221553,0.221553,0.177484,0.000000,0.265623,0.000000,0.000000,0.000000,-1.000000);
			f(32,8,9,0.221553,0.221553,0.265623,0.000000,0.347053,0.033730,0.000000,0.000000,-1.000000);
			f(32,9,10,0.221553,0.221553,0.347053,0.033730,0.409377,0.096054,0.000000,0.000000,-1.000000);
			f(32,10,11,0.221553,0.221553,0.409377,0.096054,0.443107,0.177484,0.000000,-0.000000,-1.000000);
			f(32,11,12,0.221553,0.221553,0.443107,0.177484,0.443107,0.265623,0.000000,-0.000000,-1.000000);
			f(32,12,13,0.221553,0.221553,0.443107,0.265623,0.409377,0.347053,0.000000,-0.000000,-1.000000);
			f(32,13,14,0.221553,0.221553,0.409377,0.347053,0.347053,0.409377,0.000000,-0.000000,-1.000000);
			f(32,14,15,0.221553,0.221553,0.347053,0.409377,0.265623,0.443107,-0.000000,0.000000,-1.000000);
			f(15,0,32,0.265623,0.443107,0.177484,0.443107,0.221553,0.221553,0.000000,0.000000,-1.000000);
			f(97,82,81,0.614026,0.201614,0.517115,0.136860,0.549272,0.104702,0.000000,0.000000,1.000000);
			f(97,83,82,0.614026,0.201614,0.499711,0.178875,0.517115,0.136860,0.000000,0.000000,1.000000);
			f(97,84,83,0.614026,0.201614,0.499711,0.224353,0.499711,0.178875,0.000000,0.000000,1.000000);
			f(97,85,84,0.614026,0.201614,0.517115,0.266368,0.499711,0.224353,0.000000,0.000000,1.000000);
			f(97,86,85,0.614026,0.201614,0.549272,0.298525,0.517115,0.266368,0.000000,0.000000,1.000000);
			f(97,87,86,0.614026,0.201614,0.591288,0.315929,0.549272,0.298525,0.000000,-0.000000,1.000000);
			f(97,88,87,0.614026,0.201614,0.636765,0.315929,0.591288,0.315929,0.000000,-0.000000,1.000000);
			f(97,89,88,0.614026,0.201614,0.678781,0.298525,0.636765,0.315929,0.000000,-0.000000,1.000000);
			f(97,90,89,0.614026,0.201614,0.710938,0.266368,0.678781,0.298525,0.000000,-0.000000,1.000000);
			f(97,91,90,0.614026,0.201614,0.728341,0.224352,0.710938,0.266368,-0.000000,-0.000000,1.000000);
			f(97,92,91,0.614026,0.201614,0.728341,0.178875,0.728341,0.224352,-0.000000,0.000000,1.000000);
			f(97,93,92,0.614026,0.201614,0.710938,0.136859,0.728341,0.178875,-0.000000,0.000000,1.000000);
			f(97,94,93,0.614026,0.201614,0.678780,0.104702,0.710938,0.136859,-0.000000,0.000000,1.000000);
			f(97,95,94,0.614026,0.201614,0.636765,0.087299,0.678780,0.104702,-0.000000,0.000000,1.000000);
			f(97,96,95,0.614026,0.201614,0.591287,0.087299,0.636765,0.087299,0.000000,0.000000,1.000000);
			f(97,81,96,0.614026,0.201614,0.549272,0.104702,0.591287,0.087299,0.000000,0.000000,1.000000);
			f(80,65,96,0.521520,0.063169,0.581542,0.038307,0.591287,0.087299,0.240533,0.359981,0.901420);
			f(80,96,81,0.521520,0.063169,0.591287,0.087299,0.549272,0.104702,0.240533,0.359981,0.901420);
			f(65,66,95,0.581542,0.038307,0.646510,0.038307,0.636765,0.087299,0.084465,0.424627,0.901420);
			f(65,95,96,0.581542,0.038307,0.636765,0.087299,0.591287,0.087299,0.084465,0.424627,0.901420);
			f(66,67,95,0.646510,0.038307,0.706532,0.063168,0.636765,0.087299,-0.084462,0.424627,0.901420);
			f(67,94,95,0.706532,0.063168,0.678780,0.104702,0.636765,0.087299,-0.084462,0.424627,0.901420);
			f(67,68,93,0.706532,0.063168,0.752471,0.109107,0.710938,0.136859,-0.240531,0.359982,0.901420);
			f(67,93,94,0.706532,0.063168,0.710938,0.136859,0.678780,0.104702,-0.240531,0.359982,0.901420);
			f(68,69,92,0.752471,0.109107,0.777333,0.169130,0.728341,0.178875,-0.359981,0.240533,0.901420);
			f(68,92,93,0.752471,0.109107,0.728341,0.178875,0.710938,0.136859,-0.359981,0.240533,0.901420);
			f(69,70,91,0.777333,0.169130,0.777333,0.234097,0.728341,0.224352,-0.424627,0.084465,0.901420);
			f(69,91,92,0.777333,0.169130,0.728341,0.224352,0.728341,0.178875,-0.424627,0.084465,0.901420);
			f(70,71,91,0.777333,0.234097,0.752472,0.294119,0.728341,0.224352,-0.424627,-0.084463,0.901420);
			f(71,90,91,0.752472,0.294119,0.710938,0.266368,0.728341,0.224352,-0.424627,-0.084463,0.901420);
			f(71,72,89,0.752472,0.294119,0.706533,0.340059,0.678781,0.298525,-0.359982,-0.240531,0.901420);
			f(71,89,90,0.752472,0.294119,0.678781,0.298525,0.710938,0.266368,-0.359982,-0.240531,0.901420);
			f(72,73,88,0.706533,0.340059,0.646510,0.364921,0.636765,0.315929,-0.240533,-0.359981,0.901420);
			f(72,88,89,0.706533,0.340059,0.636765,0.315929,0.678781,0.298525,-0.240533,-0.359981,0.901420);
			f(73,74,88,0.646510,0.364921,0.581543,0.364921,0.636765,0.315929,-0.084464,-0.424627,0.901420);
			f(74,87,88,0.581543,0.364921,0.591288,0.315929,0.636765,0.315929,-0.084464,-0.424627,0.901420);
			f(74,75,86,0.581543,0.364921,0.521521,0.340059,0.549272,0.298525,0.084463,-0.424627,0.901420);
			f(74,86,87,0.581543,0.364921,0.549272,0.298525,0.591288,0.315929,0.084462,-0.424627,0.901420);
			f(75,76,86,0.521521,0.340059,0.475581,0.294120,0.549272,0.298525,0.240531,-0.359982,0.901420);
			f(76,85,86,0.475581,0.294120,0.517115,0.266368,0.549272,0.298525,0.240531,-0.359982,0.901420);
			f(76,77,85,0.475581,0.294120,0.450719,0.234098,0.517115,0.266368,0.359981,-0.240532,0.901420);
			f(77,84,85,0.450719,0.234098,0.499711,0.224353,0.517115,0.266368,0.359981,-0.240532,0.901420);
			f(77,78,84,0.450719,0.234098,0.450719,0.169130,0.499711,0.224353,0.424627,-0.084464,0.901420);
			f(78,83,84,0.450719,0.169130,0.499711,0.178875,0.499711,0.224353,0.424627,-0.084464,0.901420);
			f(78,79,83,0.450719,0.169130,0.475581,0.109108,0.499711,0.178875,0.424627,0.084463,0.901420);
			f(79,82,83,0.475581,0.109108,0.517115,0.136860,0.499711,0.178875,0.424627,0.084463,0.901420);
			f(79,80,81,0.475581,0.109108,0.521520,0.063169,0.549272,0.104702,0.359982,0.240532,0.901420);
			f(79,81,82,0.475581,0.109108,0.549272,0.104702,0.517115,0.136860,0.359982,0.240532,0.901420);
			f(50,49,80,0.892451,0.988854,0.889508,0.914743,0.940297,0.907279,0.644850,0.430874,0.631280);
			f(50,80,79,0.892451,0.988854,0.940297,0.907279,0.942681,0.967309,0.644850,0.430874,0.631281);
			f(51,50,78,0.196330,0.528364,0.199273,0.454253,0.247119,0.535828,0.760653,0.151302,0.631281);
			f(50,79,78,0.199273,0.454253,0.249503,0.475798,0.247119,0.535828,0.760652,0.151302,0.631281);
			f(52,51,78,0.196576,0.608570,0.196330,0.528364,0.247119,0.535828,0.760652,-0.151304,0.631281);
			f(52,78,77,0.196576,0.608570,0.247119,0.535828,0.247319,0.600795,0.760652,-0.151304,0.631281);
			f(53,52,76,0.199974,0.682662,0.196576,0.608570,0.250071,0.660809,0.644850,-0.430876,0.631281);
			f(52,77,76,0.196576,0.608570,0.247319,0.600795,0.250071,0.660809,0.644849,-0.430876,0.631281);
			f(54,53,75,0.499822,0.372534,0.443107,0.315819,0.521521,0.340059,0.430874,-0.644851,0.631281);
			f(53,76,75,0.443107,0.315819,0.475581,0.294120,0.521521,0.340059,0.430874,-0.644851,0.631281);
			f(55,54,75,0.889508,0.457791,0.892451,0.383680,0.942681,0.405225,0.151301,-0.760653,0.631281);
			f(55,75,74,0.889508,0.457791,0.942681,0.405225,0.940297,0.465254,0.151301,-0.760653,0.631281);
			f(56,55,73,0.889754,0.537997,0.889508,0.457791,0.940496,0.530222,-0.151304,-0.760652,0.631281);
			f(55,74,73,0.889508,0.457791,0.940297,0.465254,0.940496,0.530222,-0.151304,-0.760652,0.631281);
			f(57,56,73,0.893151,0.612089,0.889754,0.537997,0.940496,0.530222,-0.430876,-0.644849,0.631281);
			f(57,73,72,0.893151,0.612089,0.940496,0.530222,0.943248,0.590236,-0.430876,-0.644849,0.631281);
			f(58,57,72,0.784946,0.315818,0.728232,0.372533,0.706533,0.340059,-0.644851,-0.430873,0.631281);
			f(58,72,71,0.784946,0.315818,0.706533,0.340059,0.752472,0.294119,-0.644851,-0.430873,0.631281);
			f(59,58,70,0.815640,0.241717,0.784946,0.315818,0.777333,0.234097,-0.760653,-0.151302,0.631281);
			f(58,71,70,0.784946,0.315818,0.752472,0.294119,0.777333,0.234097,-0.760653,-0.151302,0.631281);
			f(60,59,70,0.639683,0.520826,0.643081,0.446734,0.693178,0.468587,-0.760652,0.151305,0.631281);
			f(60,70,69,0.639683,0.520826,0.693178,0.468587,0.690426,0.528601,-0.760652,0.151305,0.631281);
			f(61,60,69,0.639437,0.601032,0.639683,0.520826,0.690426,0.528601,-0.644849,0.430877,0.631281);
			f(61,69,68,0.639437,0.601032,0.690426,0.528601,0.690226,0.593568,-0.644849,0.430877,0.631281);
			f(62,61,68,0.642380,0.675143,0.639437,0.601032,0.690226,0.593568,-0.430873,0.644851,0.631280);
			f(62,68,67,0.642380,0.675143,0.690226,0.593568,0.692610,0.653598,-0.430873,0.644851,0.631281);
			f(63,62,66,0.654129,0.000000,0.728231,0.030694,0.646510,0.038307,-0.151301,0.760653,0.631281);
			f(62,67,66,0.728231,0.030694,0.706532,0.063168,0.646510,0.038307,-0.151301,0.760653,0.631280);
			f(64,63,66,0.889754,0.834537,0.893151,0.760446,0.943248,0.782298,0.151306,0.760652,0.631280);
			f(64,66,65,0.889754,0.834537,0.943248,0.782298,0.940496,0.842312,0.151306,0.760652,0.631281);
			f(49,64,65,0.889508,0.914743,0.889754,0.834537,0.940496,0.842312,0.430876,0.644849,0.631281);
			f(49,65,80,0.889508,0.914743,0.940496,0.842312,0.940297,0.907279,0.430876,0.644849,0.631281);
			f(48,33,49,0.840627,0.918559,0.840897,0.830421,0.889508,0.914743,0.511549,0.765584,0.390126);
			f(33,64,49,0.840897,0.830421,0.889754,0.834537,0.889508,0.914743,0.511549,0.765584,0.390126);
			f(33,34,63,0.840897,0.830421,0.844631,0.749002,0.893151,0.760446,0.179635,0.903069,0.390126);
			f(33,63,64,0.840897,0.830421,0.893151,0.760446,0.889754,0.834537,0.179635,0.903069,0.390126);
			f(34,35,63,0.844631,0.749002,0.851259,0.686698,0.893151,0.760446,-0.179629,0.903070,0.390126);
			f(35,62,63,0.851259,0.686698,0.899183,0.703749,0.893151,0.760446,-0.179629,0.903070,0.390126);
			f(35,36,61,0.593790,0.686289,0.590556,0.604849,0.639437,0.601032,-0.511545,0.765587,0.390126);
			f(35,61,62,0.593790,0.686289,0.639437,0.601032,0.642380,0.675143,-0.511546,0.765587,0.390126);
			f(36,37,60,0.590556,0.604849,0.590827,0.516710,0.639683,0.520826,-0.765584,0.511550,0.390126);
			f(36,60,61,0.590556,0.604849,0.639683,0.520826,0.639437,0.601032,-0.765584,0.511550,0.390126);
			f(37,38,59,0.590827,0.516710,0.594560,0.435290,0.643081,0.446734,-0.903069,0.179634,0.390126);
			f(37,59,60,0.590827,0.516710,0.643081,0.446734,0.639683,0.520826,-0.903069,0.179634,0.390126);
			f(38,39,59,0.594560,0.435290,0.601188,0.372986,0.643081,0.446734,-0.903070,-0.179630,0.390126);
			f(39,58,59,0.601188,0.372986,0.649112,0.390038,0.643081,0.446734,-0.903070,-0.179630,0.390126);
			f(39,40,57,0.851259,0.685836,0.844631,0.623532,0.893151,0.612089,-0.765587,-0.511546,0.390126);
			f(39,57,58,0.851259,0.685836,0.893151,0.612089,0.899183,0.668785,-0.765587,-0.511545,0.390126);
			f(40,41,57,0.844631,0.623532,0.840897,0.542113,0.893151,0.612089,-0.511549,-0.765584,0.390126);
			f(41,56,57,0.840897,0.542113,0.889754,0.537997,0.893151,0.612089,-0.511549,-0.765584,0.390126);
			f(41,42,56,0.840897,0.542113,0.840627,0.453974,0.889754,0.537997,-0.179633,-0.903069,0.390126);
			f(42,55,56,0.840627,0.453974,0.889508,0.457791,0.889754,0.537997,-0.179633,-0.903069,0.390126);
			f(42,43,54,0.840627,0.453974,0.843861,0.372534,0.892451,0.383680,0.179629,-0.903070,0.390126);
			f(42,54,55,0.840627,0.453974,0.892451,0.383680,0.889508,0.457791,0.179629,-0.903070,0.390126);
			f(43,44,54,0.158082,0.756410,0.151453,0.694106,0.206006,0.739358,0.511547,-0.765586,0.390126);
			f(44,53,54,0.151453,0.694106,0.199974,0.682662,0.206006,0.739358,0.511547,-0.765586,0.390126);
			f(44,45,53,0.151453,0.694106,0.147720,0.612686,0.199974,0.682662,0.765585,-0.511549,0.390126);
			f(45,52,53,0.147720,0.612686,0.196576,0.608570,0.199974,0.682662,0.765585,-0.511549,0.390126);
			f(45,46,52,0.147720,0.612686,0.147449,0.524547,0.196576,0.608570,0.903069,-0.179633,0.390126);
			f(46,51,52,0.147449,0.524547,0.196330,0.528364,0.196576,0.608570,0.903069,-0.179633,0.390126);
			f(46,47,51,0.147449,0.524547,0.150683,0.443107,0.196330,0.528364,0.903069,0.179631,0.390126);
			f(47,50,51,0.150683,0.443107,0.199273,0.454253,0.196330,0.528364,0.903070,0.179631,0.390125);
			f(47,48,49,0.843861,1.000000,0.840627,0.918559,0.889508,0.914743,0.765586,0.511547,0.390126);
			f(47,49,50,0.843861,1.000000,0.889508,0.914743,0.892451,0.988854,0.765586,0.511547,0.390126);
			f(17,16,48,0.710454,0.999591,0.707220,0.918150,0.840627,0.918559,0.831470,0.555569,0.000000);
			f(17,48,47,0.710454,0.999591,0.840627,0.918559,0.843861,1.000000,0.831470,0.555569,0.000000);
			f(18,17,47,0.014043,0.524957,0.017277,0.443516,0.150683,0.443107,0.980785,0.195089,0.000000);
			f(18,47,46,0.014043,0.524957,0.150683,0.443107,0.147449,0.524547,0.980785,0.195089,0.000000);
			f(19,18,46,0.014313,0.613096,0.014043,0.524957,0.147449,0.524547,0.980785,-0.195092,0.000000);
			f(19,46,45,0.014313,0.613096,0.147449,0.524547,0.147720,0.612686,0.980785,-0.195092,0.000000);
			f(20,19,45,0.018047,0.694515,0.014313,0.613096,0.147720,0.612686,0.831469,-0.555571,0.000000);
			f(20,45,44,0.018047,0.694515,0.147720,0.612686,0.151453,0.694106,0.831469,-0.555571,0.000000);
			f(21,20,44,0.024675,0.756819,0.018047,0.694515,0.151453,0.694106,0.555569,-0.831470,0.000000);
			f(21,44,43,0.024675,0.756819,0.151453,0.694106,0.158082,0.756410,0.555569,-0.831470,0.000000);
			f(22,21,43,0.707220,0.454384,0.710454,0.372943,0.843861,0.372534,0.195088,-0.980786,0.000000);
			f(22,43,42,0.707220,0.454384,0.843861,0.372534,0.840627,0.453974,0.195088,-0.980786,0.000000);
			f(23,22,42,0.707491,0.542523,0.707220,0.454384,0.840627,0.453974,-0.195092,-0.980785,-0.000000);
			f(23,42,41,0.707491,0.542523,0.840627,0.453974,0.840897,0.542113,-0.195092,-0.980785,0.000000);
			f(24,23,41,0.711224,0.623942,0.707491,0.542523,0.840897,0.542113,-0.555572,-0.831469,-0.000000);
			f(24,41,40,0.711224,0.623942,0.840897,0.542113,0.844631,0.623532,-0.555572,-0.831469,0.000000);
			f(25,24,40,0.717853,0.686246,0.711224,0.623942,0.844631,0.623532,-0.831471,-0.555568,-0.000000);
			f(25,40,39,0.717853,0.686246,0.844631,0.623532,0.851259,0.685836,-0.831471,-0.555568,0.000000);
			f(26,25,39,0.461154,0.434881,0.467782,0.372577,0.601188,0.372986,-0.980786,-0.195088,-0.000000);
			f(26,39,38,0.461154,0.434881,0.601188,0.372986,0.594560,0.435290,-0.980786,-0.195088,0.000000);
			f(27,26,38,0.457420,0.516300,0.461154,0.434881,0.594560,0.435290,-0.980785,0.195093,0.000000);
			f(27,38,37,0.457420,0.516300,0.594560,0.435290,0.590827,0.516710,-0.980785,0.195093,0.000000);
			f(28,27,37,0.457150,0.604439,0.457420,0.516300,0.590827,0.516710,-0.831468,0.555573,0.000000);
			f(28,37,36,0.457150,0.604439,0.590827,0.516710,0.590556,0.604849,-0.831468,0.555573,0.000000);
			f(29,28,36,0.460383,0.685880,0.457150,0.604439,0.590556,0.604849,-0.555568,0.831471,0.000000);
			f(29,36,35,0.460383,0.685880,0.590556,0.604849,0.593790,0.686289,-0.555568,0.831471,0.000000);
			f(30,29,35,0.711224,0.748592,0.717853,0.686288,0.851259,0.686698,-0.195088,0.980786,0.000000);
			f(30,35,34,0.711224,0.748592,0.851259,0.686698,0.844631,0.749002,-0.195088,0.980786,0.000000);
			f(31,30,34,0.707491,0.830012,0.711224,0.748592,0.844631,0.749002,0.195094,0.980785,0.000000);
			f(31,34,33,0.707491,0.830012,0.844631,0.749002,0.840897,0.830421,0.195094,0.980785,0.000000);
			f(16,31,33,0.707220,0.918150,0.707491,0.830012,0.840897,0.830421,0.555572,0.831468,0.000000);
			f(16,33,48,0.707220,0.918150,0.840897,0.830421,0.840627,0.918559,0.555572,0.831468,0.000000);
			f(16,0,31,0.707220,0.918150,0.693178,0.918107,0.707491,0.830012,0.555572,0.831468,0.000002);
			f(0,15,31,0.693178,0.918107,0.693448,0.829968,0.707491,0.830012,0.555571,0.831469,-0.000008);
			f(14,30,15,0.697182,0.748549,0.711224,0.748592,0.693448,0.829968,0.195091,0.980785,-0.000008);
			f(30,31,15,0.711224,0.748592,0.707491,0.830012,0.693448,0.829968,0.195094,0.980785,0.000009);
			f(13,29,14,0.446341,0.685836,0.460383,0.685880,0.452587,0.748180,-0.195090,0.980785,-0.000006);
			f(29,30,14,0.717853,0.686288,0.711224,0.748592,0.697182,0.748549,-0.195088,0.980786,0.000008);
			f(12,28,13,0.443107,0.604396,0.457150,0.604439,0.446341,0.685836,-0.555570,0.831470,-0.000008);
			f(28,29,13,0.457150,0.604439,0.460383,0.685880,0.446341,0.685836,-0.555568,0.831471,0.000009);
			f(11,27,12,0.443377,0.516257,0.457420,0.516300,0.443107,0.604396,-0.831469,0.555570,-0.000009);
			f(27,28,12,0.457420,0.516300,0.457150,0.604439,0.443107,0.604396,-0.831468,0.555573,0.000008);
			f(10,26,11,0.447111,0.434838,0.461154,0.434881,0.443377,0.516257,-0.980785,0.195091,-0.000008);
			f(26,27,11,0.461154,0.434881,0.457420,0.516300,0.443377,0.516257,-0.980785,0.195093,0.000006);
			f(9,25,10,0.453739,0.372534,0.467782,0.372577,0.447111,0.434838,-0.980785,-0.195090,-0.000004);
			f(25,26,10,0.467782,0.372577,0.461154,0.434881,0.447111,0.434838,-0.980786,-0.195088,0.000008);
			f(8,24,9,0.697181,0.623984,0.711224,0.623942,0.703810,0.686288,-0.831469,-0.555570,-0.000008);
			f(24,25,9,0.711224,0.623942,0.717853,0.686246,0.703810,0.686288,-0.831471,-0.555568,0.000011);
			f(7,23,8,0.693448,0.542565,0.707491,0.542523,0.697181,0.623984,-0.555570,-0.831470,-0.000008);
			f(23,24,8,0.707491,0.542523,0.711224,0.623942,0.697181,0.623984,-0.555572,-0.831469,0.000008);
			f(6,22,7,0.693178,0.454426,0.707220,0.454384,0.693448,0.542565,-0.195090,-0.980785,-0.000006);
			f(22,23,7,0.707220,0.454384,0.707491,0.542523,0.693448,0.542565,-0.195092,-0.980785,0.000006);
			f(5,21,6,0.696411,0.372986,0.710454,0.372943,0.693178,0.454426,0.195090,-0.980785,-0.000007);
			f(21,22,6,0.710454,0.372943,0.707220,0.454384,0.693178,0.454426,0.195088,-0.980786,0.000006);
			f(4,20,5,0.004004,0.694558,0.018047,0.694515,0.010632,0.756862,0.555570,-0.831470,-0.000005);
			f(20,21,5,0.018047,0.694515,0.024675,0.756819,0.010632,0.756862,0.555569,-0.831470,0.000005);
			f(3,19,4,0.000270,0.613138,0.014313,0.613096,0.004004,0.694558,0.831470,-0.555570,-0.000003);
			f(19,20,4,0.014313,0.613096,0.018047,0.694515,0.004004,0.694558,0.831469,-0.555571,0.000005);
			f(2,18,3,0.000000,0.524999,0.014043,0.524957,0.000270,0.613138,0.980785,-0.195090,-0.000004);
			f(18,19,3,0.014043,0.524957,0.014313,0.613096,0.000270,0.613138,0.980785,-0.195092,0.000005);
			f(1,17,2,0.003234,0.443559,0.017277,0.443516,0.000000,0.524999,0.980785,0.195090,-0.000003);
			f(17,18,2,0.017277,0.443516,0.014043,0.524957,0.000000,0.524999,0.980785,0.195089,0.000004);
			f(0,16,1,0.693178,0.918107,0.707220,0.918150,0.696411,0.999547,0.831470,0.555570,-0.000004);
			f(16,17,1,0.707220,0.918150,0.710454,0.999591,0.696411,0.999547,0.831470,0.555569,0.000004);

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
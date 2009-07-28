package  gearunits.models{
	import away3d.core.base.Face;
	import away3d.core.base.Mesh;
	import away3d.core.base.UV;
	import away3d.core.base.Vertex;
	import away3d.core.utils.Init;

	public class AMeshSpacecraftFedBattleship_Box extends Mesh {
		private var ve:Array;
		private var fa:Array;

		public function AMeshSpacecraftFedBattleship_Box(init:Object = null) {
			super( init );
			init = Init.parse(init);
			ve = [];
			v(-37.839977,0.000000,165.840012);
			v(37.840042,0.000000,165.839996);
			v(37.839989,0.000000,-37.840012);
			v(-55.635773,-0.000000,-102.124496);
			v(-55.635765,-0.000000,-42.924488);
			v(-37.835766,-0.000000,-37.724495);
			v(-26.061895,-0.000000,-101.982231);
			v(26.487976,0.000000,-101.840012);
			v(55.839981,0.000000,-43.840019);
			v(55.887978,0.000000,-102.040009);
			v(-30.671967,0.000000,190.840012);
			v(29.872038,0.000000,190.839996);

			f(0,1,11,0.317374,0.085207,0.059208,0.085999,0.086128,0.000634,0.000000,0.000000,1.000000);
			f(0,11,10,0.317374,0.085207,0.086128,0.000634,0.292660,0.000000,0.000000,0.000000,1.000000);
			f(2,7,8,0.061340,0.780807,0.100735,0.999010,0.000000,0.801463,0.000000,-0.000000,1.000000);
			f(7,9,8,0.100735,0.999010,0.000445,1.000000,0.000000,0.801463,0.000000,0.000000,1.000000);
			f(2,5,6,0.061340,0.780807,0.319490,0.779621,0.279998,0.998945,-0.000000,0.000000,1.000000);
			f(2,6,7,0.061340,0.780807,0.279998,0.998945,0.100735,0.999010,-0.000000,0.000000,1.000000);
			f(4,3,6,0.380265,0.797174,0.380884,0.999121,0.279998,0.998945,-0.000000,0.000000,1.000000);
			f(4,6,5,0.380265,0.797174,0.279998,0.998945,0.319490,0.779621,-0.000000,0.000000,1.000000);
			f(1,0,5,0.059208,0.085999,0.317374,0.085207,0.319490,0.779621,-0.000000,-0.000000,1.000000);
			f(1,5,2,0.059208,0.085999,0.319490,0.779621,0.061340,0.780807,-0.000000,0.000000,1.000000);

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
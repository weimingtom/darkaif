package darkaif.entities 
{
	import flash.display.BitmapData;
	import sandy.core.scenegraph.Shape3D;
	import sandy.core.data.UVCoord;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class TerrainSandy 
	{
		//{
		public var terrainlayer:Shape3D = null;
		public var heightmap:BitmapData;
		public var terrainname:String = '';
		
		public var posx:Number = 0;
		public var posy:Number = 0;
		public var posz:Number = 0;
		
		public var height:Number = 0;
		public var width:Number = 0;
		public var gridx:Number = 0;
		public var gridy:Number = 0;
		//}
		
		public function TerrainSandy(){
			
		}
		
		public function minx():Number {
			return posx-(width / 2);
		}
		
		public function maxx():Number {
			return posx+(width / 2);
		}
		
		public function minz():Number {
			return posz-(height / 2);
		}
		
		public function maxz():Number {
			return posz+(height / 2);
		}
		
		
		public function uvposition(uvx:Number, uvy:Number):Number {
			var hy:Number = 0;
			var terrain_u:Number = 0;
			var terrain_v:Number = 0;//if map min and max//posx//posy
			
			//top left
			
			uvx = uvx - (posx - (width / 2));
			//trace("x:"+uvx);
			uvy = uvy - (posz - (height/2));
			
			//terrain_u = ((uvx + (width/2)) / width) ;
			//terrain_v = 1 - ((uvy + (height/2)) / height);
			
			terrain_u = ((uvx ) / width) ;
			terrain_v = 1 - ((uvy) / height);
			
			//trace("UV : "+terrain_u+":"+terrain_v);
			
			//trace(terrain_u +":"+terrain_v );
			hy = 0xFF & heightmap.getPixel (
					terrain_u * (heightmap.width -1),
					terrain_v * (heightmap.height -1));
			//trace("x:" + uvx + " y:" + uvy+" height:"+hy)
			return hy + posy;
		}
		
		//updating height map in gray scale
		public function updateheightmap():void {
			for (var i:int = 0; i < terrainlayer.geometry.aVertex.length; i++) {
				//adjust the height of the y point base on the image height gray scale
				terrainlayer.geometry.aVertex [i].y = 0xFF & heightmap.getPixel (
					UVCoord (terrainlayer.geometry.aUVCoords [i]).u * (heightmap.width -1),
					UVCoord (terrainlayer.geometry.aUVCoords [i]).v * (heightmap.height -1)
				);
			}
		}
		
		
	}
}
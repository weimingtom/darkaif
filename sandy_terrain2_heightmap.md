# Introduction #
> This should be simple. This is to test out the terrain and use the cube to check if the cube is moving to ground matches to the height map.

Credits to:
  * http://www.flashsandy.org/forum/

```
package  
{
	import flash.display.Sprite;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import sandy.materials.attributes.MaterialAttributes;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
		
	import sandy.core.data.UVCoord;
	import sandy.materials.Appearance;
	import sandy.materials.BitmapMaterial;
	import sandy.core.data.Plane;
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.core.scenegraph.Shape3D;
	import sandy.primitive.Box;
	import sandy.primitive.Plane3D;
	import sandy.materials.attributes.LineAttributes;
	import sandy.materials.attributes.LightAttributes;
	
	public class SandyTerrain2 extends Sprite
	{
		[Embed (source="../data/textures/island_heightmap3.jpg")]
		private var HeightMap:Class;
		
		public var box:Box = new Box( "box", 16, 16, 16);
		public var terrain:Shape3D = new Plane3D('bottom', 512, 512, 32, 32, Plane3D.ZX_ALIGNED, 'tri');// 512x512 is the size, 32x32 how much you want to divide
		public var hmap:BitmapData = Bitmap (new HeightMap).bitmapData; //image hieghtmap in black and white scale
		
		public var camera:Camera3D;
		public var scene:Scene3D;
		public var g:Group = new Group("group");
		
		public function SandyTerrain2() 
		{
			camera = new Camera3D( 300, 300 );
			//camera.x = 600;
			camera.y = 600;
			camera.z = -500;
			camera.lookAt (0, 100, 0);
			
			var root:Group = createScene();
			
			scene = new Scene3D( "scene", this, camera, g );
			
			stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
		}
		
		private function createScene():Group {
			
			//terrain.geometry
			var materialattr:MaterialAttributes = new MaterialAttributes( 
                              new LineAttributes( 0.5, 0x2111BB, 0.4 ),
                              new LightAttributes( true, 0.1));

			var material:Material = new ColorMaterial(0xFFCC33,1,materialattr);
			var app:Appearance = new Appearance(material);
			box.appearance = app;
			//box.useSingleContainer = false;//it need to render correctly when object over lap
			material = new ColorMaterial(0xFFCCFF,1,materialattr);
			app = new Appearance(material);
			terrain.appearance = app;
			terrain.useSingleContainer = false;//it need to render correctly when object over lap
			
			for (var i:int = 0; i < terrain.geometry.aVertex.length; i++) {
				//adjust the height of the y point base on the image height gray scale
				terrain.geometry.aVertex [i].y = 0xFF & hmap.getPixel (
					UVCoord (terrain.geometry.aUVCoords [i]).u * (hmap.width -1),
					UVCoord (terrain.geometry.aUVCoords [i]).v * (hmap.height -1)
				);
			}
			
			g.addChild( box );
			g.addChild( terrain );
			
			return g;
		}
		
		private function keyPressed(event:KeyboardEvent):void {
			switch(event.keyCode) {
				case Keyboard.UP:
					box.z +=2;
					break;
				case Keyboard.DOWN:
					box.z -=2;
					break;
				case Keyboard.RIGHT:
					box.x +=2;
					break;
				case Keyboard.LEFT:
					box.x -=2;
					break;
			}
			
			var width:Number = 512;
			var height:Number = 512;
			//terrain size
			var terrain_width:Number = width / 2;
			var terrain_height:Number = height / 2;
			var terrain_v:Number = 0;
			var terrain_u:Number = 0;
			//base on the box move border lines
			// 0 to 1 uv scale.
			// this is percent base to get the height of the map
			terrain_u = ((box.x + terrain_width) / width) ;
			terrain_v = 1 - ((box.z + terrain_height) / height);
			
			trace("y:"+box.y + " percent: u" + terrain_u + " v:" + terrain_v);
			
			box.y = 0xFF & hmap.getPixel (
					terrain_u * (hmap.width -1),
					terrain_v * (hmap.height -1)) + 10;
		}
		
		private function enterFrameHandler( event : Event ) : void
		{
			scene.render();
		}
	}
}
```
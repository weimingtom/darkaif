﻿package  programs
{
        import flash.display.Sprite;
        import flash.display.Bitmap;
        import flash.display.BitmapData;
        import sandy.core.data.UVCoord;
        import sandy.materials.Appearance;
        import sandy.materials.BitmapMaterial;
        
        import sandy.core.data.Plane;
        import sandy.core.Scene3D;
        import sandy.core.scenegraph.Camera3D;
        import sandy.core.scenegraph.Group;
        import flash.events.Event;
        import sandy.core.scenegraph.Shape3D;
        import sandy.primitive.Box;
        import sandy.primitive.Plane3D;
        
        public class SandyTerrain extends Sprite
        {
                [Embed (source="../data/textures/island_heightmap3.jpg")]
                private var HeightMap:Class;
                
                public var camera:Camera3D;
                public var scene:Scene3D;
                public var g:Group = new Group("group");
                
                public function SandyTerrain() 
                {
                        camera = new Camera3D( 300, 300 );
                        camera.y = 600;
                        camera.z = -500;
                        camera.lookAt (0, 100, 0); //came look at this point
                        
                        var root:Group = createScene();
                        
                        scene = new Scene3D( "scene", this, camera, g );
                        
                        stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
                }
                
                private function createScene():Group {
                        var box:Box = new Box( "box", 16, 16, 16);
                        var terrain:Shape3D = new Plane3D('bottom', 512, 512,16, 16, Plane3D.ZX_ALIGNED, 'tri');
                        
                        //terrain.geometry
						//Height map is base on gray scale black to white
                        var hmap:BitmapData = Bitmap (new HeightMap).bitmapData;
                        for (var i:int = 0; i < terrain.geometry.aVertex.length; i++) {
                                terrain.geometry.aVertex [i].y = 0xFF & hmap.getPixel (
                                        UVCoord (terrain.geometry.aUVCoords [i]).u * (hmap.width -1),
                                        UVCoord (terrain.geometry.aUVCoords [i]).v * (hmap.height -1)
                                );
                        }
                        
                        box.rotateX = 30;
                        box.rotateY = 30;
                        g.addChild( box );
                        g.addChild( terrain );
                        
                        return g;
                }
                
                private function enterFrameHandler( event : Event ) : void
                {
                        scene.render();
                }
        }
}
package {
   import flash.display.Sprite; 
   import flash.events.*;
   import sandy.core.Scene3D;
   import sandy.core.data.*;
   import sandy.core.scenegraph.*;
   import sandy.materials.*;
   import sandy.materials.attributes.*;
   import sandy.primitive.*;
   import sandy.*
 
   public class Example002 extends Sprite {
      private var scene:Scene3D;
      private var camera:Camera3D;
 
      public function Example002() { 
         camera = new Camera3D( 300, 300 );
         camera.z = -400;
 
         var root:Group = createScene();
 
         scene = new Scene3D( "scene", this, camera, root );
 
         addEventListener( Event.ENTER_FRAME, enterFrameHandler );         
      }
 
      private function createScene():Group {
         var g:Group = new Group();
 
         var box:Box = new Box( "box", 100, 100, 100);
		 
		 var materialAttr:MaterialAttributes = new MaterialAttributes( 
               new LineAttributes( 0.5, 0x2111BB, 0.4 ),
               new LightAttributes( true, 0.1)
            )
		 var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
         material.lightingEnable = true;
         var app:Appearance = new Appearance( material );
		 
		 box.appearance = app;

         box.rotateX = 30;
         box.rotateY = 30;
 
         g.addChild( box );
 
         return g;
      }
 
      private function enterFrameHandler( event : Event ) : void {
         scene.render();
      }
   }
}
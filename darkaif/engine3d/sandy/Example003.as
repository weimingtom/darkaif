package {
   import flash.display.Sprite; 
   import flash.events.*;
   import flash.ui.*;
   import sandy.core.Scene3D;
   import sandy.core.data.*;
   import sandy.core.scenegraph.*;
   import sandy.materials.*;
   import sandy.materials.attributes.*;
   import sandy.primitive.*;
 
   public class Example003 extends Sprite {
      private var scene:Scene3D;
      private var camera:Camera3D;
 
      public function Example003() { 
         camera = new Camera3D( 300, 300 );
         //camera.x = 100;
         //camera.y = 100;
         camera.z = -400;
         //camera.lookAt(0,0,0);
 
         var root:Group = createScene();
 
         scene = new Scene3D( "scene", this, camera, root );
 
         addEventListener( Event.ENTER_FRAME, enterFrameHandler );
         stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
 
      }
 
      private function createScene():Group {
         var g:Group = new Group();
 
         var myXLine:Line3D = new Line3D( "x-coord", new Vector(-50, 0, 0), new Vector( 50, 0, 0 ));
         var myYLine:Line3D = new Line3D( "y-coord", new Vector(0, -50, 0), new Vector( 0, 50, 0 ));
         var myZLine:Line3D = new Line3D( "z-coord", new Vector(0, 0, -50), new Vector( 0, 0, 50 ));
 
         var torus:Torus = new Torus( "theTorus", 120, 20);
 
         var materialAttr:MaterialAttributes = new MaterialAttributes( 
                        new LineAttributes( 0.5, 0x2111BB, 0.4 ),
                        new LightAttributes( true, 0.1)
                  );
 
         var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
         material.lightingEnable = true;
         var app:Appearance = new Appearance( material );
 
         torus.appearance = app;
 
         torus.rotateX = 30;
         torus.rotateY = 30;
 
         g.addChild(myXLine);
         g.addChild(myYLine);
         g.addChild(myZLine);
         g.addChild( torus	 );
 
         return g;
      }
 
      private function enterFrameHandler( event : Event ) : void {
         scene.render();
      }
 
      private function keyPressed(event:KeyboardEvent):void {
         switch(event.keyCode) {
            case Keyboard.UP:
               camera.tilt +=2;
               break;
            case Keyboard.DOWN:
               camera.tilt -=2;
               break;
            case Keyboard.RIGHT:
               camera.pan -=2;
               break;
            case Keyboard.LEFT:
               camera.pan +=2;
               break;
            case Keyboard.CONTROL:
               camera.roll +=2;
               break;	
            case Keyboard.PAGE_DOWN:
               camera.z -=5;
               break;
            case Keyboard.PAGE_UP:
               camera.z +=5;
               break;	
         }
      }
   }
}
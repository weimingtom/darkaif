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
 
   public class Example004 extends Sprite {
      private var scene:Scene3D;
      private var camera:Camera3D;
      private var tg:TransformGroup;
      private var myCone:Cone;
      private var myHedra:Hedra;
 
      public function Example004() { 
         camera = new Camera3D( 300, 300 );
         camera.x = 100;
         camera.y = 100;
         camera.z = -400;
         camera.lookAt(0,0,0);
 
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
 
         tg = new TransformGroup('myGroup');
 
         myCone = new Cone("theObj1",50, 100);
         myHedra = new Hedra( "theObj2", 80, 60, 60 );
 
         myCone.x = -160;
         myCone.z = 150;
         myHedra.x = 90;
 
         var materialAttr:MaterialAttributes = new MaterialAttributes( 
                              new LineAttributes( 0.5, 0x2111BB, 0.4 ),
                              new LightAttributes( true, 0.1)
                        );
 
         var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
         material.lightingEnable = true;
         var app:Appearance = new Appearance( material );
 
         myCone.appearance = app;
         myHedra.appearance = app;
 
         tg.addChild(myCone);
         tg.addChild(myHedra);
 
         g.addChild(tg);
         g.addChild(myXLine);
         g.addChild(myYLine);
         g.addChild(myZLine);
 
         return g;
      }
 
      private function enterFrameHandler( event : Event ) : void {
         myHedra.pan +=4;
         myCone.pan +=4;
         scene.render();
      }
 
      private function keyPressed(event:KeyboardEvent):void {
         switch(event.keyCode) {
            case Keyboard.UP:
               tg.y +=2;
               break;
            case Keyboard.DOWN:
               tg.y -=2;
               break;
            case Keyboard.RIGHT:
               tg.roll +=2;
               break;
            case Keyboard.LEFT:
               tg.roll -=2;
               break;
         }
      }
   }
}
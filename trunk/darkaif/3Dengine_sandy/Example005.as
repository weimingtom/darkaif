package
{
   import flash.display.Sprite; 
   import flash.events.*;
   import flash.ui.*;
   import sandy.core.Scene3D;
   import sandy.core.data.*;
   import sandy.core.scenegraph.*;
   import sandy.materials.*;
   import sandy.materials.attributes.*;
   import sandy.primitive.*;

   public class Example005 extends Sprite 
   {
      private var scene:Scene3D;
	  private var camera:Camera3D;
	  private var tg:TransformGroup;
	  private var myCone:Cone;
	  private var myHedra:Hedra;

      public function Example005()
      { 
		 // We create the camera
		 camera = new Camera3D( 300, 300 );
		 camera.z = -400;
		 camera.lookAt(0,0,0);
		 
		 // We create the "group" that is the tree of all the visible objects
         var root:Group = createScene();
		 
		 // We create a Scene and we add the camera and the objects tree 
	     scene = new Scene3D( "scene", this, camera, root );
		 
		 // Listen to the heart beat and render the scene
		 addEventListener( Event.ENTER_FRAME, enterFrameHandler );
		 stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
		 
      }

      // Create the scene graph based on the root Group of the scene
      private function createScene():Group
      {
         // Create the root Group
         var g:Group = new Group();
		  
		 // We need to create a transformGroup
		 tg = new TransformGroup('myGroup');
		 
         // we now create the three planes and two spheres
		 var right:Shape3D = new Plane3D('right', 150, 100, 10, 10, 
							Plane3D.YZ_ALIGNED,'quad');
		 right.moveLateraly(100);
		 right.moveForward(50)
		 var left:Shape3D = new Plane3D('left', 150, 100, 10, 10, 
							Plane3D.YZ_ALIGNED,'quad');
		 left.moveLateraly(-100);
		 left.moveForward(50)
		 
		 var back:Shape3D = new Plane3D('back', 100, 250, 10, 10, 
							Plane3D.XY_ALIGNED,'quad');
		 back.moveForward(100);
		 
		 var bottom:Shape3D = new Plane3D('bottom', 150, 250, 10, 10, 
							Plane3D.ZX_ALIGNED,'quad');
		 bottom.moveForward(50);
		 bottom.moveUpwards(-50);
		 
		 
		 
		 var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
				);

	     var material01:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
	     material01.lightingEnable = false;
		 var material02:Material = new ColorMaterial( 0xFEA792, 1, materialAttr );
	     material02.lightingEnable = false;
	     var app01:Appearance = new Appearance( material01 );
		 var app02:Appearance = new Appearance( material02 );

		 // we add appearance to all our objects
		 right.enableBackFaceCulling = false;
		 right.appearance = app01;
		 left.enableBackFaceCulling = false;
		 left.appearance = app01;
		 back.enableBackFaceCulling = false;
		 back.appearance = app02;
		 bottom.enableBackFaceCulling = true;
		 bottom.appearance = app02;
	      
		 right.useSingleContainer = false;
		 left.useSingleContainer = false;
		 back.useSingleContainer = false;
		 bottom.useSingleContainer = false;
		  
		 // we add both object to the transform group		 
		 tg.addChild(right);
		 tg.addChild(left);
		 tg.addChild(back);
		 tg.addChild(bottom);
		 // we now add all the object to the root group:
		 g.addChild(tg);
		
		  return g;
      }

      // The Event.ENTER_FRAME event handler tells the world to render
      private function enterFrameHandler( event : Event ) : void
      {
         //myHedra.pan +=4;
		 //myCone.pan +=4;
		 scene.render();
      }
	  
	  private function keyPressed(event:KeyboardEvent):void {
            switch(event.keyCode) {
				case Keyboard.UP:
					tg.tilt +=2;
					break;
				case Keyboard.DOWN:
					tg.tilt -=2;
					break;
				case Keyboard.RIGHT:
					tg.pan +=2;
					break;
				case Keyboard.LEFT:
					tg.pan -=2;
					break;
			}
        }
   }
}

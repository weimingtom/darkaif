package
{
   import flash.display.Sprite; 
   import flash.events.*;
   import sandy.core.Scene3D;
   import sandy.core.data.*;
   import sandy.core.scenegraph.*;
   import sandy.materials.*;
   import sandy.materials.attributes.*;
   import sandy.primitive.*;
   import sandy.parser.*;

   public class Example006 extends Sprite 
   {
      private var scene:Scene3D;
	  private var camera:Camera3D;
	  private var pot:Shape3D;

      public function Example006()
      { 
		 // We create the camera
		 camera = new Camera3D( 300, 300 );
		 camera.y = 30;
		 camera.z = -200;
		 
		 // We create the "group" that is the tree of all the visible objects
         var root:Group = createScene();
		 
		 // We create a Scene and we add the camera and the objects tree 
	     scene = new Scene3D( "scene", this, camera, root );
		 
		 // Listen to the heart beat and render the scene
         addEventListener( Event.ENTER_FRAME, enterFrameHandler );         
      }

      // Create the scene graph based on the root Group of the scene
      private function createScene():Group
      {
         // Create the root Group
         var g:Group = new Group("myGroup");
		 
		 var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
	     var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
		 material.lightingEnable = true;
		 var app:Appearance = new Appearance( material);
		
		 //-- this is how you add an oject generated as Sandy class
		 pot = new Teiera("pot");
		 //pot = new cubeflash();
		 pot.appearance = app;
		 pot.enableBackFaceCulling = false;
		 g.addChild( pot );
		 
		 // We need to add the pot to the group 
		 return g;
      }

      // The Event.ENTER_FRAME event handler tells the world to render
      private function enterFrameHandler( event : Event ) : void
      {
         pot.pan +=5;
		 scene.render();
      }
   }
}

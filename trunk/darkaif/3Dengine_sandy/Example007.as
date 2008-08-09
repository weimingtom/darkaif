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

   public class Example007 extends Sprite 
   {
      private var scene:Scene3D;
	  private var camera:Camera3D;
	  private var pot:Shape3D;

      public function Example007()
      { 
		var parser:IParser = Parser.create("data/models/Datafirewall_fencepole.ase",Parser.ASE );
		
		parser.addEventListener( ParserEvent.FAIL, onError );
		parser.addEventListener( ParserEvent.INIT, createScene );
		parser.parse();
      }
	  
	  private function onError( pEvt:ParserEvent ):void
      {
			trace("there is an error il loading you stuff");
	  }
	  
	  
      // Create the scene graph based on the root Group of the scene
      private function createScene(p_eEvent:ParserEvent ):void
      {
         camera = new Camera3D( 300, 300 );
		 camera.y = 30;
		 camera.z = -200;
		 
		 // Create the root Group
         var g:Group = Group( p_eEvent.group);
		 
		 pot = g.children[0] as Shape3D;
		 pot.x = 0;
		 
		 var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
	     var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
		 material.lightingEnable = true;
		 var app:Appearance = new Appearance( material);
		 
		 pot.appearance = app;
		 
		 scene = new Scene3D( "scene", this, camera, g );
		 
		 // Listen to the heart beat and render the scene
         addEventListener( Event.ENTER_FRAME, enterFrameHandler ); 
      }

      // The Event.ENTER_FRAME event handler tells the world to render
      private function enterFrameHandler( event : Event ) : void
      {
         pot.pan +=3;
		 scene.render();
      }
   }
}

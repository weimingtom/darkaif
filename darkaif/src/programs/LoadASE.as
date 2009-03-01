﻿/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package programs
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
   import org.flashdevelop.utils.FlashConnect;

   public class LoadASE extends Sprite 
   {
      private var scene:Scene3D;
	  private var camera:Camera3D;
	  private var pot:Shape3D;

      public function LoadASE()
      { 
		//var parser:IParser = Parser.create("data/models/ShipCargo.ase", Parser.ASE );
		//var parser:IParser = Parser.create("data/models/spaceship_fighter_block_long.ase",Parser.ASE );
		var parser:IParser = Parser.create("data/models/spacestation_port_block.ase",Parser.ASE );
		
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
		 //pot.
		 
		 //for 
		 
		 //var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
	     //var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
		 //material.lightingEnable = true;
		 //var app:Appearance = new Appearance( material);
		 
		 //pot.appearance = app;
		 
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

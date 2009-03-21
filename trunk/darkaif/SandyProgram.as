package  
{
	import flash.display.Sprite;
	
	import darkaif.core.collision.CollisionBox;
	import darkaif.entities.*;
	import darkaif.frame.MenuToolPanel;
	import darkaif.core.display.*;
	
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.*; 
	import flash.events.*;
	import flash.text.TextField;
	import flash.ui.*;
	import flash.utils.Timer;
	import flash.system.*;
	import flash.events.IOErrorEvent;
	
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.parser.*;
	import sandy.util.*;
	import sandy.events.*;
	import sandy.view.*;

	import org.flashdevelop.utils.FlashConnect;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SandyProgram extends Sprite{
		
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		public var box:Box = new Box('player', 32, 32, 32);
		public var ground:Box = new Box('ground',256,8,256);
		
		public function SandyProgram(){
			//{ Scene world
			// camera
			camera = new Camera3D(300,300);
			//camera.z = -50;
			camera.far = 1000;
			camera.near = 0;
			//camera.
			camera.y = 90;
			camera.lookAt(0, 0, 0);
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			//}
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
                     new LineAttributes( 0.5, 0x2111BB, 0.4 ),
                     new LightAttributes( true, 0.1)
                  );
				
			var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			//material.lightingEnable = true;
			var app:Appearance = new Appearance( material );
			box.appearance  = app;
			box.useSingleContainer = false;
			box.enableBackFaceCulling = false;
			ground.appearance = app;
			ground.enableBackFaceCulling = false;
			ground.useSingleContainer = false;

		}
		
		// This update the code and the function when every frame count is pass
		private function enterFrameHandler( event : Event ) : void {
			scene.render();
		}
		
		private function createScene():Group {
			g.addChild(box);
			g.addChild(ground);
			return g;
		}
		//keyboard press down
		public function addKey(e:KeyboardEvent):void {
			
			if (e.keyCode == 38) {//up
				box.z += 1;
			}
			if (e.keyCode == 40) {//down
				box.z -= 1;
			}
			if (e.keyCode == 39) {//right
				box.x += 1;
			}
			if (e.keyCode == 37) {//left
				box.x -= 1;
			}
			
		}
		
		//keyboard release up
		public function removeKey(e:KeyboardEvent):void {
			/*
			if (e.keyCode == Keyuparrow) {
				Uparrow = false;
			}
			*/
		}
	}
	
}
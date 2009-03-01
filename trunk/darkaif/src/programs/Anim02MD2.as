package programs
{
	import flash.display.*; 
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	import flash.ui.*;
	import flash.text.*;
	
	import sandy.util.*;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.events.*;
	
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 * Animation script to the bone
	 */
	public class Anim02MD2 extends Sprite
	{
		private var queue:LoaderQueue;
		private var scene:Scene3D;
		public var camera:Camera3D;
		public var animmd2:MD2;
		
		public function Anim02MD2() 
		{
			queue = new LoaderQueue();
			//boxanimation.md2
			//queue.add( "demon", new URLRequest("data/models/tris.md2"), "BIN" );
			queue.add( "demon", new URLRequest("data/models/Demon.md2"), "BIN" );
			queue.add( "demonSkin", new URLRequest("data/models/Skindemon.jpg"), "IMG" );
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE, loadMD2Complete );
            queue.start();
		}
		
		private function loadMD2Complete(event:Event):void 
		{
			
			// We create the "group" that is the tree of all the visible objects
            var root:Group = createScene();
		 
		    camera = new Camera3D( 600, 450 );
		    //camera.z = -400;
			camera.z = -300;
			camera.x = -100;
			camera.y = 200;
			
		    camera.lookAt(0, 0, 0);
			
			// We create a Scene and we add the camera and the objects tree 
	        scene = new Scene3D( "scene", this, camera, root );
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
		}
		
		private function createScene():Group
        {
			// Create the root Group
			var g:Group = new Group();
		  
			// the normal demon
			animmd2  = new MD2 ( "default", queue.data["demon"], 0.5 );
			//animmd2.appearance = new Appearance (new BitmapMaterial( queue.data["demonSkin"].bitmapData ));
			animmd2.x = 0;
			animmd2.y = 0;
			animmd2.x = -100;
			//animmd2.
			//animmd2.
			
			
			g.addChild(animmd2);
			
			return g;
		}
		
		private function enterFrameHandler( event : Event ) : void 
		{
			// let's make the monster walking
			//for (var j:Number=0; j<7; j++) {
				//animmd2.frame += 0.2;
				//animmd2.x += 0.00001; // X++ this is trigger to move lol
			//}
			scene.render();
		}
		
	}
	
}
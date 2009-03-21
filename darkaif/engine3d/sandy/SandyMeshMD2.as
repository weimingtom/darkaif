package  
{
	//{
	import flash.display.Sprite;
	
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
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class SandyMeshMD2 extends Sprite {
		
		//{
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		//}
		
		public function SandyMeshMD2() {
			var mesh:Shape3D = new Shape3D();
			//mesh.f
			//mesh.rotateY
			
			//{ Scene world
			// camera
			camera = new Camera3D(300,300);
			camera.z = -10;
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
		}
		
		// This update the code and the function when every frame count is pass
		private function enterFrameHandler( event : Event ) : void {
			var objectmesh:Array = g.children;
			for (var meshno:int = 0; meshno < objectmesh.length; meshno++ ) {
				if (objectmesh[meshno].name == 'md2'){//object name
					objectmesh[meshno].rotateY += 1;
					objectmesh[meshno].frame += 1;
				}
			}
			scene.render();
		}
		
		private function createScene():Group {
			var queue:LoaderQueue = new LoaderQueue();
			var objectname:String = 'md2';
			var datafilename:String = 'data/models/simple_monster_low.md2';
			
			//name , file, datatype
			queue.add(objectname, new URLRequest((datafilename)), "BIN" );
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loaddatafile);
			queue.start();
			
			function loaddatafile():void {
				//name, file, scale
				var animmd2:MD2  = new MD2(String(objectname), queue.data[objectname], 1 );
				g.addChild(animmd2);
			}
			
			return g;
		}
	}
}
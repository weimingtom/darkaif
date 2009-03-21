package  
{
	//{
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
	
	public class SandyMesh3DS extends Sprite {
		
		//{
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		//}
		
		public function SandyMesh3DS(){
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
			scene.render();
		}
		
		private function createScene():Group {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = '3ds';
			var datafilename:String = 'data/models/cubestar.3ds';
			//var datafilename:String = 'data/models/bbasic_entrance01.ase';
			var parser:IParser = Parser.create(String(datafilename),Parser.MAX_3DS);
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				//trace('---');
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				g.addChild(tmpshape);
			}
			
			return g;
		}
	}
}
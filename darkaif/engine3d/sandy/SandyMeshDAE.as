package  
{
	//{
	import flash.display.Sprite;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.core.scenegraph.Shape3D;
	import sandy.parser.Parser;
	import sandy.parser.ParserStack;
	import sandy.parser.IParser;
	
	import org.flashdevelop.utils.FlashConnect;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class SandyMeshDAE extends Sprite {
		
		//{
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		//}
		
		public function SandyMeshDAE(){
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
			var objectname:String = 'dae';
			var datafilename:String = 'data/models/cubeobj.dae';
			//var datafilename:String = 'data/models/bbasic_entrance01.ase';
			var parser:IParser = Parser.create(String(datafilename),Parser.COLLADA );
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
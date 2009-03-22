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
	import sandy.events.SandyEvent;
	import sandy.primitive.MD2;
	
	import org.flashdevelop.utils.FlashConnect;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class SandyMeshMD2_2 extends Sprite {
		
		//{
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		//}
		
		public function SandyMeshMD2_2() {
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
				if(objectmesh[meshno].name == 'md2'){
				objectmesh[meshno].rotateY += 1;
				objectmesh[meshno].rotateY += 1;
				objectmesh[meshno].frame +=0.01;
				}
			}
			scene.render();
		}
		
		private function createScene():Group {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = 'md2';
			var datafilename:String = 'data/models/simple_monster_low.md2';
			//var datafilename:String = 'data/models/bbasic_entrance01.ase';
			var parser:IParser = Parser.create(String(datafilename), Parser.MD2);
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				//trace('---');
				var tmpshape:MD2;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as MD2; 
				tmpshape.name = 'md2';
				g.addChild(tmpshape);
			}
			
			return g;
		}
	}
}
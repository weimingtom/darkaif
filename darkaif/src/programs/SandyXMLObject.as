/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package programs
{
	//{ packages
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
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
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
	 * @author @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 * 
	 * Information: This will check if there any object in the scene and remove it for next file to load. 
	 * This will load the object mesh base on engine support format. 
	 * This will load the mesh that all to test out if the code is working. 
	 * Note if you can't see any thing use the scale. Do not use word will give error.
	 * This is url base load using xml format to load.
	 * 
	 * load file:
	 * -ase
	 * -md2
	 * -dae
	 * -3ds
	 * 
	 */
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="60")]
	public class SandyXMLObject extends Sprite {
		
		//{ //variables
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var g:Group = new Group("myGroup");
		
		public var urlobjectfile:String = 'objectfile.xml'; //file id
		public var objectfilexml:XML = new XML();
		
		public var datafile_dropbox:DropBox = new DropBox();
		public var buttonloadfile:Button = new Button("Load File");
		
		public var buttonscale:Button = new Button('scale');
		public var textscale:TextField = new TextField();
		//}
		
		public function SandyXMLObject() {
			
			//{ Scene world
			// camera
			camera = new Camera3D(300, 300);
			//camera.z = -50;
			camera.near = 0;
			camera.y = 90;
			//camera.lookAt(0, 0, 0);
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			//button
			buttonscale.x = 300;
			buttonscale.addEventListener(MouseEvent.CLICK, scalemesh);
			addChild(buttonscale);
			
			//button
			buttonloadfile.addEventListener(MouseEvent.CLICK, clickloadfile);
			buttonloadfile.x = 120;
			addChild(buttonloadfile);
			
			//input
			textscale.x = 200;
			textscale.border = true;
			textscale.type = TextFieldType.INPUT; 
			textscale.height = 20;
			addChild(textscale);
			
			//start loading xml file object
			loadobjectfilexml();
			
		}
		
		//scale mesh size to see
		public function scalemesh(event:Event):void {
			//textscale.text;
			var objectmesh:Array = g.children;
			for (var c:int = 0; c < objectmesh.length; c++) {
				objectmesh[c].scaleX = textscale.text;
				objectmesh[c].scaleY = textscale.text;
				objectmesh[c].scaleZ = textscale.text;
			}
		}
		
		//load xml objerct list name
		public function loadobjectfilexml():void {
			var request:URLRequest = new URLRequest(urlobjectfile);
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				trace(event.target.data);
				objectfilexml = new XML(event.target.data);
				buildlist();
			}
		}
		
		public function clickloadfile(event:Event):void {
			var filename:String = datafile_dropbox.getboxname();
			//trace(filename);
			for (var fileno:int = 0; fileno < objectfilexml.file.length(); fileno++ ) {
				if (objectfilexml.file[fileno].idobject == filename) {
					removeobjects();
					//trace('found!');
					//trace('type:' + objectfilexml.file[fileno].type);
					if (objectfilexml.file[fileno].type == '.md2') {
						trace('file type match. md2 file');
						loadobjectfile_md2(objectfilexml.file[fileno].idobject);
					}
					
					if (objectfilexml.file[fileno].type == '.ase') {
						trace('file type match. ase file');
						loadobjectfile_ase(objectfilexml.file[fileno].idobject);
					}
					
					if (objectfilexml.file[fileno].type == '.dae') {
						trace('file type match. dae file');
						loadobjectfile_dae(objectfilexml.file[fileno].idobject);
					}
					
					if (objectfilexml.file[fileno].type == '.3ds') {
						trace('file type match. 3ds file');
						loadobjectfile_3ds(objectfilexml.file[fileno].idobject);
					}
				}
			}
		}
		
		//add object into the dropbox list
		public function buildlist():void {
			for (var fileno:int = 0; fileno < objectfilexml.file.length(); fileno++ ) {
				//trace(objectfilexml.file[fileno].idobject);
				var namestring:String = objectfilexml.file[fileno].idobject;
				datafile_dropbox.boxlist.push(namestring);
			}
			addChild(datafile_dropbox);
		}
		
		//load file id and start building mesh data
		public function displaydatafile(event:Event):void {
			//trace(event.currentTarget.name);
			removeobjects();
			//removeobjects();
			//removeobjects();
			
			for (var fileno:int = 0; fileno < objectfilexml.file.length(); fileno++ ) {
				if (objectfilexml.file[fileno].idobject == event.currentTarget.name) {
					
					//trace('found!');
					trace('type:' + objectfilexml.file[fileno].type);
					if (objectfilexml.file[fileno].type == '.md2') {
						trace('file type match. md2 file');
						loadobjectfile_md2(objectfilexml.file[fileno].idobject);
					}
					
					if (objectfilexml.file[fileno].type == '.ase') {
						trace('file type match. ase file');
						loadobjectfile_ase(objectfilexml.file[fileno].idobject);
					}
					
					if (objectfilexml.file[fileno].type == '.dae') {
						trace('file type match. dae file');
						loadobjectfile_dae(objectfilexml.file[fileno].idobject);
					}
					
					if (objectfilexml.file[fileno].type == '.3ds') {
						trace('file type match. 3ds file');
						loadobjectfile_3ds(objectfilexml.file[fileno].idobject);
					}
					//loadobjectfile_md2();
				}
			}
		}
		
		//MD2 Animation mesh
		public function loadobjectfile_md2(filename:String):void {
			var queue:LoaderQueue = new LoaderQueue();
			var objectname:String = 'md2';
			//name , file, datatype
			queue.add(objectname, new URLRequest((filename)), "BIN" );
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loaddatafile);
			queue.start();
			
			function loaddatafile():void {
				//name, file, scale
				var animmd2:MD2  = new MD2(String(objectname), queue.data[objectname], 1 );
				g.addChild(animmd2);
			}
		}
		
		//ASE Mesh
		public function loadobjectfile_ase(filename:String):void {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = 'ase';
			var parser:IParser = Parser.create(String(filename), Parser.ASE );
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				g.addChild(tmpshape);
			}
		}
		
		//DAE Mesh
		public function loadobjectfile_dae(filename:String):void {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = 'dae';
			var parser:IParser = Parser.create(String(filename),Parser.COLLADA);
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				g.addChild(tmpshape);
			}
		}
		
		//3DS Mesh
		public function loadobjectfile_3ds(filename:String):void {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = '3ds';
			var parser:IParser = Parser.create(String(filename),Parser.MAX_3DS);
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				g.addChild(tmpshape);
			}
		}
		
		//remove object from the scene
		public function removeobjects():void {
			var objectmove:Array = g.children;
			//trace('objectmove.length:'+objectmove.length);
			for (var c:int = 0; c < objectmove.length; c++) {
				//trace('object:' + objectmove[c].name);
				if (objectmove[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					g.removeChildByName(objectmove[c].name);
				}
			}
		}
		
		//render the objects to the scene
		private function enterFrameHandler( event : Event ) : void {
			var objectmesh:Array = g.children;
			for (var c:int = 0; c < objectmesh.length; c++) {
				if (objectmesh[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					objectmesh[c].rotateX += 1;
					objectmesh[c].rotateY += 1;
					objectmesh[c].rotateZ += 1;
				}
			}
			scene.render();
		}
		
		private function createScene():Group{
			//var g:Group = new Group("myGroup");
			var box:Box = new Box('box');
			g.addChild(box);
			return g;
		}
		
	}
	
}
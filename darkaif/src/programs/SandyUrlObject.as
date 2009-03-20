/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package programs
{
	//{ packages
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
	 * Information: Note if the object is not move there might be an image might not be remove.
	 * -this is url base
	 * 
	 * load file:
	 * -ase
	 * -md2
	 * -dae
	 * -3ds
	 * 
	 */
	
	public class SandyUrlObject extends Sprite {
		
		//{ //variables
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var g:Group = new Group("myGroup");
		
		public var siteaccess:String = 'http://localhost/darkaif/'; //need full address
		//public var siteaccess:String = ''; //note this does not work when host php scripts
		public var urlobjectlist:String = siteaccess +'htdocs/scripts/datafiles.php';// file list
		public var urlobjectfile:String = siteaccess +'htdocs/scripts/datafiles.php?file='; //file id
		public var objectfilexml:XML = new XML();
		
		public var datafile_dropbox:DropBox = new DropBox();
		public var buttonloadfile:Button = new Button("Load File");
		
		public var buttonscale:Button = new Button('scale');
		public var textscale:TextField = new TextField();
		//}
		
		public function SandyUrlObject() {
			//var shape:Shape3D = new Shape3D();
			//shape.rotateX
			//shape.scaleX
			
			//datafile_dropbox.setwidth = 256;
			//var shape:Shape3D = new Shape3D;
			//shape.boundingBox.intersectsBox();
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
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			//}	
			loadobjectfilexml();
			buttonscale.x = 300;
			addChild(buttonscale);
			textscale.x = 200;
			textscale.border = true;
			textscale.type = TextFieldType.INPUT; 
			textscale.height = 20;
			buttonscale.addEventListener(MouseEvent.CLICK, scalemesh);
			addChild(textscale);
			
			buttonloadfile.addEventListener(MouseEvent.CLICK, clickloadfile);
			buttonloadfile.x = 120;
			addChild(buttonloadfile);
			
		}
		
		public function scalemesh(event:Event):void {
			//textscale.text;
			var objectmesh:Array = g.children;
			for (var c:int = 0; c < objectmesh.length; c++) {
				objectmesh[c].scaleX = textscale.text;
				objectmesh[c].scaleY = textscale.text;
				objectmesh[c].scaleZ = textscale.text;
			}
		}
		
		public function loadobjectfilexml():void {
			var request:URLRequest = new URLRequest(urlobjectlist);
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
					//loadobjectfile_md2();
				}
			}
		}
		
		public function buildlist():void {
			for (var fileno:int = 0; fileno < objectfilexml.file.length(); fileno++ ) {
				//trace(objectfilexml.file[fileno].idobject);
				
				var namestring:String = objectfilexml.file[fileno].idobject;
				datafile_dropbox.boxlist.push(namestring);
				var objectfilebutton:Button = new Button(namestring);
				objectfilebutton.name = namestring;
				//trace("--]"+objectfilebutton.name);
				objectfilebutton.y = 14 * fileno;
				objectfilebutton.addEventListener(MouseEvent.CLICK, displaydatafile);
				//objectfilebutton.addEventListener(MouseEvent.CLICK, function displaydatafile(event:Event):void {
				//	trace(event.target.label_name.text);
				///});
				//addChild(objectfilebutton);
			}
			addChild(datafile_dropbox);
		}
		
		public function displaydatafile(event:Event):void {
			//trace(event.currentTarget.name);
			removeobjects();
			removeobjects();
			removeobjects();
			
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
		
		public function loadobjectfile_md2(filename:String):void {
			//removeobjects();
			var queue:LoaderQueue = new LoaderQueue();
			var objectname:String = 'md2';
			queue.add(objectname, new URLRequest((urlobjectfile + filename)), "BIN" );
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loaddatafile);
			queue.start();
			
			function loaddatafile():void {
				var animmd2:MD2  = new MD2(String(objectname), queue.data[objectname], 0.5 );
				g.addChild(animmd2);
			}
		}
		
		public function loadobjectfile_ase(filename:String):void {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = 'ase';
			//trace('[----' + urlobjectfile + filename);
			//data/models/guest_DataGearRing.ase
			var parser:IParser = Parser.create(String(urlobjectfile+filename), Parser.ASE );
			//var parser:IParser = Parser.create(String('http://localhost/darkaif/htdocs/data/models/guest_DataGearRing.ase'), Parser.ASE );
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				//trace('ase loading file');
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				g.addChild(tmpshape);
			}
		}
		
		public function loadobjectfile_dae(filename:String):void {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = 'dae';
			//trace('[----' + urlobjectfile + filename);
			//data/models/guest_DataGearRing.ase
			var parser:IParser = Parser.create(String(urlobjectfile+filename),Parser.COLLADA);
			//var parser:IParser = Parser.create(String('http://localhost/darkaif/htdocs/data/models/guest_DataGearRing.ase'), Parser.ASE );
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				//trace('dae loading file');
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				g.addChild(tmpshape);
			}
		}
		
		public function loadobjectfile_3ds(filename:String):void {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = '3ds';
			//trace('[----' + urlobjectfile + filename);
			//data/models/guest_DataGearRing.ase
			var parser:IParser = Parser.create(String(urlobjectfile+filename),Parser.MAX_3DS);
			//var parser:IParser = Parser.create(String('http://localhost/darkaif/htdocs/data/models/guest_DataGearRing.ase'), Parser.ASE );
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				//trace('dae loading file');
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				g.addChild(tmpshape);
			}
		}
		
		public function removeobjects():void {
			var objectmove:Array = g.children;
			//trace('//========================================================//');
			trace('objectmove.length:'+objectmove.length);
			for (var c:int = 0; c < objectmove.length; c++) {
				trace('object:' + objectmove[c].name);
				if (objectmove[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					g.removeChildByName(objectmove[c].name);
				}
			}
		}
		
		private function enterFrameHandler( event : Event ) : void {
			var objectmesh:Array = g.children;
			//trace('//========================================================//');
			//trace('objectmove.length:'+objectmove.length);
			for (var c:int = 0; c < objectmesh.length; c++) {
				//trace('object:' + objectmove[c].name);
				if (objectmesh[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					objectmesh[c].rotateX += 1;
					objectmesh[c].rotateY += 1;
					objectmesh[c].rotateZ += 1;
					//g.removeChildByName(objectmove[c].name);
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
package programs
{
	//{
	import flash.events.MouseEvent;
	import flash.text.TextFieldType;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	
	import away3d.containers.View3D;
	import away3d.loaders.Collada;
	import away3d.loaders.Max3DS;
	import away3d.loaders.Md2;
	import away3d.loaders.Kmz;
	import away3d.loaders.Object3DLoader;
	import away3d.materials.ColorMaterial;
    import away3d.primitives.Sphere;
	import away3d.loaders.Ase;
	
	import darkaif.core.display.Button;
	import darkaif.core.display.DropBox;
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
	* -This is url base load using xml format to load.
	* 
	* -load mesh file:
	* -ase
	* -md2
	* -dae
	* -3ds
	* 
	*/
	
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class Away3DUrlObject extends Sprite {
		
		//{
		// create a viewport
		public var view:View3D = new View3D( { x:200, y:200 } );
		public var objfile:Object3DLoader;
		
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
		
		public function Away3DUrlObject() {
			//add scene
            addChild(view);
			//button
			buttonloadfile.x = 128;
			buttonloadfile.addEventListener(MouseEvent.CLICK, displaydatafile);
			addChild(buttonloadfile);
			
			buttonscale.x = 300;
			buttonscale.addEventListener(MouseEvent.CLICK, scalemesh);
			addChild(buttonscale);
			
			//scale input
			textscale.x = 200;
			textscale.border = true;
			textscale.type = TextFieldType.INPUT; 
			textscale.height = 20;
			addChild(textscale);
			
			//load object file xml
			loadobjectfilexml();
			//render event frame
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		//load object file
		public function loadobjectfilexml():void {
			var request:URLRequest = new URLRequest(urlobjectlist);
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				//trace(event.target.data);
				objectfilexml = new XML(event.target.data);
				buildlist();
			}
		}
		
		//build list for object load list for dropbox
		public function buildlist():void {
			for (var fileno:int = 0; fileno < objectfilexml.file.length(); fileno++ ) {
				//trace(objectfilexml.file[fileno].idobject);
				var namestring:String = objectfilexml.file[fileno].idobject;
				datafile_dropbox.boxlist.push(namestring);
			}
			addChild(datafile_dropbox);
		}
		
		public function scalemesh(event:Event):void {
			//textscale.text;
			var objectmesh:Array = view.scene.children;
			for (var c:int = 0; c < objectmesh.length; c++) {
				objectmesh[c].scale(textscale.text);
			}
		}
		
		//remove object if exist and load object format
		public function displaydatafile(event:Event):void {
			var filename:String = datafile_dropbox.getboxname();
			//trace(filename);
			for (var fileno:int = 0; fileno < objectfilexml.file.length(); fileno++ ) {
				if (objectfilexml.file[fileno].idobject == filename) {
					var objectname:String = 'mesh';
					removeobjects();//clear the scene
					//trace('found!');
					//trace('type:' + objectfilexml.file[fileno].type);
					var material:ColorMaterial = new ColorMaterial(0xFF0000);
					
					if (objectfilexml.file[fileno].type == '.md2') {
						trace('file type match. md2 file');
						objfile = Md2.load(String(urlobjectfile + filename), { material:material, name:objectname } );
						//objfile.scale();
						view.scene.addChild(objfile);
					}
					
					if (objectfilexml.file[fileno].type == '.ase') {
						trace('file type match. ase file');
						objfile = Ase.load(String(urlobjectfile + filename), { material:material, name:objectname } );
						//objfile.scale();
						view.scene.addChild(objfile);
					}
					
					if (objectfilexml.file[fileno].type == '.dae') {
						trace('file type match. dae file');
						objfile = Collada.load(String(urlobjectfile + filename), { material:material, name:objectname } );
						view.scene.addChild(objfile);
					}
					
					if (objectfilexml.file[fileno].type == '.3ds') {
						trace('file type match. 3ds file');
						objfile = Max3DS.load(String(urlobjectfile + filename), { material:material, name:objectname } );
						view.scene.addChild(objfile);
					}
					
					if (objectfilexml.file[fileno].type == '.kmz') {
						trace('file type match. kmz file');
						objfile = Kmz.load(String(urlobjectfile + filename), { material:material, name:objectname } );
						view.scene.addChild(objfile);
					}
				}
			}
		}
		
		//remove object file from the scene
		public function removeobjects():void {
			var objectmesh:Array = view.scene.children;
			//trace('[]-[]'+objectmove.length);
			for (var c:int = 0; c < objectmesh.length; c++) {
				//trace('object:' + objectmove[c].name);
				view.scene.removeChildByName(objectmesh[c].name);
			}
		}
		
		//list object file from the scene
		public function listobjects():void {
			var objectmesh:Array = view.scene.children;
			//trace('[]-[]'+objectmesh.length);
			for (var c:int = 0; c < objectmesh.length; c++) {
				trace('object:' + objectmesh[c].name);
			}
		}
		
		//object update render
		public function update(e:Event):void {
			var objectmesh:Array = view.scene.children;
			for (var c:int = 0; c < objectmesh.length; c++) {
				//trace('object:' + objectmesh[c].name);
				objectmesh[c].rotationY += 1;
			}
			
			// render the view
			view.render();
		}
		
	}
}
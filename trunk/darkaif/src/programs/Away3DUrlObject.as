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
	* Information: Not stable and not enough information on build.
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
		// create a sphere and put it on the 3D stage
		public var sphere:Sphere = new Sphere();
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
            addChild(view);
			/*
			var material:ColorMaterial = new ColorMaterial(0xFF0000);
			objfile = Ase.load("data/models/cubeobj.ase", { material:material, name:'hello' });
			objfile.name = 'cube';
			objfile.addOnSuccess(objOnSuccess);
			view.scene.addChild(objfile);
			function objOnSuccess(e:Event):void {	
                trace("SUCCESS");
            }
			*/
            //view.scene.addChild(sphere);
			
			buttonloadfile.x = 128;
			buttonloadfile.addEventListener(MouseEvent.CLICK, displaydatafile);
			addChild(buttonloadfile);
			loadobjectfilexml();
			
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
				//var objectfilebutton:Button = new Button(namestring);
				//var objectfilebutton:Button = new Button(namestring);
				//objectfilebutton.name = namestring;
				//trace("--]"+objectfilebutton.name);
				//objectfilebutton.y = 14 * fileno;
				//objectfilebutton.addEventListener(MouseEvent.CLICK, displaydatafile);
			}
			addChild(datafile_dropbox);
			buttonscale.x = 300;
			addChild(buttonscale);
			textscale.x = 200;
			textscale.border = true;
			textscale.type = TextFieldType.INPUT; 
			textscale.height = 20;
			buttonscale.addEventListener(MouseEvent.CLICK, scalemesh);
			addChild(textscale);
		}
		
		public function scalemesh(event:Event):void {
			//textscale.text;
			var objectmove:Array = view.scene.children;
			for (var c:int = 0; c < objectmove.length; c++) {
				objectmove[c]..scale(textscale.text);
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
			var objectmove:Array = view.scene.children;
			//trace('[]-[]'+objectmove.length);
			for (var c:int = 0; c < objectmove.length; c++) {
				//trace('object:' + objectmove[c].name);
				view.scene.removeChildByName(objectmove[c].name);
			}
		}
		
		//list object file from the scene
		public function listobjects():void {
			
			var objectmove:Array = view.scene.children;
			trace('[]-[]'+objectmove.length);
			
			for (var c:int = 0; c < objectmove.length; c++) {
				trace('object:' + objectmove[c].name);
				//if (objectmove[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					//g.removeChildByName(objectmove[c].name);
				///}
			}
		}
		
		//object update render
		public function update(e:Event):void {
			if (objfile != null){ //check if object is null in case error
				objfile.rotationY += 1;
				objfile.rotationZ += 1;
			}
			sphere.rotationY += 1;
			// render the view
			view.render();
		}
		
	}
}
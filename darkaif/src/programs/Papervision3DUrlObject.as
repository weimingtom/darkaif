package programs
{
	//{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import org.papervision3d.objects.parsers.KMZ;
	import org.papervision3d.objects.parsers.Ase;
	import org.papervision3d.objects.parsers.DAE;
	import org.papervision3d.objects.parsers.Max3DS;
	import org.papervision3d.objects.parsers.MD2;
	import org.papervision3d.core.geom.TriangleMesh3D;
	
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
	
	import darkaif.core.display.Button;
	import darkaif.core.display.DropBox;
	//}
	
	/*
	 * Information: This will check if there any object in the scene and remove it for next file to load. 
	 * This will load the object mesh base on engine support format. 
	 * This will load the mesh that all to test out if the code is working. 
	 * Note if you can't see any thing use the scale. Do not use word will give error.
	 * -This is url base load using xml format to load.
	 * 
	 * Works
	 * load file:
	 * -ase
	 * -md2
	 * -dae
	 * -3ds
	 * -kmz
	*/
 
	//[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="60")]
	[SWF(width="640", height="480", backgroundColor="#FFF0FF", frameRate="60")]
	public class Papervision3DUrlObject extends BasicView {
		
		//{ //variables
		//public var triangleMesh3d:MD2 = new MD2(true);//play animation bool
		
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
		
		public function Papervision3DUrlObject() {
			
			//button
			buttonloadfile.x = 128;
			buttonloadfile.addEventListener(MouseEvent.CLICK, displaydatafile);
			addChild(buttonloadfile);
			
			buttonscale.x = 300;
			buttonscale.addEventListener(MouseEvent.CLICK, scalemesh);
			addChild(buttonscale);
			
			//input
			textscale.x = 200;
			textscale.border = true;
			textscale.type = TextFieldType.INPUT; 
			textscale.height = 20;
			addChild(textscale);
			
			//build list object
			loadobjectfilexml();
			startRendering();
		}
		
		//scale mesh
		public function scalemesh(event:Event):void {
			//textscale.text;
			//This will scale all the mesh
			var objectmesh:Array = scene.objects;
			for (var c:int = 0; c < objectmesh.length; c++) {
				objectmesh[c].scale = textscale.text;
			}
		}
		
		//load object file this for xmllist
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
		
		//remove object if exist and load object format
		public function displaydatafile(event:Event):void {
			listobjects();
			var filename:String = datafile_dropbox.getboxname();
			//trace(filename);
			for (var fileno:int = 0; fileno < objectfilexml.file.length(); fileno++ ) {
				if (objectfilexml.file[fileno].idobject == filename) {
					var objectname:String = 'mesh';
					removeobjects();//clear the scene
					//trace('found!');
					//trace('type:' + objectfilexml.file[fileno].type);
					var material:ColorMaterial = new ColorMaterial(0xcc0FFF);
					
					if (objectfilexml.file[fileno].type == '.md2') {
						trace('file type match. md2 file');
						var triangleMesh3d_md2:MD2 = new MD2(true);
						triangleMesh3d_md2.load(String(urlobjectfile + filename), material);
						scene.addChild(triangleMesh3d_md2);
					}
					
					if (objectfilexml.file[fileno].type == '.ase') {
						trace('file type match. ase file');
						var triangleMesh3d_ase:TriangleMesh3D;
						triangleMesh3d_ase = new Ase(null, (urlobjectfile + filename), 1);
						scene.addChild(triangleMesh3d_ase);
					}
					
					if (objectfilexml.file[fileno].type == '.dae') {
						trace('file type match. dae file');
						var triangleMesh3d_dae:DAE = new DAE(false, "mesh", false);
						triangleMesh3d_dae.load(urlobjectfile + filename);
						scene.addChild(triangleMesh3d_dae);
					}
					
					if (objectfilexml.file[fileno].type == '.3ds') {
						trace('file type match. 3ds file');
						var triangleMesh3d_3ds:Max3DS = new Max3DS();
						triangleMesh3d_3ds.load(urlobjectfile + filename);
						scene.addChild(triangleMesh3d_3ds);
					}
					
					if (objectfilexml.file[fileno].type == '.kmz') {
						trace('file type match. kmz file');
						var triangleMesh3d_kmz:KMZ = new KMZ();
						//triangleMesh3d_kmz.rotationX
						triangleMesh3d_kmz.load(urlobjectfile + filename);
						scene.addChild(triangleMesh3d_kmz);
					}
				}
			}
		}
		
		//remove from scene
		public function removeobjects():void {
			var objectmesh:Array = scene.objects;
			//trace('[]-[]'+objectmove.length);
			for (var c:int = 0; c < objectmesh.length; c++) {
				//trace('[object]:Count:' + c +":" + objectmesh[c].name);
				scene.removeChildByName(objectmesh[c].name);
			}
		}
		
		//list object file from the scene
		public function listobjects():void {
			var objectmesh:Array = scene.objects;
			//trace('[]-[]'+objectmove.length);
			for (var c:int = 0; c < objectmesh.length; c++) {
				trace('[object]:Count:'+c +":"+ objectmesh[c].name);
			}
		}
		
		//render
		override protected function onRenderTick(event:Event = null):void {
			var objectmesh:Array = scene.objects;
			//trace('[]-[]'+objectmove.length);
			for (var c:int = 0; c < objectmesh.length; c++) {
				objectmesh[c].rotationY += 1;
				//trace('[object]:Count:'+c +":"+ objectmesh[c].rotationX);
			}
			
			//triangleMesh3d_kmz.rotationX
			//triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}
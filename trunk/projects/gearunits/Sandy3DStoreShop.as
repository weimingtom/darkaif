package  
{
	//{
	import darknet.core.display.DropBoxList;
	import darknet.core.event.DropBoxEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import gearunits.models.SMeshStoreshop;
	import gearunits.sandy3d.shop.SClothing;
	import gearunits.sandy3d.shop.SMeshBody;
	import gearunits.sandy3d.shop.STexture;
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.core.scenegraph.Shape3D;
	import sandy.materials.Appearance;
	import sandy.materials.BitmapMaterial;
	import sandy.materials.ColorMaterial;
	import sandy.parser.IParser;
	import sandy.parser.Parser;
	import sandy.parser.ParserStack;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Sandy3DStoreShop extends Sprite
	{
		//{
		public var KEY_LEFT:Boolean = false;
		public var KEY_RIGHT:Boolean = false;
		public var KEY_UP:Boolean = false;
		public var KEY_DOWN:Boolean = false;
		public var KEY_SPACE:Boolean = false;
		
		public var clothing:Vector.<SClothing> = new Vector.<SClothing>();
		public var texture:Vector.<STexture> = new Vector.<STexture>();
		public var siteurl:String = 'http://localhost/projects/gearunits/bin/'
		public var itemurlrequest:String = 'clothings.xml';
		public var itemxml:XML = new XML();
		public var dropboxmenu:DropBoxList = new DropBoxList();
		public var dropboxmenu_chest:DropBoxList = new DropBoxList();
		public var dropboxmenu_leg:DropBoxList = new DropBoxList();
		public var bodymesh:SMeshBody = new SMeshBody();
		
		public var checkmeshtexture:Boolean = false;
		
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var g:Group = new Group('group');
		//}
		
		public function Sandy3DStoreShop() {
			camera = new Camera3D(800, 600);
			camera.lookAt(0, 0, 0);
			camera.z = -200;
			camera.y = 200;
			camera.lookAt(0, 0, 0);
			//camera.y = 500;
			
			scene = new Scene3D( "scene", this, camera, g );
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypressdown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyupevent);
			init_scene();
		}
		
		//UPDATE FRAME
		private function enterFrameHandler(event:Event) : void {
			
			if (KEY_DOWN) {
				camera.z--; 
			}
			
			if (KEY_UP) {
				camera.z++;
			}
			
			if (KEY_LEFT) {
				camera.x--; 
			}
			
			if (KEY_RIGHT) {
				camera.x++; 
			}
			scene.render();
			checkmeshmaterial();
		}
		
		public function init_scene():void {
			var colormat:ColorMaterial = new ColorMaterial(0x999999);
			colormat.lightingEnable = true;
			var app:Appearance = new Appearance(colormat);
			var building:SMeshStoreshop = new SMeshStoreshop();
			//building.appearance = app;
			scene.root.addChild(building);
			loadclothinglistdata();
		}
		
		//{ KEY BOARD FUNCTIONS
		public function keypressdown(key:KeyboardEvent):void {
			//trace('key press');
			if (key.keyCode == 16) {
				//SHIFT = true;
			}
			
			if (key.keyCode == 17) {
				//CTRL = true;
			}
			
			if (key.keyCode == 37) {//left
				//view.camera.x -= 10;
				KEY_LEFT = true;
			}
			if (key.keyCode == 39) {//right
				//view.camera.x += 10;
				KEY_RIGHT = true;
			}
			if (key.keyCode == 40) {//down
				//view.camera.z -= 10;
				KEY_DOWN = true;
			}
			if (key.keyCode == 38) {//up
				//view.camera.z += 10;
				KEY_UP = true;
				//camera.lookAt(0, 0, 0);
			}
			
			if (key.keyCode == 90) {
				//KEY_Z =  true;
			}
			
			if (key.keyCode == 88) {
				//KEY_X =  true;
			}
			
			if (key.keyCode == 32) {
				//KEY_SPACE = true;
			}
			
		}
		
		public function keyupevent(key:KeyboardEvent):void {
			//trace(key.keyCode);
			if (key.keyCode == 16) {
				//SHIFT = false;
			}
			
			if (key.keyCode == 17) {
				//CTRL = false;
			}
			
			if (key.keyCode == 90) {
				//KEY_Z =  false;
			}
			
			if (key.keyCode == 88) {
				//KEY_X =  false;
			}
			
			if (key.keyCode == 37) {//left
				KEY_LEFT = false;
			}
			if (key.keyCode == 39) {//right
				KEY_RIGHT = false;
			}
			if (key.keyCode == 40) {//down
				KEY_DOWN = false;
			}
			if (key.keyCode == 38) {//up
				KEY_UP = false;
				//camera.lookAt(0, 0, 0);
			}
			if (key.keyCode == 32) {
				KEY_SPACE = false;
			}
		}
		//}
		
		public function loadclothinglistdata():void {
			var urlrequest:URLRequest = new URLRequest(itemurlrequest);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			
			urlloader.addEventListener("complete", initdata)
			urlloader.addEventListener(IOErrorEvent.IO_ERROR, maperror);
			
			function maperror(event:IOErrorEvent):void {
				//trace('fail load map url map');
			}
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				itemxml = new XML(event.target.data);
				//maploaddata();
				trace(itemxml.item.clothing.name);
				//loadmesh();
				parserfile();
			}
		}
		
		public function loadmesh():void {
			trace("....mesh and texture");
			var countmesh:int = 0;
			for (var c:int = 0; c < itemxml.item.clothing.length(); c++ ) {
				trace(itemxml.item.clothing[c].name)
				
				var material:ColorMaterial = new ColorMaterial(0xFF0000);
				var buildclothing:SClothing = new SClothing();
				//var fileobjectnam:String = 'http://localhost/projects/gearunits/bin/data/cubeobj.ase';
				//var fileobjectnam:String = 'data/cubeobj.ase';
				var objectname:String = itemxml.item.clothing[c].mesh.name;
				var localdir:String = siteurl + itemxml.item.clothing[c].mesh.file;
				//buildclothing.load(Ase.load(localdir, { name:objectname, material:material, autoLoadTextures:false  } ));
				//buildclothing.load(new Ase(null,localdir, 0.5));
				
				
				buildclothing.name = itemxml.item.clothing[c].name;
				buildclothing.type = itemxml.item.clothing[c].type;
				buildclothing.weartype = itemxml.item.clothing[c].weartype;
				
				for (var m:int = 0; m < itemxml.item.clothing[c].mesh.material.texture.length(); m++) {
					var _tex:STexture  = new STexture();
					_tex.name = itemxml.item.clothing[c].mesh.material.texture[m].name;
					_tex.load(itemxml.item.clothing[c].mesh.material.texture[m].file);
					//var triangleMesh3d:TriangleMesh3D;
					//triangleMesh3d = new Ase(null, "data/cubeobj.ase", 0.5);
					//scene.addChild(triangleMesh3d);
					
					buildclothing.texture.push(_tex);
					texture.push(_tex);
				}
				countmesh++;
				clothing.push(buildclothing);
				//scene.addChild(buildclothing.meshloader);
			}
			checkmeshtexture = true;
			init_menu();
			//testbuildmesh();
		}
		
		public function parserfile():void {
			//var queue:LoaderQueue = new LoaderQueue();
			var parserstack:ParserStack = new ParserStack();
			trace("....mesh and texture");
			for (var c:int = 0; c < itemxml.item.clothing.length(); c++ ) {
				//trace(itemxml.item.clothing[c].name)
				
				var objectfilename:String = itemxml.item.clothing[c].name;
				var objectfiledir:String = itemxml.item.clothing[c].mesh.file;
				//trace('>>'+objectfiledir)
				var parser:IParser = Parser.create(objectfiledir, Parser.ASE);
				parserstack.add(objectfilename, parser);
			}
			
			//add listeners
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			
			function loaddatafile():void {
				//trace('file mesh loaded...');
				for (var cc:int = 0; cc < itemxml.item.clothing.length(); cc++ ) {
					var builtclothing:SClothing = new SClothing();
					var objectname:String = itemxml.item.clothing[cc].name;
					//trace('[]>'+objectname)
					builtclothing.name = objectname;
					builtclothing.meshloader = parserstack.getGroupByName(objectname).children[0] as Shape3D;
					builtclothing.bloaded = true;
					builtclothing.name = itemxml.item.clothing[cc].name;
					builtclothing.type = itemxml.item.clothing[cc].type;
					builtclothing.weartype = itemxml.item.clothing[cc].weartype;
					
					for (var m:int = 0; m < itemxml.item.clothing[cc].mesh.material.texture.length(); m++) {
						var _tex:STexture  = new STexture();
						_tex.name = itemxml.item.clothing[cc].mesh.material.texture[m].name;
						_tex.load(itemxml.item.clothing[cc].mesh.material.texture[m].file);
						texture.push(_tex);
						builtclothing.texture.push(_tex);
					}
					
					clothing.push(builtclothing);
				}
				checkmeshtexture = true;
				init_menu();
			}
		}
		
		public function init_menu():void {
			trace("... init list")
			for (var cc:int = 0; cc < clothing.length;cc++ ){
				dropboxmenu.addlist( { name:clothing[cc].name, id:clothing[cc].id } );
				trace("++"+clothing[cc].name);
			}
			dropboxmenu.addEventListener(DropBoxEvent.SELECT, dropboxlistselected);
			addChild(dropboxmenu);
		}
		
		public function dropboxlistselected(event:DropBoxEvent):void {
			//trace("|>>>|" + dropboxmenu._idname)
			//view.scene
			var _type:String = "";
			var _weartype:String = "";
			var cc:int = 0
			var holderclothing:SClothing;
			
			//look for type
			for (cc = 0; cc < clothing.length; cc++ ) {
				if (String(clothing[cc].id) == dropboxmenu._idname) {
					holderclothing = clothing[cc];
					_type = clothing[cc].type;
					_weartype = clothing[cc].weartype;
					break;
				}
			}
			
			//remove form type
			for (cc = 0; cc < clothing.length; cc++ ) {
				if ((clothing[cc].type == _type)&&(clothing[cc].weartype == _weartype)){
					try{
						scene.root.removeChildByName(clothing[cc].meshloader.name);
					}catch (e:Error) {
						//trace('error');
					}
					//trace("clean..." + clothing[cc].meshloader.name)
				}
			}
			
			if (holderclothing != null) {
				//trace('found');
				for (var lc:int = 0; lc < bodymesh.clothing.length; lc++) {
					//trace('checking---');
					//trace(bodymesh.clothing[lc].type+ '>>'+ holderclothing.type+'>>'+bodymesh.clothing[lc].weartype +'>>'+ holderclothing.weartype)
					if ((bodymesh.clothing[lc].type == holderclothing.type) && (bodymesh.clothing[lc].weartype == holderclothing.weartype)) {
						//holderclothing.meshloader.scale = 0.04;
						holderclothing.meshloader.x = bodymesh.clothing[lc].x + bodymesh.x;
						holderclothing.meshloader.y = bodymesh.clothing[lc].y + bodymesh.y;
						holderclothing.meshloader.z = bodymesh.clothing[lc].z + bodymesh.z;
						//trace('found---');
						break;
					}
				}
			}
			//holderclothing.meshloader.handle.y = 64;
			scene.root.addChild(holderclothing.meshloader);
			
		}
		
		public function checkmeshmaterial():void {
			if(checkmeshtexture == true){
				var bfilemeshloaded:Boolean = false;
				var bfiletextureloaded:Boolean = false;
				for (var l:int = 0; l < clothing.length; l++ ) {
					if (clothing[l].bloaded == false) {
						bfilemeshloaded = true;
						//trace('mesh...');
						break;
					}
				}
			
				for (var t:int = 0; t < texture.length; t++ ) {
					if (texture[t].bloaded == false) {
						bfilemeshloaded = true;
						//trace('tex...');
						break;
					}
				}
				
				//trace('ALL FILE LOADED...')
				//trace(bfilemeshloaded+"|"+bfiletextureloaded)
				if ((bfilemeshloaded == false)&& (bfiletextureloaded == false)){
					trace('ALL FILE LOADED...')
					
					for (var m:int = 0; m < clothing.length; m++ ) {
						if(clothing[m].btextureloaded = true){//check if mesh is apply already if not apply materail
							for (var tm:int = 0; tm < clothing[m].texture.length; tm++) {
								var bitmat:BitmapMaterial = new BitmapMaterial(clothing[m].texture[tm].texture.bitmapData);
								//clothing[m].meshloader.material = bitmat;
								var app:Appearance = new Appearance(bitmat);
								clothing[m].meshloader.appearance = app;
								clothing[m].btextureloaded = true;
								trace('loaded....')
							}
						}
					}
					
					//this will close the loop
					checkmeshtexture = false;
				}
			}
		}
		
	}
	
}
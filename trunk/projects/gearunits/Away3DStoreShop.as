package  
{
	//{
	import away3d.containers.View3D;
	import away3d.core.base.Mesh;
	import away3d.core.math.Number3D;
	import away3d.loaders.Ase;
	//import away3d.loaders.Object3DLoader;
	import away3d.materials.ColorMaterial;
	import away3d.primitives.Cube;
	import darknet.core.display.DropBoxList;
	import darknet.core.event.DropBoxEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import gearunits.models.AMeshStoreshop;
	import gearunits.models.AMeshStoreshopCashier;
	import gearunits.models.AMeshStoreshopFloor;
	import gearunits.models.AMeshStoreshopPants;
	import gearunits.models.AMeshStoreshopShirt;
	import gearunits.models.AMeshStoreshopSkirt;
	import gearunits.models.AMeshStoreshopTable;
	import gearunits.models.AMeshStoreshopWall;
	import shop.Clothing;
	import shop.Texture;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class Away3DStoreShop extends Sprite
	{
		public var view:View3D = new View3D( { x:320, y:240 } );
		public var KEY_LEFT:Boolean = false;
		public var KEY_RIGHT:Boolean = false;
		public var KEY_UP:Boolean = false;
		public var KEY_DOWN:Boolean = false;
		public var KEY_SPACE:Boolean = false;
		
		public var clothing:Vector.<Clothing> = new Vector.<Clothing>();
		public var texture:Vector.<Texture> = new Vector.<Texture>();
		public var siteurl:String = 'http://localhost/projects/gearunits/bin/'
		public var itemurlrequest:String = 'clothings.xml';
		public var itemxml:XML = new XML();
		public var dropboxmenu:DropBoxList = new DropBoxList();
		
		
		//public var leg
		
		public function Away3DStoreShop() {
			Clothing.view = view;
			addChild(view);
			view.camera.y = 200;
			view.camera.z = -200;
			view.camera.lookAt(new Number3D(0,200,0))
			//view.camera.y = 800;
			view.camera.z = -800;
			
			
			//view.camera.x = -71;
			//view.camera.y = 800;
			//view.camera.z = -567;
			//view.camera.lookAt(new Number3D(0, 0, 0))
			
			var cube:Cube = new Cube({height:8,width:8,depth:8});
			view.scene.addChild(cube);
			
			addEventListener(Event.ENTER_FRAME, render);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypressdown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyupevent);
			
			init_scene();
			loadclothinglistdata();
		}
		
		public function render(event:Event):void {
			
			if (KEY_DOWN) {
				view.camera.z--; 
			}
			
			if (KEY_UP) {
				view.camera.z++;
			}
			
			if (KEY_LEFT) {
				view.camera.x--; 
			}
			
			if (KEY_RIGHT) {
				view.camera.x++; 
			}
			//trace(view.camera);
			
			view.render();
		}
		
		public function init_scene():void {
			
			//var building:AMeshStoreshop =  new AMeshStoreshop();
			//view.scene.addChild(building);
			var buildingfloor:AMeshStoreshopFloor = new AMeshStoreshopFloor();
			view.scene.addChild(buildingfloor);
			var buildingwall01:AMeshStoreshopWall = new AMeshStoreshopWall();
			buildingwall01.x = 0;
			buildingwall01.z = 320;
			view.scene.addChild(buildingwall01);
			/*
			var buildingwall02:AMeshStoreshopWall = new AMeshStoreshopWall();
			buildingwall02.z = -320;
			buildingwall02.x = 0;
			view.scene.addChild(buildingwall02);
			*/
			var buildingwall03:AMeshStoreshopWall = new AMeshStoreshopWall();
			buildingwall03.z = 0;
			buildingwall03.x = -320;
			buildingwall03.rotationY = 90;
			view.scene.addChild(buildingwall03);
			var buildingwall04:AMeshStoreshopWall = new AMeshStoreshopWall();
			buildingwall04.z = 0;
			buildingwall04.x = 320;
			buildingwall04.rotationY = 90;
			view.scene.addChild(buildingwall04);
			
			var pants:AMeshStoreshopPants = new AMeshStoreshopPants();
			pants.z = 128;
			pants.y = 128;
			pants.x = 64+16;
			view.scene.addChild(pants);
			
			/*
			var cashier:AMeshStoreshopCashier = new AMeshStoreshopCashier();
			cashier.y = 32+16;
			//cashier.rotationY = 180;
			view.scene.addChild(cashier);
			var table:AMeshStoreshopTable  = new AMeshStoreshopTable();
			view.scene.addChild(table);
			
			var shirt:AMeshStoreshopShirt = new AMeshStoreshopShirt();
			shirt.z = 128;
			shirt.y = 128;
			view.scene.addChild(shirt);
			
			var pants:AMeshStoreshopPants = new AMeshStoreshopPants();
			pants.z = 128;
			pants.y = 128;
			pants.x = 64+16;
			view.scene.addChild(pants);
			
			var skirt:AMeshStoreshopSkirt = new AMeshStoreshopSkirt();
			skirt.z = 128;
			skirt.y = 128;
			skirt.x = (112);
			view.scene.addChild(skirt);
			*/
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
				loadmesh();
			}
		}
		
		public function loadmesh():void {
			var countmesh:int = 0;
			for (var c:int = 0; c < itemxml.item.clothing.length(); c++ ) {
				trace(itemxml.item.clothing[c].name)
				
				var material:ColorMaterial = new ColorMaterial(0xFF0000);
				var buildclothing:Clothing = new Clothing();
				//var fileobjectnam:String = 'http://localhost/projects/gearunits/bin/data/cubeobj.ase';
				//var fileobjectnam:String = 'data/cubeobj.ase';
				var objectname:String = itemxml.item.clothing[c].mesh.name;
				var localdir:String = siteurl + itemxml.item.clothing[c].mesh.file;
				//var localdir:String = itemxml.item.clothing[c].mesh.file;
				buildclothing.load(Ase.load(localdir, { name:objectname, material:material, autoLoadTextures:false  } ));
				//buildclothing.meshloader.y = 128 * c;
				buildclothing.name = itemxml.item.clothing[c].mesh.name;
				//view.scene.addChild(buildclothing.meshloader)
				//buildclothing.meshloader.scale(0.01)
				//trace(buildclothing.meshloader.url)
				countmesh++;
				clothing.push(buildclothing);
			}
			init_menu();
			//testbuildmesh();
		}
		
		public function testbuildmesh():void {
			for (var ci:int = 0; ci < clothing.length; ci++ ) {
				view.scene.addChild(clothing[ci].meshloader)
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
			trace("|>>>|" + dropboxmenu._idname)
			//view.scene
			var cc:int = 0
			
			for (cc = 0; cc < clothing.length; cc++ ) {
				try{
					view.scene.removeChildByName(clothing[cc].meshloader.name);
				}catch (e:Error) {
					trace('error');
				}
				trace("clean..."+clothing[cc].meshloader.name)
			}
			
			for (cc = 0; cc < clothing.length; cc++ ) {
				if (String(clothing[cc].id) == dropboxmenu._idname) {
					//view.scene.addChild(clothing[cc].meshloader);
					//clothing[cc].meshloader.scale(0.01);
					clothing[cc].meshloader.scale(1);
					//clothing[cc].meshloader.y = 64;
					view.scene.addChild(clothing[cc].meshloader.handle);
					trace(clothing[cc].meshloader.x + "|" + clothing[cc].meshloader.y + "|" + clothing[cc].meshloader.z);
					view.camera.lookAt(new Number3D(clothing[cc].meshloader.x,clothing[cc].meshloader.y,clothing[cc].meshloader.z))
					trace("added...")
				}
				//dropboxmenu.addlist( { name:clothing[cc].name, id:clothing[cc].id } );
				//trace("++" + clothing[cc].name);
			}
		}
	}
	
}
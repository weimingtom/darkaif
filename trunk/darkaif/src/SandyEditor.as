/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  
{
	//{PACKAGE
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
	
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.parser.*;
	//import sandy.core.data.Vector;
	import sandy.util.*;
	import sandy.events.*;
	import sandy.view.*;

	//import org.flashdevelop.utils.FlashConnect;
	//}PACKAGE
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: This will become the level editor and dealing with different fromats.
	* 
	* Save/Load Map data will be server php script and mysql database
	* since flash can't write data or save it. 
	* 
	* TODO: int map file data
	* 
	* -LOAD ASE OBJECT -(other format)
	* -LOAD TEXTURE -(need many texture)
	* -MAP FORMAT
	* TODO: DO Map Check Error
	* 
	*/
	public class SandyEditor extends Sprite
	{
		//{ Variables
		private var scene:Scene3D; // just one scene or the world
		private var camera:Camera3D; //basic one cam
		private var rawobject:Shape3D; //any objects
		public var rawstring:String;
		public var g:Group = new Group("myGroup");
		//public var mapurlrequest:String = "data/maps/mapdata01.xml";
		//public var mapurlrequest:String = "data/maps/threebythree.xml";
		public var mapurlrequest:String = "data/maps/threesube.xml";
		
		private var pot:Shape3D;
		
		//load object files
		private var parserStack:ParserStack;
		//load object texutures files
		private var queue:LoaderQueue;
		
		public var mapxml:XML = new XML(); //xml load data for map
		
		public var objectloop:Boolean = true;
		public var objectcount:int = 0;
		public var bojectloaded:Boolean = false;
		public var objectarry:Array = new Array();
		
		public var loadobject:Array = new Array();//data for loading objects
		public var loadtexutre:Array = new Array();//texture data
		public var loadmaterial:Array = new Array();
		
		public var text_loading:TextField =  new TextField();
		
		//}
		
		public function SandyEditor() 
		{
			flash.system.Security.loadPolicyFile("*")
			DrawLoading();
			initmap();
			
			//var parser:IParser = Parser.create("data/models/ShipCargo.ase", Parser.ASE );
			//var parser:IParser = Parser.create("data/models/cube32.ase",Parser.ASE );
			//parser.addEventListener( ParserEvent.FAIL, onError );
			//parser.addEventListener( ParserEvent.INIT, ParsercreateScene );
			//parser.parse();
			
			// camera
			camera = new Camera3D(300, 300);
			//FlashConnect.trace("cam name:"+String(camera.name));
			camera.y = 150;
			camera.z = -256;
			camera.rotateX = 20;
			camera.near = 10;
			
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
			
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			// Listen to the heart beat and render the scene
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
		}
		
		public function DrawLoading():void
		{
			//var textloading:TextField = new TextField();
			text_loading.text = "Loading";
			addChild(text_loading);
		}
		
		public function RemoveLoading():void
		{
			removeChild(text_loading);
		}
		
		//=================================================
		//INIT Map Data
		//=================================================
		public function initmap():void
		{
			//FlashConnect.trace("--INIT MAPDATA--");
			//set map url location for map file.
			var urlmap:URLRequest = new URLRequest(mapurlrequest);
			//get map url data
			var maploader:URLLoader = new URLLoader(urlmap);
			maploader.addEventListener("complete",initmapdata); //when map data is finish execute this
			
			function initmapdata(event:Event):void
			{
				//FlashConnect.trace(event.target.data);
				//set map data xml
				mapxml = new XML(event.target.data);
				initloadobjectdata();
			}
		}
		//=================================================
		//data map list load data files
		//=================================================
		public function initloadobjectdata():void
		{
			//This will execute the data when the map data is loaded
			//FlashConnect.trace("--INIT OBJECTS--");
			//FlashConnect.trace(mapxml.name);
			//FlashConnect.trace("- Number of objects from map xml data: -" + String(mapxml.objectlist.mesh.length() )); //length()
			//set object mesh data files
			parserStack = new ParserStack();
			for (var o:int = 0; o < mapxml.objectlist.mesh.length(); o++)
			{
				//FlashConnect.trace(mapxml.objectlist.mesh[o].name);
				//FlashConnect.trace(mapxml.objectlist.mesh[o].localdir);
				//set object file location directory
				var parser:IParser = Parser.create(String(mapxml.objectlist.mesh[o].localdir), Parser.ASE );
				//set object file names
				parserStack.add(String(mapxml.objectlist.mesh[o].name),parser);
			}
			//when data file finish loading execute object files
			parserStack.addEventListener(ParserStack.COMPLETE, parserComplete );
			parserStack.start();
		}
		
		//=================================================
		//load file loaded object when Complete then convert to shape3D
		//=================================================
		private function parserComplete(pEvt:Event ):void
		{
			//FlashConnect.trace("parserComplete");
			//This will load object files when it is finished
			//This will assign the objects files to an array.
			for (var o:int = 0; o < mapxml.objectlist.mesh.length(); o++)
			{
				var rawtmpobject:Shape3D;
				//FlashConnect.trace(String(mapxml.objectlist.mesh[o].name)); //name
				rawtmpobject = parserStack.getGroupByName(String(mapxml.objectlist.mesh[o].name)).children[0] as Shape3D; 
				//FlashConnect.trace("parserComplete:" + mapxml.objectlist.mesh[o].name + " ID:" + rawtmpobject.name);
				//FlashConnect.trace(mapxml.objects.mesh[o].position.x);
				rawtmpobject.name = String(mapxml.objectlist.mesh[o].name);
				//FlashConnect.trace("assign name:"+ rawtmpobject.name);
				objectarry.push(rawtmpobject);
			}
			initloadtexturedata(); //load texture data last it need the object data files first
		}
		
		//=================================================
		// setup for texture files data to be loaded.
		//=================================================
		public function initloadtexturedata():void
		{
			queue = new LoaderQueue();
			//queue.add( "carSkin", new URLRequest("data/textures/car.jpg") );
			//queue.add( "wheels", new URLRequest("data/textures/wheel.jpg") );
			//mesh list to see if mesh has list
			for (var o:int = 0; o < mapxml.objectlist.mesh.length(); o++)
			{
				//FlashConnect.trace("mesh ->" + String(mapxml.objectlist.mesh[o].name));
				var texcount:Number = 0;
				//This will material count to add materails
				for (var ot:int = 0; ot < mapxml.objectlist.mesh[o].mat.tex.length(); ot++)
				{
					//FlashConnect.trace("texture ->" +String(mapxml.objectlist.mesh[o].name) +"_" + texcount + ":" + String(mapxml.objectlist.mesh[o].mat.tex[ot]));
					queue.add(String(mapxml.objectlist.mesh[o].name + "_" + texcount ),new URLRequest(String(mapxml.objectlist.mesh[o].mat.tex[ot])) );
					texcount++;
				}
			}
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE, LoadTextureComplete );
			queue.start();
		}
		
		//=================================================
		// Once files is loaded store the texture files to array
		//=================================================
		private function LoadTextureComplete(event:QueueEvent): void
		{
			//FlashConnect.trace("--LOADED TEXTURE--");
			//queue.data["carSkin"].bitmapData
			
			for (var o:int = 0; o < mapxml.objectlist.mesh.length(); o++)
			{
				//FlashConnect.trace("mesh ->" + String(mapxml.objectlist.mesh[o].name));
				var texcount:Number = 0;
				//This will material count to add materials 
				for (var ot:int = 0; ot < mapxml.objectlist.mesh[o].mat.tex.length(); ot++)
				{
					//FlashConnect.trace("texture ->" +String(mapxml.objectlist.mesh[o].name) +"_" + texcount + ":" + String(mapxml.objectlist.mesh[o].mat.tex[ot]));
					var tmpname:String = String(mapxml.objectlist.mesh[o].name + "_" + texcount);
					//FlashConnect.trace("[-"+tmpname);
					queue.add(tmpname, new URLRequest(String(mapxml.objectlist.mesh[o].mat.tex[ot])) );
					
					loadmaterial.push({tex:queue.data[tmpname].bitmapData,name:tmpname});
					texcount++;
				}
			}	
			listtexture();
			initassiginobjecttexture();
		}
		
		//=================================================
		// Checking there is texture in the array.
		//=================================================
		public function listtexture():void
		{
			loadmaterial.length
			for (var m:int = 0; m < loadmaterial.length; m++)
			{
				//FlashConnect.trace("object->"+loadmaterial[m].name);
			}
		}
		
		//=================================================
		// assign the texture to the objects for materials 
		// This support one material at the moment 
		//=================================================
		public function initassiginobjecttexture():void
		{
			//FlashConnect.trace("--ASSIGN TEXTURES TO MESH OBJECTS--");
			
			//var material:BitmapMaterial = new BitmapMaterial( queue.data["carSkin"].bitmapData );
			//material.
			//var app:Appearance = new Appearance( material );
			//car.appearance = app;
			
			for (var o:int = 0; o < objectarry.length; o++)//loop objects in the list
			{
				//FlashConnect.trace("look for this object materail >" + objectarry[o].name);
				var mattex:int  = 0;
				for (var om:int = 0; om < loadmaterial.length; om++)//loop material texture to see if there more then texture in one object
				{
					var tmptexname:String = loadmaterial[om].name;
					tmptexname.search(objectarry[o].name);
					var materail:Array = new Array();
					if (tmptexname.search(objectarry[o].name) > -1) //if current material matches the name assign it
					{
						//FlashConnect.trace("ID MAT:" + mattex + " - " + loadmaterial[om].name + " < " + objectarry[o].name);
						var material:BitmapMaterial = new BitmapMaterial(loadmaterial[om].tex);
						var app:Appearance = new Appearance( material );
						objectarry[o].appearance = app;
						//materail.push(loadmaterial[om].tex);
						mattex++; //add counter for the materail id
					}
				}
			}
			createSceneobjects();
		}
		
		//=================================================
		//Once the objects are loaded create the objects and added to the Scene 
		//need ID to be assign objects and prefix in case the object need to be move
		//=================================================
		public function createSceneobjects():void
		{
			//FlashConnect.trace("---Creating objects");
			//mapxml.objects.mesh
			var count:Number = 0;
			for (var o:int = 0; o < mapxml.objects.mesh.length(); o++)
			{
				//FlashConnect.trace("x:" + mapxml.objects.mesh[o].position.x + " y:" + mapxml.objects.mesh[o].position.y + "z:" + mapxml.objects.mesh[o].position.z );
				var tmpobject:Shape3D;
				//check if map data matches the object
				for (var ol:int = 0; ol < objectarry.length; ol++)
				{
					if (String(mapxml.objects.mesh[o].name) == String(objectarry[ol].name))
					{
						tmpobject = objectarry[ol].clone();//Clone allow to create a object else it will move the object around
						//FlashConnect.trace("Found:" + tmpobject.name);
						break;
					}					
				}
				//var tmpobject:Shape3D = objectarry[0];
				//tmpobject.clone(); //create object render
				count++;
				//rename the object shape
				tmpobject.name = String(mapxml.objects.mesh[o].name + "_" + count);
				//set object position
				tmpobject.x = mapxml.objects.mesh[o].position.x;
				tmpobject.y = mapxml.objects.mesh[o].position.y;
				tmpobject.z = mapxml.objects.mesh[o].position.z;
				//FlashConnect.trace(tmpobject.name);
				//add object to the scene
				g.addChild(tmpobject);
			}
			RemoveLoading();
		}
		
		//=================================================
		//To make sure it load the data objects, is to list objects in the Scene
		//=================================================
		public function initSceneObjectList():void
		{
			//FlashConnect.trace("--OBJECT SCENE LIST--");
			var objectscene:Array = g.children //Object Scene Array
			for (var c:int = 0; c < objectscene.length; c++) {
				//FlashConnect.trace(objectscene[c].name);
			}
		}
		
		//=================================================
		//Create ASE into sandy object3D
		//=================================================
		private function ParsercreateScene(p_eEvent:ParserEvent ):void
		{
			var pg:Group = Group( p_eEvent.group);
			//FlashConnect.trace("---||" + pg.name);
			rawobject = pg.children[0] as Shape3D;
			rawobject.x = 0;
			rawobject.name = "CUBE";
		 
			var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
			var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
			material.lightingEnable = true;
			var app:Appearance = new Appearance( material);
		 
			rawobject.appearance = app;
			g.addChild(rawobject);
		}
		
		//=================================================
		//Create Polygon
		//=================================================
		private function createScene():Group
		{
			//var g:Group = new Group("myGroup");
			
			var createobject:Shape3D;
			var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
			var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
			var app:Appearance = new Appearance( material);
			
			//object data for creating
			//objectarry.push({ name:'player', x:0, y:0, z:0, height:16, width:16, length:16, color:0x008000 });
			//objectarry.push({  name:'vehicle_test0', x:0, y:0, z:92, height:16, width:16, length:16 , color:0xadff2f });//light green
			//objectarry.push({  name:'npc_test1', x:0, y:0, z:-64, height:16, width:16, length:16, color:0xffff00 });//yellow
			//objectarry.push({  name:'monster_test2', x:0, y:0, z:32, height:16, width:16, length:16, color:0xff0000 });//red
			//objectarry.push({  name:'building_test3', x:-64, y:0, z:0, height:16, width:16, length:16, color:0x808080 });//gray
			
			for (var o:int = 0; o < objectarry.length; o++)
			{
				//FlashConnect.trace(objectarry[o].name);
				createobject = new Box(objectarry[o].name, objectarry[o].height, objectarry[o].width, objectarry[o].length);
				createobject.x = objectarry[o].x;
				createobject.y = objectarry[o].y;
				createobject.z = objectarry[o].z;
				material = new ColorMaterial( objectarry[o].color, 0.9, materialAttr);
				material.lightingEnable = true;
				app = new Appearance( material);
				
				createobject.useSingleContainer = false;
				createobject.enableBackFaceCulling = false;
				createobject.enableClipping = true;
				createobject.appearance = app;
				
				g.addChild(createobject);
			}
			// We need to add the objects to the group 
			return g;
		}
		
		private function onError( pEvt:ParserEvent ):void
		{
			//FlashConnect.trace("there is an error il loading you stuff");
		}
		//=================================================
		//KEY PRESS
		//=================================================
		private function keyPressedHandler(event:flash.events.KeyboardEvent):void 
		{
			//FlashConnect.trace("Hello");
		}
		
		//=================================================
		// The Event.ENTER_FRAME event handler tells the world to render
		//=================================================
		private function enterFrameHandler( event : Event ) : void
		{
			scene.render();
		}
		
	}
	
}
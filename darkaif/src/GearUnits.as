/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

package  
{
	//{PACKAGE
	import darkaif.core.collision.CollisionBox;
	//import darkaif.core.shape.Sandy_Spaceship;
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
	import sandy.util.*;
	import sandy.events.*;
	import sandy.view.*;

	//import org.flashdevelop.utils.FlashConnect;
	
	import darkaif.entities.*;
	//}PACKAGE
	
	
	/**
	* ...
	* @author Darknet
	*/
	public class GearUnits extends Sprite
	{
		/*
		 * Objective simple game format for now.
		 * Basic stuff:
		 * -Collision
		 * -land height -terrain
		 * -objects
		 * -
		 * -build spawn player
		 * 
		 * TODO: need to clean the code
		 * 
		 * 
		 */
		
		//{ Variables
		private var scene:Scene3D; // just one scene or the world
		private var camera:Camera3D; //basic one cam
		private var rawobject:Shape3D; //any objects
		
		public var keysDown:Array = new Array();
		
		public var g:Group = new Group("myGroup");
		public var mapurlrequest:String = "data/maps/spacemaptest.xml";
		//public var mapurlrequest:String = "data/maps/threesube.xml";
		public var modelurlrequest:String = "data/models/";
		public var textureurlrequest:String = "data/textures/";
		
		public var spaceshipxml:XML = new XML(); //xml load data for map
		public var spaceshipurlrequest:String = "data/ships/spaceshiplist.xml";
		public var spacestationurlrequest:String = "data/ships/spacestationlist.xml";
		public var psspaceship:ParserStack;
		
		//load object files
		private var parserStack:ParserStack;
		//load object texutures files
		public var queue:LoaderQueue = new LoaderQueue();
		public var loadmaterial:Array = new Array();
		
		//Object data
		public var modelmesh:Array = new Array();
		public var modeltexture:Array = new Array();
		public var modelmaterial:Array = new Array();
		
		public var classmodel:Array = new Array();
		
		public var objectarry:Array = new Array();
		
		//game object data
		public var spaceships:Array = new Array();
		public var spacestation:Array = new Array();
		public var capitalship:Array = new Array();
		
		public var projectileobjects:Array = new Array();
		
		public var spaceshipqueue:LoaderQueue = new LoaderQueue();
		
		public var currentship:String = "scout_longrange";//default spawn ship
		//public var currentship:String = "simple_scout";//default spawn ship
		public var playeroneid:String = "playername";
		public var playerlist:Array = new Array();
		
		//{ control ship
		public var uparrow:Boolean = false;
		public var downarrow:Boolean = false;
		public var leftarrow:Boolean = false;
		public var rightarrow:Boolean = false;
		
		public var forwardspeed:Boolean = false;
		public var backwardspeed:Boolean = false;
		public var rightspeed:Boolean = false;
		public var leftspeed:Boolean = false;
		public var upspeed:Boolean = false;
		public var downspeed:Boolean = false;
		public var rightrollspeed:Boolean = false;
		public var leftrollspeed:Boolean = false;
		
		public var primaryfire:Boolean = false;
		public var secondaryfire:Boolean = false;
		
		public var rotationSpeed:Number = 10;
		public var acceleration:Number = 0.5;
		
		public var xSpeed:Number = 0;
		public var ySpeed:Number = 0;
		public var zSpeed:Number = 0;
		
		public var Speed:Number = 0;
		public var Currentspeed:Number = 0;
		public var Pitch:Number = 0;
		public var Yaw:Number = 0;
		public var Roll:Number = 0;
		//}
		
		//map data
		public var mapxml:XML = new XML(); //xml load data for map
		
		//text
		public var text_loading:TextField =  new TextField();
		public var text_log:TextField =  new TextField();
		
		//other data test
		public var bullet:Box = new Box("bullet", 16, 16, 16);
		public var bulletfire:Boolean = false;
		public var firerate:Number = 0;
		//}
		
		public function GearUnits(){
			DrawLoading(); //add progress text
			Addtextlog();
			loadmap(mapurlrequest); //execute load map data
			initshipxml(spaceshipurlrequest); //execute ships models
			//spawnplayer()//
			//g.addChild(bullet);
			
			var tmpplayer:Player = new Player();
			tmpplayer.playername = "playername";
			
			playerlist.push(tmpplayer);
			
			tmpplayer = new Player();
			tmpplayer.playername = "bot_1";
			tmpplayer.targetplayername = "playername";
			tmpplayer.bbot = true;
			playerlist.push(tmpplayer);
			
			//for (var pl:int = 0; pl < playerlist.length; pl++) {
			//	trace(playerlist[pl].playername);
			///}
			
			//{ Scene world
			// camera
			camera = new Camera3D(300, 300);
			//camera.y = 150;
			camera.y = 20;
			//camera.x = 20;
			camera.z = -100;
			//camera.rotateX = 20;
			camera.near = 10;
			//camera.enableBackFaceCulling = true;
			
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
			
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			var pot:Box = new Box("box", 16, 16, 16);
			
			//pot.z = 50;
			//g.addChild(pot);
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, playercontrol);
			//keyboard events
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			//}	
			
		}
		
		//frame render objects and update them
		private function enterFrameHandler( event : Event ) : void{
			text_log.text = "";
			spawnplayer();
			objectcollision();
			playercontrol();
			playerfire();
			
			updatebot();
			Gameobjectupdate();
			scene.render();
			objectscleanup();
			//trace("Hello");
		}
		
		//this will clean up the data that was left out for array and mesh data
		public function objectscleanup():void {
			//trace("----");
			for (var cpo:int = 0; cpo < projectileobjects.length; cpo++) {
				//trace(cpo);
				if (projectileobjects[cpo].model.visible == false) {
					//remove from the sandy scnce
					g.removeChildByName(projectileobjects[cpo].model.name);
					projectileobjects.slice(cpo, 1);
					var tmpprojectiles:Array = new Array();
					for (var cpo2:int = 0; cpo2 < projectileobjects.length; cpo2++) {
						if (projectileobjects[cpo] != projectileobjects[cpo2] ){
							tmpprojectiles.push(projectileobjects[cpo2]);
						}
					}
					//update new array
					projectileobjects = tmpprojectiles;
					//trace(projectileobjects[cpo].model.name);
				}
			}
		}
		
		//{ Draw outputs
		
		public function DrawLoading():void{
			//var textloading:TextField = new TextField();
			text_loading.text = "Loading";
			addChild(text_loading);
		}
		
		public function Updateloadingtext(text:String):void{
			text_loading.text = "Loading..." +text;
			text_loading.width = 200;
		}
		
		public function RemoveLoading():void{
			removeChild(text_loading);
		}
		
		public function Addtextlog():void{
			//var textloading:TextField = new TextField();
			text_log.text = "log";
			text_log.y = 20;
			text_log.width = 200;
			addChild(text_log);
		}
		
		public function updatelog(text:String):void {
			text_log.text = text;
		}
		
		public function Removetextlog():void{
			removeChild(text_loading);
		}
		
		//} END DRAW OUTPUTS
		
		//{BUILD Spaceship Mesh and Texture
		
		//this for ship data
		public function initshipxml(shipxml:String):void 
		{
			//This will be the xml file for easy access
			var urlspaceship:URLRequest = new URLRequest(shipxml);
			
			//get map url data
			var spaceshiploader:URLLoader = new URLLoader(urlspaceship);
			
			spaceshiploader.addEventListener("complete", initspaceshipxml); //when map data is finish execute this
			Updateloadingtext("Map Data");
			function initspaceshipxml(event:Event):void
			{
				//FlashConnect.trace(event.target.data);
				//set map data xml
				spaceshipxml = new XML(event.target.data);
				//trace(spaceshipxml);
				initspacehipdatamesh();
			}
		}
		
		public function initspacehipdatamesh():void
		{
			Updateloadingtext("Init... Loading object data");
			
			//trace(spaceshipxml.spaceship.ship.name);
			//psspaceship = new ParserStack();
			for (var ss:int = 0; ss < spaceshipxml.spaceship.ship.length(); ss++) 
			{
				//trace("SHIP NAME:" + spaceshipxml.spaceship.ship[ss].name);
				//trace("SHIP MESH:" + spaceshipxml.spaceship.ship[ss].object.mesh);
			}
			
			psspaceship = new ParserStack();
			for (var o:int = 0; o < spaceshipxml.spaceship.ship.length(); o++)
			{
				//FlashConnect.trace(mapxml.objectlist.mesh[o].name);
				//FlashConnect.trace(mapxml.objectlist.mesh[o].localdir);
				//set object file location directory
				var parser:IParser = Parser.create(String(spaceshipxml.spaceship.ship[o].object.mesh), Parser.ASE );
				//set object file names
				psspaceship.add(String(spaceshipxml.spaceship.ship[o].name),parser);
			}
			//when data file finish loading execute object files
			psspaceship.addEventListener(ParserStack.COMPLETE, psspaceshipComplete );
			psspaceship.start();			
		}
		
		//load spaceship mesh data
		public function psspaceshipComplete(pEvt:Event ):void
		{
			//trace("DONE MESH");
			for (var o:int = 0; o < spaceshipxml.spaceship.ship.length(); o++)
			{
				var rawtmpobject:Shape3D;
				rawtmpobject = psspaceship.getGroupByName(String(spaceshipxml.spaceship.ship[o].name)).children[0] as Shape3D; 
				rawtmpobject.name = String(spaceshipxml.spaceship.ship[o].name);
				rawtmpobject.useSingleContainer = false;
				var gameobject:Spaceship = new Spaceship();
				//rawtmpobject.clone();
				gameobject.model = rawtmpobject;
				gameobject.bcontrol = true;
				
				spaceships.push(gameobject);
				//g.addChild(gameobject.model);
			}
			//for (var go:int = 0; go < spaceships.length; go++) {
				//trace("NAME SHIP:" + spaceships[go].model.name);
			///}
			initspaceshiploadtexturedata();
		}
		
		public function initspaceshiploadtexturedata():void
		{
			spaceshipqueue = new LoaderQueue();
			//trace("Hello");
			for (var o:int = 0; o < spaceshipxml.spaceship.ship.length(); o++)
			{
				for (var om:int = 0; om < spaceshipxml.spaceship.ship[o].materail.texture.length(); om++) {
					//trace(spaceshipxml.spaceship.ship[o].materail.name[om]);
					//trace(spaceshipxml.spaceship.ship.materail[o].texture[om]);
					spaceshipqueue.add(String(spaceshipxml.spaceship.ship[o].materail.name[om]), new URLRequest(String(spaceshipxml.spaceship.ship[o].materail.texture[om])) );
					//FlashConnect.trace("loading texture:" + spaceshipxml.spaceship.ship[o].materail.name[om]);
				}
			}
			spaceshipqueue.addEventListener(SandyEvent.QUEUE_COMPLETE,spaceshipTextureComplete);
			spaceshipqueue.start();
			//FlashConnect.trace("loading texture");
		}
		
		//NOT USE YET
		// ASE FILE has loaded the texture file.
		public function spaceshipTextureComplete(event:QueueEvent):void{
			//FlashConnect.trace("Texture Load done");
			
			for (var o:int = 0; o < spaceshipxml.spaceship.ship.length(); o++)
			{
				//trace("====OBJECT====");
				//var rawtmpobject:Shape3D;
				//rawtmpobject = psspaceship.getGroupByName(String(spaceshipxml.spaceship.ship[o].name)).children[0] as Shape3D; 
				//rawtmpobject.name = String(spaceshipxml.spaceship.ship[o].name);
				//
				/*
				for (var om:int = 0; om < spaceshipxml.spaceship.ship[o].materail.texture.length(); om++) {
					//trace(spaceshipxml.spaceship.ship[o].materail.name[om]);
					//trace(spaceshipxml.spaceship.ship.materail[o].texture[om]);
					//spaceshipqueue.add(String(spaceshipxml.spaceship.ship.materail[o].texture[om]),new URLRequest(String(spaceshipxml.spaceship.ship.materail[o].texture[om])) );
					//name of the texture to assign the loaded file that was assign the same name
					var texname:String = spaceshipxml.spaceship.ship.materail[o].name[om]; //file data from xml
					//loop currrent object polygons face and mat id
					for (var mid:int = 0; mid < rawtmpobject.aPolygons.length; mid++) {
						//spaceship xml materail id
						//if shape face id material matches the Face Materail assign the texture appearance
						if ( om  == rawtmpobject.geometry.aFaceMaterail[mid]) 
						{
							rawtmpobject.aPolygons[mid].appearance = new Appearance (new BitmapMaterial(spaceshipqueue.data[texname].bitmapData));
						}
					}
				}
				*/
				//g.addChild(rawtmpobject);
			}//end object loop stuff
			//spawnplayer();
		}
		
		//} END spaceship
		
		//{BUILD MAP OBJECTS AND TEXTURES
		
		//=================================================
		//INIT Map Data
		//=================================================
		public function loadmap(mapdir:String) :void
		{
			//set map url location for map file.
			//This will be the xml file for easy access
			var urlmap:URLRequest = new URLRequest(mapdir);
			
			//get map url data
			var maploader:URLLoader = new URLLoader(urlmap);
			maploader.addEventListener("complete", initmapdata); //when map data is finish execute this
			Updateloadingtext("Map Data");
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
			Updateloadingtext("Init... Loading object data");
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
			Updateloadingtext("Init... Object");
			for (var o:int = 0; o < mapxml.objectlist.mesh.length(); o++)
			{
				var rawtmpobject:Shape3D;
				//FlashConnect.trace(String(mapxml.objectlist.mesh[o].name)); //name
				rawtmpobject = parserStack.getGroupByName(String(mapxml.objectlist.mesh[o].name)).children[0] as Shape3D; 
				//FlashConnect.trace("parserComplete:" + mapxml.objectlist.mesh[o].name + " ID:" + rawtmpobject.name);
				//FlashConnect.trace(mapxml.objects.mesh[o].position.x);
				rawtmpobject.name = String(mapxml.objectlist.mesh[o].name);
				//rawtmpobject.swapCulling();
				//rawtmpobject.enableBackFaceCulling = false;
				rawtmpobject.useSingleContainer = false;
				//rawtmpobject.enableClipping = false;
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
			Updateloadingtext("Init... Loading Texture Data");
			
			for (var o:int = 0; o < mapxml.objectlist.mesh.length(); o++)
			{
				//FlashConnect.trace("mesh ->" + String(mapxml.objectlist.mesh[o].name));
				var texcount:Number = 0;
				//This will material count to add materails
				for (var ot:int = 0; ot < mapxml.objectlist.mesh[o].mat.tex.length(); ot++)
				{
					//FlashConnect.trace("texture ->" +String(mapxml.objectlist.mesh[o].name) +"_" + texcount + ":" + String(mapxml.objectlist.mesh[o].mat.tex[ot]));
					//trace("texture ->" +String(mapxml.objectlist.mesh[o].name) +"_" + texcount + ":" + String(mapxml.objectlist.mesh[o].mat.tex[ot]));
					queue.add(String(mapxml.objectlist.mesh[o].name + "_" + texcount ),new URLRequest(String(mapxml.objectlist.mesh[o].mat.tex[ot])) );
					texcount++;
				}
			}
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE, LoadTextureComplete );
			//queue.addEventListener(AParser.onProgress,updateInfo);
			queue.start();
		}
		
		
		//=================================================
		// Once files is loaded store the texture files to array
		//=================================================
		private function LoadTextureComplete(event:QueueEvent): void
		{
			//FlashConnect.trace("--LOADED TEXTURE--");
			//queue.data["carSkin"].bitmapData
			
			Updateloadingtext("Init... Texture");
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
					//trace(tmpname);
					
					loadmaterial.push({tex:queue.data[tmpname].bitmapData,name:tmpname});
					texcount++;
				}
			}	
			//listtexture();
			initassiginobjecttexture();
		}
		
		//=================================================
		// assign the texture to the objects for materials 
		// This support one material at the moment 
		//=================================================
		public function initassiginobjecttexture():void
		{
			Updateloadingtext("Init... Building Objects and Textures");
			//FlashConnect.trace("--ASSIGN TEXTURES TO MESH OBJECTS--");
			
			//var material:BitmapMaterial = new BitmapMaterial( queue.data["carSkin"].bitmapData );
			//material.
			//var app:Appearance = new Appearance( material );
			//car.appearance = app;
			//=====================================================================================
			// OBJECT LIST LOOP ASSGIN TEXTURE
			//=====================================================================================
			for (var o:int = 0; o < objectarry.length; o++)//loop objects in the list
			{
				//trace("Hello OBJECT");
				//create tmp mesh for easy quick access
				//var tmpshapemesh:Shape3D  = objectarry[o] as Shape3D;
				//loop current poylgon face
				/*
				for (var fmid:int = 0; fmid <  tmpshapemesh.aPolygons.length; fmid++ ) 
				{
					var mattex:int  = 0;
					//loop materail count match and id
					for (var om:int = 0; om < loadmaterial.length; om++)
					{
						var tmptexname:String = loadmaterial[om].name;
						if (tmptexname.search(tmpshapemesh.name) > -1) //if current material matches the name assign it
						{
							//FlashConnect.trace("ID"+mattex);
							if (mattex == tmpshapemesh.geometry.aFaceMaterail[fmid]) 
							{
								//trace("OBJECT NAME:"+ tmpshapemesh.name + " NAME TEXT:" + loadmaterial[om].name + " FOUND:"+ mattex + " FACE NO:"+ fmid + " MID:" + tmpshapemesh.geometry.aFaceMaterail[fmid]);
								var material:BitmapMaterial = new BitmapMaterial(loadmaterial[om].tex);
								//var material:BitmapMaterial = new BitmapMaterial(queue.data["cube32_0"].bitmapData);
								
								var app:Appearance = new Appearance( material );
								//if (fmid > 5){ //mesh poylgon test
								//not working
								//tmpshapemesh.aPolygons[fmid].appearance = app;
								//}
								tmpshapemesh.appearance = app;
								break;
							}
							mattex++;
						}
					}
					//tmpshapemesh.aPolygons[fmid].appearance = app;
					//tmpshapemesh.appearance = app;
				}
				*/
			}
			createSceneobjects();
		}
		
		//=================================================
		//Once the objects are loaded create the objects and added to the Scene 
		//need ID to be assign objects and prefix in case the object need to be move
		//=================================================
		public function createSceneobjects():void
		{
			Updateloadingtext("Setting up the objects");
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
				//=================================================================================
				//add object to the scene
				//=================================================================================
				g.addChild(tmpobject);
			}
			//for (var om:int = 0; om < objectarry.length; om++)
			//{
			//	trace(objectarry[om].name);
			//}
			Updateloadingtext("Done.");
			//RemoveLoading();
			//RemoveLoading();
		}
		//} END MAP LOADING OBJECTS AND TEXTURES
		
		//{ BUILD GAME OBJECTS
		public function spawnplayer():void 
		{
			for (var pl:int = 0; pl < playerlist.length; pl++ ) {
				
				var createobject:Boolean = true;
				
				for (var cm:int = 0; cm < classmodel.length; cm++) {
					//trace("There one");
					if (classmodel[cm].playername == playerlist[pl].playername) {
						//trace("There one");
						createobject = false;
						break;
					}
				}
				
				if (createobject == true) {
					for (var co:int = 0; co < spaceships.length; co++) 
					{
						if (spaceships[co].model.name == currentship) 
						{
							spaceships[co].model.clone();
							var gameobject:Spaceship = new Spaceship();
							gameobject.model = spaceships[co].model.clone();
							gameobject.playername = playerlist[pl].playername;
							gameobject.targetplayername = playerlist[pl].targetplayername;
							gameobject.bbot = playerlist[pl].bbot;
							gameobject.model.z = -64*pl
							classmodel.push(gameobject);
							for (var cmo:int = 0; cmo < classmodel.length; cmo++) {
								if (classmodel[cmo].playername == playerlist[pl].playername){
									g.addChild(classmodel[cmo].model);
								}
							}
							//g.addChild(spaceships[co].model);
							//trace("create ship:" + spaceships[co].playername);
							break;
						}
					}
				}
			}
			//classmodel
		}
		
		
		//} END BUILD GAME OBJECTS
		
		//{ OBJECT COLLISIONS
		
		public function objectcollision():void
		{
			//text_log.text += 
			//trace("collision");
			//classmodel
			for (var cm:int = 0; cm < classmodel.length; cm++) {
				
				//classmodel[cm].boxcollision
				//loop for currrent object for collision box array
				for (var bc:int = 0; bc < classmodel[cm].boxcollision.length; bc++ ) {
					//trace("minx" + classmodel[cm].boxcollision[bc].minx);
					var minx:Number = classmodel[cm].boxcollision[bc].minx + classmodel[cm].model.x;
					var miny:Number = classmodel[cm].boxcollision[bc].miny + classmodel[cm].model.y;
					var minz:Number = classmodel[cm].boxcollision[bc].minz + classmodel[cm].model.z;
					var maxx:Number = classmodel[cm].boxcollision[bc].maxx + classmodel[cm].model.x;
					var maxy:Number = classmodel[cm].boxcollision[bc].maxy + classmodel[cm].model.y;
					var maxz:Number = classmodel[cm].boxcollision[bc].maxz + classmodel[cm].model.z;
					
					//second object
					for (var cm2:int = 0; cm2 < classmodel.length; cm2++) {
						//make sure the it does not do collision itself
						if (classmodel[cm].playername != classmodel[cm2].playername) {
							for (var bc2:int = 0; bc2 < classmodel[cm2].boxcollision.length; bc2++ ) {
								//trace(classmodel[cm].boxcollision[bc].minx);
								var minx2:Number = classmodel[cm2].boxcollision[bc2].minx + classmodel[cm2].model.x;
								var miny2:Number = classmodel[cm2].boxcollision[bc2].miny + classmodel[cm2].model.y;
								var minz2:Number = classmodel[cm2].boxcollision[bc2].minz + classmodel[cm2].model.z;
								var maxx2:Number = classmodel[cm2].boxcollision[bc2].maxx + classmodel[cm2].model.x;
								var maxy2:Number = classmodel[cm2].boxcollision[bc2].maxy + classmodel[cm2].model.y;
								var maxz2:Number = classmodel[cm2].boxcollision[bc2].maxz + classmodel[cm2].model.z;
								
								if ((maxz >= minz2) &&
									(minz <= maxz2) &&
									(maxy >= miny2) &&
									(miny <= maxy2) &&
									(maxx >= minx2) && 
									(minx <= maxx2)
									){
									//FlashConnect.trace("Collision");	
									//return true; //there is colision
									classmodel[cm].model.moveForward( -5);
									}
								else
									{
									//FlashConnect.trace("No Collision");
									//return false;// there is no collision
									}
								
								
								//text_log.text = classmodel[cm].boxcollision[bc2].minx;
							}
						}
					}
				}
			}
		}
		
		//custom class for box collision
		public function boxcollision(box:CollisionBox,box2:CollisionBox):Boolean {
			if ((box.maxz >= box2.minz) &&
				(box.minz <= box2.maxz) &&
				(box.maxy >= box2.miny) &&
				(box.miny <= box2.maxy) &&
				(box.maxx >= box2.minx) && 
				(box.minx <= box2.maxx)){
				//FlashConnect.trace("Collision");	
				return true; //there is colision
				//classmodel[cm].model.moveForward( -5);
				}
			else
				{
				//FlashConnect.trace("No Collision");
				return false;// there is no collision
			}
		}
		
		//} END OBJECT COLLISIONS
		
		/*
		 * Building AI will take some time that has to deal with math stuff
		 */
		//=========================================================================================
		//{ BOT AI BUILD
		//=========================================================================================
		public function updatebot():void {
			
			for (var botid:int = 0; botid < classmodel.length; botid++) {
				if (classmodel[botid].bbot == true) {
					for (var tarid:int = 0; tarid < classmodel.length; tarid++) {
						//trace("<->");
						if (classmodel[botid].targetplayername == classmodel[tarid].playername) {
							classmodel[botid].targetposx =  classmodel[tarid].model.x;
							classmodel[botid].targetposy =  classmodel[tarid].model.y;
							classmodel[botid].targetposz =  classmodel[tarid].model.z;
							//trace("<->");
							break;
						}
					}
				}
			}
		}
		
		//=========================================================================================
		//}END  BOT AI BUILD
		//=========================================================================================
		//{ Partical system
		//Array for Partical and texture render in 3d
		
		//}
		
		
		//this is to test out the functions
		private function createScene():Group{
			//test
			var pot:Box = new Box("box", 16, 16, 16);
			g.addChild(pot);
			// We need to add the objects to the group 
			return g;
			/*
			var g:Group = new Group("myGroup");
			var objectmodel:Spaceship;
			//meshmodel.model
			return g;
			*/
		}
		
		public function rotatemin(rotate:Number):Number {
			if (rotate < 0) {
				rotate = 359;
			}
			return rotate;
		}
		
		public function rotatemax(rotate:Number):Number {
			if (rotate > 359) {
				rotate = 0;
			}
			return rotate;
		}
		
		public function Gameobjectupdate():void{
		/*
		 * This section will update the game objects for stuff needed to run the game
		 */
			for (var ono:int = 0; ono < classmodel.length; ono++ )
			{
				classmodel[ono].Update();
			}
			
			for (var opo:int = 0; opo < projectileobjects.length; opo++) {
				projectileobjects[opo].Update();
			}
		}
		
		//This is when the keyboard is pressed.
		private function keyPressedHandler(event:flash.events.KeyboardEvent):void{
			//FlashConnect.trace("Hello");
			/*
			var objectmove:Array = g.children
			
			for (var c:int = 0; c < objectmove.length; c++) {
				if (("1" != objectmove[c].name)) //1 number one -this is cam
				
			}
			*/
		}
		
		//{ KEYBOARD START
		public function addKey(e:KeyboardEvent):void {
			keysDown[e.keyCode] = true;
			if (e.keyCode == 38) {
				upspeed = true;
			}
			if (e.keyCode == 40) {
				downspeed = true;
			}
			if (e.keyCode == 39) {
				rightspeed = true;
			}
			if (e.keyCode == 37) {
				leftspeed = true;
			}
			if (e.keyCode == 88) {
				forwardspeed = true;
			}
			if (e.keyCode == 67) {
				backwardspeed = true;
			}
			if (e.keyCode == 90) {
				leftrollspeed = true;
			}
			if (e.keyCode == 86) {
				rightrollspeed = true;
			}
			if (e.keyCode == 32) {
				primaryfire = true;
			}
			//trace(e.keyCode);
			//FlashConnect.trace(String(e.keyCode));
		}
		
		public function removeKey(e:KeyboardEvent):void {
			keysDown[e.keyCode] = false;
			if (e.keyCode == 38) {
				upspeed = false;
			}
			if (e.keyCode == 40) {
				downspeed = false;
			}
			if (e.keyCode == 39) {
				rightspeed = false;
			}
			if (e.keyCode == 37) {
				leftspeed = false;
			}
			if (e.keyCode == 88) {
				forwardspeed = false;
			}
			if (e.keyCode == 67) {
				backwardspeed = false;
			}
			if (e.keyCode == 90) {
				leftrollspeed = false;
			}
			if (e.keyCode == 86) {
				rightrollspeed = false;
			}
			if (e.keyCode == 32) {
				primaryfire = false;
			}
		}
		//} KEYBOARD END
		
		//{Player Weapon Fire
		public function playerfire():void {
			// need to clean up the projectile a bit that remove or clean it up
			
			//search classmodel for player name
			for (var pcm:int = 0; pcm < classmodel.length ; pcm++) {
				if (classmodel[pcm].playername == playeroneid) {
					//playerclassmodel = classmodel[pcm]; // this will control our player else default none
					classmodel[pcm].primaryfire = primaryfire;
					//trace(classmodel[pcm].primaryfire);
					break;
				}
			}
			
			for (var initfire:int = 0; initfire < classmodel.length ; initfire++){
			if ((classmodel[initfire].primaryfire == true) && (classmodel[initfire].bulletfire == false)) {
				//trace("FIRE WEAPON");
				//if weapon is fire turn this on so the timer know it been fire
				classmodel[initfire].bulletfire = true;
				//for (var cp:int = 0; cp < classmodel.length; cp++) {
					//if (classmodel[cp].playername == classmodel[initfire].playername) {
						//bullet.x = classmodel[cp].model.x;//bullet.y = classmodel[cp].model.y;//bullet.z = classmodel[cp].model.z;//bullet.roll = classmodel[cp].model.roll;//bullet.pan = classmodel[cp].model.pan;//bullet.tilt = classmodel[cp].model.tilt;//bullet.visible = true;
						var meshprojectile:Projectile = new Projectile();
						meshprojectile.model = bullet.clone();
						//meshprojectile.playername = classmodel[cp].playername;
						
						//array projectiles
						projectileobjects.push(meshprojectile);
						//pol = projectile objects list
						for (var pol:int = 0; pol < projectileobjects.length; pol++)
						{
							//if mesh is match add
							if (projectileobjects[pol].model.name == meshprojectile.model.name) {
								projectileobjects[pol].alive = true;
								projectileobjects[pol].playername = classmodel[initfire].playername;
								//projectileobjects[pol].model.x = classmodel[cp].model.x;//projectileobjects[pol].model.y = classmodel[cp].model.y;//projectileobjects[pol].model.z = classmodel[cp].model.z;
								projectileobjects[pol].setposition(classmodel[initfire].model.x,classmodel[initfire].model.y,classmodel[initfire].model.z);
								projectileobjects[pol].model.roll = classmodel[initfire].model.roll;
								projectileobjects[pol].model.pan = classmodel[initfire].model.pan;
								projectileobjects[pol].model.tilt = classmodel[initfire].model.tilt;
								
								//add model to the sence
								g.addChild(projectileobjects[pol].model);
							}
						}
					///}
				///}
			}
			}
			//firerate++;
			//if (firerate > 30) {
			//	firerate = 0;
			//	bulletfire = false;
			///}
			
			for (var ppath:int = 0; ppath < projectileobjects.length; ppath++){
				if (projectileobjects[ppath].model.visible) {
					//This make sure the objects are visible
					//collision check for spaceship
					for (var poc:int = 0; poc < projectileobjects[ppath].boxcollision.length; poc++){
						//trace(projectileobjects[ppath].boxcollision[poc].minx);
						var minx:Number = projectileobjects[ppath].boxcollision[poc].minx + projectileobjects[ppath].model.x;
						var miny:Number = projectileobjects[ppath].boxcollision[poc].miny + projectileobjects[ppath].model.y;
						var minz:Number = projectileobjects[ppath].boxcollision[poc].minz + projectileobjects[ppath].model.z;
						
						var maxx:Number = projectileobjects[ppath].boxcollision[poc].maxx + projectileobjects[ppath].model.x;
						var maxy:Number = projectileobjects[ppath].boxcollision[poc].maxy + projectileobjects[ppath].model.y;
						var maxz:Number = projectileobjects[ppath].boxcollision[poc].maxz + projectileobjects[ppath].model.z;
						//loop ships for collision for bullet
						for (var cm3:int = 0; cm3 < classmodel.length; cm3++) {
							//boxes loop check for ship
							for (var bc3:int = 0; bc3 < classmodel[cm3].boxcollision.length; bc3++ ) {
								//trace(classmodel[cm3].boxcollision[bc3].minx);
								var minx3:Number = classmodel[cm3].boxcollision[bc3].minx + classmodel[cm3].model.x;
								var miny3:Number = classmodel[cm3].boxcollision[bc3].miny + classmodel[cm3].model.y;
								var minz3:Number = classmodel[cm3].boxcollision[bc3].minz + classmodel[cm3].model.z;
								var maxx3:Number = classmodel[cm3].boxcollision[bc3].maxx + classmodel[cm3].model.x;
								var maxy3:Number = classmodel[cm3].boxcollision[bc3].maxy + classmodel[cm3].model.y;
								var maxz3:Number = classmodel[cm3].boxcollision[bc3].maxz + classmodel[cm3].model.z;
								//trace("Hello");
								//Check boc for collision
								//check object does not damage self not yet fixed collision yet
								//check if object is visiable
								if ((maxz >= minz3) &&
									(minz <= maxz3) &&
									(maxy >= miny3) &&
									(miny <= maxy3) &&
									(maxx >= minx3) && 
									(minx <= maxx3) && (classmodel[cm3].playername != projectileobjects[ppath].playername) && (classmodel[cm3].model.visible == true)
									){
									//trace("Collision");
									projectileobjects[ppath].model.visible = false;
									classmodel[cm3].healthpoint -= projectileobjects[ppath].attackpoint;
									//return true; //there is colision
									//classmodel[cm].model.moveForward( -5);
								}else{
									//FlashConnect.trace("No Collision");
									//return false;// there is no collision
								}
							}
						}
					}	
				}
			}
			
			/*
			if (bullet.visible) {
					bullet.moveForward( +5);
					//trace("Hello");
				if ((bullet.z > -100 ) && ( bullet.z < 100)) {
				}
				else {
					bullet.visible = false;
				}
			}
			*/
		}
		
		//} end weapon fire
		
		public function playercontrol():void{
			//up :38
			//down :40
			//right : 39
			//left : 37
			//space : 32
			var objectscene:Array = g.children //Object Scene Array
			text_log.appendText("No. scene objects :" + objectscene.length + "\n");
			//for (var c:int = 0; c < objectscene.length; c++) {
			//	trace(objectscene[c].name);
			///}
			
			var players:Array = g.children
			//trace("===");
			for (var cp:int = 0; cp < classmodel.length; cp++){
				text_log.appendText( "Name:" + classmodel[cp].playername + " HEALTH: " + classmodel[cp].healthpoint +"\n");
				//trace(">>"+classmodel[cp].playername);
				//trace("player name:" + classmodel[cp].playername);
				if (classmodel[cp].playername == playeroneid){
				//if (classmodel[cp].playername == playeroneid){
					if (upspeed) {
						Pitch -= 5;
						//Pitch = rotatemin(Pitch);
					}else if (downspeed){
						Pitch += 5;
						//Pitch = rotatemax(Pitch);
					}else{
						Pitch += 0;
					}
					
					if (leftspeed){
						Yaw -= 5;
						//Yaw  = rotatemin(Yaw);
					}else if (rightspeed){
						Yaw += 5;
						//Yaw = rotatemax(Yaw);
					}else {
						Yaw += 0;
					}
					
					if (forwardspeed){//x
						Speed = 5
					}else if (backwardspeed){//c
						Speed = -5;
					}else{
						Speed = 0;
					}
					
					if (rightrollspeed){//x 
						Roll += 5;
						//Roll = rotatemax(Roll);
						
					}else if (leftrollspeed){//c
						Roll -= 5;
						//Roll = rotatemin(Roll);
						//rotatemin(rotate:Number)
					}else{
						Roll += 0;
					}
				
					Currentspeed = Speed;
				
					classmodel[cp].model.tilt = Pitch;//up and down
					classmodel[cp].model.roll = Roll;//rotate view
					classmodel[cp].model.pan = Yaw; // left and right screen
					text_log.appendText( "\n" + classmodel[cp].model.pan);
					text_log.appendText( "\n"+classmodel[cp].model.tilt);
					classmodel[cp].model.moveForward(+Currentspeed)
					classmodel[cp].model.addChild(camera);
				}
			}
		}
	}
}
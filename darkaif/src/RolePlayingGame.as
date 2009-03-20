/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  
{
	//{PACKAGE
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
	
	//}PACKAGE
	
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class RolePlayingGame extends Sprite
	{
		/*
		 * Objective simple game format for now.
		 * Basic stuff:
		 * 
		 * -MAP DATA 		(part done)
		 * -Character 		(part done)
		 * -Monster 		(part done)
		 * --ai
		 * ---follow        (part done)
		 * ---attack        (part done)
		 * -NPC 			(part done)
		 * -object loading medoth need to reduce load times.
		 * 
		 * -Control custom (part done not xml load in yet)
		 * -collision 		(part done)
		 * 
		 * spwan			(part done)
		 * -player			(part done)
		 * -monster			(part done)
		 * -npc				(part done)
		 * 
		 * -Menus:			(part done)
		 * -Game menu
		 * -Npc menu        (part done)
		 * --shop			()
		 * --talk			(part done)
		 * -Shop menu
		 * -Quest menu
		 * 
		 * note each object is different once the server client is build.
		 * 
		 */
		
		//{ Variables
		//load data -sandy engine
		//public var queue:LoaderQueue;
		//public var parserstack:ParserStack;
		
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		//public var sbox:Box = new Box('testdir', 32, 32, 32);
		
		public var rawobject:Shape3D; //any objects -test
		//public var box:Box = new Box("box",1,1,1)
		
		public var modelurlrequest:String = "data/models/"; //model dir link
		public var textureurlrequest:String = "data/textures/"; //texture dir link
		
		//world effects
		public var gravityx:Number = 0;
		public var gravityy:Number = 1; //this makes player is on the ground
		public var gravityz:Number = 0;
		public var gametime:Number = 1;
		
		//map
		public var mapxmlurl:String = "data/maps/mapdata01.xml"; //map data xml site link
		public var mapxml:XML = new XML(); // map list xml data and other function
		public var objectmesh:Array = new Array(); // map object data store
		public var objectmap:Array = new Array(); // map data
		public var mapzone:Array = new Array();//zone when player enter the next map
		
		//terrain
		public var terrainmesh:Array = new Array();//temp store
		public var terrainmodel:Array = new Array();//for map
		
		//{ //object files
		//player
		public var characterxml:XML = new XML();//character xml data list
		public var characterxmlurl:String = "data/characters/characters.xml"; //character xml data url link
		public var charactermesh:Array = new Array(); //to store character data
		public var playermesh:Array = new Array(); //add player to the world - (not used)
		public var playermodel:Array = new Array(); //add player to the world
		public var player:Array = new Array();//this update player go and out server stuff and cleint reduce lag stuff
		
		//NPC
		public var npcxmlurl:String = 'data/npcs/npcs.xml'; //npc object
		public var npcscriptxmlurl:String = 'data/npcs/npcscriptlist.xml'; //npc script
		public var npcxml:XML = new XML(); //npc xml data list
		public var npcscriptxml:XML = new XML(); //npc script xml data
		public var npcmesh:Array = new Array(); // object storage area
		public var npcmodel:Array = new Array();//load in the map 
		
		//Monster
		public var monsterxml:XML = new XML();//mosnter xml data object mesh list 
		public var monsterxmlurl:String = 'data/monsters/monsters.xml'; //monster url link site
		public var monstermesh:Array = new Array(); //object storage area
		public var monstermodel:Array = new Array(); //map into the data
		//}
		
		//current player using this flash app
		public var playername:String = "player"; //player name
		public var charactername:String = "player"; //preset character mesh
		public var gender:String = "male"; //gender for the player
		
		//public var bbox:Box = new Box('cube', 16, 16, 16);
		
		//{ CONTROLS
		
		public var Uparrow:Boolean = false;
		public var Downarrow:Boolean = false;
		public var Rightarrow:Boolean = false;
		public var Leftarrow:Boolean = false;
		public var Spacebar:Boolean = false;
		
		public var BAttack:Boolean = false;
		
		public var Keyuparrow:int = 38;
		public var Keydownarrow:int = 40;
		public var Keyrightarrow:int = 39;
		public var Keyleftarrow:int = 37;
		public var Keyspacebar:int = 32;
		
		public var keycode_b:int = 66;
		public var keycode_c:int = 67;
		
		//}END CONTROLS
		
		public var panel_game:Sprite = new Sprite();
		
		public var bgamemenu:Boolean = false;
		public var panel_gamemenu:Sprite = new Sprite();
		public var panel_npcmessage:Sprite = new Sprite();
		public var panel_npcshop:Sprite = new Sprite();
		
		public var text_npcmessage:TextField = new TextField();
		
		public var text_log:TextField = new TextField();
		public var text_log2:TextField = new TextField();
		
		public var loadtest1map:Button = new Button('Map 1');
		public var loadtest2map:Button = new Button('Map 2');
		
		public var buttonclearmap:Button = new Button('Clear Map');
		public var buttonstoreobjects:Button =  new Button('Object List');
		
		public var npcmessageboxpanel:NPCMessageBox =  new NPCMessageBox();
		
		public var rpgmainmenupanel:MenuToolPanel = new MenuToolPanel();
		public var rpgitempanel:MenuToolPanel = new MenuToolPanel();
		public var rpgequippanel:MenuToolPanel = new MenuToolPanel();
		public var rpgskillspanel:MenuToolPanel = new MenuToolPanel();
		public var rpgconfigpanel:MenuToolPanel = new MenuToolPanel();
		//public var root:Group;
		
		//}
		
		public function RolePlayingGame() {
			HUD();
			addlog();
			text_log2.y = 20;
			addChild(text_log2);
			var tmpplayer:RPGPlayer = new RPGPlayer();
			tmpplayer.playername = "player";
			tmpplayer.charactername = "player";
			player.push(tmpplayer);//player user control object when place
			
			//tmpplayer = new RPGPlayer();
			//tmpplayer.playername = "lost";
			//tmpplayer.charactername = "player";
			//player.push(tmpplayer);//player user control object when place
			
			//g.addChild(bbox);
			//player.push();
			
			//{ Scene world
			// camera
			camera = new Camera3D(640,480);
			//camera.z = -50;
			camera.far = 1000;
			camera.near = 0;
			//camera.
			camera.y = 90;
			//camera.lookAt(0, 0, 0);
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			//}	
			
			//load map data and others
			//initCharacterxml();
			
			//initmapxml("data/maps/mapdata00.xml");
			//initmapxml(mapxmlurl);
			initloadmap(mapxmlurl);
			
			//{ start simple button
			//button
			loadtest1map.addEventListener(MouseEvent.CLICK, map01);
			//addChild(loadtest1map);
			//buton
			loadtest2map.x = 50;
			loadtest2map.addEventListener(MouseEvent.CLICK, map02);
			//addChild(loadtest2map);
			//button
			buttonclearmap.x = 90;
			buttonclearmap.addEventListener(MouseEvent.CLICK, clickclearmap);
			//addChild(buttonclearmap);
			
			buttonstoreobjects.x = 164;
			buttonstoreobjects.addEventListener(MouseEvent.CLICK, objectlist);
			addChild(buttonstoreobjects);
			//}
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			
		}
		
		// This render the mesh, objects data, and other funtions by frame speed
		// This update the code and the function when every frame count is pass
		private function enterFrameHandler( event : Event ) : void {
			text_log.text = "log...";
			showentities();
			ObjectUpdate();
			PlayerCollisions();
			MonsterCollisions();
			NPCCollisions();
			PlayerAttackMonster();
			MonsterAttackPlayer();
			PlayerControl(); 
			Talknpc();
			//CheckPlayer();
			scene.render();
			//FlashConnect.trace("Hello");
		}
		
		//{ start map debugger
		public function objectlist(event:MouseEvent):void {
			var objectmove:Array = g.children
			trace('//========================================================//');
			for (var c:int = 0; c < objectmove.length; c++) {
				trace("ID"+objectmove[c].id+' object:' + objectmove[c].name);
			}
			for (var monsterno:int = 0; monsterno < monstermodel.length ; monsterno++ ) {
				trace("monster(CLASS) id:"+monstermodel[monsterno].animset[0].animmesh.id+" Name:"+monstermodel[monsterno].animset[0].animmesh.name);
			}
			for (var playerno:int = 0; playerno < playermodel.length ; playerno++ ) {
				trace("monster(CLASS) id:"+playermodel[playerno].animset[0].animmesh.id+" Name:"+playermodel[playerno].animset[0].animmesh.name);
			}
			trace('//========================================================//');
			trace('mesh object:' + objectmesh.length + ' player mesh:' + charactermesh.length + ' monster mesh:' + monstermesh.length + "npc mesh"+ npcmesh.length);
			trace('object model:'+ objectmap.length + ' player model:'+playermodel.length + ' monster model:' + monstermodel.length + ' npc model:'+ npcmodel.length);
		}
		
		public function map01(event:MouseEvent):void {
			//g = new Group("myGroup"); //do not do this -error way to load
			clearmap();
			initmapxml("data/maps/mapdata01.xml");
		}
		
		public function map02(event:MouseEvent):void {
			clearmap();
			initmapxml("data/maps/mapdata02.xml");
		}
		//} end map debugger
		
		//=======================================
		// [Update function] -Player, Monster
		public function ObjectUpdate():void {
			for (var playerno:int = 0; playerno < playermodel.length; playerno++ ) {
				playermodel[playerno].update();
			}
			
			for (var nomonster:int = 0; nomonster < monstermodel.length; nomonster++ ) {
				monstermodel[nomonster].update();
				for (var targetplayer:int = 0;targetplayer < playermodel.length ;targetplayer++ ) {
					if (playermodel[targetplayer].playername == monstermodel[nomonster].targetname) {
						monstermodel[nomonster].targetx = playermodel[targetplayer].posx;
						monstermodel[nomonster].targety = playermodel[targetplayer].posy;
						monstermodel[nomonster].targetz = playermodel[targetplayer].posz;
					}
				}
			}
			
			for (var nonpc:int = 0; nonpc < npcmodel.length;nonpc++ ) {
				npcmodel[nonpc].update();
			}
			
		}
		//=========================================================================================
		//{ START MAP DATA BLOCK (OBJECT/ TERRAIN)
		//map start first incase the frame speed is on - MAP DATA BLOCK
		
		public function initloadmap(mapurl:String):void {
			//trace('build map!');
			mapxmlurl = mapurl;
			clearmap();
			initmapxml(mapurl);
		}
		
		public function clickclearmap(event:MouseEvent):void {
			//g = new Group("myGroup");
			var objectmove:Array = g.children
			//trace('//========================================================//');
			//for (var c:int = 0; c < objectmove.length; c++) {
			//	trace('object:' + objectmove[c].name);
			///}
			//trace('-[data]-');
			
			//remove objects from map
			for (var objmeshno:int = 0; objmeshno < objectmap.length; objmeshno++) {
				//trace('map object:' + objectmap[objmeshno].model.name);
				g.removeChildByName(objectmap[objmeshno].model.name);
			}
			objectmap = new Array();
			
			for (var playermodelno:int = 0; playermodelno < playermodel.length; playermodelno++) {
				//playermodel
				//trace('player:---');
				for (var panimsetno:int = 0; panimsetno < playermodel[playermodelno].animset.length; panimsetno++) {
					//trace('player anim set:' + playermodel[playermodelno].animset[panimsetno].animmesh.name);
					g.removeChildByName(playermodel[playermodelno].animset[panimsetno].animmesh.name);
				}
			}
			playermodel = new Array();
			
			//remove monster
			for (var monsterno:int = 0; monsterno < monstermodel.length; monsterno++) {
				//playermodel
				//trace('monster:---');
				//monstermodel[monsterno].healthbarimage.visible = false;
				for (var manimsetno:int = 0; manimsetno < monstermodel[monsterno].animset.length; manimsetno++) {
					//trace('monster anim set:' + monstermodel[monsterno].animset[manimsetno].animmesh.name);
					//g.removeChildByName(monstermodel[monsterno].animset[manimsetno].animmesh.name);
					g.removeChildByName(monstermodel[monsterno].animset[manimsetno].animmesh.name);
					//monstermodel[monsterno].animset[manimsetno].animmesh.remove();
				}
				g.removeChildByName(monstermodel[monsterno].healthbarimage.name);
			}
			monstermodel = new Array();
			
			//remove npc
			for (var npcno:int = 0; npcno < npcmodel.length; npcno++) {
				//playermodel
				//trace('npc:---');
				for (var nanimsetno:int = 0; nanimsetno < npcmodel[npcno].animset.length; nanimsetno++) {
					//trace('npc anim set:' + npcmodel[npcno].animset[nanimsetno].animmesh.name);
					g.removeChildByName(npcmodel[npcno].animset[nanimsetno].animmesh.name);
					npcmodel[npcno].animset[nanimsetno].animmesh.remove();
				}
			}
			npcmodel = new Array();
			//trace('object://===//');
			//for (var cL:int = 0; cL < objectmove.length; cL++) {
			//	trace('OBJ LIST:' + objectmove[cL].name);
				//g.removeChildByName(objectmove[cL].name);
			///}
			//trace('DATA LIST:');
			//trace('mesh object:' + objectmesh.length + ' player mesh:' + charactermesh.length + ' monster mesh:' + monstermesh.length);
			
			//var objectmove:Array = g.children
			//trace('//========================================================//');
			for (var c:int = 0; c < objectmove.length; c++) {
				//trace('object:' + objectmove[c].name);
				if (objectmove[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					g.removeChildByName(objectmove[c].name);
				}
			}
		}
		
		public function clearmap():void {
			//g = new Group("myGroup");
			var objectmove:Array = g.children
			//trace('//========================================================//');
			//for (var c:int = 0; c < objectmove.length; c++) {
			//	trace('object:' + objectmove[c].name);
			///}
			//trace('-[data]-');
			
			//remove objects from map
			for (var objmeshno:int = 0; objmeshno < objectmap.length; objmeshno++) {
				//trace('map object:' + objectmap[objmeshno].model.name);
				g.removeChildByName(objectmap[objmeshno].model.name);
			}
			objectmap = new Array();
			
			for (var playermodelno:int = 0; playermodelno < playermodel.length; playermodelno++) {
				//playermodel
				//trace('player:---');
				for (var panimsetno:int = 0; panimsetno < playermodel[playermodelno].animset.length; panimsetno++) {
					//trace('player anim set:' + playermodel[playermodelno].animset[panimsetno].animmesh.name);
					g.removeChildByName(playermodel[playermodelno].animset[panimsetno].animmesh.name);
				}
			}
			playermodel = new Array();
			
			//remove monster
			for (var monsterno:int = 0; monsterno < monstermodel.length; monsterno++) {
				//playermodel
				//trace('monster:---');
				//monstermodel[monsterno].healthbarimage.visible = false;
				for (var manimsetno:int = 0; manimsetno < monstermodel[monsterno].animset.length; manimsetno++) {
					//trace('monster anim set:' + monstermodel[monsterno].animset[manimsetno].animmesh.name);
					//g.removeChildByName(monstermodel[monsterno].animset[manimsetno].animmesh.name);
					g.removeChildByName(monstermodel[monsterno].healthbarimage);
					g.removeChildByName(monstermodel[monsterno].animset[manimsetno].meshid);
					//monstermodel[monsterno].animset[manimsetno].animmesh.remove();
				}
				g.removeChildByName(monstermodel[monsterno].healthbarimage.name);
			}
			monstermodel = new Array();
			
			//remove npc
			for (var npcno:int = 0; npcno < npcmodel.length; npcno++) {
				//playermodel
				//trace('npc:---');
				for (var nanimsetno:int = 0; nanimsetno < npcmodel[npcno].animset.length; nanimsetno++) {
					//trace('npc anim set:' + npcmodel[npcno].animset[nanimsetno].animmesh.name);
					g.removeChildByName(npcmodel[npcno].animset[nanimsetno].animmesh.name);
					npcmodel[npcno].animset[nanimsetno].animmesh.remove();
				}
			}
			npcmodel = new Array();
			//trace('object://===//');
			//for (var cL:int = 0; cL < objectmove.length; cL++) {
			//	trace('OBJ LIST:' + objectmove[cL].name);
				//g.removeChildByName(objectmove[cL].name);
			///}
			//trace('DATA LIST:');
			//trace('mesh object:' + objectmesh.length + ' player mesh:' + charactermesh.length + ' monster mesh:' + monstermesh.length);
			
			mapzone = new Array(); //clear zonemap when spawning
			
			//double buff to make sure it clean //it the array some time skip something
			cleanmap(); //first it clean the mesh out
			cleanmap(); //second in case the mesh is missed during the loop
			cleanmap(); //third time just array was not clean enough
		}
		
		public function cleanmap():void {//this will clean up the extra mesh not completely clear
			var objectmove:Array = g.children
			//trace('//========================================================//');
			for (var c:int = 0; c < objectmove.length; c++) {
				//trace('object:' + objectmove[c].name);
				if (objectmove[c].name != '1') {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					g.removeChildByName(objectmove[c].name);
				}
			}
		}
		
		//map get url
		public function initmapxml(mapname:String):void {
			//trace('init..map url');
			//mapname
			//var urlrequest:URLRequest = new URLRequest(mapxmlurl);
			
			var urlrequest:URLRequest = new URLRequest(mapname);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			
			urlloader.addEventListener("complete", initdata)
			urlloader.addEventListener(IOErrorEvent.IO_ERROR, maperror);
			
			function maperror(event:IOErrorEvent):void {
				//trace('fail load map url map');
			}
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				mapxml = new XML(event.target.data);
				maploaddata();
			}
		}
		
		//map xml data -ase loading...
		public function maploaddata():void {
			//mapxml.objectlist.mesh
			var parserstack:ParserStack = new ParserStack();
			var objectcount:int = 0;
			for (var meshno:int = 0; meshno < mapxml.objectlist.mesh.length(); meshno++){
				var bobjfound:Boolean = false;
				for (var objectmeshno:int = 0; objectmeshno < objectmesh.length ;objectmeshno++ ) {
					if (objectmesh[objectmeshno].name == mapxml.objectlist.mesh[meshno].name) {
						//trace('object found!===================');
						bobjfound = true;
						objectcount++;
						break;
					}
				}
				if (!bobjfound){
					var parser:IParser = Parser.create(String(mapxml.objectlist.mesh[meshno].localdir), Parser.ASE );
					parserstack.add(String(mapxml.objectlist.mesh[meshno].name), parser);
				}
			}
			
			if (mapxml.objectlist.mesh.length() == objectcount) { //if files are loaded
				//trace('IT FULLY LOADED ALREADY!');
				initbuildmap();
			}else {//if files are not loaded add query to be stored
				parserstack.addEventListener(ParserStack.COMPLETE,loadASEmapcomplete);
				parserstack.start();
			}
			
			// Create and Store ASE mesh object
			function loadASEmapcomplete(pEvt:Event):void {
				//trace('loading ase files...');
				//trace("Hello ASE");
				for (var meshno:int = 0; meshno < mapxml.objectlist.mesh.length(); meshno++){
					//mapxml.objectlist.mesh[meshno].
					//var parser:IParser = Parser.create(String(mapxml.objectlist.mesh[meshno].localdir), Parser.ASE );
					//parserstack.add(String(mapxml.objectlist.mesh[meshno].name), parser);
					var tmpshape:Shape3D;
					tmpshape = parserstack.getGroupByName(String(mapxml.objectlist.mesh[meshno].name)).children[0] as Shape3D; 
					//tmpshape.useSingleContainer = true;
					tmpshape.name = String(mapxml.objectlist.mesh[meshno].name);
					//trace(tmpshape.name);
					var bcharfound:Boolean = false;
					//trace("mosnter number:"+monstermesh.length);
					for (var countcharno:int = 0; countcharno < objectmesh.length ; countcharno++ ) {
						if (objectmesh[countcharno].name == mapxml.objectlist.mesh[meshno].name) {
							bcharfound = true;
							//trace('found');
						}
					}	
					//make sure the data is loaded
					if(!bcharfound){
						objectmesh.push(tmpshape);
					}
					//objectmesh.push(tmpshape);
					//g.addChild(tmpshape);
				}	
				initbuildmap();
			}
			
		}
		
		// texture?
		public function loadmapComplete():void {
			//mapxml.objects.mesh
			/*
			for (var meshno:int = 0; meshno <  mapxml.objects.mesh.length(); meshno) {
				var meshname:String = mapxml.objects.mesh[meshno].name;
				//var tmpshape:Shape3D = queue.data['cube32'];
				trace(queue.data['cube32']);
				//var shape:Shape3D = new Shape3D();
				//g.addChild(tmpshape);
			}
			*/
			var meshname:String = 'cube32';
			//var tmpshape:Shape3D = Shape3D("test", queue.data[meshname],null,true);
		}
		
		// Build object from (object mesh) and texture from data map(MAP DATA INSERT)
		public function initbuildmap():void {
			//trace("===INIT MAP BUILD===");
			//loop mesh currently in the list map
			for (var meshno:int = 0; meshno < mapxml.objects.mesh.length(); meshno++){
				//MESH
				//trace(mapxml.objects.mesh[meshno].name);
				for (var objmeshno:int = 0; objmeshno < objectmesh.length ; objmeshno++) {
					//if mesh matches the map mesh object create it list
					if (mapxml.objects.mesh[meshno].name == objectmesh[objmeshno].name) {
						var tmpobjectmesh:Objectmesh = new Objectmesh();
						var shape:Shape3D = objectmesh[objmeshno].clone('mesh_clone');//clone('mesh_clone')
						//trace("name:" + objectmesh[objmeshno].name);
						//shape.
						//shape.clone();
						shape.x = mapxml.objects.mesh[meshno].position.x;
						shape.y = mapxml.objects.mesh[meshno].position.y;
						shape.z = mapxml.objects.mesh[meshno].position.z;
						
						shape.rotateX = mapxml.objects.mesh[meshno].rotation.x;
						shape.rotateY = mapxml.objects.mesh[meshno].rotation.y;
						shape.rotateZ = mapxml.objects.mesh[meshno].rotation.z;
						
						//shape.depth = 1;
						tmpobjectmesh.model = shape;
						tmpobjectmesh.model.useSingleContainer = false;
						tmpobjectmesh.model.enableBackFaceCulling = false;
						//tmpobjectmesh.model.enableForcedDepth = true;
						//tmpobjectmesh.model.forcedDepth = 100;
						//tmpobjectmesh.model.depth = -100;
						//tmpobjectmesh.model.swapCulling();
						//tmpobjectmesh.model.enableNearClipping = true;
						//.enableNearClipping = true;
						//mesh name
						tmpobjectmesh.meshname = objectmesh[objmeshno].name;
						//mesh name id
						tmpobjectmesh.meshid = shape.name;
						//mapxml.objects.mesh[meshno]
						
						//this to added collision box
						for (var objlistno:int = 0;objlistno < mapxml.objectlist.mesh.length(); objlistno++) {
							if (mapxml.objectlist.mesh[objlistno].name == objectmesh[objmeshno].name) {
								//trace("found!");
								for (var boxno:int = 0; boxno < mapxml.objectlist.mesh[objlistno].collision.box.length() ; boxno++ ) {
									var tmpbox:CollisionBox = new CollisionBox();
									tmpbox.minx = mapxml.objectlist.mesh[objlistno].collision.box[boxno].min.x;
									tmpbox.miny = mapxml.objectlist.mesh[objlistno].collision.box[boxno].min.y;
									tmpbox.minz = mapxml.objectlist.mesh[objlistno].collision.box[boxno].min.z;
									
									tmpbox.maxx = mapxml.objectlist.mesh[objlistno].collision.box[boxno].max.x;
									tmpbox.maxy = mapxml.objectlist.mesh[objlistno].collision.box[boxno].max.y;
									tmpbox.maxz = mapxml.objectlist.mesh[objlistno].collision.box[boxno].max.z;
									
									tmpbox.posx = mapxml.objectlist.mesh[objlistno].collision.box[boxno].position.x;
									tmpbox.posy = mapxml.objectlist.mesh[objlistno].collision.box[boxno].position.y;
									tmpbox.posz = mapxml.objectlist.mesh[objlistno].collision.box[boxno].position.z;
									
									//trace(mapxml.objectlist.mesh[objlistno].collision.box[boxno].position.z + "--")
									//trace(mapxml.objectlist.mesh[objlistno].collision.box[boxno].min.x + "---")
									tmpobjectmesh.boxcollision.push(tmpbox);
								}
							}
						}
						//shape
						//tmpobjectmesh.model.useSingleContainer = false;
						//trace('build mesh...into map');
						objectmap.push(tmpobjectmesh);
						g.addChild(tmpobjectmesh.model);
						//trace("FOUND!");
					}
				}
			}
			buildmapzone();
			//initbuildmonstermap();
			initterrainsetup();
		}
		
		//build terrain and add to the map
		public function initterrainsetup():void {
			//trace('build terrain!');
			//mapxml.terrain.layer
			//texture layer
			var queuetex:LoaderQueue = new LoaderQueue();
			
			for (var texturehmno:int = 0; texturehmno < mapxml.terrain.layer.length() ; texturehmno++) {
				//trace("height map: " + mapxml.terrain.layer[texturehmno].name);
				//trace("height text: " + mapxml.terrain.layer[texturehmno].heightmap);
				queuetex.add(String(mapxml.terrain.layer[texturehmno].name),new URLRequest(String(mapxml.terrain.layer[texturehmno].heightmap)), "IMG" );
			}
			
			queuetex.addEventListener(SandyEvent.QUEUE_COMPLETE,HeightTerrainLoaded);
            queuetex.start();
			
			function HeightTerrainLoaded():void {
				for (var texturehmno:int = 0; texturehmno < mapxml.terrain.layer.length() ; texturehmno++) {
					//trace('build terrain...' );
					var materialattr:MaterialAttributes = new MaterialAttributes(new LineAttributes( 0.5, 0x2111BB, 0.4 ),new LightAttributes( true, 0.1));
					var material:Material = new ColorMaterial(0xFFCC33,1,materialattr);
					var app:Appearance = new Appearance(material);
					var terrainbuild:TerrainSandy = new TerrainSandy();
					
					terrainbuild.terrainname = mapxml.terrain.layer[texturehmno].name
					var layername:String = mapxml.terrain.layer[texturehmno].name;
					//var terrainlayerMaterial:BitmapMaterial = new BitmapMaterial( queue.data[layername].bitmapData);
					var hmap:BitmapData = queuetex.data[layername].bitmapData;
					var height:Number = mapxml.terrain.layer[texturehmno].height;
					var width:Number = mapxml.terrain.layer[texturehmno].width;
					var gridx:Number = mapxml.terrain.layer[texturehmno].gridx;
					var gridy:Number = mapxml.terrain.layer[texturehmno].gridy;
					
					terrainbuild.heightmap = queuetex.data[layername].bitmapData;
					terrainbuild.height = height;
					terrainbuild.width = width;
					terrainbuild.gridx = gridx;
					terrainbuild.gridy = gridy;
					var terrain:Shape3D = new Plane3D(layername, height, width, gridx, gridy, Plane3D.ZX_ALIGNED, 'tri');
					terrain.x = mapxml.terrain.layer[texturehmno].position.x;
					terrain.y = mapxml.terrain.layer[texturehmno].position.y;
					terrain.z = mapxml.terrain.layer[texturehmno].position.z;
					terrainbuild.posx = mapxml.terrain.layer[texturehmno].position.x;
					terrainbuild.posy = mapxml.terrain.layer[texturehmno].position.y;
					terrainbuild.posz = mapxml.terrain.layer[texturehmno].position.z;
					
					terrainbuild.terrainlayer = terrain;
					terrainbuild.updateheightmap();
					
					//for (var i:int = 0; i < terrain.geometry.aVertex.length; i++) {
					//	//adjust the height of the y point base on the image height gray scale
					//	terrain.geometry.aVertex [i].y = 0xFF & hmap.getPixel (
					//	UVCoord (terrain.geometry.aUVCoords [i]).u * (hmap.width -1),
					//	UVCoord (terrain.geometry.aUVCoords [i]).v * (hmap.height -1)
					///	);
					///}
					
					terrainbuild.terrainlayer.appearance = app;
					terrainmodel.push(terrainbuild);//save data for player and terrain interacting
					terrainbuild.terrainlayer.useSingleContainer = false;
					g.addChild(terrainbuild.terrainlayer);
				}
				//this function will fire off where stuff are finish
				initCharacterxml();
			}
			//trace('init..');
		}
		
		public function buildmapzone():void {
			//trace('build zone!');
			for (var zoneno:int = 0; zoneno < mapxml.mapzone.zone.length(); zoneno++) {
				var buildmapzone:MapZone = new MapZone();
				//mapxml.objects.mesh[meshno].name
				//trace('map name: ' + mapxml.mapzone.zone[zoneno].mapname);
				var zmx:Number = mapxml.mapzone.zone[zoneno].position.x;
				var zmy:Number = mapxml.mapzone.zone[zoneno].position.y;
				var zmz:Number = mapxml.mapzone.zone[zoneno].position.z;
				var shapezone:Box = new Box('mapzone' + zoneno, 16, 16, 16);
				shapezone.useSingleContainer = false;
				shapezone.enableBackFaceCulling = false;
				shapezone.x = zmx;
				shapezone.y = zmy;
				shapezone.z = zmz;
				buildmapzone.mesh = shapezone;
				buildmapzone.posx = zmx;
				buildmapzone.posy = zmy;
				buildmapzone.posz = zmz;
				buildmapzone.mapurl = mapxml.mapzone.zone[zoneno].mapurl;
				buildmapzone.mapzoneid = mapxml.mapzone.zone[zoneno].mapzoneid;
				//trace('------------------' + mapxml.mapzone.zone[zoneno].mapurl);
				buildmapzone.exitposx = mapxml.mapzone.zone[zoneno].exit.position.x;
				buildmapzone.exitposy = mapxml.mapzone.zone[zoneno].exit.position.y;
				buildmapzone.exitposz = mapxml.mapzone.zone[zoneno].exit.position.z;
				
				mapzone.push(buildmapzone);
				g.addChild(shapezone);
			}
		}
		
		//=================================================
		//} END MAP DATA BLOCK
		//=========================================================================================
		//{ START CHARACTER OBJECT DATA BLOCK
		public function initCharacterxml():void {
			//trace('init character url load');
			var urlrequest:URLRequest = new URLRequest(characterxmlurl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				characterxml = new XML(event.target.data);
				CharacterLoadData();
			}
		}
		
		public function CharacterLoadData():void {
			var queue:LoaderQueue = new LoaderQueue();
			var objectcount:int = 0;
			
			for (var charno:int = 0; charno < characterxml.character.length(); charno++) {
				//trace(String(characterxml.character[charno].name));
				var bobjfound:Boolean = false;
				
				for (var objectmeshno:int = 0; objectmeshno < charactermesh.length ;objectmeshno++ ) {
					if (charactermesh[objectmeshno].charactername == characterxml.character[charno].name) {
						//trace('character object found!===================');
						bobjfound = true;
						objectcount++;
						break;
					}
				}
				if (!bobjfound){
					for (var animno:int = 0; animno < characterxml.character[charno].animmesh.mesh.length() ; animno++ ) {
						//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].name);
						//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].file);
						//queue.add( "demon2", new URLRequest("data/models/bbasic_entrance01.ase"), "BIN" );
						queue.add(String(characterxml.character[charno].animmesh.mesh[animno].name), new URLRequest(String(characterxml.character[charno].animmesh.mesh[animno].file)), "BIN" );
					}
				}
				//queue.add( "demon", new URLRequest("data/models/tris.md2"),"BIN");
			}
			
			if (characterxml.character.length() == objectcount) { //if files are loaded
				//trace('IT FULLY LOADED ALREADY!');
				//initbuildmap();
				//initMonsterxml();
				initbuildcharactermap();
			}else {//if files are not loaded add query to be stored
				queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loadcharactercomplete);
				queue.start();
			}
			
			function loadcharactercomplete():void {
				for (var charno:int = 0; charno < characterxml.character.length(); charno++) {
					var tmpcharacter:Character = new Character();
					tmpcharacter.charactername = characterxml.character[charno].name;
					//build collision
					for (var boxno:int = 0; boxno < characterxml.character[charno].collision.box.length(); boxno++) {
						var tmpbox:CollisionBox = new CollisionBox();
						tmpbox.minx = characterxml.character[charno].collision.box[boxno].min.x;
						tmpbox.miny = characterxml.character[charno].collision.box[boxno].min.y;
						tmpbox.minz = characterxml.character[charno].collision.box[boxno].min.z;
						
						tmpbox.maxx = characterxml.character[charno].collision.box[boxno].max.x;
						tmpbox.maxy = characterxml.character[charno].collision.box[boxno].max.y;
						tmpbox.maxz = characterxml.character[charno].collision.box[boxno].max.z;
						
						tmpbox.posx = characterxml.character[charno].collision.box[boxno].position.x;
						tmpbox.posy = characterxml.character[charno].collision.box[boxno].position.y;
						tmpbox.posz = characterxml.character[charno].collision.box[boxno].position.z;
						
						//trace("max:" + characterxml.character[charno].collision.box[boxno].max.x);
						tmpcharacter.boxcollision.push(tmpbox);
					}
					
					//tmpcharacter.boxcollision
					for (var animno:int = 0; animno < characterxml.character[charno].animmesh.mesh.length() ; animno++ ) {
						var animset:AnimationSet = new AnimationSet();
						//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].name);
						//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].file);
						//animation Name
						var animname:String = characterxml.character[charno].animmesh.mesh[animno].name;
						//animation mesh
						try{
							var animmd2:MD2  = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						}
						catch(error:TypeError) {
							text_log2.appendText(String(error));
						}
						//animmd2.
						animset.actionname = characterxml.character[charno].animmesh.mesh[animno].name;
						animset.animmesh = animmd2;
						//animset.animmesh.visible = false;
						//frame name index from min to max
						for (var frameno:int = 0; frameno < characterxml.character[charno].animmesh.mesh[animno].frameset.action.length(); frameno++ ) {
							var tmpactionframe:ActionFrame = new ActionFrame();
							//trace("action frame:" + characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].name);
							tmpactionframe.actionname = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].name;
							tmpactionframe.min = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].startframe;
							//trace(characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].startframe);
							tmpactionframe.max = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].endframe;
							tmpactionframe.speed = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].framespeed;
							tmpactionframe.attackstart = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].attackstart;
							tmpactionframe.attackend = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].attackend;
							
							animset.actionframe.push(tmpactionframe);
						}
						//anim mesh with hold animation frame index custom
						//animset.actionframe.
						
						
						//default mesh assign
						//tmpcharacter.animmesh = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						tmpcharacter.animset.push(animset);
						//g.addChild(animmd2);
					}
					
					var bcharfound:Boolean = false;
					for (var countcharno:int = 0; countcharno < charactermesh.length; countcharno++ ) {
						if (charactermesh[countcharno].charactername == characterxml.character[charno].name) {
							bcharfound = true;
						}
					}
					
					//if character found
					if(!bcharfound){
						charactermesh.push(tmpcharacter);
					}
					/*
					for (var charnoa:int = 0; charnoa < charactermesh.length; charnoa++) {
						for (var animnoa:int = 0; animnoa < charactermesh[charnoa].animset.length ; animnoa++ ) {
							trace(charactermesh[charnoa].animset[animnoa].actionname);
						}
						
					}
					*/
				}
				
				//var animmd2:MD2  = new MD2 ( "default", queue.data["demon"], 0.5 );
				//g.addChild(animmd2);
				//animmd2  = new MD2 ( "default", queue.data["demon"], 0.5 );
				initbuildcharactermap();
			}
		}
			
		public function initbuildcharactermap():void {
			//trace('build character!');
			
			for (var playerno:int = 0; playerno < player.length; playerno++ ) {
				//trace(player[playerno].playername);
				var bcharadded:Boolean = true;
				for (var playerm:int = 0; playerm < playermodel.length; playerm++ ) {
					if (player[playerno].playername == playermodel[playerm].playername) {
						bcharadded = false;
						//trace("player found");
						break;
					}
				}
				
				//create player if it doesn't exist
				//trace("move");
				if (bcharadded == true) {
					//trace("create player");
					for (var characterno:int = 0; characterno <  charactermesh.length; characterno++) {
						//trace(charactermesh[characterno].charactername)
						if (player[playerno].charactername == charactermesh[characterno].charactername) {
							var tmpcharacter:Character = new Character();
							tmpcharacter.playername = player[playerno].playername;
							tmpcharacter.mapzoneid = player[playerno].mapzoneid;
							
							for (var newzonepos:int = 0; newzonepos < mapzone.length;newzonepos++ ) {
								if (newzonepos == player[playerno].mapzoneid) {//id to spawn
									//trace('found exit-==========================');
									tmpcharacter.posx = mapzone[newzonepos].exitposx;
									tmpcharacter.posy = mapzone[newzonepos].exitposy;
									tmpcharacter.posz = mapzone[newzonepos].exitposz;
									//trace('x'+tmpcharacter.posx+' y:'+tmpcharacter.posx+' z:' +tmpcharacter.posz);
								}
							}
							
							for (var animno:int = 0; animno < charactermesh[characterno].animset.length ; animno++ ) {
								//trace('anim set build...');
								var tmpanimset:AnimationSet =  new AnimationSet();
								tmpanimset.actionframe = charactermesh[characterno].animset[animno].actionframe;
								tmpanimset.actionname = charactermesh[characterno].animset[animno].actionname;
								tmpanimset.framemin = charactermesh[characterno].animset[animno].framemin;
								tmpanimset.framemax = charactermesh[characterno].animset[animno].framemax;
								var charactershape:MD2 = charactermesh[characterno].animset[animno].animmesh.clone("character_clone");//animmesh.clone("character_clone")
								tmpanimset.animmesh = charactershape;
								tmpanimset.animmesh.useSingleContainer = false;
								tmpanimset.animmesh.enableBackFaceCulling = false;
								var clonename:String = tmpanimset.animmesh.name;
								tmpanimset.meshid = tmpanimset.animmesh.name;
								//g.addChild(tmpanimset.animmesh);
								tmpcharacter.animset.push(tmpanimset);//push anim set
							}
							
							tmpcharacter.boxcollision = charactermesh[characterno].boxcollision;
							//tmpcharacter.modelid = tmpcharacter.animmesh.name;
							//tmpcharacter.animmesh.x = -50;
							playermodel.push(tmpcharacter);
							//g.addChild(tmpcharacter.animmesh);
							
							for (var playermadd:int = 0; playermadd < playermodel.length; playermadd++) {
								//trace("CHARACTER ANIMATION SET:");
								if (playermodel[playermadd].playername == player[playerno].playername) {
									for (var animsetno:int = 0; animsetno <  playermodel[playermadd].animset.length; animsetno++) {
										//trace("--SET:")
										g.addChild(playermodel[playermadd].animset[animsetno].animmesh);
										//trace(playermodel[playermadd].animset[animsetno].actionname);
									}
									//g.addChild(playermodel[playermadd].animmesh);
								}
							}
							//trace("PUSH ARRAY:>");
							//charactermesh
							break;
						}
					}
				}
			}
			initMonsterxml();
		}
		
		//} END CHARACTER OBJECT DATA BLOCK
		//=========================================================================================
		//{ START MONSTER BLOCK OBCJECT DATA
		// object animations
		// collision
		public function initMonsterxml():void {
			//trace('build monsters!');
			var urlrequest:URLRequest = new URLRequest(monsterxmlurl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			//trace('complete');
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				monsterxml = new XML(event.target.data);
				MonsterLoadData();
			}
		}
		
		//loading and storing mesh object and class
		public function MonsterLoadData():void {
			//start build file query
			var queue:LoaderQueue = new LoaderQueue();
			var objectcount:int = 0;
			for (var charno:int = 0; charno < monsterxml.monster.length(); charno++) {
				var bobjfound:Boolean = false;
				for (var objectmeshno:int = 0; objectmeshno < monstermesh.length ;objectmeshno++ ) {
					if (monstermesh[objectmeshno].charactername == monsterxml.monster[charno].name) {
						//trace('monster object found!===================');
						bobjfound = true;
						objectcount++;
						break;
					}
				}
				if (!bobjfound){
					for (var animno:int = 0; animno < monsterxml.monster[charno].animmesh.mesh.length() ; animno++ ) {
						queue.add(String(monsterxml.monster[charno].animmesh.mesh[animno].name), new URLRequest(String(monsterxml.monster[charno].animmesh.mesh[animno].file)), "BIN" );
					}
				}
			}
			if (monsterxml.monster.length() == objectcount) { 
				initbuildmonstermap();
			}else{//if files are not loaded add query to be stored
				queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loadcharactercomplete);
				queue.start();
			}
			
			//once files are loaded begin build for monster and storage data.
			function loadcharactercomplete():void {
				for (var charno:int = 0; charno < monsterxml.monster.length(); charno++) {
					var tmpcharacter:Monster = new Monster();
					tmpcharacter.charactername = monsterxml.monster[charno].name;
					//tmpcharacter
					
					for (var boxno:int = 0; boxno < monsterxml.monster[charno].collision.box.length(); boxno++) {
						var tmpbox:CollisionBox = new CollisionBox();
						tmpbox.minx = monsterxml.monster[charno].collision.box[boxno].min.x;
						tmpbox.miny = monsterxml.monster[charno].collision.box[boxno].min.y;
						tmpbox.minz = monsterxml.monster[charno].collision.box[boxno].min.z;
						
						tmpbox.maxx = monsterxml.monster[charno].collision.box[boxno].max.x;
						tmpbox.maxy = monsterxml.monster[charno].collision.box[boxno].max.y;
						tmpbox.maxz = monsterxml.monster[charno].collision.box[boxno].max.z;
						
						tmpbox.posx = monsterxml.monster[charno].collision.box[boxno].position.x;
						tmpbox.posy = monsterxml.monster[charno].collision.box[boxno].position.y;
						tmpbox.posz = monsterxml.monster[charno].collision.box[boxno].position.z;
						
						//trace("max:" + characterxml.character[charno].collision.box[boxno].max.x);
						tmpcharacter.boxcollision.push(tmpbox);
					}
					
					for (var animno:int = 0; animno < monsterxml.monster[charno].animmesh.mesh.length() ; animno++ ) {
						var animset:AnimationSet = new AnimationSet();
						var animname:String = monsterxml.monster[charno].animmesh.mesh[animno].name;
						//animation mesh
						var animmd2:MD2  = new MD2 (String(monsterxml.monster[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						animset.actionname = monsterxml.monster[charno].animmesh.mesh[animno].name;
						animset.animmesh = animmd2;
						for (var frameno:int = 0; frameno < monsterxml.monster[charno].animmesh.mesh[animno].frameset.action.length(); frameno++ ) {
							var tmpactionframe:ActionFrame = new ActionFrame();
							//trace("monster action frame:" + monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].name);
							tmpactionframe.actionname = monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].name;
							tmpactionframe.min = monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].startframe;
							//trace("monster"+monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].startframe);
							tmpactionframe.max = monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].endframe;
							tmpactionframe.speed =  monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].framespeed;
							tmpactionframe.attackstart =  monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].attackstart;
							tmpactionframe.attackend =  monsterxml.monster[charno].animmesh.mesh[animno].frameset.action[frameno].attackend;
							animset.actionframe.push(tmpactionframe);
						}
						//animset.animmesh.visible = false;
						//default mesh assign
						//tmpcharacter.animmesh = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						tmpcharacter.animset.push(animset);
						//tmpcharacter.posx = -50;
						//g.addChild(animmd2);
					}
					
					var bcharfound:Boolean = false;
					//trace("mosnter number:"+monstermesh.length);
					for (var countcharno:int = 0; countcharno < monstermesh.length ; countcharno++ ) {
						if (monstermesh[countcharno].charactername == monsterxml.monster[charno].name) {
							bcharfound = true;
							//trace('found');
						}
					}	
					//make sure the data is loaded or already exist
					if(!bcharfound){
						monstermesh.push(tmpcharacter);
					}
				}
				initbuildmonstermap();
			}
		}
		
		// adding MONSTER into the map
		public function initbuildmonstermap():void {
			
			for (var monlist:int = 0; monlist < mapxml.monsterlist.monster.length(); monlist++) {
				//trace('build monsters...');
				//trace('number mosnter:'+monlist)
				//trace(mapxml.monsterlist.monster[monlist].name);
				//monstermesh //storage
				for (var monmeshno:int = 0; monmeshno < monstermesh.length; monmeshno++) {
					//trace("monster mesh:"+monstermesh[monmeshno].charactername);
					//match if monster name is the same
					if (mapxml.monsterlist.monster[monlist].name == monstermesh[monmeshno].charactername) {
						//trace("FOUND! " + monstermesh[monmeshno].charactername);
						var tmpchar:Monster = new Monster();
						//tmpmonster =  monstermesh[monmeshno]; //fail does not over ride, give same id
						tmpchar.boxcollision = monstermesh[monmeshno].boxcollision;
						tmpchar.charactername = monstermesh[monmeshno].charactername;
						tmpchar.posx = mapxml.monsterlist.monster[monlist].position.x;
						tmpchar.posy = mapxml.monsterlist.monster[monlist].position.y;
						tmpchar.posz = mapxml.monsterlist.monster[monlist].position.z;
						
						tmpchar.rotx = mapxml.monsterlist.monster[monlist].rotation.x;
						tmpchar.roty = mapxml.monsterlist.monster[monlist].rotation.y;
						tmpchar.rotz = mapxml.monsterlist.monster[monlist].rotation.z;
						g.addChild(tmpchar.healthbarimage);
						
						for (var animno:int = 0; animno < monstermesh[monmeshno].animset.length ; animno++) {
							var tmpanimset:AnimationSet =  new AnimationSet();
							tmpanimset.actionframe = monstermesh[monmeshno].animset[animno].actionframe;
							tmpanimset.actionname = monstermesh[monmeshno].animset[animno].actionname;
							tmpanimset.framemin = monstermesh[monmeshno].animset[animno].framemin;
							tmpanimset.framemax = monstermesh[monmeshno].animset[animno].framemax;
							
							var charactershape:MD2 = monstermesh[monmeshno].animset[animno].animmesh.clone('monster_clone');//animmesh.clone('monster');
							tmpanimset.animmesh = charactershape;
							
							tmpanimset.animmesh.x = mapxml.monsterlist.monster[monlist].position.x;
							tmpanimset.animmesh.y = mapxml.monsterlist.monster[monlist].position.y;
							tmpanimset.animmesh.z = mapxml.monsterlist.monster[monlist].position.z;
							//add to map dara
							//trace('added to char to map');
							g.addChild(tmpanimset.animmesh);
							tmpchar.animset.push(tmpanimset);
						}
						monstermodel.push(tmpchar);
					}
				}
			}
			
			/*
			for (var monsterno:int = 0; monsterno < monstermodel.length ; monsterno++ ) {
				//trace("monster id:" + monstermodel[monsterno].animset[0].animmesh.id + " Name:" + monstermodel[monsterno].animset[0].animmesh.name);
				for ( var monstermeshno:int = 0; monstermeshno < monstermodel[monsterno].animset.length; monstermeshno++) {
					//trace("add to 'g' monster id:" + monstermodel[monsterno].animset[monstermeshno].animmesh.id + " Name:" + monstermodel[monsterno].animset[monstermeshno].animmesh.name);
					g.addChild(monstermodel[monsterno].animset[monstermeshno].animmesh);
				}
			}
			*/
			
			/*
			for (var monmeshlist:int = 0; monmeshlist < monstermodel.length; monmeshlist++) {
				for (var animlist:int = 0; animlist < monstermodel[monmeshlist].animset.length; animlist++ ) {
					trace("actionname:"+monstermodel[monmeshlist].animset[animlist].actionname);
				}
			}
			*/
			initNpcxml();
		}
		
		//} END MONSTER BLOCK OBJECT DATA
		//=========================================================================================
		//{ START NPC BLOCK OBJECT DATA
		//TODO: need to fix text box
		//NPC XML DATA
		public function initNpcxml():void {
			//trace('build npcs!');
			var urlrequest:URLRequest = new URLRequest(npcxmlurl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				npcxml = new XML(event.target.data);
				NpcLoadData();
			}
		}
		
		//NPC OBJECT DATA
		public function NpcLoadData():void {
			//start build file query
			var queue:LoaderQueue = new LoaderQueue();
			var objectcount:int = 0;
			for (var charno:int = 0; charno < npcxml.npc.length(); charno++) {
				
				var bobjfound:Boolean = false;
				for (var objectmeshno:int = 0; objectmeshno < npcmesh.length ;objectmeshno++ ) {
					if (npcmesh[objectmeshno].charactername == npcxml.npc[charno].name) {
						//trace('npc object found!===================');
						bobjfound = true;
						objectcount++;
						break;
					}
				}
				if (!bobjfound){
					for (var animno:int = 0; animno < npcxml.npc[charno].animmesh.mesh.length() ; animno++ ) {
						queue.add(String(npcxml.npc[charno].animmesh.mesh[animno].name), new URLRequest(String(npcxml.npc[charno].animmesh.mesh[animno].file)), "BIN" );
					}
				}
			}
			if (npcxml.npc.length() == objectcount) {
				initbuildnpcmap();
			}else{//if files are not loaded add query to be stored
				queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loadcharactercomplete);
				queue.start();
			}
			//once files are loaded begin build for monster and storage data.
			function loadcharactercomplete():void {
				for (var charno:int = 0; charno < npcxml.npc.length(); charno++) {
					var tmpcharacter:Npc = new Npc();
					tmpcharacter.charactername = npcxml.npc[charno].name;
					for (var animno:int = 0; animno < npcxml.npc[charno].animmesh.mesh.length() ; animno++ ) {
						var animset:AnimationSet = new AnimationSet();
						var animname:String = npcxml.npc[charno].animmesh.mesh[animno].name;
						//animation mesh
						var animmd2:MD2  = new MD2 (String(npcxml.npc[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						
						//text_log2.text = "npc:";
						animset.actionname = npcxml.npc[charno].animmesh.mesh[animno].name;
						animset.animmesh = animmd2;
						//g.addChild(animset.animmesh);
						//trace('anim npc:'+animset.animmesh.name);
						//animset.animmesh.visible = false;
						//default mesh assign
						//tmpcharacter.animmesh = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						tmpcharacter.animset.push(animset);
						tmpcharacter.posx = 50;
						//g.addChild(animmd2);
					}
					
					var bcharfound:Boolean = false;
					//trace("npcmesh number:"+npcmesh.length);
					for (var countcharno:int = 0; countcharno < npcmesh.length ; countcharno++ ) {
						if (npcmesh[countcharno].charactername == npcxml.npc[charno].name) {
							bcharfound = true;
							//trace('found');
						}
					}	
					
					if(!bcharfound){
						npcmesh.push(tmpcharacter);
						//text_log2.text = "npc:add";
						//g.addChild(tmpcharacter.)
					}
				}
				initbuildnpcmap();
			}
			//initNpcScript();
		}
		
		// adding NPC into the map and added addEventListener for user click on npc object
		public function initbuildnpcmap():void {
			//mapxml data npc list
			for (var npclist:int = 0; npclist < mapxml.npclist.npc.length(); npclist++) {
				//trace('number mosnter:'+monlist)
				//trace(mapxml.monsterlist.monster[monlist].name);
				//monstermesh //storage
				for (var npcmeshno:int = 0; npcmeshno < npcmesh.length; npcmeshno++) {
					//trace("monster mesh:"+monstermesh[monmeshno].charactername);
					//match if monster name is the same
					if (mapxml.npclist.npc[npclist].name == npcmesh[npcmeshno].charactername) {
						//trace("FOUND! " + monstermesh[monmeshno].charactername);
						var tmpchar:Npc = new Npc();
						//tmpmonster =  monstermesh[monmeshno];
						tmpchar.boxcollision = npcmesh[npcmeshno].boxcollision;
						tmpchar.charactername = npcmesh[npcmeshno].charactername;
						tmpchar.posx = mapxml.npclist.npc[npclist].position.x;
						tmpchar.posy = mapxml.npclist.npc[npclist].position.y;
						tmpchar.posz = mapxml.npclist.npc[npclist].position.z;
						
						tmpchar.rotx = mapxml.npclist.npc[npclist].rotation.x;
						tmpchar.roty = mapxml.npclist.npc[npclist].rotation.y;
						tmpchar.rotz = mapxml.npclist.npc[npclist].rotation.z;
						
						for (var animno:int = 0; animno < npcmesh[npcmeshno].animset.length ; animno++ ) {
							var tmpanimset:AnimationSet =  new AnimationSet();
							tmpanimset.actionframe = npcmesh[npcmeshno].animset[animno].actionframe;
							tmpanimset.actionname = npcmesh[npcmeshno].animset[animno].actionname;
							tmpanimset.framemin = npcmesh[npcmeshno].animset[animno].framemin;
							tmpanimset.framemax = npcmesh[npcmeshno].animset[animno].framemax;
							
							var charactershape:MD2 = npcmesh[npcmeshno].animset[animno].animmesh.clone('npc_clone');//animmesh.clone('npc');
							tmpanimset.animmesh = charactershape;
							
							tmpanimset.animmesh.x = mapxml.npclist.npc[npclist].position.x;
							tmpanimset.animmesh.y = mapxml.npclist.npc[npclist].position.y;
							tmpanimset.animmesh.z = mapxml.npclist.npc[npclist].position.z;
							
							tmpanimset.animmesh.container.name = '<npc>' +
							'<name>'+  npcmesh[npcmeshno].charactername +'</name>' +
							'<meshid>'+ tmpanimset.animmesh.id  +'</meshid>' +
							'</npc>';
							tmpanimset.animmesh.container.addEventListener(MouseEvent.CLICK, clickHandler);
							
							//add to map dara
							//trace('added to npc to map');
							g.addChild(tmpanimset.animmesh);
							tmpchar.animset.push(tmpanimset);
							
							//show npc message box id
							function clickHandler(event:MouseEvent):void {
								//trace("name:->" + event.target.name);
								var npcid:XML = new XML(event.target.name);
								//trace("Hello npc!" + animno);
								Shownpcmessage(npcid.name,npcid.meshid);
							}
						}
						npcmodel.push(tmpchar);
					}
				}
			}
			
			//init message box
			initNpcScript();
		}
		
		// NPC SCRIPT XML
		public function initNpcScript():void {
			var urlrequest:URLRequest = new URLRequest(npcscriptxmlurl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				npcscriptxml = new XML(event.target.data);
			}
		}
		
		//NPC BOX MESSAGE
		public function Shownpcmessage(npcname:String, npcid:String):void {
			//trace("NPC:" + npcname +" ID:"+npcid);
			for (var nonpctext:int = 0; nonpctext < npcscriptxml.npcscript.length(); nonpctext++ ) {
				if (npcscriptxml.npcscript[nonpctext].name == npcname) {
					//trace("npc input data...");
					npcmessageboxpanel =  new NPCMessageBox();
					//npc message box -needs to add area
					addChild(npcmessageboxpanel);
				}
			}
		}
		//} END NPC BLOCK OBCJECT DATA
		
		//=========================================================================================
		//{ START HEAD UP DISPLAY
		
		public function HUD():void {
			addChild(panel_game);
			//rpgmenupanel();
			//rpginventorymenupanel();
		}
		
		// RPG MENU
		
		public function rpgmenupanel():void {
			var panelx:Number = 0
			var panely:Number = 0;
			rpgmainmenupanel.y = 15;
			rpgmainmenupanel._pheight = 100;
			rpgmainmenupanel._pwidth = 50;
			var character_button:Button = new Button("Character");
			var item_button:Button = new Button("Item");
			var equip_button:Button = new Button("Equip");
			var skills_button:Button = new Button("Skills");
			var config_button:Button = new Button("Config");
			var editmode_button:Button = new Button("Edit Mode");
			var logout_button:Button = new Button("Logout");
			character_button._width = 100;
			character_button.y = 0 * 14;
			//character_button.addEventListener(MouseEvent.CLICK,showrpgcharacterpanel)
			rpgmainmenupanel.contentholder.addChild(character_button);
			item_button._width = 100;
			item_button.y = 1 * 14;
			item_button.addEventListener(MouseEvent.CLICK, showrpgitempanel);
			rpgmainmenupanel.contentholder.addChild(item_button);
			equip_button._width = 100;
			equip_button.y = 2 * 14;
			equip_button.addEventListener(MouseEvent.CLICK, showrpgequippanel);
			rpgmainmenupanel.contentholder.addChild(equip_button);
			skills_button._width = 100;
			skills_button.y = 3 * 14;
			skills_button.addEventListener(MouseEvent.CLICK, showrpgskillspanel);
			rpgmainmenupanel.contentholder.addChild(skills_button);
			config_button._width = 100;
			config_button.y = 4 * 14;
			config_button.addEventListener(MouseEvent.CLICK, showrpgconfigpanel);
			rpgmainmenupanel.contentholder.addChild(config_button);
			editmode_button._width = 100;
			editmode_button.y = 5 * 14;
			rpgmainmenupanel.contentholder.addChild(editmode_button);
			logout_button._width = 100;
			logout_button.y = 6 * 14;
			rpgmainmenupanel.contentholder.addChild(logout_button);
			rpgmainmenupanel._pheight = 9 * 14;
			addChild(rpgmainmenupanel);
		}
		
		//{ start show and hide event 
		// show character
		public function showrpgcharacterpanel(event:Event):void {
			addChild(rpgconfigpanel);
		}
		// hide character
		public function hiderpgcharacterpanel(event:Event):void {
			removeChild(rpgconfigpanel);
		}
		
		// show item
		public function showrpgitempanel(event:Event):void {
			rpgitemmenupanel();
		}
		// hide item
		public function hiderpgitempanel(event:Event):void {
			removeChild(rpgitempanel);
		}
		
		// show equip
		public function showrpgequippanel(event:Event):void {
			rpgeqiupmenupanel();
		}
		// hide equip
		public function hiderpgequippanel(event:Event):void {
			removeChild(rpgequippanel);
		}
		
		// show skills
		public function showrpgskillspanel(event:Event):void {
			rpgskillsmenupanel();
		}
		// hide skills
		public function hiderpgskillspanel(event:Event):void {
			removeChild(rpgskillspanel);
		}
		
		// show config
		public function showrpgconfigpanel(event:Event):void {
			rpgconfigmenupanel();
		}
		// show config
		public function hiderpgrconfigpanel(event:Event):void {
			removeChild(rpgconfigpanel);
		}
		//}end show and hide event 
		
		//{ //start show menu panels
		//item
		public function rpgitemmenupanel():void {
			//rpgequippanel
			//rpgitempanel.Label_Menu.text = "item";
			var rpgitemclosebuton:Button = new Button("Close");
			rpgitemclosebuton.addEventListener(MouseEvent.CLICK, hiderpgitempanel);
			rpgitempanel.y = 14;
			rpgitempanel._pheight = 200;
			rpgitempanel._pwidth = 60;
			rpgitempanel.contentholder.addChild(rpgitemclosebuton);
			addChild(rpgitempanel);
		}
		
		// equip
		public function rpgeqiupmenupanel():void {
			//rpgequippanel
			//rpgequippanel.Label_Menu.text = "item";
			var rpgeqiupclosebuton:Button = new Button("Close");
			rpgeqiupclosebuton.addEventListener(MouseEvent.CLICK, hiderpgequippanel);
			rpgequippanel.y = 14;
			rpgequippanel._pheight = 200;
			rpgequippanel._pwidth = 60;
			rpgequippanel.contentholder.addChild(rpgeqiupclosebuton);
			addChild(rpgequippanel);
		}
		
		// skill
		public function rpgskillsmenupanel():void {
			//rpgskillspanel
			//rpgskillspanel.Label_Menu.text = "item";
			var rpgskillsclosebuton:Button = new Button("Close");
			rpgskillsclosebuton.addEventListener(MouseEvent.CLICK, hiderpgskillspanel);
			rpgskillspanel.y = 14;
			rpgskillspanel._pheight = 200;
			rpgskillspanel._pwidth = 60;
			rpgskillspanel.contentholder.addChild(rpgskillsclosebuton);
			addChild(rpgskillspanel);
		}
		
		// config
		public function rpgconfigmenupanel():void {
			//rpgconfigpanel
			//rpgconfigpanel.Label_Menu.text = "item";
			var rpgconfigclosebuton:Button = new Button("Close");
			rpgconfigclosebuton.addEventListener(MouseEvent.CLICK, hiderpgrconfigpanel);
			rpgconfigpanel.y = 14;
			rpgconfigpanel._pheight = 200;
			rpgconfigpanel._pwidth = 200;
			rpgconfigpanel.contentholder.addChild(rpgconfigclosebuton);
			addChild(rpgconfigpanel);
		}
		//} end menu panels
		
		//=======================================
		// GAME MENU
		public function showgamemenu():void {
			panel_gamemenu = new Sprite();
			panel_gamemenu.graphics.beginFill(0xEFEFEF);
			panel_gamemenu.graphics.drawRect(0, 0, 128, 64);
			panel_game.addChild(panel_gamemenu);
		}
		
		public function hidegamemenu():void {
			panel_game.removeChild(panel_gamemenu);
		}
		
		//=======================================
		// SHOP MENU
		
		//=======================================
		// NPC TALK
		
		//=======================================
		// GAME MODE MENU
		
		public function showgamemode():void {
			
		}
		
		public function hidegamemode():void {
			
		}
		
		//{ START LEVEL EDITOR
		// load objects
		// move objects
		
		public function objectmove():void {
			
		}
		
		//} END LEVEL EDITOR
		
		//} END HEAD UP DISPLAY
		
		//{ Player BUILDs (controls and functions)
		
		public function PlayerControl():void {
			
			for (var playerno:int = 0; playerno < playermodel.length; playerno++ ) {
				//trace("move");
				//trace("player:"+playermodel[playerno].playername);
				//trace("position x:"+playermodel[playerno].posx+" y:"+playermodel[playerno].posy+ " z:" + playermodel[playerno].posz)
				var actionname:String = "walk";
				//playerchar.cam(camera);
				//playerchar.animmesh.x +=  10;
				//playerchar.bdetectcollision
				//var oldx:Number = playermodel[playerno].posx;
				//var oldy:Number = playermodel[playerno].posy;
				//var oldz:Number = playermodel[playerno].posz;
					
				if (BAttack) {
					playermodel[playerno].battack = true;
				}else {
					playermodel[playerno].battack = false;
				}
					
				if (Downarrow) {
					//playermodel[playerno].dirx = 0;
					playermodel[playerno].dirz = - playermodel[playerno].movespeed; //this one
					playermodel[playerno].action = 'walk';
					playermodel[playerno].actionframe = 'walk';
					playermodel[playerno].roty = -90;
				}
				else if (Uparrow) {
					//playermodel[playerno].dirx = 0;
					playermodel[playerno].dirz = playermodel[playerno].movespeed; //this one
					playermodel[playerno].action  = 'walk';
					playermodel[playerno].actionframe = 'walk';
					playermodel[playerno].roty = 90;
				}else {
					playermodel[playerno].dirz = 0;
				}
				
				if (Rightarrow) {
					playermodel[playerno].dirx = playermodel[playerno].movespeed; //this one
					playermodel[playerno].action  = 'walk';
					playermodel[playerno].actionframe = 'walk';
					playermodel[playerno].roty = 0;
				}
				else if (Leftarrow) {
					playermodel[playerno].dirx = -playermodel[playerno].movespeed; //this one
					playermodel[playerno].action = 'walk';
					playermodel[playerno].actionframe = 'walk';
					playermodel[playerno].roty = 180;
				}else {
					playermodel[playerno].dirx = 0;
				}
				
				if (Spacebar) {
					playermodel[playerno].diry  = 5;
					//playermodel[playerno].bkeyjump = true;
					//trace('hello');
				}else {
					playermodel[playerno].diry  = -5;
					//playermodel[playerno].bkeyjump = false;
				}
				//trace("x:"+playermodel[playerno].dirx +" z: "+playermodel[playerno].dirz);
				//playerchar.addChild(camera);
				//trace("x:"+playermodel[playerno].posx+ " z:"+playermodel[playerno].posz);
				//playermodel[playerno].diffx = oldx - playermodel[playerno].posx;
				//playermodel[playerno].diffy = oldy - playermodel[playerno].posy;
				//playermodel[playerno].diffz = oldz - playermodel[playerno].posz;
				
				//bbox.x = playermodel[playerno].posx;
				//bbox.y = playermodel[playerno].posy;
				//bbox.z = playermodel[playerno].posz;
				camera.x = playermodel[playerno].posx;
				//camera.y = playermodel[playerno].posy + 200;
				//camera.z = playermodel[playerno].posz - 150;
				//camera.y = playermodel[playerno].posy + 200;
				camera.z = playermodel[playerno].posz - 150;
				//camera.x = playermodel[playerno].posx - 10;
				camera.rotateX = +45;
				//trace("move");
			}
			//playerchar.animmesh
		}
		
		public function Talknpc():void {
			for (var noplayer:int = 0; noplayer < playermodel.length ; noplayer++) {
				for (var noplayerbox:int = 0; noplayerbox < playermodel[noplayer].boxcollision.noplayer;noplayerbox++) {
					var minx:Number = playermodel[noplayer].boxcollision[noplayerbox].minx + playermodel[noplayer].posx + playermodel[noplayer].dirx * 16;
					var miny:Number = playermodel[noplayer].boxcollision[noplayerbox].miny + playermodel[noplayer].posy + playermodel[noplayer].diry * 16;
					var minz:Number = playermodel[noplayer].boxcollision[noplayerbox].minz + playermodel[noplayer].posz + playermodel[noplayer].dirz * 16;
						
					var maxx:Number = playermodel[noplayer].boxcollision[noplayerbox].maxx + playermodel[noplayer].posx + playermodel[noplayer].dirx * 16;
					var maxy:Number = playermodel[noplayer].boxcollision[noplayerbox].maxy + playermodel[noplayer].posy + playermodel[noplayer].diry * 16;
					var maxz:Number = playermodel[noplayer].boxcollision[noplayerbox].maxz + playermodel[noplayer].posz + playermodel[noplayer].dirz * 16;
					
					//npc talk
					for (var nonpc:int = 0; nonpc < npcmodel.length; nonpc++ ) {
						for (var nonpcbox:int = 0; nonpcbox < npcmodel[nonpc].boxcollision.length; nonpcbox++ ) {
							
						}
					}
				}
			}
		}
		
		//} 
		
		//{ START DEBUG SECTION
		
		public function showentities():void {
			//text_log
			for (var noplayer:int = 0; noplayer < playermodel.length; noplayer++) {
				text_log.appendText("\n name:" + playermodel[noplayer].playername + " HP:" 
				+ playermodel[noplayer].healthpoint + "/" +  playermodel[noplayer].healthmaxpoint + " Attack:" +   playermodel[noplayer].battack );
			}
			
			for (var nomonster:int = 0; nomonster < monstermodel.length; nomonster++) {
				text_log.appendText("\n name:" + monstermodel[nomonster].charactername + " HP:" 
				+ monstermodel[nomonster].healthpoint + "/" +  monstermodel[nomonster].healthmaxpoint  );
			}
		}
		
		public function addlog():void {
			text_log.text = "log";
			text_log.y = 300;
			text_log.border = true;
			text_log.width = 500;
			addChild(text_log);
		}
		
		public function removelog():void {
			removeChild(text_log);
		}
		
		//} END DEBUG SECTION
		
		//{ START OBJECTS ACTIONS
		
		//monster attak player
		public function MonsterAttackPlayer():void {
			for (var nomonster:int = 0; nomonster < monstermodel.length; nomonster++) {
				//playermodel[noplayer].boxcollision.length
				//playermodel
				if (monstermodel[nomonster].bstartdamage) {
					//trace("monster check... attack");
					for (var nomonsterbox:int = 0; nomonsterbox < monstermodel[nomonster].boxcollision.length; nomonsterbox++) {
						//playermodel[noplayer].boxcollision[noplayerbox]
						var minx:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minx + monstermodel[nomonster].posx + monstermodel[nomonster].olddirx * 16;
						var miny:Number = monstermodel[nomonster].boxcollision[nomonsterbox].miny + monstermodel[nomonster].posy + monstermodel[nomonster].olddiry * 16;
						var minz:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minz + monstermodel[nomonster].posz + monstermodel[nomonster].olddirz * 16;
						
						var maxx:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxx + monstermodel[nomonster].posx + monstermodel[nomonster].olddirx * 16;
						var maxy:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxy + monstermodel[nomonster].posy + monstermodel[nomonster].olddiry * 16;
						var maxz:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxz + monstermodel[nomonster].posz + monstermodel[nomonster].olddirz * 16;
						
						for (var noplayer:int = 0; noplayer < playermodel.length; noplayer++ ) {
							for (var noplayerbox:int = 0;noplayerbox < playermodel[noplayer].boxcollision.length ;noplayerbox++ ) {
								var minx2:Number = playermodel[noplayer].boxcollision[noplayerbox].minx + playermodel[noplayer].posx;
								var miny2:Number = playermodel[noplayer].boxcollision[noplayerbox].miny + playermodel[noplayer].posy;
								var minz2:Number = playermodel[noplayer].boxcollision[noplayerbox].minz + playermodel[noplayer].posz;
								
								var maxx2:Number = playermodel[noplayer].boxcollision[noplayerbox].maxx + playermodel[noplayer].posx;
								var maxy2:Number = playermodel[noplayer].boxcollision[noplayerbox].maxy + playermodel[noplayer].posy;
								var maxz2:Number = playermodel[noplayer].boxcollision[noplayerbox].maxz + playermodel[noplayer].posz;
								
								//var minx2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minx + monstermodel[nomonster].posx;
								
								if ((maxz >= minz2) &&
								(minz <= maxz2) &&
								(maxy >= miny2) &&
								(miny <= maxy2) &&
								(maxx >= minx2) && 
								(minx <= maxx2) //&& (monstermodel[nomonster].balive == true)
								){
									//trace("player hit!");
									playermodel[noplayer].healthpoint -= monstermodel[nomonster].attack;
									//TODO:need to fixed this
								}
								monstermodel[nomonster].bstartdamage = false;
							}
						}
					}
				}
			}
		}
		
		//player attack monster
		public function PlayerAttackMonster():void {
			
			for (var noplayer:int = 0; noplayer < playermodel.length; noplayer++) {
				//playermodel[noplayer].boxcollision.length
				//playermodel
				//trace(playermodel[noplayer].bstartdamage);
				if (playermodel[noplayer].bstartdamage) {
					trace("check... attack"+playermodel[noplayer].dirx);
					
					for (var noplayerbox:int = 0; noplayerbox < playermodel[noplayer].boxcollision.length; noplayerbox++) {
						//playermodel[noplayer].boxcollision[noplayerbox]
						//trace("dir"+playermodel[noplayer].dirx);
						var facedirx:Number = 0;
						var facedirz:Number = 0;
						
						//player face direction to attack
						if (playermodel[noplayer].dirx > 0) {
							facedirx = 1;
						}else if (playermodel[noplayer].dirx < 0) {
							facedirx = -1;
						}else {
							facedirx = 0;
						}
						
						if (playermodel[noplayer].dirz > 0) {
							facedirz = 1;
						}else if (playermodel[noplayer].dirz < 0) {
							facedirz = -1;
						}else {
							facedirz = 0;
						}
						
						var minx:Number = playermodel[noplayer].boxcollision[noplayerbox].minx + playermodel[noplayer].posx + facedirx * 16;
						var miny:Number = playermodel[noplayer].boxcollision[noplayerbox].miny + playermodel[noplayer].posy;
						var minz:Number = playermodel[noplayer].boxcollision[noplayerbox].minz + playermodel[noplayer].posz + facedirz * 16;
						
						var maxx:Number = playermodel[noplayer].boxcollision[noplayerbox].maxx + playermodel[noplayer].posx + facedirx * 16;
						var maxy:Number = playermodel[noplayer].boxcollision[noplayerbox].maxy + playermodel[noplayer].posy;
						var maxz:Number = playermodel[noplayer].boxcollision[noplayerbox].maxz + playermodel[noplayer].posz + facedirz * 16;
						
						for (var nomonster:int = 0; nomonster < monstermodel.length; nomonster++ ) {
							for (var nomonsterbox:int = 0; nomonsterbox < monstermodel[nomonster].boxcollision.length;nomonsterbox++ ) {
								//monstermodel[nomonster].boxcollision[nomonsterbox]
								//trace("collision-attack");
								var minx2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minx + monstermodel[nomonster].posx;
								var miny2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].miny + monstermodel[nomonster].posy;
								var minz2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minz + monstermodel[nomonster].posz;
								
								var maxx2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxx + monstermodel[nomonster].posx;
								var maxy2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxy + monstermodel[nomonster].posy;
								var maxz2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxz + monstermodel[nomonster].posz;
								
								if ((maxz >= minz2) &&
								(minz <= maxz2) &&
								(maxy >= miny2) &&
								(miny <= maxy2) &&
								(maxx >= minx2) && 
								(minx <= maxx2)// && (monstermodel[nomonster].balive == true)
								){
									trace("monster hit!");
									monstermodel[nomonster].healthpoint -= playermodel[noplayer].attack;
									//monstermodel[nomonster].healthpoint = 0;
								}
								//this will finish damage check
								playermodel[noplayer].bstartdamage = false;
							}
						}
					}
				}
			}
		}
		
		//} END OBJECTS ACTIONS
		
		//{ OBJECTS COLLISION BY CLASS
		public function PlayerCollisions():void {
			
			//loop collisions
			for ( var playerno:int = 0; playerno < playermodel.length ; playerno++) {
				
				//object mesh collision
				for (var objectmeshno:int = 0; objectmeshno < objectmap.length; objectmeshno++) {
					/*
					if (playermodel[playerno].objectbox(objectmap[objectmeshno], playermodel[playerno].dirx, 0, 0)) {
						playermodel[playerno].posx += playermodel[playerno].diffx;
						playermodel[playerno].bcollisionx = true;
						//trace("collision");
					}else {
						playermodel[playerno].bcollisionx = false;
					}
					*/
					/*
					if (playermodel[playerno].objectbox(objectmap[objectmeshno], 0, playermodel[playerno].diry-5, 0)) {
						playermodel[playerno].posy += (playermodel[playerno].diffy);
						playermodel[playerno].bcollisiony = true;
						playermodel[playerno].bgroundcollision = true;
						//break;
						//trace("collision y t");
					}else {
						playermodel[playerno].bcollisiony = false;
						//trace("collision y f");
					}
					*/
					//playermodel[playerno].hitbox(objectmap[objectmeshno]);
					//playermodel[playerno].hitbox_z(objectmap[objectmeshno]);
					//playermodel[playerno].hitbox_x(objectmap[objectmeshno]);
					playermodel[playerno].hitbox(objectmap[objectmeshno]);
					playermodel[playerno].intersetbox(objectmap[objectmeshno]);
					/*
					if (playermodel[playerno].objectbox(objectmap[objectmeshno], 0, 0, playermodel[playerno].dirz)) {
						playermodel[playerno].posz += playermodel[playerno].diffz;
						playermodel[playerno].bcollisionz = true;
						
					}else {
						playermodel[playerno].bcollisionz = false;
					}
					*/
				}
				
				//monster mesh collision if alive
				for (var monsterno:int = 0; monsterno < monstermodel.length; monsterno++) {
					if (((playermodel[playerno].monsterbox(monstermodel[monsterno], 0, 0, playermodel[playerno].dirz))== true)&&(monstermodel[monsterno].balive == true)) {
						//playermodel[playerno].posz += playermodel[playerno].diffz;
						//trace('collision');
						playermodel[playerno].bcollisionz = true;
						break;//need to break if other objects are in collision
						
					}else {
						playermodel[playerno].bcollisionz = false;
					}
					
					if ((playermodel[playerno].monsterbox(monstermodel[monsterno], playermodel[playerno].dirx, 0, 0) == true)&&(monstermodel[monsterno].balive == true)) {
						//playermodel[playerno].posx += playermodel[playerno].diffx;
						playermodel[playerno].bcollisionx = true;
						break;//need to break if other objects are in collision
						//trace("collision:"+monsterno);
					}else {
						playermodel[playerno].bcollisionx = false;
					}
				}
				
				//terrain collision
				for (var terrainno:int = 0; terrainno < terrainmodel.length;terrainno++ ) {
					//trace( terrainmodel[terrainno].uvposition(playermodel[playerno].posx, playermodel[playerno].posz));
					if ((playermodel[playerno].posx > terrainmodel[terrainno].minx()) &&(playermodel[playerno].posx < terrainmodel[terrainno].maxx())&&
					   (playermodel[playerno].posz > terrainmodel[terrainno].minz()) && (playermodel[playerno].posz < terrainmodel[terrainno].maxz())) {
						//trace('terrain area');
						//terrain check collision
						//if ()
						var terrainy:Number = terrainmodel[terrainno].uvposition(playermodel[playerno].posx, playermodel[playerno].posz);
						if ((playermodel[playerno].posy <  terrainy)&&(playermodel[playerno].posy > terrainy -20) ){
							//playermodel[playerno].posy = terrainy + terrainmodel[terrainno].posy;
							playermodel[playerno].posy = terrainy;
							//trace("terrain collision");
						}
					}
				}
				
				//map zone check collision
				for (var zoneno:int = 0; zoneno < mapzone.length ; zoneno++ ) { //mapzone class
					//if there is an collision hit do something
					if (playermodel[playerno].checkzonemap(mapzone[zoneno]) == true) {
						//assign mapzoneid to zone to the map
						for (var playeridno:int = 0; playeridno < player.length;playeridno++ ) { //player class
							if (player[playeridno].playername == playermodel[playerno].playername) {
								//trace('found current player!');
								player[playeridno].mapzoneid = mapzone[zoneno].mapzoneid;
								//trace('===== ID:'+ mapzone[zoneno].mapzoneid);
								//trace('zone name:'+mapzone[zoneno].mapurl+' zone id:'+mapzone[zoneno].mapzoneid);
								//if it matches the url map set player position
								if (mapxmlurl == mapzone[zoneno].mapurl){
									//trace('Current map');
									//for (var zoneid:int = 0; ) {
									//set the plauer to the exit point
									//trace('zone id' + mapzone[zoneno].mapzoneid + ' for id:' + zoneno)
									
									for (var newzonepos:int = 0; newzonepos < mapzone.length;newzonepos++ ) {
										if (newzonepos == player[playeridno].mapzoneid) {
											playermodel[playerno].posx = mapzone[newzonepos].exitposx;
											playermodel[playerno].posy = mapzone[newzonepos].exitposy;
											playermodel[playerno].posz = mapzone[newzonepos].exitposz;
										}
									}
									//playermodel[playerno].posx = mapzone[zoneno].exitposx;
									//playermodel[playerno].posy = mapzone[zoneno].exitposy;
									//playermodel[playerno].posz = mapzone[zoneno].exitposz;
								}else {//if it doesn't matches the url map load the file
									initloadmap(mapzone[playeridno].mapurl);
									//trace('other map');
								}
								//trace('current mapurl:'+ mapxmlurl);
							}
						}
						//trace(mapzone[zoneno].mapurl);
					}
				}
			}
		}
		
		public function MonsterCollisions():void {
			for (var monsterno:int = 0; monsterno < monstermodel.length; monsterno++ ) {
				//object mesh
				for (var objectmeshno:int = 0; objectmeshno < objectmap.length; objectmeshno++) {
					/*
					if (monstermodel[monsterno].objectbox(objectmap[objectmeshno], monstermodel[monsterno].dirx, 0, 0)) {
						monstermodel[monsterno].posx -= monstermodel[monsterno].dirx;
						monstermodel[monsterno].bcollisionx = true;
						//trace("-mon and obj collision");
					}else {
						monstermodel[monsterno].bcollisionx = false;
					}
					
					if (monstermodel[monsterno].objectbox(objectmap[objectmeshno], 0, 0, monstermodel[monsterno].dirz)) {
						monstermodel[monsterno].posz -= monstermodel[monsterno].dirz;
						monstermodel[monsterno].bcollisionz = true;
						//trace("-mon and obj collision");
					}else {
						monstermodel[monsterno].bcollisionz = false;
					}
					*/
					if (monstermodel[monsterno].intersetbox(objectmap[objectmeshno])) {
						//monstermodel[monsterno].posy += monstermodel[monsterno].diry;
						monstermodel[monsterno].bgroundcollision = true;
						//trace("-mon and obj collision");
						//break; //it does break to make character touch the ground
					}else {
						//trace("-mon and obj =========");
						monstermodel[monsterno].bgroundcollision = false;
					}
					
					//monstermodel[monsterno].objectbox(objectmap[objectmeshno], 0, 0, monstermodel[monsterno].dirz)
					//monstermodel[playerno].intersetbox(objectmap[objectmeshno]);
					
					/*
					if (monstermodel[monsterno].objectbox(objectmap[objectmeshno], 0, monstermodel[monsterno].diry-5, 0)) {
						monstermodel[monsterno].posy += monstermodel[monsterno].diry;
						monstermodel[monsterno].bgroundcollision = true;
						//trace("-mon and obj collision");
						break; //it does break to make character touch the ground
					}else {
						//trace("-mon and obj =========");
						monstermodel[monsterno].bgroundcollision = false;
					}
					*/
				}
				
				//player collision
				for (var playerno:int = 0; playerno < playermodel.length; playerno++) {
					
					if (monstermodel[monsterno].playerbox(playermodel[playerno], monstermodel[monsterno].dirx, 0, 0)) {
						monstermodel[monsterno].posx -= monstermodel[monsterno].diffx;
						monstermodel[monsterno].bcollisionx = true;
						//trace("mon and obj collision");
					}else {
						monstermodel[monsterno].bcollisionx = false;
					}
					
					if (monstermodel[monsterno].playerbox(playermodel[playerno], 0, 0, monstermodel[monsterno].dirz)) {
						monstermodel[monsterno].posz -= monstermodel[monsterno].diffz;
						monstermodel[monsterno].bcollisionz = true;
						//trace("mon and obj collision");
					}else {
						monstermodel[monsterno].bcollisionz = false;
					}
				}
				
			}
		}
		
		public function NPCCollisions():void {
			for (var npcno:int = 0; npcno < npcmodel.length; npcno++) {
				for (var objectmeshno:int = 0; objectmeshno < objectmap.length; objectmeshno++) {
					if (npcmodel[npcno].intersetbox(objectmap[objectmeshno])) {
					
					}
				}
				/*
				for (var objectmeshno:int = 0; objectmeshno < objectmap.length; objectmeshno++) {
					if (npcmodel[npcno].objectbox(objectmap[objectmeshno], 0, npcmodel[npcno].diry - 5, 0)) {
						npcmodel[npcno].bgroundcollision = true;
						break;
					}else {
						npcmodel[npcno].bgroundcollision = false;
					}
				}
				*/
				
			}
		}
		
		//} end object collision
		
		//{ KeyBoard Events and Controls
		//This is when the keyboard is pressed.
		private function keyPressedHandler(event:flash.events.KeyboardEvent):void{
			//FlashConnect.trace("Hello");
			if (event.keyCode == keycode_b) {
				var oldbgamemenu:Boolean = bgamemenu;
				if (oldbgamemenu) {
					bgamemenu = false;
					hidegamemenu();
					//trace("hide");
				}else {
					bgamemenu = true;
					showgamemenu();
					//trace("show");
				}
			}
		}
		
		//keyboard press down
		public function addKey(e:KeyboardEvent):void {
			//trace(e.keyCode);
			//keysDown[e.keyCode] = true;
			//if (e.keyCode == 38) {
			//	upspeed = true;
			///}
			if (e.keyCode == Keyuparrow) {
				Uparrow = true;
			}
			if (e.keyCode == Keydownarrow) {
				Downarrow = true;
			}
			if (e.keyCode == Keyleftarrow) {
				Leftarrow = true;
			}
			if (e.keyCode == Keyrightarrow) {
				Rightarrow = true;
			}
			
			if (e.keyCode == keycode_c) {
				BAttack = true;
			}
			
			if (e.keyCode == Keyspacebar) {
				Spacebar = true;
			}
		}
		
		//keyboard release up
		public function removeKey(e:KeyboardEvent):void {
			//keysDown[e.keyCode] = false;
			//trace(e.keyCode);
			//if (e.keyCode == 38) {
			//	upspeed = false;
			///}
			if (e.keyCode == Keyuparrow) {
				Uparrow = false;
			}
			if (e.keyCode == Keydownarrow) {
				Downarrow = false;
			}
			if (e.keyCode == Keyleftarrow) {
				Leftarrow = false;
			}
			if (e.keyCode == Keyrightarrow) {
				Rightarrow = false;
			}
			
			if (e.keyCode == keycode_c) {
				BAttack = false;
			}
			
			if (e.keyCode == Keyspacebar) {
				Spacebar = false;
			}
			
		}
		//} end Keyboard
		
		//=========================================================================================
		//Scene test build
		private function createScene():Group{
			//var g:Group = new Group("myGroup");
			//g.addChild(box);
			return g;
		}
		
	}
}
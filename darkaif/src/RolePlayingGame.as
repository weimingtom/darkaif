/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  
{
	//{PACKAGE
	
	import darkaif.entities.*;
	import darkaif.interact.RectButton;
	
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
		 * ---follow
		 * ---attack
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
		//load data
		private var queue:LoaderQueue;
		public var parserstack:ParserStack;
		
		private var scene:Scene3D; // just one scene or the world
		private var camera:Camera3D; //basic one cam
		private var rawobject:Shape3D; //any objects
		
		public var g:Group = new Group("myGroup");
		
		public var mapxmlurl:String = "data/maps/mapdata01.xml";
		public var mapxml:XML = new XML();
		
		public var modelurlrequest:String = "data/models/";
		public var textureurlrequest:String = "data/textures/";
		
		public var box:Box = new Box("box",1,1,1)
		
		public var characterxml:XML = new XML();
		public var characterxmlurl:String = "data/characters/characters.xml";
		
		public var objectmesh:Array = new Array(); //map object data store
		public var objectmap:Array = new Array(); //map data
		public var charactermesh:Array = new Array(); //to store character data
		public var playermesh:Array = new Array(); //add player to the world
		public var player:Array = new Array();//this update player go and out server stuff and cleint reduce lag stuff
		
		public var npcxml:XML = new XML(); //xml data
		public var npcscriptxml:XML = new XML();
		public var npcxmlurl:String = 'data/npcs/npcs.xml'; //site link
		public var npcscriptxmlurl:String = 'data/npcs/npcscriptlist.xml';
		public var npcmesh:Array = new Array(); // object storage area
		public var npcmodel:Array = new Array();//load in the map 
		
		public var monsterxml:XML = new XML();//xml data 
		public var monsterxmlurl:String = 'data/monsters/monsters.xml'; //site link
		public var monstermesh:Array = new Array(); //object storage area
		public var monstermodel:Array = new Array(); //map into the data
		
		public var playername:String = "player";
		public var charactername:String = "player";
		public var gender:String = "male";
		
		public var bbox:Box = new Box('cube', 16, 16, 16);
		
		//{ CONTROLS
		
		public var Uparrow:Boolean = false;
		public var Downarrow:Boolean = false;
		public var Rightarrow:Boolean = false;
		public var Leftarrow:Boolean = false;
		
		public var BAttack:Boolean = false;
		
		public var Keyuparrow:int = 38;
		public var Keydownarrow:int = 40;
		public var Keyrightarrow:int = 39;
		public var Keyleftarrow:int = 37;
		
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
		
		//}
		
		public function RolePlayingGame() {
			HUD();
			addlog();
			var tmpplayer:RPGPlayer = new RPGPlayer();
			tmpplayer.playername = "player";
			tmpplayer.charactername = "player";
			player.push(tmpplayer);
			
			g.addChild(bbox);
			//player.push();
			
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
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			//}	
			initCharacterxml();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			
		}
		
		//{ Start log display
		
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
		
		
		//} End log
		
		//=======================================
		// -Player
		// -Monster
		public function ObjectUpdate():void {
			for (var playerno:int = 0; playerno < playermesh.length; playerno++ ) {
				playermesh[playerno].update();
			}
			
			for (var nomonster:int = 0; nomonster < monstermodel.length; nomonster++ ) {
				monstermodel[nomonster].update();
				for (var targetplayer:int = 0;targetplayer < playermesh.length ;targetplayer++ ) {
					if (playermesh[targetplayer].playername == monstermodel[nomonster].targetname) {
						monstermodel[nomonster].targetx = playermesh[targetplayer].posx;
						monstermodel[nomonster].targety = playermesh[targetplayer].posy;
						monstermodel[nomonster].targetz = playermesh[targetplayer].posz;
					}
				}
				
			}
			
		}
		
		//{ START CHARACTER OBJECT DATA BLOCK
		
		public function initCharacterxml():void {
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
			queue = new LoaderQueue();
			for (var charno:int = 0; charno < characterxml.character.length(); charno++) {
				//
				//trace(String(characterxml.character[charno].name));
				for (var animno:int = 0; animno < characterxml.character[charno].animmesh.mesh.length() ; animno++ ) {
					//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].name);
					//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].file);
					//queue.add( "demon2", new URLRequest("data/models/bbasic_entrance01.ase"), "BIN" );
					queue.add(String(characterxml.character[charno].animmesh.mesh[animno].name), new URLRequest(String(characterxml.character[charno].animmesh.mesh[animno].file)), "BIN" );
				}
				//queue.add( "demon", new URLRequest("data/models/tris.md2"),"BIN");
			}
			//queue.add( "demon", new URLRequest("data/models/tris.md2"),"BIN");
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loadcharactercomplete);
            queue.start();
			
			function loadcharactercomplete():void {
				for (var charno:int = 0; charno < characterxml.character.length(); charno++) {
					var tmpcharacter:Character = new Character();
					tmpcharacter.charactername = characterxml.character[charno].name;
					for (var animno:int = 0; animno < characterxml.character[charno].animmesh.mesh.length() ; animno++ ) {
						var animset:AnimationSet = new AnimationSet();
						//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].name);
						//trace("[]:" + characterxml.character[charno].animmesh.mesh[animno].file);
						//animation Name
						var animname:String = characterxml.character[charno].animmesh.mesh[animno].name;
						//animation mesh
						var animmd2:MD2  = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						//animmd2.
						animset.actionname = characterxml.character[charno].animmesh.mesh[animno].name;
						animset.animmesh = animmd2;
						animset.animmesh.visible = false;
						//frame name index from min to max
						for (var frameno:int = 0; frameno < characterxml.character[charno].animmesh.mesh[animno].frameset.action.length(); frameno++ ) {
							var tmpactionframe:ActionFrame = new ActionFrame();
							//trace("action frame:" + characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].name);
							tmpactionframe.actionname = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].name;
							tmpactionframe.min = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].startframe;
							//trace(characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].startframe);
							tmpactionframe.max = characterxml.character[charno].animmesh.mesh[animno].frameset.action[frameno].endframe;
							animset.actionframe.push(tmpactionframe);
						}
						//anim mesh with hold animation frame index custom
						//animset.actionframe.
						
						
						//default mesh assign
						//tmpcharacter.animmesh = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						tmpcharacter.animset.push(animset);
						//g.addChild(animmd2);
					}
					charactermesh.push(tmpcharacter);
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
			}
			initMonsterxml();
			//initNpcxml();
			//initmapxml();
		}
		
		//} END CHARACTER OBJECT DATA BLOCK
		
		//{ START MONSTER BLOCK OBCJECT DATA
		// object animations
		// collision
		public function initMonsterxml():void {
			var urlrequest:URLRequest = new URLRequest(monsterxmlurl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				monsterxml = new XML(event.target.data);
				MonsterLoadData();
			}
		}
		
		public function MonsterLoadData():void {
			//start build file query
			queue = new LoaderQueue();
			for (var charno:int = 0; charno < monsterxml.monster.length(); charno++) {
				for (var animno:int = 0; animno < monsterxml.monster[charno].animmesh.mesh.length() ; animno++ ) {
					queue.add(String(monsterxml.monster[charno].animmesh.mesh[animno].name), new URLRequest(String(monsterxml.monster[charno].animmesh.mesh[animno].file)), "BIN" );
				}
			}
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loadcharactercomplete);
            queue.start();
			
			//once files are loaded begin build for monster and storage data.
			function loadcharactercomplete():void {
				for (var charno:int = 0; charno < monsterxml.monster.length(); charno++) {
					var tmpcharacter:Monster = new Monster();
					tmpcharacter.charactername = monsterxml.monster[charno].name;
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
							animset.actionframe.push(tmpactionframe);
						}
						//animset.animmesh.visible = false;
						//default mesh assign
						//tmpcharacter.animmesh = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						tmpcharacter.animset.push(animset);
						//tmpcharacter.posx = -50;
						//g.addChild(animmd2);
					}
					monstermesh.push(tmpcharacter);
				}
			}
			initNpcxml();
		}
		
		//} END MONSTER BLOCK OBJECT DATA
		
		//{ START NPC BLOCK OBJECT DATA
		
		//NPC XML DATA
		public function initNpcxml():void {
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
			queue = new LoaderQueue();
			for (var charno:int = 0; charno < npcxml.npc.length(); charno++) {
				for (var animno:int = 0; animno < npcxml.npc[charno].animmesh.mesh.length() ; animno++ ) {
					queue.add(String(npcxml.npc[charno].animmesh.mesh[animno].name), new URLRequest(String(npcxml.npc[charno].animmesh.mesh[animno].file)), "BIN" );
				}
			}
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loadcharactercomplete);
            queue.start();
			
			//once files are loaded begin build for monster and storage data.
			function loadcharactercomplete():void {
				for (var charno:int = 0; charno < npcxml.npc.length(); charno++) {
					var tmpcharacter:Monster = new Monster();
					tmpcharacter.charactername = npcxml.npc[charno].name;
					for (var animno:int = 0; animno < npcxml.npc[charno].animmesh.mesh.length() ; animno++ ) {
						var animset:AnimationSet = new AnimationSet();
						var animname:String = npcxml.npc[charno].animmesh.mesh[animno].name;
						//animation mesh
						var animmd2:MD2  = new MD2 (String(npcxml.npc[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						animset.actionname = npcxml.npc[charno].animmesh.mesh[animno].name;
						animset.animmesh = animmd2;
						//animset.animmesh.visible = false;
						//default mesh assign
						//tmpcharacter.animmesh = new MD2 (String(characterxml.character[charno].animmesh.mesh[animno].name), queue.data[animname], 0.5 );
						tmpcharacter.animset.push(animset);
						tmpcharacter.posx = 50;
						//g.addChild(animmd2);
					}
					npcmesh.push(tmpcharacter);
				}
			}
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
				NpcscriptLoadData();
			}
		}
		
		//NPC SCRIPT DATA
		public function NpcscriptLoadData():void {
			initmapxml();
		}
		
		//NPC BOX MESSAGE
		public function Shownpcmessage(npcname:String, npcid:String):void {
			//trace("NPC:" + npcname +" ID:"+npcid);
			for (var nonpctext:int = 0; nonpctext < npcscriptxml.npcscript.length(); nonpctext++ ) {
				if (npcscriptxml.npcscript[nonpctext].name == npcname) {
					//npcscriptxml.npcscript[nonpctext].scriptlist.message.text
					//panel_npcmessage
					
					panel_npcmessage = new Sprite();
					panel_npcmessage.graphics.beginFill(0xEFEFEF);
					panel_npcmessage.graphics.drawRect(0, 0, 128, 64);
					
					text_npcmessage.text = npcscriptxml.npcscript[nonpctext].scriptlist.message.text;
					text_npcmessage.border = true;
					text_npcmessage.height =  50;
					text_npcmessage.wordWrap = true;
					
					
					var closebutton:RectButton = new RectButton("End Chat.");
					closebutton.y = 50;
					closebutton.addEventListener(MouseEvent.CLICK,removenpcmessage);
					panel_npcmessage.addChild(text_npcmessage);
					panel_npcmessage.addChild(closebutton);
					//panel_npcmessage.multiline = true;
					
					panel_game.addChild(panel_npcmessage);
					
					function removenpcmessage(event:MouseEvent):void {
						panel_game.removeChild(panel_npcmessage);
					}
					
				}
				//trace("scriptlst:"+npcscriptxml.npcscript[nonpctext].name)
			}
		}
		
		//} END NPC BLOCK OBCJECT DATA
		
		//{ START MAP DATA BLOCK
		//=======================================
		//MAP BLOCK
		public function initmapxml():void {
			var urlrequest:URLRequest = new URLRequest(mapxmlurl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener("complete", initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				mapxml = new XML(event.target.data);
				maploaddata();
			}
		}
		
		public function maploaddata():void {
			//mapxml.objectlist.mesh
			
			parserstack = new ParserStack();
			
			for (var meshno:int = 0; meshno < mapxml.objectlist.mesh.length(); meshno++)
			{
				var parser:IParser = Parser.create(String(mapxml.objectlist.mesh[meshno].localdir), Parser.ASE );
				parserstack.add(String(mapxml.objectlist.mesh[meshno].name), parser);
			}
			parserstack.addEventListener(ParserStack.COMPLETE,loadASEmapcomplete);
			parserstack.start();
		}
		
		//=======================================
		// ASE DATA MESH
		// This to store object mesh tmp for reuse data
		public function loadASEmapcomplete(pEvt:Event):void {
			//trace("Hello ASE");
			for (var meshno:int = 0; meshno < mapxml.objectlist.mesh.length(); meshno++)
			{
				//var parser:IParser = Parser.create(String(mapxml.objectlist.mesh[meshno].localdir), Parser.ASE );
				//parserstack.add(String(mapxml.objectlist.mesh[meshno].name), parser);
				var tmpshape:Shape3D;
				tmpshape = parserstack.getGroupByName(String(mapxml.objectlist.mesh[meshno].name)).children[0] as Shape3D; 
				tmpshape.name = String(mapxml.objectlist.mesh[meshno].name);
				//trace(tmpshape.name);
				objectmesh.push(tmpshape);
				//g.addChild(tmpshape);
			}	
			initbuildmap();
		}
		
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
		
		//=======================================
		// Build object from object mesh and texture from data map
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
						var shape:Shape3D = objectmesh[objmeshno].clone();
						//shape.
						//shape.clone();
						shape.x = mapxml.objects.mesh[meshno].position.x;
						shape.y = mapxml.objects.mesh[meshno].position.y;
						shape.z = mapxml.objects.mesh[meshno].position.z;
						
						shape.rotateX = mapxml.objects.mesh[meshno].rotation.x;
						shape.rotateY = mapxml.objects.mesh[meshno].rotation.y;
						shape.rotateZ = mapxml.objects.mesh[meshno].rotation.z;
						tmpobjectmesh.model = shape;
						//mesh name
						tmpobjectmesh.meshname = objectmesh[objmeshno].name;
						//mesh name id
						tmpobjectmesh.meshid = shape.name;
						objectmap.push(tmpobjectmesh);
						g.addChild(shape);
						//trace("FOUND!");
					}
				}
			}
			
			initbuildmonstermap();
		}
		
		//=======================================
		// adding MONSTER into the map
		public function initbuildmonstermap():void {
			//mapxml
			for (var monlist:int = 0; monlist < mapxml.monsterlist.monster.length(); monlist++) {
				//trace(mapxml.monsterlist.monster[monlist].name);
				//monstermesh //storage
				for (var monmeshno:int = 0; monmeshno < monstermesh.length; monmeshno++) { 
					//trace("monster mesh:"+monstermesh[monmeshno].charactername);
					//match if monster name is the same
					if (mapxml.monsterlist.monster[monlist].name == monstermesh[monmeshno].charactername) {
						//trace("FOUND! " + monstermesh[monmeshno].charactername);
						var tmpmonster:Monster = new Monster();
						//tmpmonster =  monstermesh[monmeshno];
						tmpmonster.boxcollision = monstermesh[monmeshno].boxcollision;
						tmpmonster.charactername = monstermesh[monmeshno].charactername;
						tmpmonster.setx = mapxml.monsterlist.monster[monlist].position.x;
						tmpmonster.sety = mapxml.monsterlist.monster[monlist].position.y;
						tmpmonster.setz = mapxml.monsterlist.monster[monlist].position.z;
						
						//trace("x:" + mapxml.monsterlist.monster[monlist].position.x +"y:" + mapxml.monsterlist.monster[monlist].position.y +"z:" + mapxml.monsterlist.monster[monlist].position.z);
						
						tmpmonster.rotx = mapxml.monsterlist.monster[monlist].rotation.x;
						tmpmonster.roty = mapxml.monsterlist.monster[monlist].rotation.y;
						tmpmonster.rotz = mapxml.monsterlist.monster[monlist].rotation.z;
						tmpmonster.balive = true;
						
						for (var animno:int = 0; animno < monstermesh[monmeshno].animset.length ; animno++ ) {
							var tmpanimset:AnimationSet =  new AnimationSet();
							tmpanimset = monstermesh[monmeshno].animset[animno];
							tmpanimset.animmesh = monstermesh[monmeshno].animset[animno].animmesh.clone();
							tmpanimset.animmesh.x = mapxml.monsterlist.monster[monlist].position.x;
							tmpanimset.animmesh.y = mapxml.monsterlist.monster[monlist].position.y;
							tmpanimset.animmesh.z = mapxml.monsterlist.monster[monlist].position.z;
							g.addChild(tmpanimset.animmesh);
							tmpmonster.animset.push(tmpanimset);
						}
						monstermodel.push(tmpmonster);
					}
				}
				//monstermodel //add to map
			}
			
			/*
			for (var monmeshlist:int = 0; monmeshlist < monstermodel.length; monmeshlist++) {
				for (var animlist:int = 0; animlist < monstermodel[monmeshlist].animset.length; animlist++ ) {
					trace("actionname:"+monstermodel[monmeshlist].animset[animlist].actionname);
				}
			}
			*/
			
			initbuildnpcmap();
			
		}
		
		//=======================================
		// adding NPC into the map
		// added addEventListener for user click on npc object
		public function initbuildnpcmap():void {
			//mapxml
			for (var npclist:int = 0; npclist < mapxml.npclist.npc.length(); npclist++) {
				//trace("npc:"+mapxml.npclist.npc[npclist].name);
				//monstermesh //storage
				for (var npcmeshno:int = 0; npcmeshno < npcmesh.length; npcmeshno++) { 
					//trace("monster mesh:"+monstermesh[monmeshno].charactername);
					//match if monster name is the same
					if (mapxml.npclist.npc[npclist].name == npcmesh[npcmeshno].charactername) {
						//trace("NPC FOUND! " + npcmesh[npcmeshno].charactername);
						var tmpnpc:Npc = new Npc();
						tmpnpc.balive = true;
						tmpnpc.charactername = npcmesh[npcmeshno].charactername;
						tmpnpc.posx = mapxml.npclist.npc[npclist].position.x;
						tmpnpc.posy = mapxml.npclist.npc[npclist].position.y;
						tmpnpc.posz = mapxml.npclist.npc[npclist].position.z;
						
						//trace("x:" + mapxml.monsterlist.monster[monlist].position.x +"y:" + mapxml.monsterlist.monster[monlist].position.y +"z:" + mapxml.monsterlist.monster[monlist].position.z);
						
						tmpnpc.rotx = mapxml.npclist.npc[npclist].rotation.x;
						tmpnpc.roty = mapxml.npclist.npc[npclist].rotation.y;
						tmpnpc.rotz = mapxml.npclist.npc[npclist].rotation.z;
						
						for (var animno:int = 0; animno < npcmesh[npcmeshno].animset.length ; animno++ ) {
							var tmpanimset:AnimationSet =  new AnimationSet();
							tmpanimset = npcmesh[npcmeshno].animset[animno];
							tmpanimset.animmesh = npcmesh[npcmeshno].animset[animno].animmesh.clone();
							//trace(tmpanimset.animmesh.name);
							
							//tmpanimset.animmesh.name = '<npc>' +'<name>'+  npcmesh[npcmeshno].charactername +'</name>' +'<meshid>'+ tmpanimset.animmesh.id  +'</meshid>' +'</npc>';
							
							tmpanimset.animmesh.container.name = '<npc>' +
							'<name>'+  npcmesh[npcmeshno].charactername +'</name>' +
							'<meshid>'+ tmpanimset.animmesh.id  +'</meshid>' +
							'</npc>';
							
							//trace("name::"+tmpanimset.animmesh.name);
							tmpanimset.animmesh.x = mapxml.npclist.npc[npclist].position.x;
							tmpanimset.animmesh.y = mapxml.npclist.npc[npclist].position.y;
							tmpanimset.animmesh.z = mapxml.npclist.npc[npclist].position.z;
							tmpanimset.animmesh.container.addEventListener(MouseEvent.CLICK, clickHandler);
							//trace(tmpanimset.animmesh.id + "ID");
							
							g.addChild(tmpanimset.animmesh);
							tmpnpc.animset.push(tmpanimset);
							
							function clickHandler(event:MouseEvent):void {
								//trace("name:->" + event.target.name);
								var npcid:XML = new XML(event.target.name);
								//trace("Hello npc!" + animno);
								Shownpcmessage(npcid.name,npcid.meshid);
							}
							
						}
						npcmodel.push(tmpnpc);
					}
				}
				//monstermodel //add to map
			}
			/*
			for (var monmeshlist:int = 0; monmeshlist < monstermodel.length; monmeshlist++) {
				for (var animlist:int = 0; animlist < monstermodel[monmeshlist].animset.length; animlist++ ) {
					trace("actionname:"+monstermodel[monmeshlist].animset[animlist].actionname);
				}
			}
			*/
		}
		
		//} END MAP DATA BLOCK
		
		//{ START HEAD UP DISPLAY
		
		public function HUD():void {
			addChild(panel_game);
		}
		
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
		
		//{ Player BUILDs
		public function CheckPlayer():void {
			for (var playerno:int = 0; playerno < player.length; playerno++ ) {
				//trace(player[playerno].playername);
				var playermodel:Boolean = true;
				for (var playerm:int = 0; playerm < playermesh.length; playerm++ ) {
					if (player[playerno].playername == playermesh[playerm].playername) {
						playermodel = false;
						//trace("player found");
						break;
					}
				}
				
				//create player if it doesn't exist
				//trace("move");
				if (playermodel == true) {
					//trace("create player");
					for (var characterno:int = 0; characterno <  charactermesh.length; characterno++) {
						//trace(charactermesh[characterno].charactername)
						if (player[playerno].charactername == charactermesh[characterno].charactername) {
							var tmpcharacter:Character = new Character();
							tmpcharacter.playername = player[playerno].playername;
							//tmpcharacter.animmesh = charactermesh[characterno].animmesh.clone();
							tmpcharacter.animset = charactermesh[characterno].animset;
							//tmpcharacter.modelid = tmpcharacter.animmesh.name;
							//tmpcharacter.animmesh.x = -50;
							playermesh.push(tmpcharacter);
							//g.addChild(tmpcharacter.animmesh);
							
							for (var playermadd:int = 0; playermadd < playermesh.length; playermadd++) {
								//trace("CHARACTER ANIMATION SET:");
								if (playermesh[playermadd].playername == player[playerno].playername) {
									for (var animsetno:int = 0; animsetno <  playermesh[playermadd].animset.length; animsetno++) {
										//trace("--SET:")
										g.addChild(playermesh[playermadd].animset[animsetno].animmesh);
										//trace(playermesh[playermadd].animset[animsetno].actionname);
									}
									//g.addChild(playermesh[playermadd].animmesh);
								}
							}
							
							//trace("PUSH ARRAY:>");
							//charactermesh
							break;
						}
					}
				}
				
			}
		}
		
		public function PlayerControl():void {
			
			for (var playerno:int = 0; playerno < playermesh.length; playerno++ ) {
				//trace("move");
				//trace("player:"+playermesh[playerno].playername);
				
				var actionname:String = "walk";
				//playerchar.cam(camera);
				//playerchar.animmesh.x +=  10;
				//playerchar.bdetectcollision
					var oldx:Number = playermesh[playerno].posx;
					var oldy:Number = playermesh[playerno].posy;
					var oldz:Number = playermesh[playerno].posz;
					
				if (BAttack) {
					playermesh[playerno].battack = true;
				}else {
					playermesh[playerno].battack = false;
				}
					
				if (Downarrow) {
					playermesh[playerno].dirz = -1;
					playermesh[playerno].dirx = 0;
					
					playermesh[playerno].posz -= 5; //this one
					playermesh[playerno].action = 'walk';
					playermesh[playerno].actionframe = 'walk';
					playermesh[playerno].roty = 90;
				}else if (Uparrow) {
					playermesh[playerno].dirz = 1;
					playermesh[playerno].dirx = 0;
					
					playermesh[playerno].posz += 5; //this one
					playermesh[playerno].action  = 'walk';
					playermesh[playerno].actionframe = 'walk';
					playermesh[playerno].roty = -90;
				}else {
					playermesh[playerno].posz += 0;
				}
				
				if (Rightarrow) {
					playermesh[playerno].dirx = 1;
					playermesh[playerno].dirz = 0;
					
					playermesh[playerno].posx += 5; //this one
					playermesh[playerno].action  = 'walk';
					playermesh[playerno].actionframe = 'walk';
					playermesh[playerno].roty = 0;
				}else if (Leftarrow) {
					playermesh[playerno].dirx = -1;
					playermesh[playerno].dirz = 0;
					
					playermesh[playerno].posx -= 5; //this one
					playermesh[playerno].action = 'walk';
					playermesh[playerno].actionframe = 'walk';
					playermesh[playerno].roty = 180;
				}else {
					playermesh[playerno].posx += 0;
				}
				
				//trace("x:"+playermesh[playerno].dirx +" z: "+playermesh[playerno].dirz);
				//playerchar.addChild(camera);
				//trace("x:"+playermesh[playerno].posx+ " z:"+playermesh[playerno].posz);
				playermesh[playerno].diffx = oldx - playermesh[playerno].posx;
				playermesh[playerno].diffy = oldy - playermesh[playerno].posy;
				playermesh[playerno].diffz = oldz - playermesh[playerno].posz;
				
				bbox.x = playermesh[playerno].posx;
				bbox.y = playermesh[playerno].posy;
				bbox.z = playermesh[playerno].posz;
				camera.x = playermesh[playerno].posx;
				camera.y = playermesh[playerno].posy + 200;
				camera.z = playermesh[playerno].posz - 150;
				camera.rotateX = +45;
				//trace("move");
			}
			//playerchar.animmesh
		}
		
		public function Talknpc():void {
			for (var noplayer:int = 0; noplayer < playermesh.length ; noplayer++) {
				for (var noplayerbox:int = 0; noplayerbox < playermesh[noplayer].boxcollision.noplayer;noplayerbox++) {
					var minx:Number = playermesh[noplayer].boxcollision[noplayerbox].minx + playermesh[noplayer].posx + playermesh[noplayer].dirx * 16;
					var miny:Number = playermesh[noplayer].boxcollision[noplayerbox].miny + playermesh[noplayer].posy + playermesh[noplayer].diry * 16;
					var minz:Number = playermesh[noplayer].boxcollision[noplayerbox].minz + playermesh[noplayer].posz + playermesh[noplayer].dirz * 16;
						
					var maxx:Number = playermesh[noplayer].boxcollision[noplayerbox].maxx + playermesh[noplayer].posx + playermesh[noplayer].dirx * 16;
					var maxy:Number = playermesh[noplayer].boxcollision[noplayerbox].maxy + playermesh[noplayer].posy + playermesh[noplayer].diry * 16;
					var maxz:Number = playermesh[noplayer].boxcollision[noplayerbox].maxz + playermesh[noplayer].posz + playermesh[noplayer].dirz * 16;
					
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
			for (var noplayer:int = 0; noplayer < playermesh.length; noplayer++) {
				text_log.appendText("\n name:" + playermesh[noplayer].playername + " HP:" 
				+ playermesh[noplayer].healthpoint + "/" +  playermesh[noplayer].healthmaxpoint + " Attack:" +   playermesh[noplayer].battack );
			}
			
			for (var nomonster:int = 0; nomonster < monstermodel.length; nomonster++) {
				text_log.appendText("\n name:" + monstermodel[nomonster].charactername + " HP:" 
				+ monstermodel[nomonster].healthpoint + "/" +  monstermodel[nomonster].healthmaxpoint  );
			}
		}
		
		//} END DEBUG SECTION
		
		//this will render the mesh and other objects data
		// This is an update code function when every frame is render
		private function enterFrameHandler( event : Event ) : void {
			text_log.text = "log...";
			showentities();
			ObjectUpdate();
			ObjectCollision();
			PlayerAttackMonster();
			MonsterAttackPlayer();
			PlayerControl(); 
			Talknpc();
			CheckPlayer();
			scene.render();
			//FlashConnect.trace("Hello");
		}
		
		//{ START OBJECTS ACTIONS
		
		public function MonsterAttackPlayer():void {
			for (var nomonster:int = 0; nomonster < monstermodel.length; nomonster++) {
				//playermesh[noplayer].boxcollision.length
				//playermesh
				if (monstermodel[nomonster].bstartdamage) {
					//trace("monster check... attack");
					for (var nomonsterbox:int = 0; nomonsterbox < monstermodel[nomonster].boxcollision.length; nomonsterbox++) {
						//playermesh[noplayer].boxcollision[noplayerbox]
						var minx:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minx + monstermodel[nomonster].posx + monstermodel[nomonster].olddirx * 16;
						var miny:Number = monstermodel[nomonster].boxcollision[nomonsterbox].miny + monstermodel[nomonster].posy + monstermodel[nomonster].olddiry * 16;
						var minz:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minz + monstermodel[nomonster].posz + monstermodel[nomonster].olddirz * 16;
						
						var maxx:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxx + monstermodel[nomonster].posx + monstermodel[nomonster].olddirx * 16;
						var maxy:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxy + monstermodel[nomonster].posy + monstermodel[nomonster].olddiry * 16;
						var maxz:Number = monstermodel[nomonster].boxcollision[nomonsterbox].maxz + monstermodel[nomonster].posz + monstermodel[nomonster].olddirz * 16;
						
						for (var noplayer:int = 0; noplayer < playermesh.length; noplayer++ ) {
							for (var noplayerbox:int = 0;noplayerbox < playermesh[noplayer].boxcollision.length ;noplayerbox++ ) {
								var minx2:Number = playermesh[noplayer].boxcollision[noplayerbox].minx + playermesh[noplayer].posx;
								var miny2:Number = playermesh[noplayer].boxcollision[noplayerbox].miny + playermesh[noplayer].posy;
								var minz2:Number = playermesh[noplayer].boxcollision[noplayerbox].minz + playermesh[noplayer].posz;
								
								var maxx2:Number = playermesh[noplayer].boxcollision[noplayerbox].maxx + playermesh[noplayer].posx;
								var maxy2:Number = playermesh[noplayer].boxcollision[noplayerbox].maxy + playermesh[noplayer].posy;
								var maxz2:Number = playermesh[noplayer].boxcollision[noplayerbox].maxz + playermesh[noplayer].posz;
								
								//var minx2:Number = monstermodel[nomonster].boxcollision[nomonsterbox].minx + monstermodel[nomonster].posx;
								
								if ((maxz >= minz2) &&
								(minz <= maxz2) &&
								(maxy >= miny2) &&
								(miny <= maxy2) &&
								(maxx >= minx2) && 
								(minx <= maxx2) //&& (monstermodel[nomonster].balive == true)
								){
									//trace("player hit!");
									playermesh[noplayer].healthpoint -= monstermesh[nomonster].attack;
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
			for (var noplayer:int = 0; noplayer < playermesh.length; noplayer++) {
				//playermesh[noplayer].boxcollision.length
				//playermesh
				if (playermesh[noplayer].bstartdamage) {
					//trace("check... attack");
					for (var noplayerbox:int = 0; noplayerbox < playermesh[noplayer].boxcollision.length; noplayerbox++) {
						//playermesh[noplayer].boxcollision[noplayerbox]
						var minx:Number = playermesh[noplayer].boxcollision[noplayerbox].minx + playermesh[noplayer].posx + playermesh[noplayer].dirx * 16;
						var miny:Number = playermesh[noplayer].boxcollision[noplayerbox].miny + playermesh[noplayer].posy + playermesh[noplayer].diry * 16;
						var minz:Number = playermesh[noplayer].boxcollision[noplayerbox].minz + playermesh[noplayer].posz + playermesh[noplayer].dirz * 16;
						
						var maxx:Number = playermesh[noplayer].boxcollision[noplayerbox].maxx + playermesh[noplayer].posx + playermesh[noplayer].dirx * 16;
						var maxy:Number = playermesh[noplayer].boxcollision[noplayerbox].maxy + playermesh[noplayer].posy + playermesh[noplayer].diry * 16;
						var maxz:Number = playermesh[noplayer].boxcollision[noplayerbox].maxz + playermesh[noplayer].posz + playermesh[noplayer].dirz * 16;
						
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
								(minx <= maxx2) && (monstermodel[nomonster].balive == true)
								){
									//trace("monster hit!");
									monstermodel[nomonster].healthpoint -= playermesh[noplayer].attack;
								}
								//this will finish damage check
								playermesh[noplayer].bstartdamage = false;
							}
						}
					}
				}
			}
		}
		
		//} END OBJECTS ACTIONS
		
		public function ObjectCollision():void {
			
			//loop collisions
			for ( var playerno:int = 0; playerno < playermesh.length ; playerno++) {
				for (var boxno:int = 0; boxno < playermesh[playerno].boxcollision.length ; boxno++ ) {
					//playermesh[playerno].boxcollision[boxno]
					//custom positon due to anim set
					var minx:Number = playermesh[playerno].boxcollision[boxno].minx + playermesh[playerno].posx;
					var miny:Number = playermesh[playerno].boxcollision[boxno].miny + playermesh[playerno].posy;
					var minz:Number = playermesh[playerno].boxcollision[boxno].minz + playermesh[playerno].posz;
					var maxx:Number = playermesh[playerno].boxcollision[boxno].maxx + playermesh[playerno].posx;
					var maxy:Number = playermesh[playerno].boxcollision[boxno].maxy + playermesh[playerno].posy;
					var maxz:Number = playermesh[playerno].boxcollision[boxno].maxz + playermesh[playerno].posz;
					
					//object mesh collision
					for (var meshno:int = 0; meshno < objectmap.length; meshno++) {
					//trace(String(objectmap.length));
						for (var meshbox:int = 0; meshbox < objectmap[meshno].boxcollision.length; meshbox++ ) {
							//trace("Hello");
							//objectmap[meshno].boxcollision[meshbox]
							var minx2:Number = objectmap[meshno].boxcollision[meshbox].minx + objectmap[meshno].model.x;
							var miny2:Number = objectmap[meshno].boxcollision[meshbox].miny + objectmap[meshno].model.y;
							var minz2:Number = objectmap[meshno].boxcollision[meshbox].minz + objectmap[meshno].model.z;
							var maxx2:Number = objectmap[meshno].boxcollision[meshbox].maxx + objectmap[meshno].model.x;
							var maxy2:Number = objectmap[meshno].boxcollision[meshbox].maxy + objectmap[meshno].model.y;
							var maxz2:Number = objectmap[meshno].boxcollision[meshbox].maxz + objectmap[meshno].model.z;
							
							if ((maxz >= minz2) &&
								(minz <= maxz2) &&
								(maxy >= miny2) &&
								(miny <= maxy2) &&
								(maxx >= minx2) && 
								(minx <= maxx2)
								){
								//FlashConnect.trace("Collision");	
								//return true; //there is colision
								playermesh[playerno].bdetectcollision = true;
								
								if(playermesh[playerno].diffx < 0){
									playermesh[playerno].posx += playermesh[playerno].diffx;
								}else if (playermesh[playerno].diffx > 0){
									playermesh[playerno].posx += playermesh[playerno].diffx;
								}
								
								if(playermesh[playerno].diffy < 0){
									playermesh[playerno].posy += playermesh[playerno].diffy;
								}else if (playermesh[playerno].diffy > 0){
									playermesh[playerno].posy += playermesh[playerno].diffy;
								}
								
								if(playermesh[playerno].diffz < 0){
									playermesh[playerno].posz += playermesh[playerno].diffz;
									//trace("hello z");
								}else if (playermesh[playerno].diffz > 0){
									playermesh[playerno].posz += playermesh[playerno].diffz;
									//trace("hello z");
								}
								//trace("x:"+diffx +"y:"+diffy +"z:"+diffz);
								//break;
								//trace("collision-" + meshno);
								//break;
							}else{
								playermesh[playerno].bdetectcollision = false;
								//FlashConnect.trace("No Collision");
								//return false;// there is no collision
							}
						}
					}
					
					//monster collision
					for (var monno:int = 0; monno < monstermodel.length; monno++) {
						for (var monbox:int = 0; monbox < monstermodel[monno].boxcollision.length; monbox++ ) {
							
							var minx3:Number = monstermodel[monno].boxcollision[monbox].minx + monstermodel[monno].posx;
							var miny3:Number = monstermodel[monno].boxcollision[monbox].miny + monstermodel[monno].posy;
							var minz3:Number = monstermodel[monno].boxcollision[monbox].minz + monstermodel[monno].posz;
							
							var maxx3:Number = monstermodel[monno].boxcollision[monbox].minx + monstermodel[monno].posx;
							var maxy3:Number = monstermodel[monno].boxcollision[monbox].miny + monstermodel[monno].posy;
							var maxz3:Number = monstermodel[monno].boxcollision[monbox].minz + monstermodel[monno].posz;
							
							
							if ((maxz >= minz3) &&
								(minz <= maxz3) &&
								(maxy >= miny3) &&
								(miny <= maxy3) &&
								(maxx >= minx3) && 
								(minx <= maxx3)
								){
								//FlashConnect.trace("Collision");	
								//return true; //there is colision
								playermesh[playerno].bdetectcollision = true;
								
								if(playermesh[playerno].diffx < 0){
									playermesh[playerno].posx += playermesh[playerno].diffx;
								}else if (playermesh[playerno].diffx > 0){
									playermesh[playerno].posx += playermesh[playerno].diffx;
								}
								
								if(playermesh[playerno].diffy < 0){
									playermesh[playerno].posy += playermesh[playerno].diffy;
								}else if (playermesh[playerno].diffy > 0){
									playermesh[playerno].posy += playermesh[playerno].diffy;
								}
								
								if(playermesh[playerno].diffz < 0){
									playermesh[playerno].posz += playermesh[playerno].diffz;
									//trace("hello z");
								}else if (playermesh[playerno].diffz > 0){
									playermesh[playerno].posz += playermesh[playerno].diffz;
									//trace("hello z");
								}
								//trace("x:"+diffx +"y:"+diffy +"z:"+diffz);
								//break;
								//trace("collision-" + meshno);
								//break;
							}else{
								playermesh[playerno].bdetectcollision = false;
								//FlashConnect.trace("No Collision");
								//return false;// there is no collision
							}
						}
					}
				}
			}
		}
		
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
		
		public function addKey(e:KeyboardEvent):void {
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
		}
		
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
			
		}
		
		private function createScene():Group{
			//var g:Group = new Group("myGroup");
			g.addChild(box);
			return g;
		}
		
	}
	
}
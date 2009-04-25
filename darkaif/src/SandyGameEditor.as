/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/

package  
{
	
	//{
	import darknet.core.collision.CollisionBox;
	import darknet.core.display.DropBoxList;
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.NumericUpDownEvent;
	import darknet.core.event.DropBoxEvent;
	import darknet.core.event.PanelEvent;
	import darkaif.core.display.ToolPanel;
	import darkaif.frame.MenuToolPanel;
	import darknet.core.display.Button;
	import darknet.core.display.DialogBox;
	import darknet.engine.sandy.entity.SActionFrame;
	import darknet.engine.sandy.entity.SAnimationSet;
	import darknet.engine.sandy.entity.SCharacter;
	import darknet.engine.sandy.entity.SMesh;
	import darknet.engine.sandy.entity.SMonster;
	import darknet.engine.sandy.entity.SNPC;
	import darknet.engine.sandy.entity.SPlayer;
	import darknet.engine.sandy.entity.SUser;
	import darknet.engine.sandy.entity.STexture;
	
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.*; 
	import flash.events.*;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldType;
	import flash.ui.*;
	import flash.utils.Timer;
	import flash.system.*;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequestMethod;
	
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
	 * @author Darknet
	 * 
	 * Information: It Depends on the camera position and angle it might clipping or not.
	 * 
	 */
	
	[SWF(width="640", height="480", backgroundColor="#FFFFFF", frameRate="30")]
	public class SandyGameEditor extends Sprite {
		
		//{ variables
		public var HEIGHT:Number = 480;
		public var WIDTH:Number = 640;
		/// {online,offline,both}  //This will depends on using local folder or site access
		public var EDITORMODE:String = 'online'; 
		//sandy engine
		public var siteaccess:String = 'http://localhost/darkaif/htdocs/'; //need full address
		public var loginurl:String = 'login.php';
		
		//public var siteaccess:String = ''; //need full address
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		
		public var scene2:Scene3D; // just one scene or the world
		public var camera2:Camera3D; //basic one cam
		public var g2:Group = new Group("myGroup2");
		
		public var scene3:Scene3D; // just one scene or the world
		public var camera3:Camera3D; //basic one cam
		public var g3:Group = new Group("myGroup3");
		
		public var imagemeshpreview:Sprite = new Sprite();
		
		//public var box:Box = new Box('player', 32, 32, 32);
		public var ground:Box = new Box('ground', 256, 8, 256);
		//{
		
		public var mapscripturl:String = 'scripts/map.php';
		public var mapname:String = 'mapdata00';
		public var mapurl:String = 'data/maps/mapdata00.xml';
		public var mapxml:XML = new XML();
		public var mapphp:XML = new XML();
		
		public var characterlistxml:XML = new XML();
		public var characterobjecturl:String = 'scripts/characterobject.php';
		public var characterlist:Vector.<SCharacter> = new Vector.<SCharacter>(); //store less information
		public var characteranimationset:Vector.<SAnimationSet> = new Vector.<SAnimationSet>();
		public var charactermesh:Vector.<SCharacter> = new Vector.<SCharacter>();
		
		public var playerfound:Boolean = false;
		
		public var player:Vector.<SPlayer> = new Vector.<SPlayer>();
		public var playerurl:String = 'data/characters/characters.xml';
		public var playerxml:XML = new XML();
		public var playermesh:Vector.<SPlayer> = new Vector.<SPlayer>();
		public var playermodel:Vector.<SPlayer> = new Vector.<SPlayer>();
		
		//{
		public var monsterurl:String = 'data/monsters/monsters.xml';
		public var monsterxml:XML = new XML();
		public var monstermesh:Vector.<SMonster> = new Vector.<SMonster>();
		public var monstermodel:Vector.<SMonster> = new Vector.<SMonster>();
		
		public var npcurl:String = 'data/npcs/npcs.xml';
		public var npcxml:XML = new XML();
		public var npcmesh:Vector.<SNPC> = new Vector.<SNPC>();
		public var npcmodel:Vector.<SNPC> = new Vector.<SNPC>();
		//}
		
		public var objecturl:String = 'scripts/datafiles.php';
		public var objectlistxml:XML;
		public var objectdataxml:XML;
		public var objectmesh:Vector.<SMesh> = new Vector.<SMesh>();
		//public var objectmesh:Array = new Array();
		public var objectmodel:Vector.<SMesh> = new Vector.<SMesh>();
		
		public var texturemesh:Vector.<STexture> = new Vector.<STexture>();
		//}
		
		public var user:Vector.<SUser> = new Vector.<SUser>();
		public var userid:SUser = new SUser();
		public var session:String = ''; //player session when time expire
		public var username:String = ''; //player name
		//public var userid:String = ''; //player id
		
		public var TEXTUREID:String = '';
		public var MESHOBJECT:String = '';
		
		public var buttonsavemap:Button = new Button('Save Map');
		public var mapfilepanel:DialogBox = new DialogBox();
		
		public var dialogbox_login:DialogBox = new DialogBox();
		
		
		public var dropbox_file:DropBoxList = new DropBoxList();
		public var dropboxlist_map:DropBoxList = new DropBoxList();
		public var dropboxlist_meshmenu:DropBoxList = new DropBoxList();
		public var dropboxlist_meshlist:DropBoxList = new DropBoxList();
		public var dialogbox_meshdata:DialogBox = new DialogBox();
		public var dialogbox_message:DialogBox = new DialogBox();
		public var dropboxlist_meshdatalistedit:DropBoxList = new DropBoxList();
		public var dropboxlist_texture:DropBoxList = new DropBoxList();
		public var dropboxlist_meshmaterial:DropBoxList = new DropBoxList();
		public var dialogbox_meshmaterial:DialogBox = new DialogBox();
		public var splayer:SPlayer = new SPlayer();
		public var mapsavexml:XML = <data/>;
		
		//{ //Control Keys
		public var Keyuparrow:int = 38;
		public var Keydownarrow:int = 40;
		public var Keyrightarrow:int = 39;
		public var Keyleftarrow:int = 37;
		public var Keyspacebar:int = 32;
		
		public var buparrow:Boolean = false;
		public var bdownarrow:Boolean = false;
		public var brightarrow:Boolean = false;
		public var bleftarrow:Boolean = false;
		public var bspacebar:Boolean = false;
		
		public var keycode_a:int = 65;
		public var keycode_b:int = 66;
		public var keycode_c:int = 67;
		public var keycode_d:int = 68;
		public var keycode_e:int = 69;
		public var keycode_f:int = 70;
		public var keycode_g:int = 71;
		public var keycode_h:int = 72;
		public var keycode_i:int = 73;
		public var keycode_j:int = 74;
		public var keycode_k:int = 75;
		public var keycode_l:int = 76;
		public var keycode_m:int = 77;
		public var keycode_n:int = 78;
		public var keycode_o:int = 79;
		public var keycode_p:int = 80;
		public var keycode_q:int = 81;
		public var keycode_r:int = 82;
		public var keycode_s:int = 83;
		public var keycode_t:int = 84;
		public var keycode_u:int = 85;
		public var keycode_v:int = 86;
		public var keycode_w:int = 87;
		public var keycode_x:int = 88;
		public var keycode_y:int = 89;
		public var keycode_z:int = 90;
		
		//}
		
		//}
		public var count:Number = 0;
		
		//MAIN CLASS
		public function SandyGameEditor() {
			stage.showDefaultContextMenu = false;
			
			splayer.playername = 'guest';
			splayer.characteridhash = 'b34c2abb8b7d4b447cc2bfbaa5eb8c5f';
			player.push(splayer);
			
			//{ Sandy Scene world
			// camera
			camera = new Camera3D(300, 300);
			camera2 = new Camera3D(128, 128);
			//trace("cam name:"+camera.name);
			//camera.z = -50;
			camera.far = 1000;
			camera.near = 0;
			camera.x = -50;
			camera.y = 100;
			camera.z = -160;
			//camera.lookAt(0, 0, 0);
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
			var root2:Group = g2;
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			scene2 = new Scene3D( "scene2", imagemeshpreview, camera2, root2 );
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			
			//loadmapurl(mapurl);
			
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			//}
			
			buttonsavemap.addEventListener(MouseEvent.CLICK, checkmapnamedatabase);
			//addChild(buttonsavemap);
			editortool();
			
			characterlisturl();
			
			tmplogin();
			
			//dialogboxlogin();
			//trace('---------------'+dropbox_file.y);
		}
		
		// This update the code and the function when every frame count is pass
		private function enterFrameHandler( event : Event ) : void {
			//count++;
			objectmodelupdate();
			//charactercheck();
			//playerupdate();
			//camera.rotateX += 0.01;
			//trace('--');
			
			//var mesh:Array = g.children;
			//for (var meshno:int = 0; meshno < mesh.length; meshno++) {
				//if (mesh[meshno].name != camera.name) {
					//mesh[meshno].rotateX ++;
					//mesh[meshno].rotateY ++;
					//mesh[meshno].rotateZ ++;
					//trace(mesh[meshno].rotateX);
				///}
			///}
			checkplayercharacter();
			playercollisionmesh();
			playermove();
			scene.render();
			
			var objectmesh2:Array = g2.children;
			
			for (var objectmesh2no:int = 0; objectmesh2no < objectmesh2.length; objectmesh2no++ ) {
				if (objectmesh2[objectmesh2no].name != camera2.name) {
					//objectmesh2[objectmesh2no].rotateX ++;
					objectmesh2[objectmesh2no].rotateY ++;
				}
			}
			
			scene2.render();
		}
		
		//create scene
		private function createScene():Group {
			return g;
		}
		
		public function cleanscene2():void {
			var objectmesh2:Array = g2.children;
			
			for (var objectmesh2no:int = 0; objectmesh2no < objectmesh2.length; objectmesh2no++ ) {
				if (objectmesh2[objectmesh2no].name != camera2.name) {
					//objectmesh2[objectmesh2no].rotateY ++;
					g2.removeChildByName(objectmesh2[objectmesh2no].name);
				}
			}
		}
		
		//=======================================
		//{ START MAP DATA
		//need to rework map saving function area
		
		//clean mesh from the scene
		public function cleanmap():void {
			//var meshscene:Array = g.children;
			var objectmove:Array = g.children
			//trace('//========================================================//');
			for (var c:int = 0; c < objectmove.length; c++) {
				//trace('object:' + objectmove[c].name);
				if (objectmove[c].name != camera.name) {//default there should be a camera (It should be number one (1) and not a letter l ='L')
					//trace('object remove-:' + objectmove[c].name);
					g.removeChildByName(objectmove[c].name);
				}
			}
		}
		
		public function cleanmapdata():void {
			/*
			objectmesh = new Vector.<SMesh>();
			objectmodel = new Vector.<SMesh>();
			
			playermesh  = new Vector.<SPlayer>();
			playermodel = new Vector.<SPlayer>();
			
			monstermesh= new Vector.<SMonster>();
			monstermodel = new Vector.<SMonster>();
			
			npcmesh = new Vector.<SNPC>();
			npcmodel= new Vector.<SNPC>();
			*/
		}
		
		//REQUEST MAP DATA XML
		//map url location to lead map data
		public function loadmapurl(mapnameurl:String):void {
			var request:URLRequest = new URLRequest(mapnameurl);
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				load.removeEventListener(Event.COMPLETE, loaddata);
				//trace(event.target.data);
				mapxml = new XML(event.target.data);
				//trace(mapxml);
				loadmapmesh();
			}	
		}
		
		//HERE THE CODE NEEDED TO BE ADDED IF HASH OR LOCAL FILE
		//load and create mesh
		public function loadmapmesh():void {
			cleanmap();
			cleanmap();
			//reload mesh character
			playerreloadmodel();
			
			objectmodel = new Vector.<SMesh>();
			
			var parserstack:ParserStack = new ParserStack();
			var count:Number = 0;
			//trace(mapxml);
			for (var meshlistno:int = 0; meshlistno < mapxml.objectlist.mesh.length(); meshlistno++ ) {
				var parser:IParser;
				var objectid:String = mapxml.objectlist.mesh[meshlistno].idobject;
				//trace("ID:" + objectid);
				if (objectid.length == 32) {
					//trace("found!");
					if (mapxml.objectlist.mesh[meshlistno].typeext == '.ase') {
						//trace('.ASE...');
						parser = Parser.create(String(siteaccess+objecturl+'?file='+ objectid), Parser.ASE); //object data
						parserstack.add(String(objectid), parser);//name file, object data
					}
				}else {
					
				}
			}
			
			if(mapxml.objectlist.mesh.length() > 0 ){
				parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
				parserstack.start();
			}
			
			//once all files are loaded
			function loaddatafile():void {
				for (var meshdatano:int = 0; meshdatano < mapxml.objectlist.mesh.length(); meshdatano++ ) {
					//trace('build mesh...');
					var bobjectfound:Boolean = false;
					var objectidname:String = mapxml.objectlist.mesh[meshdatano].idobject;
					var meshdata:SMesh = new SMesh();
					var objectname:String = mapxml.objectlist.mesh[meshdatano].name;
					var tmpshape:Shape3D;
					tmpshape = parserstack.getGroupByName(String(objectidname)).children[0] as Shape3D;
					meshdata.filedir = mapxml.objectlist.mesh[meshdatano].localdir;
					meshdata.mesh = tmpshape;
					meshdata.mesh.name = objectname;
					meshdata.idhash = objectidname;
					meshdata.name = objectname;
					meshdata.exttype =  mapxml.objectlist.mesh[meshdatano].typeext;
					//g.addChild(tmpshape);
					//COLLISION BUILD BOX
					
					//texture
					for (var texno:int = 0; texno < mapxml.objectlist.mesh[meshdatano].mat.tex.length() ; texno++) {
						var tex:STexture = new STexture();
						tex.idhash = mapxml.objectlist.mesh[meshdatano].mat.tex[texno].idhash;
						tex.name = mapxml.objectlist.mesh[meshdatano].mat.tex[texno].name;
						tex.matid = mapxml.objectlist.mesh[meshdatano].mat.tex[texno].matid;
						tex.filedir = mapxml.objectlist.mesh[meshdatano].mat.tex[texno].filedir;
						meshdata.texture.push(tex);
					}
					
					//meshdata.collision.box
					for (var boxno:int = 0; boxno < mapxml.objectlist.mesh[meshdatano].collision.box.length(); boxno++ ) {
						var cbox:CollisionBox = new CollisionBox();
						cbox.xmlconvertvar(mapxml.objectlist.mesh[meshdatano].collision.box[boxno]);
						meshdata.collison.box.push(cbox);
					}
					
					for (var objectmeshno:int = 0; objectmeshno < objectmesh.length;objectmeshno++ ) {
						if (objectmesh[objectmeshno].idhash == objectidname) {
							bobjectfound = true;
							//trace("found...");
						}
					}
					
					if(!bobjectfound){
						objectmesh.push(meshdata);
					}
				}
				//when object is finish goes here
				//buildmeshmap();
				loadtexture();
			}
			
		}
		
		public function loadtexture():void {
			//this will start loading the texture from each object id
			var queue:LoaderQueue = new LoaderQueue();
			//trace(mapxml);
			for (var meshlistno:int = 0; meshlistno < mapxml.objectlist.mesh.length(); meshlistno++ ) {
				for (var texno:int = 0; texno < mapxml.objectlist.mesh[meshlistno].mat.tex.length() ; texno++) {
					//trace(mapxml.objectlist.mesh[meshlistno].mat.tex[texno].name);
					var namecheck:String = mapxml.objectlist.mesh[meshlistno].mat.tex[texno].name;
					var filename:String = mapxml.objectlist.mesh[meshlistno].mat.tex[texno].idhash;
					if (namecheck.length) {
						//trace('There is');
						queue.add(filename, new URLRequest(siteaccess + objecturl + '?file=' + filename), "IMG" );
					}else {
						//trace('not there');
					}
					//trace(mapxml.objectlist.mesh[meshlistno].mat.tex.length());
					//trace('TEX...');
				}
			}
			
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE, loadimagecomplete );
			queue.start();
			
			//TEXTURE
			function loadimagecomplete(event:Event):void {
				for (var meshlistno:int = 0; meshlistno < mapxml.objectlist.mesh.length(); meshlistno++ ) {
					for (var texno:int = 0; texno < mapxml.objectlist.mesh[meshlistno].mat.tex.length() ; texno++) {
						//trace(mapxml.objectlist.mesh[meshlistno].mat.tex[texno].name);
						var idnamecheck:String = mapxml.objectlist.mesh[meshlistno].mat.tex[texno].idhash;
						if (idnamecheck.length) {
							//trace(idnamecheck);
							var tex:STexture = new STexture();
							//trace('There is');
							//queue.add(filename, new URLRequest(siteaccess + objecturl + '?file=' + filename), "IMG" );
							tex.idhash = mapxml.objectlist.mesh[meshlistno].mat.tex[texno].idhash;
							tex.name = mapxml.objectlist.mesh[meshlistno].mat.tex[texno].name;
							tex.bitimage = new Bitmap( queue.data[idnamecheck].bitmapData);
							tex.filedir = mapxml.objectlist.mesh[meshlistno].mat.tex[texno].filedir;
							
							var btexfound:Boolean = false;
							for (var texmeshno:int = 0; texmeshno < texturemesh.length ;texmeshno++ ) {
								if (tex.idhash  == texturemesh[texmeshno].idhash) {
									btexfound = true;
									break;
								}
							}
							
							if (!btexfound) {
								texturemesh.push(tex);
							}
						}else {
							//trace('not there');
						}
						//trace(mapxml.objectlist.mesh[meshlistno].mat.tex.length());
						//trace('TEX...');
					}
				}
				//buildmeshmap();
				TextureAssign();
			}
		}
		
		// mesh assign texture id // need to work on it // support one texture for one skin
		public function TextureAssign():void {
			for (var meshno:int = 0; meshno <  objectmesh.length ;meshno++ ) {
				for (var meshmatno:int = 0; meshmatno <  objectmesh[meshno].texture.length ;meshmatno++ ) {
					for (var texno:int = 0; texno < texturemesh.length ; texno++ ) {
						if(objectmesh[meshno].texture[meshmatno].idhash == texturemesh[texno].idhash) {
							objectmesh[meshno].texture[meshmatno].bitimage = texturemesh[texno].bitimage;
							var material:BitmapMaterial = new BitmapMaterial( objectmesh[meshno].texture[meshmatno].bitimage.bitmapData );
							material.precision = 1;
							objectmesh[meshno].mesh.appearance = new Appearance (material);
						}
					}
				}
			}
			buildmeshmap();
		}
		
		//BUILD MESH LIST INTO MAP
		//mesh build for map
		//need map edit protporties.
		public function buildmeshmap():void {
			//cleanmapdata();
			//trace('loading mesh...');
			for (var objectlistno:int = 0; objectlistno < mapxml.objects.mesh.length()  ; objectlistno++ ) {
				//trace(mapxml.objects.mesh[objectlistno].name);
				//trace(mapxml.objects.mesh[objectlistno].position.x + "]:[" + mapxml.objects.mesh[objectlistno].position.y + "]:[" + mapxml.objects.mesh[objectlistno].position.z);
				//trace(objectmesh.length);
				for (var meshno:int = 0; meshno < objectmesh.length; meshno++ ) {
					//trace("name::>" + objectmesh[meshno].name);
					if (mapxml.objects.mesh[objectlistno].name == objectmesh[meshno].name) {
						//trace('found...');
						var datamesh:SMesh = new SMesh();
						//datamesh.mesh = 
						
						datamesh.collison = objectmesh[meshno].collison;
						
						datamesh.filedir = mapxml.objects.mesh[objectlistno].localdir;
						datamesh.mesh = objectmesh[meshno].mesh.clone();
						datamesh.mesh.enableClipping = true;
						datamesh.mesh.useSingleContainer = false;
						
						datamesh.name = objectmesh[meshno].name;
						datamesh.setposition(
						mapxml.objects.mesh[objectlistno].position.x,
						mapxml.objects.mesh[objectlistno].position.y,
						mapxml.objects.mesh[objectlistno].position.z
						);
						
						datamesh.setrotation(
						mapxml.objects.mesh[objectlistno].rotation.x,
						mapxml.objects.mesh[objectlistno].rotation.y,
						mapxml.objects.mesh[objectlistno].rotation.z
						);
						
						//datamesh.mesh.x = mapxml.objects.mesh[objectlistno].position.x;
						//datamesh.mesh.y = mapxml.objects.mesh[objectlistno].position.y;
						//datamesh.mesh.z = mapxml.objects.mesh[objectlistno].position.z;
						g.addChild(datamesh.mesh);
						objectmodel.push(datamesh);
						break;
					}
				}
			}
			
			//objectmodel.push(datamesh);
			
			for (var meshmodelno:int = 0; meshmodelno < objectmodel.length; meshmodelno++) {
				trace("model box:"+objectmodel[meshmodelno].collison.box.length);
			}
			
			//loadcharacterurl();
		}
		
		//menu and data//
		//{ map menu
		
		//DROPBOX FILE MAP MENU
		//=======================================
		//show menu file list panel
		public function showfilepanel():void {
			dropbox_file.boxlist = new Array();
			dropbox_file.boxlist.push( { name:'New Map', id:'newmap' } );
			dropbox_file.boxlist.push( { name:'Load Map', id:'loadmap' } );
			dropbox_file.boxlist.push( { name:'Save Map', id:'savemap' } );
			dropbox_file.boxlist.push( { name:'Rename Map', id:'renamemap' } );
			dropbox_file.addEventListener(DropBoxEvent.SELECT,fileselectid);
			addChild(dropbox_file);
			
			function fileselectid(event:DropBoxEvent):void {
				//dropbox_file.getidname();
				//trace('selected:' + dropbox_file.getidname());
				var id:String = dropbox_file.getidname();
				
				if (id == 'newmap') {
					dialogbox_newmap();
				}
				if (id == 'loadmap') {
					mapquerylist();
				}
				if (id == 'savemap') {
					checkmapnamedatabase();
				}
				if (id == 'renamemap') {
					dialogboxrenamemap();
				}
			}
		}
		
		//DIALOGBOX NEW MAP
		public function dialogbox_newmap():void {
			var newmapimage:Sprite = new Sprite();
			var textfieldinput:TextField = new TextField();
			textfieldinput.text = 'new';
			textfieldinput.x = 14;
			textfieldinput.y = 14;
			textfieldinput.height = 14;
			var format:TextFormat = defaulttextformat();
			textfieldinput.setTextFormat(format);
			textfieldinput.type = TextFieldType.INPUT;
			textfieldinput.border = true;
			
			var buttoncreate:Button = new Button('Create');
			buttoncreate.x = 14;
			buttoncreate.y = 30;
			buttoncreate.addEventListener(MouseEvent.CLICK, clickcreatemap);
			
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 64;
			buttoncancel.y = 30;
			
			buttoncancel.addEventListener(MouseEvent.CLICK, mapfilepaneleventclose);
			function mapfilepaneleventclose(event:Event):void {
				filemappanelclose();
			}
			
			mapfilepanel.addEventListener(PanelEvent.CLOSE,filemappanelclose );
			
			newmapimage.addChild(textfieldinput);
			newmapimage.addChild(buttoncreate);
			newmapimage.addChild(buttoncancel);
			
			mapfilepanel.content(newmapimage);
			addChild(mapfilepanel);
			
			function clickcreatemap():void {
				//mapname = textfieldinput.text;
				var stringname:String = textfieldinput.text;
				if (stringname.length != 0) {
					mapname = stringname;
					cleanmap();
					cleanmap();
					cleanmap();
					//objectmodel = new Vector.<SMesh>(); //clear data from map.
					objectmodel = new Vector.<SMesh>(); //clear data from map.
					filemappanelclose();
				}else {
					//trace('null name');
				}
			}
		}
		
		//REQUEST MAP LIST
		//get map list url from user
		private function mapquerylist():void {
			var variables:URLVariables = new URLVariables();
			variables.action = 'maplist';
			variables.session = session;
			var requestmaplist:URLRequest = new URLRequest();
			var loadermaplist:URLLoader = new URLLoader();
			requestmaplist.url = siteaccess + mapscripturl;
			requestmaplist.data = variables;
			requestmaplist.method = URLRequestMethod.POST;
			//trace(requestmaplist.url);
			loadermaplist.load(requestmaplist);
			loadermaplist.addEventListener(Event.COMPLETE, mapquerylistdata);
			
			function mapquerylistdata(event:Event):void {
				loadermaplist.removeEventListener(Event.COMPLETE, mapquerylistdata);
				var maplistdata:XML = new XML(event.target.data);
				trace(maplistdata);
				//trace("list map no:"+maplistdata.map.length());
				dropboxlist_map.x = 14;
				dropboxlist_map.y = 14;
				dropboxlist_map.boxlist = new Array();
				for (var mapdatano:int = 0; mapdatano < maplistdata.map.length(); mapdatano++) {
					//trace(mapdata.map[mapdatano].name);
					dropboxlist_map.boxlist.push({name:maplistdata.map[mapdatano].name,id:maplistdata.map[mapdatano].id});
				}
				dialogboxmaploadlist();
			}
		}
		
		//DIALOGBOX MAP LIST
		//show menu load map list drop box
		private function dialogboxmaploadlist():void {
			var mapsprite:Sprite = new Sprite();
			mapfilepanel.content(mapsprite);
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 64;
			buttoncancel.y = 30;
			
			buttonload.addEventListener(MouseEvent.CLICK,loadmapselect);
			buttoncancel.addEventListener(MouseEvent.CLICK, mapfilepaneleventclose);
			function mapfilepaneleventclose(event:Event):void {
				filemappanelclose();
			}
			mapfilepanel.addEventListener(PanelEvent.CLOSE,filemappanelclose );
			
			function loadmapselect(event:Event):void {
				buttonload.removeEventListener(MouseEvent.CLICK,loadmapselect);
				//trace('mapseleted');
				//trace(dropboxlist_map.getidname());
				var mapid:String = dropboxlist_map.getidname();
				if (mapid != 'null') {
					//trace('hello');
					var variables:URLVariables = new URLVariables();
					//variables.mapname = mapname;
					variables.mapid = dropboxlist_map.getidname();
					variables.action = 'load';
					variables.session = session;
					var request:URLRequest = new URLRequest();
					var loader:URLLoader = new URLLoader();
					request.url = siteaccess+mapscripturl;
					request.data = variables;
					request.method = URLRequestMethod.POST;
					loader.load(request);
					loader.addEventListener(Event.COMPLETE, mapxmlloaddata);
					function mapxmlloaddata(event:Event):void {
						loader.removeEventListener(Event.COMPLETE, mapxmlloaddata);
						var mapdata:XML = new XML(event.target.data);
						//trace(mapdata);
						//mapxml = mapdata;
						mapxml = new XML(event.target.data);
						mapname = mapdata.name;
						trace(mapxml);
						loadmapmesh();
					}
					filemappanelclose();
				}else {
					//trace('hello null');
				}
			}
			
			mapsprite.addChild(buttonload);
			mapsprite.addChild(buttoncancel);
			mapsprite.addChild(dropboxlist_map);
			mapfilepanel.content(mapsprite);
			addChild(mapfilepanel);
		}
		
		//{ //MAP SAVE SECTION
		
		//MAP ACTION PHP
		//build map data xml //action={save,update} this will either save or update the file to mysql
		public function mapaction(actionname:String):void {
			mapsavexml = <data />;
			//trace('Object Models:'+objectmodel.length);
			var xmlname:XML = <name />;
			xmlname.appendChild(mapname);
			var xmlobjectlist:XML = <objectlist/>;
			var xmlobjects:XML = <objects/>;
			mapsavexml.appendChild(xmlname);
			
			for (var meshno:int = 0; meshno < objectmesh.length;meshno++ ) {
				//trace(objectmodel[meshmodelno].objectmapxml());
				//trace(objectmodel[meshno].objectxml());
				xmlobjectlist.appendChild(objectmesh[meshno].objectxml());
			}
			
			mapsavexml.appendChild(xmlobjectlist);
			
			for (var meshmodelno:int = 0; meshmodelno < objectmodel.length;meshmodelno++ ) {
				//trace(objectmodel[meshmodelno].objectmapxml());
				//trace(objectmodel[meshmodelno].objectxml());
				xmlobjects.appendChild(objectmodel[meshmodelno].objectmapxml());
			}
			
			mapsavexml.appendChild(xmlobjects);
			
			//trace("========");
			//trace(mapsavexml);
			//trace("========");
			
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			var variables:URLVariables = new URLVariables();
			
			variables.mapname = mapname;
			//variables.action = 'save';
			//actionname
			variables.action = actionname;
			variables.mapdata = mapsavexml.toXMLString();
			variables.session = session;
			request.url = siteaccess+mapscripturl;
			//request.contentType = "text/xml";
			//request.data = mapsavexml.toXMLString();
			request.method = URLRequestMethod.POST;
			request.data = variables;
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, checkmapaction);
			filemappanelclose();
			
			function checkmapaction(event:Event = null):void {
				var dataxml:XML = new XML(event.target.data);
				//trace(event.target.data);
				//FlashConnect.trace(dataxml);
				if (dataxml == 'save') {
					
				}
			}
		}
		
		//PHP SCRIPTS REQUEST MAP NAME
		//check map name to php at mysql database
		public function checkmapnamedatabase(event:Event = null):void {
			var variables:URLVariables = new URLVariables();
			variables.mapname = mapname;
			variables.session = session;
			//variables.mapname = 'test object';
			//test object
			variables.action = 'check';
			var request:URLRequest = new URLRequest();
			var loader:URLLoader = new URLLoader();
			request.url = siteaccess+mapscripturl;
			request.data = variables;
			request.method = URLRequestMethod.POST;
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, checkmapnamedata);
			
			function checkmapnamedata(event:Event = null):void {
				var dataxml:XML = new XML(event.target.data);
				//FlashConnect.trace(dataxml);
				//trace("[" + dataxml.message + "]");
				//addChild(mapfilepanel);
				if (dataxml.message == 'existmap') {//if map exist go here
					dialogboxmapexist();
					//trace('hello map exist');
				}else if(dataxml.message == 'newmap'){
					dialogboxmapsave();
				}
			}
		}
		
		//DIALOGBOX EXIST SAVE MAP
		//save map and update php script
		public function dialogboxmapexist():void {
			//trace('exist');
			var filesavesprite:Sprite = new Sprite();
			var buttonsavemap:Button = new Button('Save');
			var buttoncanelmap:Button = new Button('Cancel');
			var textfield:TextField = new TextField();
			textfield.text = 'Update Map?';
			var format:TextFormat = defaulttextformat();
			textfield.height = 14;
			textfield.setTextFormat(format);
			textfield.x = 14;
			textfield.y = 14;
			
			buttonsavemap.x = 14;
			buttonsavemap.y = 30;
			buttoncanelmap.x = 49;
			buttoncanelmap.y = 30;
			
			filesavesprite.addChild(buttoncanelmap);
			filesavesprite.addChild(buttonsavemap);
			mapfilepanel.x = 64;
			mapfilepanel.y = 64;
			
			buttonsavemap.addEventListener(MouseEvent.CLICK, mapdataactionupdate);
			buttoncanelmap.addEventListener(MouseEvent.CLICK, mapfilepaneleventclose);
			function mapfilepaneleventclose(event:Event):void {
				filemappanelclose();
			}
			mapfilepanel.addEventListener(PanelEvent.CLOSE,filemappanelclose );
			
			function mapdataactionupdate(event:Event = null):void {
				//trace('update...');
				mapaction('update');
			}
			
			mapfilepanel.x = (WIDTH/ 2) - (mapfilepanel.width/2);
			mapfilepanel.y = (HEIGHT/ 2) - (mapfilepanel.height / 2);
			
			mapfilepanel.content(filesavesprite);
			filesavesprite.addChild(textfield);
			addChild(mapfilepanel);
		}
		
		//DIALOGBOX SAVE MAP
		//save map and php add to database
		public function dialogboxmapsave():void {
			//trace('save');
			var filesavesprite:Sprite = new Sprite();
			var buttonsavemap:Button = new Button('Save');
			var buttoncanelmap:Button = new Button('Cancel');
			var textfield:TextField = new TextField();
			var format:TextFormat = defaulttextformat();
			textfield.text = 'Save New Map?';
			textfield.setTextFormat(format);
			textfield.height = 14;
			
			textfield.x = 14;
			textfield.y = 14;
			buttonsavemap.x = 14;
			buttonsavemap.y = 30;
			buttoncanelmap.x = 49;
			buttoncanelmap.y = 30;
			
			mapfilepanel.x = 64;
			mapfilepanel.y = 64;
			
			mapfilepanel.x = (WIDTH/ 2) - (mapfilepanel.width/2);
			mapfilepanel.y = (HEIGHT/ 2) - (mapfilepanel.height / 2);
			
			//trace("stage width:x"+width+"height:y"+height)
			//trace("width:x" + mapfilepanel.x + " y:" + mapfilepanel.y);
			
			buttonsavemap.addEventListener(MouseEvent.CLICK, mapdataactionsave);
			buttoncanelmap.addEventListener(MouseEvent.CLICK, mapfilepaneleventclose);
			function mapfilepaneleventclose(event:Event):void {
				filemappanelclose();
			}
			mapfilepanel.addEventListener(PanelEvent.CLOSE,filemappanelclose );
			
			function mapdataactionsave(event:Event = null):void {
				mapaction('save');
			}
			
			filesavesprite.addChild(buttonsavemap);
			filesavesprite.addChild(textfield);
			filesavesprite.addChild(buttoncanelmap);
			mapfilepanel.content(filesavesprite);
			addChild(mapfilepanel);
		}
		
		//} //END MAP SAVE SECTION
		
		//DIALOGBOX CLOSE MAP
		//remove dialog file menu panel
		public function filemappanelclose(event:PanelEvent = null):void {
			//textbox.text = dropbox.getboxname(); 
			//trace(String(event.actionpanel));
			//mapfilepanel.removeEventListener(MouseEvent.CLICK, filemappanelclose);
			mapfilepanel.removeEventListener(PanelEvent.CLOSE, filemappanelclose);
			removeChild(mapfilepanel);
		}
		
		//DIALOGBOX RENAME MAP
		//rename map dialog
		public function dialogboxrenamemap():void {
			var mapsprite:Sprite = new Sprite();
			var textfieldinput:TextField = new TextField();
			textfieldinput.x = 14;
			textfieldinput.y = 14;
			textfieldinput.type = TextFieldType.INPUT;
			textfieldinput.border = true;
			textfieldinput.text = mapname;
			textfieldinput.height = 14;
			var format:TextFormat = defaulttextformat();
			textfieldinput.setTextFormat(format);
			
			var buttonrename:Button = new Button('Rename');
			buttonrename.x = 14;
			buttonrename.y = 30;
			
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 64;
			buttoncancel.y = 30;
			
			buttonrename.addEventListener(MouseEvent.CLICK,renamemap);
			buttoncancel.addEventListener(MouseEvent.CLICK, mapfilepaneleventclose);
			function mapfilepaneleventclose(event:Event):void {
				filemappanelclose();
			}
			mapfilepanel.addEventListener(PanelEvent.CLOSE,filemappanelclose );
			
			mapsprite.addChild(buttonrename);
			mapsprite.addChild(buttoncancel);
			mapsprite.addChild(textfieldinput);
			
			//mapfilepanel.addEventListener(PanelEvent.ACTION, mapsavepanelclose);
			mapfilepanel.content(mapsprite);
			addChild(mapfilepanel);
			
			function renamemap(event:Event):void {
				var stringname:String = textfieldinput.text;
				if ((stringname == null) || (stringname.length == 0)) {
					//trace('null map name');
				}else {
					mapname = textfieldinput.text;
					filemappanelclose();
				}
			}
			
			function cancelmapname(event:Event):void {
				var stringname:String = textfieldinput.text;
				if ((stringname == null) || (stringname.length == 0)) {
					//trace('null map name');
				}else {
					filemappanelclose();
				}
			}
			
		}
		
		//} //end menu map
		//} // END MAP
		//=======================================
		
		//=======================================
		//{ OBJECT MESH AND MODEL MAP DATA
		
		//update model data for editor
		public function objectmodelupdate():void {
			for (var objectmodelno:int = 0; objectmodelno < objectmodel.length; objectmodelno++ ) {
				objectmodel[objectmodelno].update();
			}
			
			for (var playerno:int = 0; playerno < playermodel.length;playerno++ ) {
				playermodel[playerno].update();
			}
		}
		
		//menu list object mesh/model/texture
		public function filemeshobjectpanel():void {
			dropboxlist_meshmenu.x = 128;
			dropboxlist_meshmenu.clearlist();
			dropboxlist_meshmenu.addlist( { name:'Load Object', id:'loadobject' } );
			dropboxlist_meshmenu.addlist( { name:'Textures', id:'textures' } );
			dropboxlist_meshmenu.addlist( { name:'Mesh Object', id:'meshobject' } );
			dropboxlist_meshmenu.addlist( { name:'Model Object',id:'modelobject' } );
			dropboxlist_meshmenu.addlist( { name:'AnimMesh Object', id:'animmeshobject' });
			dropboxlist_meshmenu.addEventListener(DropBoxEvent.SELECT,dropboxlist_meshselect);
			addChild(dropboxlist_meshmenu);
			
			function dropboxlist_meshselect(event:DropBoxEvent):void {
				//trace('selected');
				var stringname:String =  dropboxlist_meshmenu.getidname();
				if (stringname == 'loadobject') {
					meshlisturl();
				}
				
				if (stringname == 'textures') {
					dialogboxtextureid();
				}
				
				if (stringname == 'meshobject') {
				dialogbox_meshobjectlist();
				}
				
				if (stringname == 'modelobject') {
					dialogbox_modeldatalist();
				}
			}
		}
		
		//load mesh data from site MESH / ANIMATION MESH / TEXTURE URL LIST DATA
		public function meshlisturl():void {
			var request:URLRequest = new URLRequest(siteaccess+objecturl);
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				//trace(event.target.data);
				objectlistxml = new XML(event.target.data);
				meshdataload();
			}	
		}
		
		//make list objects MESH / ANIMATION MESH / TEXTURE
		public function meshdataload(event:Event = null):void {
			//trace(event.target.data);
			//objectlistxml
			dropboxlist_meshlist.clearlist();
			for (var objectno:int = 0; objectno < objectlistxml.file.length(); objectno++ ) {
				//trace(objectlistxml.file[objectno].name);
				dropboxlist_meshlist.boxlist.push({name:objectlistxml.file[objectno].name,id:objectlistxml.file[objectno].idobject});
			}
			dialogboxloadmeshdata();
		}
		
		// DIALOGBOX MESH / ANIMATION MESH / TEXTURE LIST show mesh object name for loading into the map data store
		public function dialogboxloadmeshdata():void {
			//dialogbox_meshdataid
			//trace("load mesh......");
			dialogbox_meshdata._pheight = 64;
			dialogbox_meshdata._pwidth = 128;
			var meshdatapanel:Sprite = new Sprite();
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 50;
			buttoncancel.y = 30;
			dialogbox_meshdata.x = 32;
			dialogbox_meshdata.y = 32;
			dropboxlist_meshlist.x = 14;
			dropboxlist_meshlist.y = 14;
			//dropboxlist_meshlist.addEventListener(DropBoxEvent.SELECT, loadobjectmesh);
			
			meshdatapanel.addChild(buttonload);
			meshdatapanel.addChild(buttoncancel);
			meshdatapanel.addChild(dropboxlist_meshlist);
			dialogbox_meshdata.content(meshdatapanel);
			//dropbox_file.addEventListener(DropBoxEvent.SELECT,fileselectid);
			buttonload.addEventListener(MouseEvent.CLICK, loadobjectmesh);
			
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogbox_mouseclick);
			function dialogbox_mouseclick(event:Event):void {
				dialogbox_meshdataclose();
			}
			
			dialogbox_meshdata.addEventListener(PanelEvent.CLOSE, dialogbox_meshdataclose);
			addChild(dialogbox_meshdata);
		}
		
		//file id MESH / ANIMATION MESH / TEXTURE LOADING FILES
		public function loadobjectmesh(event:Event):void {
			dialogbox_meshdataclose();
			//trace(dropboxlist_meshlist.getidname());
			//objectlistxml
			for (var objectno:int = 0; objectno < objectlistxml.file.length();objectno++) {
				if (dropboxlist_meshlist.getidname() == objectlistxml.file[objectno].idobject) {
					//trace('FOUND ID FOR LOADING');
					//trace(objectlistxml.file[objectno].type+"]]]");
					if (objectlistxml.file[objectno].type == '.ase') {
						loadobjectfile_ase(objectlistxml.file[objectno].idobject);
					}
					
					if (imagecheckext(objectlistxml.file[objectno].type)) {
						loadobjectfile_image(objectlistxml.file[objectno].idobject);
					}
					
				}
			}
		}
		
		//IMAGE CHECK EXT.
		public function imagecheckext(ext:String):Boolean {
			var bext:Boolean = false;
			var extimage:Array = new Array('.jpg', '.png', '.gif','.bmp');
			for (var imgextno:int = 0; imgextno < extimage.length ; imgextno++) {
				if (extimage[imgextno] == ext) {
					bext = true;
					break;
				}
			}
			if (bext) {
				//trace('found...')
				return true;
			}else {
				//trace('not there...');
				return false;
			}
		}
		
		//ASE Mesh object loader
		public function loadobjectfile_ase(filename:String):void {
			var parserstack:ParserStack = new ParserStack();
			var objectname:String = 'ase';
			//file access url
			var parser:IParser = Parser.create(String(siteaccess+objecturl+'?file='+filename), Parser.ASE );
			parserstack.add(String(objectname), parser);
			parserstack.addEventListener(ParserStack.COMPLETE,loaddatafile);
			parserstack.start();
			var dataobject:SMesh = new SMesh();
			//dataobject.mesh
			dataobject.mesh
			
			function loaddatafile():void {
				//var :SMesh = new SMesh();
				var meshobject:SMesh = new SMesh();
				var tmpshape:Shape3D;
				//tmpshape = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				for (var meshxmlno:int = 0; meshxmlno < objectlistxml.file.length(); meshxmlno++) {
					//trace(objectlistxml);
					if (objectlistxml.file[meshxmlno].idobject == filename) {
						meshobject.exttype = objectlistxml.file[meshxmlno].type;
						trace("loading..."+objectlistxml.file[meshxmlno].typeext );
						//meshobject.filedir = objectlistxml.file[meshxmlno].localdir;
						meshobject.name = objectlistxml.file[meshxmlno].name
						//trace('id found!');
						break;
					}
				}
				
				meshobject.idhash = filename;
				meshobject.mesh = parserstack.getGroupByName(String(objectname)).children[0] as Shape3D; 
				//g.addChild(meshobject.mesh);
				g2.addChild(meshobject.mesh);
				//g.addChild(tmpshape);
				var bobjectfound:Boolean = false;
				for (var objectmeshno:int = 0; objectmeshno < objectmesh.length;objectmeshno++) {
					if (objectmesh[objectmeshno].idhash == filename) {
						bobjectfound = true;
					}
				}
				
				if(!bobjectfound){
					objectmesh.push(meshobject);
				}
				
				dialogbox_meshdataid(meshobject.idhash);
				//trace("COUNT MESH:" + objectmesh.length);
				//drawframemeshpreview();
				//addChild(imagemeshpreview);
			}
		}
		
		//TEXTURE DATA LOADED FILES
		public function loadobjectfile_image(filename:String):void {
			var queue:LoaderQueue = new LoaderQueue();
			//queue.add( "demonSkin", new URLRequest("data/models/Skindemon.jpg"), "IMG" );
			queue.add(filename, new URLRequest(siteaccess + objecturl + '?file=' + filename), "IMG" );
			
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE, loadimagecomplete );
			queue.start();
			
			//var textureimage0:STexture = new STexture();
			//textureimage0.idhash
			
			function loadimagecomplete(event:Event):void {
				//trace('texture loaded...');
				var textureimage:STexture = new STexture();
				textureimage.idhash = filename;
				textureimage.bitimage = new Bitmap( queue.data[filename].bitmapData);
				
				for (var objectno:int = 0; objectno < objectlistxml.file.length(); objectno++) {
					if (objectlistxml.file[objectno].idobject == filename) {
						textureimage.name = objectlistxml.file[objectno].name;
					}
				}
				
				var bobjectfound:Boolean = false;
				for (var textureno:int = 0; textureno < texturemesh.length; textureno++) {
					if (texturemesh[textureno].idhash == filename) {
						bobjectfound = true;
					}
				}
				
				//trace("text no."+texturemesh.length);
				if(!bobjectfound){
					texturemesh.push(textureimage);
					dialogboxtextureid(textureimage.idhash);
				}
				
				//addChild(textureimage.bitimage);
			}
		}
		
		//MESH EDIT OBJECT DATA FOR STORE
		//set id mesh to show
		public function dialogbox_meshdataid(meshid:String):void {
			cleanscene2();
			var format:TextFormat = defaulttextformat();
			//drawframemeshpreview();
			var objectdataimage:Sprite = new Sprite();
			var objecteditimage:Sprite = new Sprite();
			
			var objecteditpanel:Sprite = new Sprite();
			var dropbox_dataedit:DropBoxList = new DropBoxList();
			dropbox_dataedit.x = 128;
			dropbox_dataedit.y = 14;
			dropbox_dataedit.clearlist();
			dropbox_dataedit.addlist( { name:'Data', id:'meshdata' } );
			dropbox_dataedit.addlist( { name:'Textures', id:'textures' } );
			dropbox_dataedit.addlist( { name:'Collisions', id:'collisions' } );
			dropbox_dataedit.addlist( { name:'Preview', id:'preview' } );
			dropbox_dataedit.addlist( { name:'Animation', id:'animation' } );
			
			dropbox_dataedit.addEventListener(DropBoxEvent.SELECT, selecteditdata)
			function selecteditdata(event:DropBoxEvent):void {
				if (dropbox_dataedit._idname == 'meshdata') {
					loaddata();
				}
				
				if (dropbox_dataedit._idname == 'textures') {
					showmeshtextures();
				}
				
				if (dropbox_dataedit._idname == 'collisions') {
					showmeshcollision();
				}
				
				if (dropbox_dataedit._idname == 'preview') {
					
				}
				
				if (dropbox_dataedit._idname == 'animation') {
					
				}
				
				
			}
			
			dialogbox_meshdata._pheight = 256;
			dialogbox_meshdata._pwidth = 256;
			
			var meshdata:SMesh = new SMesh();
			for (var objectmeshno:int = 0; objectmeshno < objectmesh.length; objectmeshno ++ ) {
				if(objectmesh[objectmeshno].idhash == meshid){
					meshdata = objectmesh[objectmeshno];
					break;
				}
			}
			g2.addChild(meshdata.mesh);
			
			//OBJECT NAME TEXT
			var textobjectname:TextField = new TextField();
			textobjectname.text = meshdata.name;
			textobjectname.setTextFormat(format);
			textobjectname.selectable = false;
			
			var buttonmeshdata:Button = new Button("Data");//not sure base on xml create object
			var buttonmeshaddscene:Button = new Button("Add Scene");//error on clone same id
			var buttonmeshtexturedata:Button = new Button("Textures");
			var buttonmeshcollisiondata:Button = new Button("Collisions");
			var buttonmeshanimationdata:Button = new Button("Animations");//this is later
			
			//buttonmeshdata.x = 128;
			buttonmeshaddscene.x = 128;
			buttonmeshaddscene.y = 0;
			//buttonmeshtexturedata.x = 128;
			//buttonmeshtexturedata.y = 14 * 2;
			//buttonmeshcollisiondata.x = 128;
			//buttonmeshcollisiondata.y = 14 * 3;
			//buttonmeshanimationdata.x = 128;
			//buttonmeshanimationdata.y = 14 * 4;
			
			//var loader:URLLoader = new URLLoader();
			//loader.
			
			buttonmeshdata.addEventListener(MouseEvent.CLICK,loaddata);
			
			function loaddata(event:Event=null):void {
				cleaneditimage();
				
				var buttonloaddata:Button = new Button('Load Data');
				buttonloaddata.x = 0;
				buttonloaddata.y = 14*5;
				var buttonsavedata:Button = new Button('Save Data');
				buttonsavedata.x = 64;
				buttonsavedata.y = 14*5;
				
				buttonsavedata.addEventListener(MouseEvent.CLICK, saveobject);	
				
				function saveobject(event:Event):void {
					cleaneditimage();
					var variables:URLVariables = new URLVariables();
					variables.meshdata = meshdata.objectxml();
					variables.action = 'save';
					variables.file = meshdata.idhash;
					var request:URLRequest = new URLRequest(siteaccess + objecturl);
					request.data = variables;
					request.method = URLRequestMethod.POST;
					var load:URLLoader = new URLLoader();
					load.load(request);
					load.addEventListener(Event.COMPLETE, loaddata);
					function loaddata(event:Event):void {
						//trace(event.target.data);
						//objectlistxml = new XML(event.target.data);
						//meshdataload();
					}	
				}
				
				buttonloaddata.addEventListener(MouseEvent.CLICK, loadobject);
				
				function loadobject(event:Event):void {
					cleaneditimage();
					var variables:URLVariables = new URLVariables();
					variables.meshdata = meshdata.objectxml();
					variables.datatype = 'xmldata';
					variables.file = meshdata.idhash;
					var request:URLRequest = new URLRequest(siteaccess + objecturl);
					request.data = variables;
					request.method = URLRequestMethod.POST;
					var load:URLLoader = new URLLoader();
					load.load(request);
					load.addEventListener(Event.COMPLETE, loaddata);
					function loaddata(event:Event):void {
						//trace(event.target.data);
						var objxml:XML = new XML(event.target.data);
						meshdata.objxmlconvertdata(objxml);
						//objectlistxml = new XML(event.target.data);
						//meshdataload();
					}	
				}
				
				objecteditimage.addChild(buttonloaddata);
				objecteditimage.addChild(buttonsavedata);
			}
			
			buttonmeshaddscene.addEventListener(MouseEvent.CLICK, addmeshscene);
			
			function addmeshscene(event:Event=null):void {
				meshdata_addscene(meshid);
			}
			
			buttonmeshcollisiondata.addEventListener(MouseEvent.CLICK, showmeshcollision);
			
			//COLLISION EDIT OPTIONS
			function showmeshcollision(event:Event=null):void {
				cleaneditimage();
				var buttoncreatebox:Button = new Button('Create Box');
				buttoncreatebox.x = 168;
				var buttoncreateeditbox:Button = new Button('Edit Box');
				buttoncreateeditbox.x = 110;
				
				dropboxlist_meshdatalistedit.boxlist = new Array();
				for (var collisionno:int = 0; collisionno < meshdata.collison.box.length; collisionno++) {
					// meshdata.collison.box.length
					dropboxlist_meshdatalistedit.boxlist.push( { name:collisionno,id:collisionno} );
				}
				
				//dropboxlist_meshdatalistedit.addEventListener(DropBoxEvent.SELECT, selectboxid);
				buttoncreateeditbox.addEventListener(MouseEvent.CLICK, selectboxid);
				function selectboxid(event:Event):void {
					var idno:Number = Number( dropboxlist_meshdatalistedit.getidname());
					//trace(idno);
					if(dropboxlist_meshdatalistedit.getidname() != 'null'){
						createcollision(meshdata.collison.box[idno]);
					}
				}
				
				buttoncreatebox.addEventListener(MouseEvent.CLICK, createbox);
				//create box and push to mesh class
				function createbox(event:Event):void {
					var collisionbox:CollisionBox = new CollisionBox();
					createcollision(collisionbox);
					meshdata.collison.box.push(collisionbox);
				}
				objecteditimage.addChild(buttoncreateeditbox);
				objecteditimage.addChild(buttoncreatebox);
				objecteditimage.addChild(dropboxlist_meshdatalistedit)
			}
			
			buttonmeshtexturedata.addEventListener(MouseEvent.CLICK, showmeshtextures);
			
			//TEXTURE EDIT OPTIONS
			function showmeshtextures(event:Event=null):void {
				cleaneditimage();
				//trace('-----||---');
				var buttonedittex:Button = new Button('Edit Tex');
				buttonedittex.x = 110;
				
				var buttoncreatetex:Button = new Button('Create Tex');
				buttoncreatetex.x = 170;
				
				for (var editno:int = 0; editno < objecteditimage.numChildren;editno++ ) {
					objecteditimage.removeChildAt(editno);
				}
				
				dropboxlist_meshdatalistedit.boxlist = new Array();
				for (var textureno:int = 0; textureno < meshdata.texture.length; textureno++) {
					// meshdata.collison.box.length
					dropboxlist_meshdatalistedit.boxlist.push( { name:meshdata.texture[textureno].name,id:meshdata.texture[textureno].idhash} );
				}
				
				//dropboxlist_meshdatalistedit.addEventListener(DropBoxEvent.SELECT, selectboxid);
				buttonedittex.addEventListener(MouseEvent.CLICK, selectboxid);
				
				function selectboxid(event:Event):void {
					var idno:String = dropboxlist_meshdatalistedit.getidname();
					for (var meshidno:int = 0; meshidno < meshdata.texture.length ;meshidno++ ) {
						if (meshdata.texture[meshidno].idhash == idno) {
							//trace('found...')
							//meshmaterialid(meshdata.texture[meshidno]);
							meshmaterialid(meshdata.texture[meshidno]);
							break;
						}
					}
				}
				
				buttoncreatetex.addEventListener(MouseEvent.CLICK, createtexture);
				//dropboxlist_meshdatalistedit
				
				objecteditimage.addChild(buttonedittex);
				objecteditimage.addChild(buttoncreatetex);
				objecteditimage.addChild(dropboxlist_meshdatalistedit)
			}
			
			//SELECT TEXTURE FOR MESH TO SET MATERIAL
			function meshmaterialid(tex:STexture):void {
				//var textfield:TextField = new TextField();
				//textfield.height = 14;
				//textfield.
				
				var nummatid:NumericUpDown = new NumericUpDown();
				nummatid.x = 180;
				nummatid.y = 14 * 2;
				nummatid.valuenumber = tex.matid;
				nummatid.addEventListener(NumericUpDownEvent.VALUE,setmatid);
				
				var buttonsettex:Button = new Button('Set');
				buttonsettex.x = 106;
				buttonsettex.y = 14 * 2;
				var buttondeletetex:Button = new Button('Delete');
				buttondeletetex.x = 135;
				buttondeletetex.y = 14 * 2;
				
				dropboxlist_meshmaterial.boxlist = new Array();
				dropboxlist_meshmaterial.y = 14 * 2;
				for (var meshmatno:int = 0; meshmatno < texturemesh.length  ; meshmatno++ ) {
					dropboxlist_meshmaterial.boxlist.push({name:texturemesh[meshmatno].name,id:texturemesh[meshmatno].idhash});
				}
				
				//dropboxlist_meshmaterial.addEventListener(DropBoxEvent.SELECT, selecttex);
				//need work on assign texture once it selected for preview
				buttonsettex.addEventListener(MouseEvent.CLICK, selecttex);
				function selecttex(event:Event):void {
					dropboxlist_meshmaterial.getidname();
					for (var meshmattexno:int = 0; meshmattexno < texturemesh.length  ; meshmattexno++ ) {
						if (dropboxlist_meshmaterial.getidname() == texturemesh[meshmattexno].idhash) {
							for (var ntexno:int = 0; ntexno < meshdata.texture.length ; ntexno++) {
								if(meshdata.texture[ntexno].idhash == tex.idhash) {
									meshdata.texture[ntexno].idhash = texturemesh[meshmattexno].idhash;
									meshdata.texture[ntexno].name = texturemesh[meshmattexno].name;
									meshdata.texture[ntexno].filedir = texturemesh[meshmattexno].filedir;
									meshdata.texture[ntexno].bitimage = texturemesh[meshmattexno].bitimage;
									break;
								}
							}
							break;
						}
					}
					//cleaneditimage();
				}
				
				//this will just delete array from class object mesh
				//does not remove from skin that need restart but save before restart.
				//code need to be rework for this
				buttondeletetex.addEventListener(MouseEvent.CLICK, deletetex);
				
				function deletetex(event:Event):void {
					for (var ntexno:int = 0; ntexno < meshdata.texture.length ; ntexno++) {
						if (meshdata.texture[ntexno].idhash == tex.idhash) {
							//trace('DELETE:'+tex.idhash);
							meshdata.texture.splice(ntexno, 1);
							break;
						}
					}
					cleaneditimage();
				}
				
				function setmatid(event:NumericUpDownEvent):void {
					for (var ntexno:int = 0; ntexno < meshdata.texture.length ; ntexno++) {
						if (meshdata.texture[ntexno].idhash == tex.idhash) {
							meshdata.texture[ntexno].matid = event.number;
							//trace('DELETE:'+tex.idhash);
							//meshdata.texture.splice(ntexno, 1);
							//break;
						}
					}
					//cleaneditimage();
				}
				
				objecteditimage.addChild(nummatid);
				objecteditimage.addChild(buttonsettex);
				objecteditimage.addChild(buttondeletetex);
				objecteditimage.addChild(dropboxlist_meshmaterial);
				//dialogbox_meshmaterial
			}
			
			//Create and push class to texture mesh class
			function createtexture(event:Event):void {
				var tex:STexture = new STexture();
				creatematerail(tex);
				meshdata.texture.push(tex);
			}
			
			//Create material mesh list for assign texture to mesh
			function creatematerail(tex:STexture):void {
				//dropboxlist_meshmaterial
				//trace('chow text...');
				dropboxlist_meshmaterial.boxlist = new Array();
				for (var matno:int = 0; matno < texturemesh.length; matno++ ){
					dropboxlist_meshmaterial.boxlist.push( { name:texturemesh[matno].name, id:texturemesh[matno].idhash } );
				}
				dropboxlist_meshmaterial.addEventListener(DropBoxEvent.SELECT, matidselected);
				
				function matidselected(event:DropBoxEvent):void {
					var namestr:String = dropboxlist_meshmaterial.getidname();
					for (var idno:int = 0; idno < texturemesh.length; idno++ ) {
						tex.idhash = texturemesh[idno].idhash;
						tex.name = texturemesh[idno].name;
						tex.filedir = texturemesh[idno].filedir;
						tex.bitimage = texturemesh[idno].bitimage;
					}
				}
				
				dropboxlist_meshmaterial.y = 14 * 2;
				
				objecteditimage.addChild(dropboxlist_meshmaterial);
				//objecteditimage.addChild(numposz);
			}
			
			//array class update read time vars
			//COLLISION BOX
			function createcollision(box:CollisionBox):void {
				
				dialogbox_meshdata.actionpanel = 'show';
				var format:TextFormat = defaulttextformat();
				
				var textfieldcollision:TextField = new TextField();
				textfieldcollision.height = 14;
				textfieldcollision.y = 14 * 2;
				textfieldcollision.text = 'Collision Box:';
				textfieldcollision.setTextFormat(format);
				var textboxheight:TextField = new TextField();
				textboxheight.height = 14;
				textboxheight.text = 'Height:';
				textboxheight.y = 14 * 3;
				textboxheight.setTextFormat(format);
				var textboxlength:TextField = new TextField();
				textboxlength.height = 14;
				textboxlength.text = 'Length:';
				textboxlength.y = 14 * 4;
				textboxlength.setTextFormat(format);
				var textboxwidth:TextField = new TextField();
				textboxwidth.height = 14;
				textboxwidth.text = 'Width:';
				textboxwidth.y = 14 * 5;
				textboxwidth.setTextFormat(format);
				
				var textboxposx:TextField = new TextField();
				textboxposx.height = 14;
				textboxposx.text = 'pos.x:';
				textboxposx.y = 14 * 7;
				textboxposx.setTextFormat(format);
				
				var textboxposy:TextField = new TextField();
				textboxposy.height = 14;
				textboxposy.text = 'pos.y:';
				textboxposy.y = 14 * 8;
				textboxposy.setTextFormat(format);
				
				var textboxposz:TextField = new TextField();
				textboxposz.height = 14;
				textboxposz.text = 'pos.z:';
				textboxposz.y = 14 * 9;
				textboxposz.setTextFormat(format);
				
				var numheight:NumericUpDown = new NumericUpDown();
				numheight.x = 64;
				numheight.y = 14 * 3;
				//trace(box.height);
				numheight.valuenumber = box.height;
				var numlength:NumericUpDown = new NumericUpDown();
				numlength.x = 64;
				numlength.y = 14 * 4;
				numlength.valuenumber = box.length;
				var numwidth:NumericUpDown = new NumericUpDown();
				numwidth.x = 64;
				numwidth.y = 14 * 5;
				numwidth.valuenumber = box.width;
				var numposx:NumericUpDown = new NumericUpDown();
				numposx.x = 64;
				numposx.y = 14 * 7;
				numposx.valuenumber = box.x;
				var numposy:NumericUpDown = new NumericUpDown();
				numposy.x = 64;
				numposy.y = 14 * 8;
				numposy.valuenumber = box.y;
				var numposz:NumericUpDown = new NumericUpDown();
				numposz.x = 64;
				numposz.y = 14 * 9;
				numposz.valuenumber = box.z;
				
				numheight.addEventListener(NumericUpDownEvent.VALUE, changenumheight);
				function changenumheight(event:NumericUpDownEvent):void {
					box.height = numheight.currentnumber;//box.height = event.number;//trace("event number:"+event.numberchange);//trace("box height:"+box.height);//trace(event.number);
				}
				
				numlength.addEventListener(NumericUpDownEvent.VALUE, changenumlength);
				function changenumlength(event:NumericUpDownEvent):void {
					box.length = numlength.currentnumber;
					//trace("box height:"+box.height);
				}
				
				numwidth.addEventListener(NumericUpDownEvent.VALUE, changenumwidth);
				function changenumwidth(event:NumericUpDownEvent):void {
					box.width = numwidth.currentnumber;
					//trace("box height:"+box.height);
				}
				numposx.addEventListener(NumericUpDownEvent.VALUE, changeposx);
				function changeposx(event:NumericUpDownEvent):void {
					box.x = numposx.currentnumber;
				}
				numposy.addEventListener(NumericUpDownEvent.VALUE, changeposy);
				function changeposy(event:NumericUpDownEvent):void {
					box.y = numposy.currentnumber;
				}
				numposz.addEventListener(NumericUpDownEvent.VALUE, changeposz);
				function changeposz(event:NumericUpDownEvent):void {
					box.z = numposz.currentnumber;
				}
				var buttondelbox:Button = new Button('Del. Box');
				buttondelbox.y = 14 * 10;
				buttondelbox.addEventListener(MouseEvent.CLICK, deletebox);
				function deletebox(event:Event):void {
					for (var boxno:int = 0; boxno < meshdata.collison.box.length; boxno++) {
						//if box matches the class remove it
						if (meshdata.collison.box[boxno] == box) {
							//trace('Box Col. Found.');
							meshdata.collison.box.splice(boxno, 1);
							break;
						}
					}
					cleaneditimage();
				}
				
				objecteditimage.addChild(buttondelbox);
				
				objecteditimage.addChild(textfieldcollision);
				objecteditimage.addChild(textboxheight);
				objecteditimage.addChild(textboxlength);
				objecteditimage.addChild(textboxwidth);
				objecteditimage.addChild(textboxposx);
				objecteditimage.addChild(textboxposy);
				objecteditimage.addChild(textboxposz);
				
				objecteditimage.addChild(numheight);
				objecteditimage.addChild(numlength);
				objecteditimage.addChild(numwidth);
				
				objecteditimage.addChild(numposx);
				objecteditimage.addChild(numposy);
				objecteditimage.addChild(numposz);
			}
			
			//clean sprite from background
			function cleaneditimage():void {
				while (objecteditimage.numChildren) {
					for (var childno:int = 0; childno < objecteditimage.numChildren; childno++) {
						objecteditimage.removeChildAt(childno);
					}
				}
			}
			
			objecteditimage.y = 14 * 6;
			objecteditpanel.y = 14 * 7;
			imagemeshpreview.x = 0;
			imagemeshpreview.y = 0;
			
			//trace("imagemeshpreview:"+imagemeshpreview.y)
			
			objectdataimage.addChild(objecteditpanel);
			objectdataimage.addChild(objecteditimage);
			//objectdataimage.addChild(buttonmeshdata);
			objectdataimage.addChild(buttonmeshaddscene);
			//objectdataimage.addChild(buttonmeshtexturedata);
			//objectdataimage.addChild(buttonmeshcollisiondata);
			//objectdataimage.addChild(buttonmeshanimationdata);
			objectdataimage.addChild(imagemeshpreview);
			
			objectdataimage.addChild(textobjectname);
			objectdataimage.addChild(dropbox_dataedit);
			
			
			dialogbox_meshdata.content(objectdataimage);
			dialogbox_meshdata.addEventListener(PanelEvent.CLOSE, dialogbox_meshdataclose);
			addChild(dialogbox_meshdata);
		}
		
		//DIALOGBOX MODEL LIST
		public function dialogbox_modeldatalist():void {
			var modeldataimage:Sprite = new Sprite();
			dialogbox_meshdata._pheight = 64;
			dialogbox_meshdata._pwidth = 128;
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			buttonload.addEventListener(MouseEvent.CLICK, modeldataselectid);
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 50;
			buttoncancel.y = 30;
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogbox_clickclose);
			
			function dialogbox_clickclose(event:Event):void {
				dialogbox_meshdataclose();
			}
			
			dropboxlist_meshlist.x = 14;
			dropboxlist_meshlist.y = 14;
			
			dropboxlist_meshlist.boxlist = new Array();
			for (var objectno:int = 0; objectno < objectmodel.length; objectno++ ) {
				//trace(objectmodel[objectno].mesh.name);
				dropboxlist_meshlist.boxlist.push({name:objectmodel[objectno].name + "_" + objectmodel[objectno].mesh.name,id:objectmodel[objectno].mesh.name});
			}
			modeldataimage.addChild(buttonload);
			modeldataimage.addChild(buttoncancel);
			modeldataimage.addChild(dropboxlist_meshlist);
			
			//dropboxlist_meshlist.addEventListener(DropBoxEvent.SELECT,dropboxlist_meshselect);
			
			dialogbox_meshdata.content(modeldataimage);
			dialogbox_meshdata.addEventListener(PanelEvent.CLOSE, dialogbox_meshdataclose);
			addChild(dialogbox_meshdata);
			
			function modeldataselectid(event:Event):void {
				//trace("[:]" + dropboxlist_meshlist.getidname());
				var idmodel:String = dropboxlist_meshlist.getidname();
				dialogbox_meshdataclose();
				modeldataid(idmodel);
			}
		}
		
		//DIALOGBOX EDIT MODEL OBJECT DATA 
		//object model id for data control
		public function modeldataid(meshid:String):void {
			//trace('LOADED...');
			var modeldataimage:Sprite = new Sprite();
			var format:TextFormat = defaulttextformat();
			
			var meshdata:SMesh = new SMesh();
			for (var objectmeshno:int = 0; objectmeshno < objectmodel.length; objectmeshno ++ ) {
				if(objectmodel[objectmeshno].mesh.name == meshid){
					meshdata = objectmodel[objectmeshno];
					//meshdata.mesh = objectmesh[objectmeshno].mesh.clone();
					//g.addChild(meshdata.mesh);
					//objectmodel.push(meshdata);
					//trace("found:"+meshdata.name);
					break;
				}
			}
			
			var textfieldinputpos:TextField = new TextField();
			textfieldinputpos.height = 14;
			textfieldinputpos.text = '1';
			textfieldinputpos.setTextFormat(format);
			textfieldinputpos.border = true;
			textfieldinputpos.type = TextFieldType.INPUT;
			textfieldinputpos.y = 14*1
			
			var textfieldinputrot:TextField = new TextField();
			textfieldinputrot.text = '1';
			textfieldinputrot.height = 14;
			textfieldinputrot.border = true;
			textfieldinputrot.setTextFormat(format);
			textfieldinputrot.type = TextFieldType.INPUT;
			textfieldinputrot.y = 14 * 5;
			
			var textfieldobjectname:TextField = new TextField();
			var textfieldposx:TextField = new TextField();
			textfieldposx.text = 'posx';
			textfieldposx.selectable = false;
			textfieldposx.setTextFormat(format);
			textfieldposx.height = 14;
			textfieldposx.y = 14 * 2;
			var textfieldposy:TextField = new TextField();
			textfieldposy.text = 'posy';
			textfieldposy.selectable = false;
			textfieldposy.setTextFormat(format);
			textfieldposy.height = 14;
			textfieldposy.y = 14 * 3;
			var textfieldposz:TextField = new TextField();
			textfieldposz.text = 'posz';
			textfieldposz.selectable = false;
			textfieldposz.setTextFormat(format);
			textfieldposz.height = 14;
			textfieldposz.y = 14 * 4;
			
			var textfieldrotx:TextField = new TextField();
			textfieldrotx.text = 'rotx';
			textfieldrotx.selectable = false;
			textfieldrotx.setTextFormat(format);
			textfieldrotx.height = 14;
			textfieldrotx.y = 14 * 6;
			
			//{ROTATION
			var numrotx:NumericUpDown = new NumericUpDown();
			numrotx.x = 30;
			numrotx.y = 14 * 6;
			numrotx.valuenumber = meshdata.rotation.x;
			numrotx.addEventListener(NumericUpDownEvent.VALUE, numrotxchnage);
			numrotx.addEventListener(NumericUpDownEvent.ENTER, numrotxchnage);
			function numrotxchnage(event:NumericUpDownEvent):void {
				meshdata.rotation.x = numrotx.valuenumber;
			}
			
			var textfieldroty:TextField = new TextField();
			textfieldroty.text = 'roty';
			textfieldroty.height = 14;
			textfieldroty.selectable = false;
			textfieldroty.setTextFormat(format);
			textfieldroty.y = 14 * 7;
			
			var numroty:NumericUpDown = new NumericUpDown();
			numroty.x = 30;
			numroty.y = 14 * 7;
			numroty.valuenumber = meshdata.rotation.y;
			numroty.addEventListener(NumericUpDownEvent.VALUE, numrotychnage);
			numroty.addEventListener(NumericUpDownEvent.ENTER, numrotychnage);
			function numrotychnage(event:NumericUpDownEvent):void {
				meshdata.rotation.y = numroty.valuenumber;
			}
			
			var textfieldrotz:TextField = new TextField();
			textfieldrotz.text = 'rotz';
			textfieldrotz.height = 14;
			textfieldrotz.selectable = false;
			textfieldrotz.setTextFormat(format);
			textfieldrotz.y = 14 * 8;
			
			var numrotz:NumericUpDown = new NumericUpDown();
			numrotz.x = 30;
			numrotz.y = 14 * 8;
			numrotz.valuenumber = meshdata.rotation.z;
			numrotz.addEventListener(NumericUpDownEvent.VALUE, numrotzchnage);
			numrotz.addEventListener(NumericUpDownEvent.ENTER, numrotzchnage);
			function numrotzchnage(event:NumericUpDownEvent):void {
				meshdata.rotation.z = numrotz.valuenumber;
			}
			//}
			textfieldobjectname.text = "Name:" + meshdata.name+"_"+meshdata.mesh.name;
			textfieldobjectname.selectable = false;
			textfieldobjectname.height = 14;
			textfieldobjectname.setTextFormat(format);
			//{POSITION
			var numposx:NumericUpDown = new NumericUpDown();
			numposx.x = 30;
			numposx.y = 14 * 2;
			numposx.valuenumber = meshdata.x;
			numposx.addEventListener(NumericUpDownEvent.VALUE, numposxchnage);
			numposx.addEventListener(NumericUpDownEvent.ENTER, numposxchnage);
			function numposxchnage(event:NumericUpDownEvent):void {
				meshdata.x = numposx.valuenumber;
			}
			
			var numposy:NumericUpDown = new NumericUpDown();
			numposy.x = 30;
			numposy.y = 14 * 3;
			
			numposy.valuenumber = meshdata.y;
			numposy.addEventListener(NumericUpDownEvent.VALUE, numposychnage);
			numposy.addEventListener(NumericUpDownEvent.ENTER, numposychnage);
			function numposychnage(event:NumericUpDownEvent):void {
				meshdata.y = numposy.valuenumber;
			}
			
			var numposz:NumericUpDown = new NumericUpDown();
			numposz.x = 30;
			numposz.y = 14 * 4;
			
			numposz.valuenumber = meshdata.z;
			numposz.addEventListener(NumericUpDownEvent.VALUE, numposzchnage);
			numposz.addEventListener(NumericUpDownEvent.ENTER, numposzchnage);
			function numposzchnage(event:NumericUpDownEvent):void {
				meshdata.z = numposz.valuenumber;
			}
			//}
			
			var buttondeleteobject:Button = new Button('Delete Object');
			buttondeleteobject.y = 14*10;
			buttondeleteobject.addEventListener(MouseEvent.CLICK, deletesceneobjectmesh);
			
			var buttonload:Button = new Button('Ok');
			buttonload.x = 14;
			buttonload.y = 14 * 12;
			buttonload.addEventListener(MouseEvent.CLICK, dialogbox_clickclose);
			function dialogbox_clickclose(even:Event):void {
				dialogbox_meshdataclose();
			}
			
			//buttonload.addEventListener(MouseEvent.CLICK, modeldataselectid);
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 50;
			buttoncancel.y = 14*11;
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogbox_clickclose);
			
			dropboxlist_meshlist.x = 14;
			dropboxlist_meshlist.y = 14;
			
			modeldataimage.addChild(textfieldinputpos);
			modeldataimage.addChild(textfieldinputrot);
			
			modeldataimage.addChild(textfieldobjectname);
			modeldataimage.addChild(textfieldposx);
			modeldataimage.addChild(textfieldposy);
			modeldataimage.addChild(textfieldposz);
			
			modeldataimage.addChild(textfieldrotx);
			modeldataimage.addChild(textfieldroty);
			modeldataimage.addChild(textfieldrotz);
			
			modeldataimage.addChild(numposx);
			modeldataimage.addChild(numposy);
			modeldataimage.addChild(numposz);
			
			modeldataimage.addChild(numrotx);
			modeldataimage.addChild(numroty);
			modeldataimage.addChild(numrotz);
			
			modeldataimage.addChild(buttondeleteobject);
			
			modeldataimage.addChild(buttonload);
			//modeldataimage.addChild(buttoncancel);
			dialogbox_meshdata.content(modeldataimage);
			dialogbox_meshdata._pheight = 200;
			addChild(dialogbox_meshdata);
			
			function posinput():Number {
				var posnumber:String = textfieldinputpos.text;
				var num:Number = 1;
				num = Number(posnumber);
				if (num) {
					//trace('there');
					return num;
				}else {
					//trace('nope');
					return 1;
				}
			}
			
			function rotinput():Number {
				var posnumber:String = textfieldinputrot.text;
				var num:Number = 1;
				num = Number(posnumber);
				if (num) {
					//trace('there');
					return num;
				}else {
					//trace('nope');
					return 1;
				}
			}
			
			function deletesceneobjectmesh():void {
				//trace(objectmodel.length);
				for (var objectno:int = 0; objectno < objectmodel.length; objectno++ ) {
					if (meshdata.mesh.name == objectmodel[objectno].mesh.name) {
						g.removeChildByName(objectmodel[objectno].mesh.name);
						//trace(objectmodel[objectno].mesh.name);
						//dropboxlist_meshlist.boxlist.push({name:objectmodel[objectno].name + "_" + objectmodel[objectno].mesh.name,id:objectmodel[objectno].mesh.name});
						//objectmodel[objectno].mesh.name
						//objectmodel.splice(1, objectno);
						//delete current index, delete number of classes
						objectmodel.splice(objectno,1);
					}
				}
				//trace(objectmodel.length);
				
			}
		}
		
		//clone and added to the scene.
		public function meshdata_addscene(meshid:String):void {
			var meshdata:SMesh = new SMesh();
			for (var objectmeshno:int = 0; objectmeshno < objectmesh.length; objectmeshno ++ ) {
				if(objectmesh[objectmeshno].idhash == meshid){
					meshdata = objectmesh[objectmeshno];
					meshdata.mesh = objectmesh[objectmeshno].mesh.clone();
					g.addChild(meshdata.mesh);
					objectmodel.push(meshdata);
					//trace(meshdata.name);
					break;
				}
			}
		}
		
		//close and remove child from parent
		public function dialogbox_meshdataclose(event:PanelEvent = null):void {	
			trace('close dialogbox...');
			dialogbox_meshdata.removeEventListener(PanelEvent.CLOSE, dialogbox_meshdataclose);
			removeChild(dialogbox_meshdata);
		}
		
		//DRAW BACKGROUND SCENE imagemeshpreview sprite
		public function drawframemeshpreview():void {
			imagemeshpreview.graphics.clear();
			imagemeshpreview.graphics.beginFill(0x999999);
			imagemeshpreview.graphics.drawRect(0, 0, 128, 128);
			imagemeshpreview.graphics.endFill();
		}
		
		//{ //START store mesh object section
		public function dialogbox_meshobjectlist():void {
			var meshdatapanel:Sprite = new Sprite();
			dialogbox_meshdata._pheight = 64;
			dialogbox_meshdata._pwidth = 128;
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 50;
			buttoncancel.y = 30;
			dropboxlist_meshlist.x = 14;
			dropboxlist_meshlist.y = 14;
			
			dropboxlist_meshlist.boxlist = new Array();
			for (var objectno:int = 0; objectno < objectmesh.length; objectno++ ) {
				//trace(objectmesh[objectno].name);
				//trace(objectmesh[objectno].idhash);
				dropboxlist_meshlist.boxlist.push({name:objectmesh[objectno].name,id:objectmesh[objectno].idhash});
			}
			
			buttonload.addEventListener(MouseEvent.CLICK,meshobjectselect);
			
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogbox_clickclose);
			function dialogbox_clickclose(event:Event):void {
				dialogbox_meshdataclose();
			}
			dialogbox_meshdata.addEventListener(PanelEvent.CLOSE, dialogbox_meshdataclose);
			
			meshdatapanel.addChild(buttonload);
			meshdatapanel.addChild(buttoncancel);
			meshdatapanel.addChild(dropboxlist_meshlist);
			
			dialogbox_meshdata.content(meshdatapanel);
			addChild(dialogbox_meshdata);
			
			function meshobjectselect():void {
				//trace(dropboxlist_meshlist.getidname());
				if ((dropboxlist_meshlist.getidname() != 'null')) {
					//trace("selected........");
					//modeldataid(dropboxlist_meshlist.getidname());
					dialogbox_meshdataid(dropboxlist_meshlist.getidname())
				}
			}
			
		}
		
		//} //END store mesh object section
		
		//}
		//=======================================
		
		//=======================================
		//{ //START TEXTURE DATA
		
		//DIALOGBOX TEXTURE LIST
		public function dialogboxtexturelist():void {
			var meshdatapanel:Sprite = new Sprite();
			var buttonload:Button = new Button('Load');
			buttonload.x = 14;
			buttonload.y = 30;
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 50;
			buttoncancel.y = 30;
			
			dropboxlist_meshlist.boxlist = new Array();
			for (var objectno:int = 0; objectno < texturemesh.length; objectno++ ) {
				//trace(texturemesh[objectno].name); //trace(texturemesh[objectno].idhash);
				dropboxlist_meshlist.boxlist.push({name:texturemesh[objectno].name,id:texturemesh[objectno].idhash});
			}
			
			buttonload.addEventListener(MouseEvent.CLICK, textureselected);
			buttoncancel.addEventListener(MouseEvent.CLICK, dialogbox_meshdataclose);
			
			function textureselected(event:Event):void {
				//dialogbox_meshdataclose();
				var idstr:String = dropboxlist_meshlist.getidname();
				dialogboxtextureid(idstr);
			}
			
			meshdatapanel.addChild(buttonload);
			meshdatapanel.addChild(buttoncancel);
			meshdatapanel.addChild(dropboxlist_meshlist);
			dialogbox_meshdata.content(meshdatapanel);
			addChild(dialogbox_meshdata);
		}
		
		//[======  DIALOGBOX TEXTURE IDHASH
		public function dialogboxtextureid(id:String = null):void {
			cleanscene2();
			drawframemeshpreview();
			var meshdatapanel:Sprite = new Sprite();
			var format:TextFormat = defaulttextformat();
			var texturedata:STexture = new STexture();
			//var buttonclose:Button = new Button('close');
			for (var texno:int = 0; texno < texturemesh.length;texno++) {
				if (texturemesh[texno].idhash == id) {
					texturedata = texturemesh[texno];
				}
			}
			texno = 0;
			dropboxlist_texture.boxlist = new Array();
			for (texno = 0; texno < texturemesh.length; texno++) {
				dropboxlist_texture.boxlist.push({name:texturemesh[texno].name,id:texturemesh[texno].idhash});
			}
			
			dropboxlist_texture.x = 0;
			dropboxlist_texture.y = 0;
			
			var textimagename:TextField = new TextField();
			textimagename.text = texturedata.name;
			textimagename.height = 14;
			textimagename.selectable = false;
			textimagename.setTextFormat(format);
			
			var textureplane:Shape3D = new Plane3D('texture', 200, 200, 1, 1, Plane3D.YZ_ALIGNED, 'quad');
			textureplane.enableBackFaceCulling = false;
			if(texturedata.bitimage != null){
				textureplane.appearance = new Appearance (new BitmapMaterial( texturedata.bitimage.bitmapData ));
			}
			//addChild(texturedata.bitimage);
			g2.addChild(textureplane);
			imagemeshpreview.y = 14*2;
			
			//buttonclose.x = 50;
			//buttonclose.y = 14 * 14;
			textimagename.y = 14 * 1;
			
			//buttonclose.addEventListener(MouseEvent.CLICK, dialogbox_mouseclick);
			//function dialogbox_mouseclick(event:Event):void {
			//	dialogbox_meshdataclose();
			///}
			
			dropboxlist_texture.addEventListener(DropBoxEvent.SELECT, applytexture);
			//var materail:BitmapMaterial = new BitmapMaterial( texturemesh[matno].bitimage.bitmapData );
			//materail.precision = 1;
			function applytexture(event:DropBoxEvent):void {
				var strname:String = dropboxlist_texture.getidname();
				for (var matno:int = 0; matno < texturemesh.length; matno++ ) {
					if (texturemesh[matno].idhash == strname) {
						//need to clean and create every time else error on bitmapData
						cleanscene2();
						var textureplane2:Shape3D = new Plane3D('texture', 200, 200, 1, 1, Plane3D.YZ_ALIGNED, 'quad');
						textureplane2.enableBackFaceCulling = false;
						var materail:BitmapMaterial = new BitmapMaterial( texturemesh[matno].bitimage.bitmapData );
						materail.precision = 1;//fix bend texture
						textureplane2.appearance = new Appearance (materail);
						
						g2.addChild(textureplane2);
					}
				}
			}
			
			dialogbox_meshdata.addEventListener(PanelEvent.CLOSE, dialogbox_meshdataclose);
			
			//meshdatapanel.addChild(buttonclose);
			meshdatapanel.addChild(textimagename);
			meshdatapanel.addChild(imagemeshpreview);
			meshdatapanel.addChild(dropboxlist_texture);
			dialogbox_meshdata._pheight = 188;
			dialogbox_meshdata._pwidth = 128;
			dialogbox_meshdata.content(meshdatapanel);
			addChild(dialogbox_meshdata);
		}
		
		//} //END TEXTURE DATA
		//=======================================
		
		//=======================================
		//{ // Character/player Data
		//get character list from url list database
		public function characterlisturl():void {
			/*
			 * Information: This will not load all the character just list 
			 * of names if match it being to load one file each time.
			 */
			
			//trace('init.char...');
			var urlrequest:URLRequest = new URLRequest(siteaccess+characterobjecturl);
			var urlloader:URLLoader = new URLLoader(urlrequest);
			urlloader.addEventListener(Event.COMPLETE, initdata)
			
			function initdata(event:Event):void {
				//trace(event.target.data);
				characterlistxml = new XML(event.target.data);
				creatcharacterlist();
			}
		}
		
		//create character list this will check if character matches.
		public function creatcharacterlist():void {
			for (var charno:int = 0; charno < characterlistxml.character.length();charno++) {
				var schar:SCharacter = new SCharacter();
				schar.name = characterlistxml.character[charno].name;
				schar.idhash = characterlistxml.character[charno].idhash;
				characterlist.push(schar);
			}
			//trace('...');
			characternameidload('b34c2abb8b7d4b447cc2bfbaa5eb8c5f');
		}
		
		//load character animation mesh
		public function characternameidload(stridname:String):void {
			//trace('init..chardata...');
			var bcharfound:Boolean = false;
			for (var charno:int = 0; charno < charactermesh.length; charno++) {
				if (charactermesh[charno].idhash == stridname) {
					//trace(charactermesh[charno].idhash);
					bcharfound = true;
					break;
				}
			}
			
			if (!bcharfound == false) {
				//trace('found...');
			}else{
				//trace('not found...');
				var variables:URLVariables = new URLVariables();
				variables.idhash = stridname;
				variables.action = 'load';
				var urlrequest:URLRequest = new URLRequest();
				urlrequest.data = variables;
				urlrequest.url = siteaccess + characterobjecturl;
				urlrequest.method = URLRequestMethod.POST;
				var urlloader:URLLoader = new URLLoader();
				urlloader.load(urlrequest);
				//urlrequest
				urlloader.addEventListener(Event.COMPLETE, initdata)
				
				function initdata(event:Event):void {
					//trace("data char:"+event.target.data);
					//character
					//trace('character frame loaded...');
					loadanimationmeshset(new XML(event.target.data));
				}
			}
		}
		
		//character animationset mesh
		public function loadanimationmeshset(objectxml:XML):void {
			var sanimset:SAnimationSet = new SAnimationSet();
			sanimset.mesh
			//trace('init...mesh load...');
			var schar:SCharacter = new SCharacter();
			schar.name = objectxml.character.name;
			schar.idhash = objectxml.character.idhash;
			
			var queue:LoaderQueue = new LoaderQueue();
			//trace("XML===="+objectxml.character.animationset.mesh.length());
			for (var animmeshno:int = 0; animmeshno < objectxml.character.animationset.mesh.length(); animmeshno++) {
				var strfile:String = objectxml.character.animationset.mesh[animmeshno].idhash
				var nameurlobject:String  = siteaccess + objecturl + '?file=' +strfile;
				//trace(nameurlobject);
				if(strfile.length){
					queue.add(String(strfile), new URLRequest(String(nameurlobject)), "BIN" );
				}
			}
			
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE,loadcharactercomplete);
			queue.start();
			//var action:SActionFrame = new SActionFrame();
			//action.savexmldata();
			
			function loadcharactercomplete():void {
				for (var animmeshsetno:int = 0; animmeshsetno < objectxml.character.animationset.mesh.length(); animmeshsetno++) {
					var sanimset:SAnimationSet = new SAnimationSet();
					var strfileloaded:String = objectxml.character.animationset.mesh[animmeshsetno].idhash;
					//trace(strfileloaded);
					if(strfileloaded.length){
						//var animmd2:MD2  = new MD2 (String(strfileloaded), queue.data[strfileloaded], 1);
						sanimset.mesh = new MD2 (String(strfileloaded), queue.data[strfileloaded], 1);
						sanimset.idhash = strfileloaded;
						//trace("number actions:" + objectxml.character.animationset.mesh[animmeshsetno].actionset.action.length())
						//create action set from frame index's
						for (var actionno:int = 0; actionno < objectxml.character.animationset.mesh[animmeshsetno].actionset.action.length(); actionno++) {
							var action:SActionFrame = new SActionFrame();
							action.readxmldata(objectxml.character.animationset.mesh[animmeshsetno].actionset.action[actionno]);
							sanimset.actionframe.push(action);
						}
						//g.addChild(animmd2);
						schar.meshs.push(sanimset);
					}
				}
				//character mesh with animationset
				charactermesh.push(schar);
				//trace('Char...:'+charactermesh.length);
			}
		}
		
		//this will find one player and it exit it
		public function checkplayercharacter():void {
			//trace('...'+player.length);
			if(!playerfound){
			//check if player by list to be shown in game
			for (var playerno:int = 0; playerno < player.length;playerno++ ) {
				var bplayerfound:Boolean = false;
				//if player is found do not add
				for (var playermodelno:int = 0; playermodelno < playermodel.length  ;playermodelno++) {
					if (bplayerfound == playermodel[playermodelno].playername) {
						bplayerfound = true;
					}
				}
				
				//if player not found add to scene
				if (!bplayerfound) {
					//player[playerno].characteridhash
					//trace('finding...');
					for (var charactermeshno:int = 0; charactermeshno < charactermesh.length; charactermeshno++ ) {
						//trace(charactermesh[charactermeshno].idhash+"ID CHAR");
						if (charactermesh[charactermeshno].idhash == player[playerno].characteridhash) {
							var splayer:SPlayer = new SPlayer();
							splayer.playername = player[playerno].playername;
							//trace('found...');
							for (var charmeshno:int = 0; charmeshno < charactermesh[charactermeshno].meshs.length; charmeshno++) {
								var sanimset:SAnimationSet = new SAnimationSet();
								
								//sanimset.actionframe = charactermesh[charactermeshno].meshs[charmeshno].actionframe;
								//trace("clone action:" + charactermesh[charactermeshno].meshs[charmeshno].actionframe.length)
								sanimset.actionframe = charactermesh[charactermeshno].meshs[charmeshno].actionframe;
								
								sanimset.mesh = charactermesh[charactermeshno].meshs[charmeshno].mesh.clone() as MD2;
								//trace('actionindex no:' + charactermesh[charactermeshno].meshs[charmeshno].actionframe.length);
								
								g.addChild(sanimset.mesh);
								splayer.meshs.push(sanimset);
							}
							playerfound = true;
							playermodel.push(splayer);
							break;
						}
					}
				}else {
					//trace('FOUND++>');
				}
			}
			}
		}
		
		//control one player for movement control
		public function playermove():void {
			//splayer
			for (var playerno:int = 0; playerno < playermodel.length; playerno++ ) {
				if (playermodel[playerno].playername == splayer.playername) {
					//trace('found...');
					var bwalkx:Boolean = false;
					var bwalkz:Boolean = false;
					if (buparrow) {
						playermodel[playerno].movedirz = 1;
						playermodel[playerno].framename = 'walk';
						bwalkz = true;
					}else if (bdownarrow) {
						playermodel[playerno].movedirz = -1;
						playermodel[playerno].framename = 'walk';
						bwalkz = true;
					}else {
						//playermodel[playerno].framename = 'stand';
						playermodel[playerno].movedirz = 0;
						bwalkz = false;
					}
					
					if (brightarrow) {
						playermodel[playerno].movedirx = 1;
						playermodel[playerno].framename = 'walk';
						camera.x += 1;
						bwalkx = true;
					}else if (bleftarrow) {
						playermodel[playerno].movedirx = -1;
						playermodel[playerno].framename = 'walk';
						camera.x -= 1;
						bwalkx = true;
					}else{
						playermodel[playerno].movedirx = 0;
						bwalkx = false;
					}
					
					if ((bwalkx == false)&&((bwalkz == false)) ){
						playermodel[playerno].framename = 'stand';
					}
					
					camera.x = playermodel[playerno].x - 100;
					camera.y = playermodel[playerno].y + 100;
					camera.z = playermodel[playerno].z - 200;
				}
			}
		}
		
		//collision mesh
		public function playercollisionmesh():void {
			for (var playerno:int = 0; playerno < playermodel.length; playerno++ ) {
				//playermodel[playerno].intersetmesh
				for (var meshno:int = 0; meshno < objectmodel.length; meshno++ ) {
					//trace("main: " + objectmodel[meshno].x+':'+ objectmodel[meshno].y+':'+ objectmodel[meshno].z);
					
					playermodel[playerno].intersetbox(objectmodel[meshno]);
					playermodel[playerno].groundcollisionmesh(objectmodel[meshno]);
					//trace(meshno);
				}
			}
		}
		
		//THIS WILL RE-ADD TO THE SCENE FOR CHARACTER MESH
		public function playerreloadmodel():void {
			for (var charno:int = 0; charno < playermodel.length; charno++ ) {
				//trace("box:"+playermodel[charno].collison.box.length);
				for (var charmeshno:int = 0; charmeshno < playermodel[charno].meshs.length; charmeshno++) {
					//playermodel[charno].meshs[charmeshno].mesh
					playermodel[charno].x = 0;
					playermodel[charno].y = 0;
					playermodel[charno].z = 0;
					g.addChild(playermodel[charno].meshs[charmeshno].mesh);
				}
			}
		}
		
		
		//}
		//=======================================
		
		//=======================================
		//{ // START HUD/GUI
		
		//DIALOGBOX LOGIN
		public function dialogboxlogin():void {
			var panel:Sprite = new Sprite();
			dialogbox_login.textname = 'Login Panel';
			var format:TextFormat = defaulttextformat();
			//{ TEXTFIELD
			var text_username:TextField = new TextField();
			text_username.text = 'User:';
			text_username.height = 14;
			text_username.selectable = false;
			text_username.setTextFormat(format);
			var text_password:TextField = new TextField();
			text_password.text = 'Pass:';
			text_password.height = 14;
			text_password.selectable = false;
			text_password.setTextFormat(format);
			text_password.y = 14;
			
			var input_username:TextField = new TextField();
			input_username.text = 'guest';
			input_username.type = TextFieldType.INPUT;
			input_username.height = 16;
			input_username.width = 70;
			//input_username.selectable = false;
			input_username.border = true;
			input_username.setTextFormat(format);
			input_username.x = 45;
			input_username.y = 0;
			//input_username.text
			var input_password:TextField = new TextField();
			input_password.text = 'guest';
			input_password.type = TextFieldType.INPUT;
			input_password.height = 16;
			input_password.width = 70;
			input_password.border = true;
			//input_password.selectable = false;
			input_password.setTextFormat(format);
			input_password.x = 45;
			input_password.y = 14;
			//}
			var buttonlogin:Button = new Button('Login');
			buttonlogin.x = 14;
			buttonlogin.y = 14 * 2;
			buttonlogin.addEventListener(MouseEvent.CLICK, clicklogin);
			
			function clicklogin(event:Event):void {
				var user:URLVariables = new URLVariables();
				user.username = input_username.text;
				user.password = input_password.text;
				user.sumbit = 'sumbit';
				var request:URLRequest = new URLRequest();
				request.url = siteaccess + loginurl;
				request.data = user;
				request.method = URLRequestMethod.POST;
				var loader:URLLoader = new URLLoader();
				loader.load(request);
				loader.addEventListener(Event.COMPLETE, querylogin);
			}
			
			function querylogin(event:Event):void {
				//trace("==" + event.target.data);
				
				var userdataxml:XML = new XML(event.target.data);
				if (userdataxml.message == 'pass') {
					//trace(userdataxml.username);
					username = userdataxml.username;
					session = userdataxml.session;
					//trace('session:'+session);
					dialogboxloginclose();
				}
			}
			
			var buttoncancel:Button = new Button('Cancel');
			buttoncancel.x = 60;
			buttoncancel.y = 14 * 2;
			
			panel.addChild(text_username);
			panel.addChild(text_password);
			panel.addChild(input_username);
			panel.addChild(input_password);
			panel.addChild(buttonlogin);
			panel.addChild(buttoncancel);
			dialogbox_login.content(panel);
			addChild(dialogbox_login);
		}
		//remove dialogbox login
		public function dialogboxloginclose():void {
			removeChild(dialogbox_login);
		}
		
		public function dialogboxmessageclose(event:Event):void {
			dialogbox_message.removeEventListener(MouseEvent.CLICK, dialogboxmessageclose);
			removeChild(dialogbox_message);
		}
		
		public function defaulttextformat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			//format.color = 0xF5F5F5;
			return format;
		}
		
		public function editortool():void {
			//mapfilepanel.addEventListener(PanelCloseEvent.CHANGE, mapsavepanelclose);
			showfilepanel();
			filemeshobjectpanel();
		}
		
		public function tmplogin(event:Event = null):void {
			var user:URLVariables = new URLVariables();
			user.username = 'guest';
			user.password = 'guest';
			user.sumbit = 'sumbit';
			var request:URLRequest = new URLRequest();
			request.url = siteaccess + loginurl;
			request.data = user;
			request.method = URLRequestMethod.POST;
			var loader:URLLoader = new URLLoader();
			loader.load(request);
			loader.addEventListener(Event.COMPLETE, querylogin);
			function querylogin(event:Event):void {
				//trace("==" + event.target.data);
				
				var userdataxml:XML = new XML(event.target.data);
				if (userdataxml.message == 'pass') {
					//trace(userdataxml.username);
					username = userdataxml.username;
					session = userdataxml.session;
					trace('session:'+session);
				}
			}
		}
		
		//} // End HUD/GUI
		//=======================================
		
		//=======================================
		//{ //Control
		//keyboard press down
		
		public function addKey(e:KeyboardEvent):void {
			
			/*
			for (var playerno:int = 0; playerno < playermodel.length; playerno++) {
				if(userid.playername == playermodel[playerno].playername){
					if (e.keyCode == 38) {//up
						playermodel[playerno].z += 1;
					}
					if (e.keyCode == 40) {//down
						playermodel[playerno].z -= 1;
					}
					if (e.keyCode == 39) {//right
						playermodel[playerno].x += 1;
					}
					if (e.keyCode == 37) {//left
						playermodel[playerno].x -= 1;
					}
					
					//camera.x = playermodel[playerno].x - 150;
					//camera.z = playermodel[playerno].z - 150;
					camera.x = playermodel[playerno].x - 50;
					camera.y = playermodel[playerno].y + 100;
					camera.z = playermodel[playerno].z - 160;
				}
			}
			*/
			
			if (e.keyCode == Keyuparrow) {//up
				buparrow = true;
			}
			
			if (e.keyCode == Keydownarrow) {//up
				bdownarrow= true;
			}
			if (e.keyCode == Keyrightarrow) {//up
				brightarrow= true;
			}
			if (e.keyCode == Keyleftarrow) {//up
				bleftarrow = true;
			}
			
			
			/*
			if (e.keyCode == 38) {//up
				camera.z += 1;
			}
			if (e.keyCode == 40) {//down
				camera.z -= 1;
			}
			if (e.keyCode == 39) {//right
				camera.x += 1;
			}
			if (e.keyCode == 37) {//left
				camera.x -= 1;
			}
			*/
		}
		
		//keyboard release up
		public function removeKey(e:KeyboardEvent):void {
			if (e.keyCode == Keyuparrow) {//up
				buparrow = false;
			}
			
			if (e.keyCode == Keydownarrow) {//up
				bdownarrow= false;
			}
			if (e.keyCode == Keyrightarrow) {//up
				brightarrow= false;
			}
			if (e.keyCode == Keyleftarrow) {//up
				bleftarrow = false;
			}
		}
		
		//} //end control
		//=======================================
	}
	
}
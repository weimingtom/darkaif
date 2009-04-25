package  
{
	//{
	import darknet.core.display.Button;
	import darknet.core.display.DialogBox;
	import darknet.core.display.DropBoxList;
	import darknet.core.event.DropBoxEvent;
	import darknet.core.event.PanelEvent;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.filters.GlowFilter;
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
	import flash.utils.setTimeout;
	
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
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	//[SWF(width = "640", height = "480", backgroundColor = "#FFFFFF", frameRate = "30")]
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="30")]
	public class SandySpaceMap extends Sprite {
		//{
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		
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
		
		public var galaxymapxml:XML = new XML();
		
		public var username:String = ''; //player name
		public var userid:String = ''; //player id
		public var session:String = ''; //player session when time expire
		public var solarsystemid:String = ''; // solar system id
		public var galaxyid:String = ''; //galaxy id
		public var planetid:String = ''; //planet id
		public var homeplanetid:String = ''; //main home planet to return
		
		public var selectsolarsystemid:String = ''; // solar system id
		public var selectgalaxyid:String = ''; //galaxy id
		public var selectplanetid:String = ''; //planet id
		
		public var siteaccess:String = 'http://localhost/darkaif/htdocsspace/';
		public var loginurl:String = 'login.php';
		public var dropboxlist_mainmenu:DropBoxList = new DropBoxList();
		
		public var dialogbox_login:DialogBox = new DialogBox();
		
		//public var solarsystemmapxml:XML = new XML();
		public var skybox:SkyBox = new SkyBox('skybox', 1000, 1000);
		public var movespeeddelay:Number = 200;
		
		public var buttongalaxy:Button = new Button('Galaxy');
		public var buttonsolarsystem:Button = new Button('Solar System');
		public var buttonplanet:Button = new Button('Planet');
		public var buttonhomeplanet:Button = new Button('Home Planet');
		
		public var camstartx:Number = 0;
		public var camstarty:Number = 0;
		
		public var camx:Number = 0;
		public var camy:Number = 0;
		public var camangle:Number = 0;
		public var camdistance:Number = 1000;
		
		public var center:Point3D = new Point3D();
		
		public var sky:StarField = new StarField('sky');
		public var sky2:StarField = new StarField('sky2');
		
		
		//}
		
		public function SandySpaceMap() {
			//camera = new Camera3D(300, 300);
			camera = new Camera3D(640, 480);
			//camera.z = -50;
			camera.far = 10000;
			camera.near = 0;
			//camera.x = -300/2;
			camera.y = 300/2;
			camera.z = -1000;
			camera.lookAt(0, 0, 0);
			// We create the "group" that is the tree of all the visible objects
			var root:Group = g;
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			var box:Box = new Box('box');
			var plane:Plane3D = new Plane3D('grid', 1000, 1000);
			//var plane:Plane3D = new Plane3D('grid', 100, 100);
			plane.rotateX = 90;
			//plane.rotateY = 80;
			//plane.rotateZ = 90;
			g.addChild(plane);
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
			dropboxlistmainmenu();
			//{ BUTTON FOR MAP FUNCTION
			//GALAXY MAP
			buttongalaxy.x = 128;
			buttongalaxy.addEventListener(MouseEvent.CLICK, setgalaxymap);
			function setgalaxymap(event:Event):void {
				getgalaxymap();
			}
			//SOLAR SYSTEM BUTTON
			buttonsolarsystem.x = 172;
			buttonsolarsystem.addEventListener(MouseEvent.CLICK, setsoloarsystemmap);
			function setsoloarsystemmap(event:Event):void {
				getsolarsystemmap(selectgalaxyid);
			}
			//PLANET BUTTON
			buttonplanet.x = 252;
			buttonplanet.addEventListener(MouseEvent.CLICK, setplanetmap);
			function setplanetmap(event:Event):void {
				getplanetmap(selectsolarsystemid);
			}
			
			addChild(buttongalaxy);
			addChild(buttonsolarsystem);
			addChild(buttonplanet);
			//}
			
			
			addEventListener(MouseEvent.MOUSE_DOWN, startcammove);
			addEventListener(MouseEvent.MOUSE_UP, endcammove);
			function startcammove(event:Event):void {
				//trace(mouseX);
				camstartx = mouseX;
				camstarty = mouseY;
				stage.addEventListener(MouseEvent.MOUSE_MOVE, movecammove);
			}
			function movecammove(event:Event):void {
				//trace(mouseX + ":" + mouseY);
				//var radius:Number = 1000;
				//var camangle:Number = 0;
				
				//angle = -mouseX / 2;
				camangle += ((camstartx - mouseX)/2);
				//trace(angle);
				camera.x = center.x + Math.sin(camangle * Math.PI / 180) * camdistance;
				camera.z = center.z + Math.cos(camangle * Math.PI / 180) * camdistance;
				camera.lookAt(center.x,center.y,center.z);
				//mouseZ;
			}
			function endcammove(event:Event):void {
				//setmpositiony = mouseZ;
				stage.removeEventListener(MouseEvent.MOUSE_MOVE, movecammove);
			}
			addEventListener(MouseEvent.MOUSE_WHEEL, zoomcontrol);
			function zoomcontrol(event:MouseEvent):void {
				//event.
				trace(event.delta);
				camdistance += (event.delta * 10);
				camera.lookAt(center.x, center.y, center.z);
				camera.x = center.x + Math.sin(camangle * Math.PI / 180) * camdistance;
				camera.z = center.z + Math.cos(camangle * Math.PI / 180) * camdistance;
			}
			createskyspace();
			
			dialogboxlogin();
			//getsolarsystemmap();
		}
		
		
		public function enterFrameHandler(event:Event):void {
			//camera.rotateZ = (mouseY / 2)/2;
			//camera.rotateY = (mouseX / 2)/2;
			
			if (brightarrow) {
				camera.x -= 1;
			}
			if (bleftarrow) {
				camera.x += 1;
			}
			
			if (buparrow) {
				camera.z -= 1;
			}
			if (bdownarrow) {
				camera.z += 1;
			}
			
			
			/*
			if (brightarrow) {
				camera.rotateY -= 1;
			}
			if (bleftarrow) {
				camera.rotateY += 1;
			}
			
			if (buparrow) {
				camera.tilt -= 1;
			}
			if (bdownarrow) {
				camera.tilt += 1;
			}
			*/
			
			
			scene.render();
		}
		
		//Clear the scene from meshes that is render.
		public function cleanscene():void {			
			var mesh:Array = g.children;
			while (mesh.length) {
				for (var meshno:int = 0; meshno < mesh.length;meshno++ ) {
					if (mesh[meshno].name != camera.name) {
						g.removeChildByName(mesh[meshno].name);
					}
				}
				if (mesh.length <= 1) {
					break;
				}
			}
			//g.removeChildByName(sky.name);
			g.addChild(sky);
		}
		
		//SKY SPACE STAR
		public function createskyspace():void {
			var N:int = 10000, radius:Number = 600;
			for (var i:int = 0; i < N; i++) {
				var phi:Number = Math.acos (-1 + (2*i -1) / N);
				var theta:Number = Math.sqrt (N * Math.PI) * phi;
				phi   += 0.1 * (Math.random () - 0.5);
				theta += 0.1 * (Math.random () - 0.5);
				sky.stars [i] = new Vertex (
					/* x */ radius * Math.cos(theta) * Math.sin(phi),
					/* y */ radius * Math.sin(theta) * Math.sin(phi),
					/* z */ radius * Math.cos(phi)
				);
			}
			//sky.visible = false;
			//sky.clear();
			sky.container.filters = [ new GlowFilter (0x7FFF, 1, 6, 6, 10) ];
			g.addChild(sky);
		}
		
		//{ GALAXY MAP FUNCTIONS 
		//this will query once since the the main map
		public function getgalaxymap():void {
			var mapvar:URLVariables = new URLVariables();
			mapvar.map = 'galaxymap';
			var request:URLRequest = new URLRequest(siteaccess + 'map.php');
			request.data = mapvar;
			request.method = URLRequestMethod.POST;
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				load.removeEventListener(Event.COMPLETE, loaddata);
				trace(event.target.data);
				galaxymapxml = new XML(event.target.data);
				buildgalaxymap(galaxymapxml);
			}	
		}
		
		//build galaxy map
		public function buildgalaxymap(galaxydatamap:XML):void {
			cleanscene();
			//trace('...'+galaxydatamap.map.solarsystem.length());
			for (var galaxyno:int = 0; galaxyno < galaxydatamap.map.length(); galaxyno++) {
				var galaxypoint:Box = new Box(String("galaxy_"+galaxydatamap.map[galaxyno].id));
				galaxypoint.x = galaxydatamap.map[galaxyno].x;
				galaxypoint.y = galaxydatamap.map[galaxyno].y;
				galaxypoint.z = galaxydatamap.map[galaxyno].z;
				galaxypoint.enableEvents = true;
				galaxypoint.addEventListener(MouseEvent.CLICK, galaxypointid);
				
				var materialAttr03:MaterialAttributes = new MaterialAttributes( 
				new LightAttributes( true, 0.1), 
                new OutlineAttributes(3, 0xFC5858, 1),
				new LineAttributes(1, 0x000000, 1)
				);
				var material03:Material = new ColorMaterial( 0x9DCCEA, 1, materialAttr03);
				material03.lightingEnable = true;
				galaxypoint.appearance = new Appearance( material03 );
				
				g.addChild(galaxypoint);
			}
		}
		
		//load solar system from galaxy id
		public function getsolarsystemmap(galaxyid:String = ''):void {
			var mapvar:URLVariables = new URLVariables();
			mapvar.map = 'solarsystemmap';
			mapvar.galaxyid = galaxyid;
			var request:URLRequest = new URLRequest(siteaccess + 'map.php');
			request.data = mapvar;
			request.method = URLRequestMethod.POST;
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				load.removeEventListener(Event.COMPLETE, loaddata);
				trace(event.target.data);
				var solarsystemmapxml:XML = new XML(event.target.data);
				trace(solarsystemmapxml.map.length());
				buildsolarsystemmap(solarsystemmapxml);
			}	
		}
		
		//build solar system
		public function buildsolarsystemmap(solarsystemmapxml:XML):void {
			cleanscene();
			trace('...'+solarsystemmapxml.map.length());
			for (var solarsystemno:int = 0; solarsystemno < solarsystemmapxml.map.length(); solarsystemno++) {
				var solarpoint:Box = new Box(String('solarsystem_'+solarsystemmapxml.map[solarsystemno].id));
				solarpoint.x = solarsystemmapxml.map[solarsystemno].x;
				solarpoint.y = solarsystemmapxml.map[solarsystemno].y;
				solarpoint.z = solarsystemmapxml.map[solarsystemno].z;
				solarpoint.enableEvents = true;
				solarpoint.addEventListener(MouseEvent.CLICK, galaxypointid);
				
				var materialAttr03:MaterialAttributes = new MaterialAttributes( 
				new LightAttributes( true, 0.1), 
                new OutlineAttributes(3, 0xFC5858, 1),
				new LineAttributes(1, 0x000000, 1)
				);
				var material03:Material = new ColorMaterial( 0x9DCCEA, 1, materialAttr03);
				material03.lightingEnable = true;
				solarpoint.appearance = new Appearance( material03 );
				
				g.addChild(solarpoint);
				//trace('building...');
			}
			trace('done');
		}
		
		//load planet from solar id
		public function getplanetmap(solarsystemid:String = ''):void {
			var mapvar:URLVariables = new URLVariables();
			mapvar.map = 'planetmmap';
			mapvar.solarsystemid = solarsystemid;
			var request:URLRequest = new URLRequest(siteaccess + 'map.php');
			request.data = mapvar;
			request.method = URLRequestMethod.POST;
			var load:URLLoader = new URLLoader();
			load.load(request);
			load.addEventListener(Event.COMPLETE, loaddata);
			function loaddata(event:Event):void {
				load.removeEventListener(Event.COMPLETE, loaddata);
				trace(event.target.data);
				var solarsystemmapxml:XML = new XML(event.target.data);
				trace(solarsystemmapxml.map.length());
				//mapxml = new XML(event.target.data);
				buildplanetmap(solarsystemmapxml);
			}	
		}
		
		//build solar system
		//need to build the planet little different to use ring code
		public function buildplanetmap(planetmmapxml:XML):void {
			cleanscene()
			for (var planetno:int = 0; planetno < planetmmapxml.map.length(); planetno++) {
				//var planetpoint:Box = new Box(String('planet_' + planetmmapxml.map[planetno].id));
				var planetpoint:Sphere = new Sphere(String('planet_' + planetmmapxml.map[planetno].id),planetmmapxml.map[planetno].size);
				//planetpoint.x = planetmmapxml.map[planetno].x;
				//planetpoint.y = planetmmapxml.map[planetno].y;
				//planetpoint.z = planetmmapxml.map[planetno].z;
				planetpoint.z = (planetno * 10) +planetmmapxml.map[planetno].ringradius;
				planetpoint.enableEvents = true;
				planetpoint.addEventListener(MouseEvent.CLICK, galaxypointid);
				var materialAttr03:MaterialAttributes = new MaterialAttributes( 
				new LightAttributes( true, 0.1), 
                new OutlineAttributes(3, 0xFC5858, 1),
				new LineAttributes(1, 0x000000, 1)
				);
				var material03:Material = new ColorMaterial( 0x9DCCEA, 1, materialAttr03);
				material03.lightingEnable = true;
				planetpoint.appearance = new Appearance( material03 );
				
				g.addChild(planetpoint);
				//trace('building...');
			}
			trace('done');
		}
		
		//}
		
		public function galaxypointid(shapeevent:Shape3DEvent):void {
			trace(shapeevent.shape.name);
			var stridname:String = shapeevent.shape.name;
			var re:RegExp = /(\d+)/;
			var results:Array = stridname.split(re);
			
			//trace(results[0]);
			if (results[0] == 'galaxy_') {
				trace('found galaxy:' + results[1]);
				camera.lookAt(shapeevent.shape.x, shapeevent.shape.y, shapeevent.shape.z);
				//setTimeout(camera.lookAt, movespeeddelay, shapeevent.shape.x, shapeevent.shape.y, shapeevent.shape.z);
				center.x = shapeevent.shape.x;
				center.y = shapeevent.shape.y;
				center.z = shapeevent.shape.z;
			}
			
			if (results[0] == 'solarsystem_') {
				trace('found solarsystem:' + results[1]);
				camera.lookAt(shapeevent.shape.x, shapeevent.shape.y, shapeevent.shape.z);
				//setTimeout(camera.lookAt, movespeeddelay, shapeevent.shape.x, shapeevent.shape.y, shapeevent.shape.z);
				center.x = shapeevent.shape.x;
				center.y = shapeevent.shape.y;
				center.z = shapeevent.shape.z;
			}
			
			if (results[0] == 'planet_') {
				trace('found planet:' + results[1]);
				camera.lookAt(shapeevent.shape.x, shapeevent.shape.y, shapeevent.shape.z);
				//setTimeout(camera.lookAt, movespeeddelay, shapeevent.shape.x, shapeevent.shape.y, shapeevent.shape.z);
				center.x = shapeevent.shape.x;
				center.y = shapeevent.shape.y;
				center.z = shapeevent.shape.z;
			}
		}
		
		//FORMAT TEXT DEFAULT
		public function defaulttextformat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			//format.color = 0xF5F5F5;
			return format;
		}
		
		//FILE MENU
		public function dropboxlistmainmenu():void {
			dropboxlist_mainmenu.addlist( { name:'Overview', id:'overview' } );
			dropboxlist_mainmenu.addlist( { name:'Building', id:'building' } );
			dropboxlist_mainmenu.addlist( { name:'Resources', id:'resources' } );
			dropboxlist_mainmenu.addlist( { name:'Research', id:'research' } );
			dropboxlist_mainmenu.addlist( { name:'Shipyard', id:'shipyard' } );
			dropboxlist_mainmenu.addlist( { name:'Fleet', id:'fleet' } );
			dropboxlist_mainmenu.addlist( { name:'Galaxy', id:'galaxy' } );
			dropboxlist_mainmenu.addlist( { name:'Solar System', id:'solarsystem' } );
			dropboxlist_mainmenu.addlist( { name:'Planet', id:'planet' } );
			dropboxlist_mainmenu.addlist( { name:'Defence', id:'defence' } );
			
			dropboxlist_mainmenu.addlist( { name:'Alliance', id:'alliance' } );
			dropboxlist_mainmenu.addlist( { name:'board', id:'board' } );
			dropboxlist_mainmenu.addlist( { name:'Message', id:'message' } );
			dropboxlist_mainmenu.addlist( { name:'buddylist', id:'buddylist' } );
			dropboxlist_mainmenu.addlist( { name:'settings', id:'settings' } );
			
			
			dropboxlist_mainmenu.addEventListener(DropBoxEvent.SELECT, selectmenu);
			function selectmenu(event:DropBoxEvent):void {
				
				if (dropboxlist_mainmenu._idname =='galaxy') {
					getgalaxymap();
				}
				
				if (dropboxlist_mainmenu._idname =='solarsystem') {
					getsolarsystemmap(selectgalaxyid);
				}
				
				if (dropboxlist_mainmenu._idname =='planet') {
					getplanetmap(selectsolarsystemid);
				}
			}
			
			addChild(dropboxlist_mainmenu);
		}
		
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
				trace("==" + event.target.data);
				
				var userdataxml:XML = new XML(event.target.data);
				if (userdataxml.message == 'pass') {
					trace(userdataxml.username);
					username = userdataxml.username;
					session = userdataxml.session;
					
					galaxyid = userdataxml.galaxyid;
					solarsystemid = userdataxml.solarsystemid;
					homeplanetid = userdataxml.homeplanetid;
					planetid = userdataxml.setplanetid;
					
					selectgalaxyid = userdataxml.galaxyid;
					selectsolarsystemid = userdataxml.solarsystemid;
					selectplanetid = userdataxml.homeplanetid;
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
		
		public function addKey(e:KeyboardEvent):void {
			
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
		
	}
	
};
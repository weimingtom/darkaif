package  
{
	//{
	import darknet.core.display.Button;
	import darknet.core.display.GameButton;
	import darknet.core.event.GameButtonEvent;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import gearunits.sandy3d.display.SQueryUnitBuild;
	import gearunits.sandy3d.display.SUnitIconButton;
	import gearunits.sandy3d.entity.*;
	import gearunits.sandy3d.entity.building.*;
	import gearunits.sandy3d.entity.infantry.*;
	import gearunits.sandy3d.entity.spacecraft.*;
	import gearunits.sandy3d.entity.vehicle.*;
	import gearunits.sandy3d.entity.weapon.*;
	import gearunits.sandy3d.events.*;
	import gearunits.models.*;
	import flash.events.*;
	import flash.ui.*;
	import org.jloa.display.ResourceMonitor;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.math.Matrix4Math;
	import sandy.primitive.*;
	import sandy.events.Shape3DEvent;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 * 
	 * information: 
	 * 	This will be the main game build for checks and updates. This game is run frame loops.
	 * 
	 */
	[SWF(width="800", height="600", backgroundColor="#FFFFFF", frameRate="30")]
	public class Sandy3DGearUnits extends Sprite
	{
		//{ Embed FILES
		[Embed(source = "system/icon/building_rts.jpg")]
		private var Picture:Class;
		public var buildingicon:Bitmap = new Picture();
		
		[Embed(source = "system/icon/constructionyard_rts_icon32.jpg")]
		private var image32constructionyard:Class;
		
		[Embed(source = "system/icon/powerplant_rts_icon32.jpg")]
		private var image32powerplant:Class;
		
		[Embed(source = "system/icon/orerefinery_rts_icon32.jpg")]
		private var image32orerefinery:Class;
		
		[Embed(source = "system/icon/gasrefinery_rts_icon32.jpg")]
		private var image32gasrefinery:Class;
		
		[Embed(source = "system/icon/crystalrefinery_rts_icon32.jpg")]
		private var image32crystalrefinery:Class;
		
		[Embed(source = "system/icon/barracks_rts_icon32.jpg")]
		private var image32barracks:Class;
		
		[Embed(source = "system/icon/mechfactory_rts_icon32.jpg")]
		private var image32mechfactory:Class;
		
		[Embed(source = "system/icon/airport_rts_icon32.jpg")]
		private var image32airport:Class;
		
		[Embed(source = "system/icon/seaport_rts_icon32.jpg")]
		private var image32seaport:Class;
		
		[Embed(source = "system/icon/attack_rts_icon32.jpg")]
		private var image32attack:Class;
		
		[Embed(source = "system/icon/cancel_rts_icon32.jpg")]
		private var image32cancel:Class;
		
		[Embed(source = "system/icon/guard_rts_icon32.jpg")]
		private var image32guard:Class;
		
		[Embed(source = "system/icon/move_rts_icon32.jpg")]
		private var image32move:Class;
		
		[Embed(source = "system/icon/patrol_rts_icon32.jpg")]
		private var image32patrol:Class;
		
		[Embed(source = "system/icon/soldier_rts_icon32.jpg")]
		private var image32soldier:Class;
		
		[Embed(source = "system/icon/engineer_rts_icon32.jpg")]
		private var image32engineer:Class;
		
		
		[Embed(source = "system/icon/load_icon32.jpg")]
		private var image32load:Class;
		
		[Embed(source = "system/icon/unload_icon32.jpg")]
		private var image32unload:Class;
		
		
		[Embed(source = "system/icon/spacecraft_fedcarrier_icon32.jpg")]
		private var image32fedcarrier:Class;
		
		[Embed(source = "system/icon/spacecraft_fedfighter_icon32.jpg")]
		private var image32fedfighter:Class;
		//}
		
		//{
		public var HEIGHT:Number = 240;//note it the camera settings //camera = new Camera3D( 300, 300 );
		public var WIDTH:Number = 320;
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var g:Group = new Group('group');
		public var bottom:Shape3D = new Plane3D('bottom', 256, 256, 10, 10, Plane3D.ZX_ALIGNED, 'quad');
		public var tmpbox:Box = new Box('tmpbox');
		
		public var buildings:Vector.<SBuilding> = new Vector.<SBuilding>();
		public var vehicles:Vector.<SVehicle> = new Vector.<SVehicle>();
		public var turret:Vector.<SBuildingTurret> = new Vector.<SBuildingTurret>();
		
		//weapon bullet
		public var projectile:Vector.<SProjectile> = new Vector.<SProjectile>();
		
		public var unit:Vector.<SStructureUnit> = new Vector.<SStructureUnit>();
		public var selectunit:Vector.<SStructureUnit> = new Vector.<SStructureUnit>();
		
		public var buildingname:String = '';
		public var buildingid:String = '';
		//space id build
		public var unitid:String = '';
		public var unitbuildname:String = '';
		public var selectbuilding:String = '';
		public var objectselect:Boolean = false;
		public var objectid:String = '';
		public var playername:String = 'guest';
		
		public var startpoint:Point3D = new Point3D();
		public var endpoint:Point3D = new Point3D();
		
		public var selectbox:Point = new Point(); //select point of the screen
		public var selectbox3d:Shape3D = new Plane3D('selectplane', 32, 32, 1, 1, Plane3D.ZX_ALIGNED, 'quad'); //select point of the screen
		
		public var commander:Vector.<SCommander> = new Vector.<SCommander>();
		//public var textresource:TextField = new TextField();
		
		public var buttonbuilding:Button = new Button('Building');
		
		public var topbarpanel:Sprite = new Sprite(); //bar panel for iccon build
		public var barpanel:Sprite = new Sprite(); //bar panel for iccon build
		public var mappanel:Sprite = new Sprite();
		public var mapunitpanel:Sprite = new Sprite();
		public var unitinfopanel:Sprite = new Sprite(); //unit or building info
		public var unitactionpanel:Sprite = new Sprite(); //action panel for unit and building
		public var unitquerypanel:Sprite = new Sprite(); //query build
		public var unitactionorderpanel:Sprite = new Sprite(); //query build
		
		public var maprendertime:Number = 0;
		public var maprendertimemax:Number = 30; //30 frame for 1 sec guess
		public var frametime:Number = 0;
		public var frametimemax:Number = 0;
		
		public var resource_credit:TextField = new TextField();
		public var resource_power:TextField = new TextField();
		public var resource_gas:TextField = new TextField();
		public var resource_ore:TextField = new TextField();
		public var resource_crystal:TextField = new TextField();
		public var resource_unit:TextField = new TextField();
		//tmp object for preview
		public var meshconstructionyard:SMeshBuildingConstructionYard = new SMeshBuildingConstructionYard();
		public var meshpowerplant:SMeshBuildingPowerPlant = new SMeshBuildingPowerPlant();
		public var meshorerefinery:SMeshBuildingOreRefinery = new SMeshBuildingOreRefinery();
		public var meshbarracks:SMeshBuildingBarrack = new SMeshBuildingBarrack();
		public var meshmechfactory:SMeshBuildingMechFactory = new SMeshBuildingMechFactory();
		public var meshpreview:Shape3D;
		
		public var iconconstructionyard:SUnitIconButton = new SUnitIconButton(new image32constructionyard());
		public var iconpowerplant:SUnitIconButton = new SUnitIconButton(new image32powerplant());
		public var iconorerefiney:SUnitIconButton = new SUnitIconButton(new image32orerefinery());
		public var icongasrefinery:SUnitIconButton = new SUnitIconButton(new image32gasrefinery());
		public var iconcrystalrefinery:SUnitIconButton = new SUnitIconButton(new image32crystalrefinery());
		public var iconbarracks:SUnitIconButton = new SUnitIconButton(new image32barracks());
		public var iconmechfactory:SUnitIconButton = new SUnitIconButton(new image32mechfactory());
		public var iconairport:SUnitIconButton = new SUnitIconButton(new image32airport());
		public var iconseaport:SUnitIconButton = new SUnitIconButton(new image32seaport());
		
		public var iconattack:SUnitIconButton = new SUnitIconButton(new image32attack());
		public var iconcancel:SUnitIconButton = new SUnitIconButton(new image32cancel());
		public var iconguard:SUnitIconButton = new SUnitIconButton(new image32guard());
		public var iconmove:SUnitIconButton = new SUnitIconButton(new image32move());
		public var iconpatrol:SUnitIconButton = new SUnitIconButton(new image32patrol());
		public var iconload:SUnitIconButton = new SUnitIconButton(new image32load());
		public var iconunload:SUnitIconButton = new SUnitIconButton(new image32unload());
		//soldier
		public var iconsoldier:SUnitIconButton = new SUnitIconButton(new image32soldier());
		public var iconengineer:SUnitIconButton = new SUnitIconButton(new image32engineer());
		
		//vehicle
		public var iconfedcarrier:SUnitIconButton = new SUnitIconButton(new image32fedcarrier());
		public var iconfedfighter:SUnitIconButton = new SUnitIconButton(new image32fedfighter());
		
		
		//{ CONTROL KEY EVENT
		
		public var CTRL:Boolean = false;
		public var SHIFT:Boolean = false;
		//}
		
		//}
		
		public function Sandy3DGearUnits() {
			
			var monitor:ResourceMonitor = new ResourceMonitor(true, true);
			monitor.x = 550;
			monitor.y = 14;
			addChild(monitor);
			monitor.monitor();
			
			var commanderdata:SCommander = new SCommander();
			commanderdata.name = playername;
			commander.push(commanderdata);
			
			//{ SCENE SETTINGS
			camera = new Camera3D(800, 600);
			camera.lookAt(0, 0, 0);
			camera.z = -200;
			camera.y = 350;
			camera.lookAt(0, 0, 0);
			camera.y = 500;
			//camera.x = 300;
			
			//camera.rotateZ = -10;
			camera.near = 0; 
			camera.far = 10000;
			
			//camera.enableClipping = true;
			//camera.useSingleContainer = true;
			
			var root:Group = g;
			scene = new Scene3D( "scene", this, camera, g );
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			//}
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownevent);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyupevent);
			
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, selectunit_down);
			stage.addEventListener(MouseEvent.MOUSE_UP, selectunit_up);
			
			initstartup();
			
			terrainbuild();//test
			groundbuildtest();//test
			//spacebuildtest()//test
			//g.removeChildByName
			showgroundunithud();
		}
		
		//=========================================================================================
		// KEYBOARD AND EVENT
		//=========================================================================================
		
		public function initstartup():void {
			selectbox3d.enableForcedDepth = true;
			selectbox3d.depth = -1;
			selectbox3d.changed = true;//this will tell the object is change 
		}
		
		public function keydownevent(key:KeyboardEvent):void {
			//trace(key.keyCode);
			if (key.keyCode == 16) {
				SHIFT = true;
			}
			
			if (key.keyCode == 17) {
				CTRL = true;
			}
			
			if (key.keyCode == 37) {//left
				camera.x -= 10;
			}
			if (key.keyCode == 39) {//right
				camera.x += 10;
			}
			if (key.keyCode == 40) {//down
				camera.z -= 10;
			}
			if (key.keyCode == 38) {//up
				camera.z += 10;
				//camera.lookAt(0, 0, 0);
			}
			
		}
		
		public function keyupevent(key:KeyboardEvent):void {
			//trace(key.keyCode);
			if (key.keyCode == 16) {
				SHIFT = false;
			}
			
			if (key.keyCode == 17) {
				CTRL = false;
			}
		}
		
		//UPDATE FRAME
		private function enterFrameHandler(event:Event) : void {
			System.gc();
			objectupdate();
			updateships();
			DrawMapUnit();
			frametime++;
			if (frametime > frametimemax) {
				frametime = 0;
				scene.render();
			}
		}
		
		
		//=========================================================================================
		// TEST BUILD
		//=========================================================================================
		
		//BUILDING TEST FOR UPDATE TEST
		public function groundbuildtest():void {
			var build:SBuilding;
			//build = new BuildingConstructionYard();
			//selectbuilding = 'Constuction Yard';
			//assignbuilding(build);
			//g.addChild(build.mesh);
			//build.ownerid = playername;
			//buildings.push(build);
			
			build = new SBuildingBarrack();
			//selectbuilding = 'Constuction Yard';
			build = assignunitbuilding(build);
			g.addChild(build.mesh);
			//build.mesh.enableEvents = true;
			//build.mesh.addEventListener(MouseEvent.CLICK, selectbuildmenu);
			
			build.ownerid = playername;
			buildings.push(build);
			
			
			build = new SBuildingMechFactory();
			build.x = 64;
			g.addChild(build.mesh);
			//selectbuilding = 'Constuction Yard';
			build = assignunitbuilding(build);
			//build.mesh.enableEvents = true;
			//build.mesh.addEventListener(MouseEvent.CLICK, selectbuildmenu);
			build.ownerid = playername;
			buildings.push(build);
			
			//units / functions
			
			
			var solider:SSoldier = new SSoldier();
			solider.x = 32;
			solider.z = 32;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			/*
			solider = new Soldier();
			solider.x = -32;
			solider.z = 32;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			
			solider = new Soldier();
			solider.x = 32;
			solider.z = -64;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			
			solider = new Soldier();
			solider.x = 92;
			solider.z = -53;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			
			solider = new Soldier();
			solider.x = -32;
			solider.z = -64;
			solider.ownerid = '1';
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			*/
		}
		
		public function spacebuildtest():void {
			var build:SBuilding;
			//camera.y = 250;
			
			var spaceunit_0:SStructureUnit;
			
			var spaceunit_1:SStructureUnit = new SSpacecraftFedFighter();
			spaceunit_1.ownerid = playername;
			spaceunit_1.y = 10;
			singleunit_assign(spaceunit_1);
			//g.addChild(spaceunit_0.mesh);
			//unit.push(spaceunit_0);
			/*
			spaceunit_0 = new SpacecraftFedCarrier();
			spaceunit_0.z = 64;
			spaceunit_0.unit.push(spaceunit_1);
			spaceunit_0.ownerid = playername;
			singleunit_assign(spaceunit_0);
			g.addChild(spaceunit_0.mesh);
			unit.push(spaceunit_0);
			*/
			
			spaceunit_0 = new SSpacestationFedShipyard();
			//spaceunit_0.z = 64;
			spaceunit_0.ownerid = playername;
			spaceunit_0.y = 10;
			singleunit_assign(spaceunit_0);
			//spaceunit_0.mesh.enableForcedDepth = true;
			//spaceunit_0.mesh.forcedDepth = 9999;
			spaceunit_0.mesh.useSingleContainer = true;
			g.addChild(spaceunit_0.mesh);
			unit.push(spaceunit_0);
			
			spaceunit_0 = new SSpacecraftFedFighter();
			spaceunit_0.ownerid = playername;
			spaceunit_0.y = 10;
			singleunit_assign(spaceunit_0);
			g.addChild(spaceunit_0.mesh);
			unit.push(spaceunit_0);
			
			spaceunit_0 = new SSpacecraftFedFighter();
			spaceunit_0.x = 32;
			spaceunit_0.y = 10;
			spaceunit_0.ownerid = playername;
			singleunit_assign(spaceunit_0);
			g.addChild(spaceunit_0.mesh);
			unit.push(spaceunit_0);
			
			//spaceunit_0 = new SSpacecraftFedBaseship();
			//spaceunit_0.x = 512;
			//spaceunit_0.ownerid = playername;
			//singleunit_assign(spaceunit_0);
			//g.addChild(spaceunit_0.mesh);
			//unit.push(spaceunit_0);
			
			/*
			spaceunit_0 = new SSpacecraftFedCarrier();
			spaceunit_0.ownerid = playername;
			singleunit_assign(spaceunit_0);
			g.addChild(spaceunit_0.mesh);
			unit.push(spaceunit_0);
			*/
			
			
			bottom.enableEvents = true;
			bottom.enableInteractivity = true;
			bottom.enableBackFaceCulling = false;
			bottom.enableClipping = true;
			bottom.useSingleContainer = true;
			bottom.enableForcedDepth = true;//you need to able to render last
			bottom.forcedDepth = 9999999999;
			
			g.addChild(bottom);
			
			spacebuttonsetting();
		}
		
		//=========================================================================================
		// TERRAIN BUILD
		//=========================================================================================
		
		//BUILD TERRAIN
		public function terrainbuild():void {
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
			);
			
			var material01:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			//var material01:Material = new ColorMaterial( 0xFFCC33);
			material01.lightingEnable = false;
			var app01:Appearance = new Appearance( material01 );
			
			bottom.enableEvents = true;
			bottom.enableInteractivity = true;
			
			bottom.enableBackFaceCulling = false;
			bottom.enableClipping = true;
			bottom.useSingleContainer = false;
			bottom.enableForcedDepth = true;//you need to able to render last
			bottom.forcedDepth = 9999999999;
			
			//bottom.addEventListener(MouseEvent.MOUSE_DOWN, selectunit_down);
			//bottom.addEventListener(MouseEvent.MOUSE_UP, selectunit_up);
			
			//bottom.addEventListener();
			
			bottom.appearance = app01;
			
			g.addChild(bottom);
		}
		
		//=========================================================================================
		// BUILDINGS FUNCTIONS
		//=========================================================================================
		//{ START INTERFACE PANEL -This where it handle 3D placement
		
		//MOUSE CLICK PLACE UNIT BUILDING ON TERRIAN
		public function placeunitbuilding(objectevent:Shape3DEvent):void {
			removepreviewunitbuilding();
			trace('press and place:'+buildingname);
			buildunitbuilding(objectevent.point);
			bottom.removeEventListener(MouseEvent.CLICK, placeunitbuilding);
			bottom.removeEventListener(MouseEvent.MOUSE_OVER, unitbuildingover);
			bottom.removeEventListener(MouseEvent.MOUSE_MOVE, unitbuildingmove);
		}
		
		//MOUSE OVER, DISPLAY UNIT BUILDING
		public function unitbuildingover(objectevent:Shape3DEvent):void {
			bottom.addEventListener(MouseEvent.MOUSE_MOVE, unitbuildingmove);
			//g.addChild(tmpbox);
			if (buildingname == 'Constuction Yard') {
				g.addChild(meshconstructionyard);
				meshpreview = meshconstructionyard;
			}
			
			if (buildingname == 'Power plant') {
				g.addChild(meshpowerplant);
				meshpreview = meshpowerplant;
			}
			
			if (buildingname == 'Ore Refiney') {
				g.addChild(meshorerefinery);
				meshpreview = meshorerefinery;
			}
			
			if (buildingname == 'Barracks') {
				g.addChild(meshbarracks);
				meshpreview = meshbarracks;
			}
			
			if (buildingname == 'Mech Factory') {
				g.addChild(meshmechfactory);
				meshpreview = meshmechfactory;
			}
		}
		
		//MOUSE MOVE, UPDATE POSITION BASE ON TERRAIN
		public function unitbuildingmove(objectevent:Shape3DEvent):void {
			//trace('over');
			var v:Point3D = objectevent.point;
			tmpbox.x = v.x;
			tmpbox.y = v.y+8;
			tmpbox.z = v.z;
			//trace('added...'+"x:"+v.x+"y:"+v.y+"z:"+v.z);
			
			if (meshpreview != null) {
				meshpreview.x = v.x;
				meshpreview.y = v.y;
				meshpreview.z = v.z;
			}
		}
		
		//MOUSE OUT, REMOVE IF TERRAIN IS OUT OF BOUNDS
		public function updateobjectout(objectevent:Shape3DEvent):void {
			bottom.removeEventListener(MouseEvent.MOUSE_MOVE, unitbuildingmove);
			removepreviewunitbuilding();
		}
		
		//MOUSE CLICK, UNIT BUILDING MENU
		public function selectbuildmenu(event:Shape3DEvent):void {
			trace(event.shape.name);
			buildingid = event.shape.name;
			unitbuildingidaction(event.shape.name);
		}
		//} END INTERFACE PANEL
		
		
		//{ START CONTROLERS AND EVENTS
		//PLACE BUILDING BASE ON TERRAIN
		public function buildunitbuilding(point:Point3D):void {
			var build:SBuilding;
			
			if (buildingname == 'Constuction Yard') {
				build = new SBuildingConstructionYard();
				selectbuilding = 'Constuction Yard';
				assignunitbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Power plant') {
				build = new SBuildingPowerPlant();
				selectbuilding = 'Power plant';
				assignunitbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Ore Refiney') {
				build = new SBuildingOreRefinery();
				selectbuilding = 'Ore Refiney';
				assignunitbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Barracks') {
				build = new SBuildingBarrack();
				selectbuilding = 'Barracks';
				assignunitbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Mech Factory') {
				build = new SBuildingMechFactory();
				selectbuilding = 'Mech Factory';
				assignunitbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			trace('Number of buildings:'+buildings.length);
			for (var buildingno:int = 0; buildingno < buildings.length;buildingno++ ) {
				trace(buildings[buildingno].name)
			}
		}
		
		//REOMVE OBJECT PREVIEW FROM SCENE
		public function removepreviewunitbuilding():void {
			g.removeChildByName(meshconstructionyard.name);
			g.removeChildByName(meshpowerplant.name);
			g.removeChildByName(meshorerefinery.name);
			g.removeChildByName(meshbarracks.name);
			g.removeChildByName(meshmechfactory.name);
		}
		
		//UNIT ADDED TO FUNCTIONS AND LISTENERS
		public function assignunitbuilding(buiding:SBuilding):SBuilding {
			buiding.mesh.useSingleContainer = false;
			buiding.mesh.enableClipping = true;
			buiding.mesh.enableEvents = true;
			buiding.mesh.addEventListener(MouseEvent.CLICK, selectbuildmenu);
			return buiding;
		}
		
		//UNIT BUILDING ID ACTION EVENT
		public function unitbuildingidaction(id:String):void {
			//trace('ID' + id);
			for (var buildingno:int = 0; buildingno < buildings.length ;buildingno++ ) {
				if (buildings[buildingno].mesh.name == id) {
					trace('BUILDING:' + buildings[buildingno].name + 'Mesh ID:' + buildings[buildingno].mesh.name);
					unitbuildingmenu(buildings[buildingno]);
					break;
				}
			}
		}
		
		//UNIT BUILDING MENU
		public function unitbuildingmenu(building:SBuilding):void {
			trace('BUILDING:' + building.name);
			//this make sure there is no error
			if (building != null) {
				var button_build:GameButton;
				//barracks code class test
				clearsprite(unitinfopanel);
				clearsprite(unitquerypanel);
				
				var buildingname:TextField = customtext(building.name);
				buildingname.x = 8;
				buildingname.y = 64+8;
				//buildingname.text = building.name;
				unitinfopanel.addChild(buildingname);
				
				buildingname = customtext('Health:' + building.healthpoint);
				buildingname.x = 8;
				buildingname.y = 64+12*2;
				unitinfopanel.addChild(buildingname);
				buildingicon.x = 8;
				buildingicon.y = 8;
				unitinfopanel.addChild(buildingicon);
				//unitinfopanel.addChild();
				//building.name
				
				if (building.name == 'Barracks') {
					clearsprite(unitactionpanel);
					trace('Unit list:');
					for (var unitinfanno:int = 0; unitinfanno < building.unit.length;unitinfanno++ ) {
						trace('unit class:' + building.unit[unitinfanno].name);
						
						if (building.unit[unitinfanno].name == 'Soldier') {
							iconsoldier.x = 32 * 0;
							iconsoldier.y = 32 * 0;
							iconsoldier.unitid = building.mesh.name;
							iconsoldier.unitclass = building.unit[unitinfanno].classtype;
							unitactionpanel.addChild(iconsoldier);
						}
						if (building.unit[unitinfanno].name == 'Engineer') {
							iconengineer.x = 32 * 1;
							iconengineer.y = 32 * 0;
							iconengineer.unitid = building.mesh.name;
							iconengineer.unitclass = building.unit[unitinfanno].classtype;
							unitactionpanel.addChild(iconengineer);
						}
						trace('type:'+building.unit[unitinfanno].classtype);
					}
					
					
					if(building.queryunit.length > 0){
						clearsprite(unitquerypanel);
						for (var iconno:int = 0; iconno < building.queryunit.length;iconno++) {
							var queryicon:SQueryUnitBuild = new SQueryUnitBuild();
							queryicon.unitquerybuild(building.queryunit[iconno]);
							queryicon.y = 14 * iconno;
							unitquerypanel.addChild(queryicon);
						}
					}
				}
				
				if (building.name == 'Mech Factory') {
					//trace('Mech Factory');
					clearsprite(unitactionpanel);
					for (var unitvehno:int = 0; unitvehno < building.unit.length; unitvehno++ ) {
						
						/*
						trace('unit class:' + building.unit[unitvehno].name);
						button_build = new GameButton(building.unit[unitvehno].name);
						button_build.tag = building.unit[unitvehno].classtype;
						//button_build.addEventListener(MouseEvent.CLICK,unit_build);
						button_build.y = 14 * unitvehno;
						button_build._width = 64;
						unitactionpanel.addChild(button_build);
						*/
					}
				}
			}
		}
		
		
		//UNIT BUILDING BUILD UNITS ACTIONS
		public function unit_build(event:SUnitEvent):void {
			trace('hello..........');
			trace('test:' + event.unitid + '::'+ event.unitclass);
			//buildingid
			
			var classjob:SStructureUnit = new SUnitClass().unitload(event.unitclass);
			var gamebutton:SQueryUnitBuild;
			trace('check class:' + classjob.classtype);
			
			for (var buildingno:int = 0; buildingno < buildings.length; buildingno++) {
				if (buildings[buildingno].mesh.name == buildingid) {
					buildings[buildingno].queryunit.push(classjob);
					
					
					//trace('found and adding query build...' + buildings[buildingno].queryunit.length);
					gamebutton = new SQueryUnitBuild(); 
					gamebutton.unitquerybuild(classjob);
					//gamebutton._width = 64;
					gamebutton.y = (buildings[buildingno].queryunit.length * 14);
					gamebutton.x = 4;
					//gamebutton.addEventListener(UnitEvent.TAG, unit_cancelbuild);
					unitquerypanel.addChild(gamebutton);
					
					break;
				}
			}
		}
		
		//update unit query build
		public function updateunitquerybuild():void {
			
		}
		
		public function unit_holdbuild():void {
			
		}
		
		public function unit_cancelbuild(event:GameButtonEvent):void {
			
		}
		
		//ADD FUNCTIONS TO LISTENER PREVIEW OBJECTS
		public function unitmeshbuilding():void {
			meshconstructionyard.enableEvents = true;
			meshconstructionyard.enableInteractivity = true;
			meshconstructionyard.addEventListener(MouseEvent.CLICK, placeunitbuilding);
			
			meshpowerplant.enableEvents = true;
			meshpowerplant.enableInteractivity = true;
			meshpowerplant.addEventListener(MouseEvent.CLICK, placeunitbuilding);
			
			meshorerefinery.enableEvents = true;
			meshorerefinery.enableInteractivity = true;
			meshorerefinery.addEventListener(MouseEvent.CLICK, placeunitbuilding);
			
			meshbarracks.enableEvents = true;
			meshbarracks.enableInteractivity = true;
			meshbarracks.addEventListener(MouseEvent.CLICK, placeunitbuilding);
			
			meshmechfactory.enableEvents = true;
			meshmechfactory.enableInteractivity = true;
			meshmechfactory.addEventListener(MouseEvent.CLICK, placeunitbuilding);
		}
		
		//} END CONTROLERS AND EVENTS
		
		//=========================================================================================
		// UNITS FUNCTIONS
		//=========================================================================================
		
		//{  START INTERFACE PANEL
		//single unit
		//need to get object menu build
		//select function and other functions
		//attack function if not match
		public function singleunit_click(event:Shape3DEvent):void {
			trace('ID:-.' + event.shape.name);
			unitid = event.shape.name;
			var selectunit_o:SStructureUnit;
			//select function 
			//{
			for (var unitno:int = 0; unitno < unit.length; unitno++) {
				if (unit[unitno].mesh.name == event.shape.name) {
					trace('found! unit:' + unit[unitno].mesh.name + ' ownerid:' + unit[unitno].ownerid);
					if (unit[unitno].ownerid == playername) {//do not attack
						if (CTRL == true) {
							trace('control...'+CTRL);
							unit[unitno].bselected = true;
							break;//this break will add units
						}else if (SHIFT == true) {
							unit[unitno].bselected = false;
							break;//this code will break to remove unit
						}else if ((SHIFT == false) && (CTRL == false) && (objectselect == true)) {
							//this is for current one unit select and deselect others
							unit[unitno].bselected = true;
						}else {
						}
						selectunit_o = unit[unitno];
					}
					//break;
				}else {
					//this will deselect all the unit that is current selected
					unit[unitno].bselected = false;
				}
			}
			//}
			
			var bemeny:Boolean = false;
			var selectedunit:Boolean = false;
			//attack function
			for (var unitcheckno:int = 0; unitcheckno < unit.length;unitcheckno++ ) {
				if (unit[unitcheckno].mesh.name == event.shape.name) {
					//trace('------');
					if (unit[unitcheckno].ownerid != playername) {
						trace('attack point');
						bemeny = true;
					}else {
						trace('friendly point');
						selectedunit = true;
					}
					break;
				}
			}
			
			for (var unittargetno:int = 0; unittargetno < unit.length; unittargetno++ ) {
				if (unit[unittargetno].ownerid == playername) {
					if (unit[unittargetno].bselected == true) {
						unit[unittargetno].targetpoint(event.point);
					}
				}
			}
			
			//clearsprite(unitactionorderpanel);
			clearsprite(unitquerypanel);
			clearsprite(unitactionpanel);
			//selectunit_o.
			//menus and panel access
			if(selectunit_o != null){
				//iconunload.
				for (var i:int = 0; i < selectunit_o.unittype.length; i++ ) {
					//deployablespaceship
					if(selectunit_o.unittype[i].name == 'deployablespaceship'){
						unitactionpanel.addChild(iconunload);
						iconload.x = 32;
						unitactionpanel.addChild(iconload);
					}
					
					if (selectunit_o.unittype[i].name == 'shipyard') {
						iconfedcarrier.x =0;
						unitactionpanel.addChild(iconfedcarrier);
						iconfedfighter.x = 32;
						unitactionpanel.addChild(iconfedfighter);
					}
				}
			}
			//set object select off
			objectselect = false;
		}
		
		public function singleunit_down(event:Shape3DEvent):void {
			trace('trace....selected');
			objectselect = true;
		}
		
		
		public function pointposition(event:Shape3DEvent):void {
			trace('point heh.');
		}
		
		//multi units
		public function selectunit_down(event:Event):void {
			//startpoint = event.point;
			startpoint = S2W(mouseX, mouseY);
			startpoint.x = startpoint.x +1;
			startpoint.z = startpoint.z +1;
			//trace('down point:' + startpoint);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, selectunit_updateposition);
		}
		
		public function selectunit_up(event:Event):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, selectunit_updateposition);
			//endpoint = event.point;
			endpoint = S2W(mouseX, mouseY);
			endpoint.x = endpoint.x +1;
			endpoint.z = endpoint.z +1;
			//trace('up point:' + endpoint);
			
			unitcheckselect();
			//trace(endpoint);
			g.removeChildByName(selectbox3d.name);
			g.removeChildByName(selectbox3d.name);
		}
		
		public function selectunit_updateposition(event:Event):void {
			g.addChild(selectbox3d);// it need the start and end value
			endpoint = S2W(mouseX, mouseY);
			endpoint.x = endpoint.x +1;
			endpoint.z = endpoint.z +1;
			//endpoint = event.point;
			//trace(endpoint);
			var minpoint:Point3D = new Point3D();
			var maxpoint:Point3D = new Point3D();
			//{
			if (startpoint.z < endpoint.z) {
				minpoint.z = startpoint.z;
				maxpoint.z = endpoint.z;
				
			}else {
				minpoint.z = endpoint.z
				maxpoint.z = startpoint.z;
			}
			
			if (startpoint.x < endpoint.x) {
				minpoint.x = startpoint.x;
				maxpoint.x = endpoint.x;
			}else {
				minpoint.x = endpoint.x;
				maxpoint.x = startpoint.x;
			}			
			
			selectbox3d.geometry.aVertex[0].x = minpoint.x;
			selectbox3d.geometry.aVertex[0].z = minpoint.z;
			selectbox3d.geometry.aVertex[1].x = maxpoint.x;
			selectbox3d.geometry.aVertex[1].z = minpoint.z;
			selectbox3d.geometry.aVertex[2].x = minpoint.x;
			selectbox3d.geometry.aVertex[2].z = maxpoint.z;
			selectbox3d.geometry.aVertex[3].x = maxpoint.x;
			selectbox3d.geometry.aVertex[3].z = maxpoint.z;
			//}
		}
		
		//=================================
		//=================================
		//need to hand listener from object and space 3d clicking functions
		public function unitcheckselect():void {
			
			var minpoint:Point3D = new Point3D();
			var maxpoint:Point3D = new Point3D();
			
			if (startpoint.z < endpoint.z) {
				//trace('z min:' + startpoint.z + ' max:' + endpoint.z);
				minpoint.z = startpoint.z;
				maxpoint.z = endpoint.z;
				
			}else {
				//trace('z min:' + endpoint.z + ' max:' + startpoint.z);
				minpoint.z = endpoint.z
				maxpoint.z = startpoint.z;
			}
			
			if (startpoint.x < endpoint.x) {
				//trace('x min:' + startpoint.x + ' max:' + endpoint.x);
				minpoint.x = startpoint.x;
				maxpoint.x = endpoint.x;
			}else {
				//trace('x min:' + endpoint.x + ' max:' + startpoint.x);
				minpoint.x = endpoint.x;
				maxpoint.x = startpoint.x;
			}
			if(!objectselect){
			//if mouse position is the same as first and last point, do not deselect objects
			if((startpoint.x != endpoint.x)&&(startpoint.z != endpoint.z)){
				//if CTRL and SHIFT are not use deselect objects
				if((CTRL == false)&&(SHIFT == false)){
					for (var unitno:int = 0; unitno < unit.length; unitno++) {
						unit[unitno].bselected = false;
					}
					//trace('deselected...'+CTRL+':'+SHIFT);
				}
				
				for (unitno = 0; unitno < unit.length; unitno++) {
					//unit[unitno].x
					if ((unit[unitno].x > minpoint.x) && (unit[unitno].x < maxpoint.x)&&
						(unit[unitno].z > minpoint.z)&&(unit[unitno].z < maxpoint.z)) {
						//trace('found');
						if(unit[unitno].ownerid == playername){//this make sure it not over lap the other select
							unit[unitno].bselected = true;
							if(SHIFT){
								unit[unitno].bselected = false;
							}
						}
					}else {
						//trace('not found');
					}
				}
			}else 
			{
				
				var groupselectedunit:Vector.<SStructureUnit> = new Vector.<SStructureUnit>();
				//rework the group squad type
				var groupunitgrid:int = 0;
				//this deal with selecting and grouping
				for (var unitselectno:int = 0; unitselectno < unit.length; unitselectno++ ) {
					if (unit[unitselectno].bselected == true) {
						groupselectedunit.push(unit[unitselectno]);//class
					}
				}
				
				//trace('number of units:' + groupselectedunit.length);
				//this deal with group-  unit-> selected length < loop(x)x2 
				for (var groupunitno:int = 0;  groupunitno < groupselectedunit.length ;groupunitno++ ) {
					if (groupselectedunit.length  < (groupunitno * 2)) {
						groupunitgrid = groupunitno;
						break;
					}else {
						groupunitgrid = 1;
					}
				}
				//trace('grid size:' + groupunitgrid);
				
				var countunit:int = 0;
				//row and col group loop
				for (var unitcolno:int = 0; unitcolno < groupselectedunit.length; unitcolno++ ) {
					//trace('units:'+unitrowno);
					if (countunit >= groupselectedunit.length) {
						break;
					}
					for (var unitrowno:int = 0; unitrowno < groupunitgrid; unitrowno++) {
						if (countunit >= groupselectedunit.length) {
							break;
						}
						var posgrouppoint:Point3D = new Point3D();
						groupselectedunit[countunit].order = 'move';
						//posgrouppoint.x = endpoint.x + (9 * unitcolno);
						//posgrouppoint.y = endpoint.y;
						//posgrouppoint.z = endpoint.z + (9 * unitrowno);
						
						posgrouppoint.x = endpoint.x + (32 * unitcolno);
						posgrouppoint.y = endpoint.y;
						posgrouppoint.z = endpoint.z + (32 * unitrowno);
						//trace('ID:'+unitcolno+' move point'+posgrouppoint);
						groupselectedunit[countunit].pointmove(posgrouppoint);
						countunit++;
					}
				}
			}
			}
			trace('single..' + objectselect);
			//objectselect = false;
		}
		
		
		//} END INTERFACE PANEL
		
		//{ START CONTROLERS AND EVENTS
		public function singleunit_assign(su:SStructureUnit):void {
			su.mesh.enableEvents = true;
			su.mesh.enableClipping = false;
			su.mesh.useSingleContainer = false;
			su.mesh.addEventListener(MouseEvent.CLICK, singleunit_click);
			su.mesh.addEventListener(MouseEvent.MOUSE_DOWN, singleunit_down);
			trace('adding unit functions...');
		}
		
		//need to sort out into gourp for order to attack.
		public function unitmenu():void {
			
		}
		
		
		public function updateships():void {
			//ship spawn
			//ship enter
			//weapons
			
			for (var ui:int = 0; ui < unit.length; ui++ ) {
				//trace(unit[ui].name + ':' + unit[ui].unittype.length);
				for (var ut:int = 0; ut < unit[ui].unittype.length;ut++ ) {
					//trace('---' + unit[ui].unittype[ut].name);
					if (unit[ui].unittype[ut].name == 'deployablespaceship') {
						//trace('found...');
						//trace('deployablespaceship---');
						if (unit[ui].unittype[ut].bdeploy == true) {
							unit[ui].launchtime++;
							if (unit[ui].launchtime > unit[ui].launchtimemax) {
								unit[ui].launchtime = 0;
								//trace('hello');
								if (unit[ui].unit.length > 0) {
									//shipclass.unit[0]
									//error//need to fixed
									unit[ui].unit[0].x = unit[ui].x + unit[ui].entitypoint[0].x;
									unit[ui].unit[0].y = unit[ui].y + unit[ui].entitypoint[0].y;
									unit[ui].unit[0].z = unit[ui].z + unit[ui].entitypoint[0].z;
									
									unit[ui].unit[0].bdocked = false;
									singleunit_assign(unit[ui].unit[0]);
									//unit[ui].unit[0].ownerid =  unit[ui].ownerid;
									g.addChild(unit[ui].unit[0].mesh);
									
									unit.push(unit[ui].unit[0]);
									
									unit[ui].unit.splice(0, 1);
								}
							}
						}
					}
					
					//build ships
					if (unit[ui].unittype[ut].name == 'shipyard') {
						//check if there is query in the unit
						//trace('shipyard---');
						if (unit[ui].queryunit.length > 0) {
							//default 0 
							unit[ui].queryunit[0].time++;
							if (unit[ui].queryunit[0].time > unit[ui].queryunit[0].spawntime) {
								//default 0 
								unit[ui].queryunit[0].x = unit[ui].x + unit[ui].entitypoint[0].x;
								unit[ui].queryunit[0].y = unit[ui].x + unit[ui].entitypoint[0].y;
								unit[ui].queryunit[0].z = unit[ui].x + unit[ui].entitypoint[0].z;
								unit[ui].queryunit[0].ownerid = unit[ui].ownerid;
								singleunit_assign(unit[ui].queryunit[0]);
								g.addChild(unit[ui].queryunit[0].mesh);
								unit.push(unit[ui].queryunit[0]);
								unit[ui].queryunit.splice(0, 1);
								trace('spawn ship');
							}
						}
					}
					
				}
			}
			
		}
		
		
		//} END CONTROLERS AND EVENTS
		
		//buildings functions and update
		//update power
		//update building
		//--update spawn time
		//--update ore produing
		//update weapons
		//update projectiles
		public function objectupdate():void {
			var commanderdata:SCommander;
			for (var commanderno:int = 0; commanderno < commander.length;commanderno++) {
				if (commander[commanderno].name == playername) {
					commanderdata = commander[commanderno];
				}
			}
			
			var totalpower:Number = 0;
			var totalpowercost:Number = 0;
			
			//power check if building is destory
			for (var buildingpowerno:int = 0; buildingpowerno < buildings.length ; buildingpowerno++ ) {
				//if(!buildings[buildingpowerno].bdisable){
					totalpowercost += buildings[buildingpowerno].poweruse;
					totalpower += buildings[buildingpowerno].powerlevel;
				///}
			}
			var totalpowerlevel:Number = totalpower;
			
			for (var objectno:int = 0; objectno < buildings.length;objectno++ ) {
				buildings[objectno].update();
				
				if (buildings[objectno].queryunit.length > 0) {
					
					buildings[objectno].queryunit[0].timer++;
					if (buildings[objectno].queryunit[0].time > buildings[objectno].queryunit[0].spawntime ) {
						buildings[objectno].queryunit[0].time = 0;
						trace('unit finish build...');
						//check entery point spawn point else {0,0,0}
						if (buildings[objectno].entitypoint.length > 0) {
							buildings[objectno].queryunit[0].x = buildings[objectno].x + buildings[objectno].entitypoint[0].x;
							buildings[objectno].queryunit[0].y = buildings[objectno].y + buildings[objectno].entitypoint[0].y;
							buildings[objectno].queryunit[0].z = buildings[objectno].z + buildings[objectno].entitypoint[0].z;
						}
						
						buildings[objectno].queryunit[0].ownerid = playername;//assign solider
						singleunit_assign(buildings[objectno].queryunit[0]);//add functions and listener
						g.addChild(buildings[objectno].queryunit[0].mesh);
						unit.push(buildings[objectno].queryunit[0]);
						buildings[objectno].queryunit.splice(0, 1);
						//rebuild query building icon
						//error some where
						/*
						if (buildings[objectno].mesh.name == buildingid) {
							clearsprite(unitquerypanel);
							if(buildings[objectno].queryunit.length > 0){
								for (var iconno:int = 0; iconno < buildings[objectno].queryunit.length;iconno++) {
									var queryicon:QueryUnitBuild = new QueryUnitBuild();
									queryicon.unitquerybuild(buildings[objectno].queryunit[iconno]);
									queryicon.y = (17 * iconno)+1;
									unitquerypanel.addChild(queryicon);
								}
							}
						}
						*/
					}
				}
				
				//Ore Refinery
				if (!buildings[objectno].bdisable) {
					if (totalpowerlevel <= 0) {
						
					}
					else
					{
						//this will use power if power plant is there
						totalpowerlevel -= buildings[objectno].poweruse;
						if (buildings[objectno].buildingtype == 'Ore Refinery') {
							buildings[objectno].time++;
							if (buildings[objectno].time > buildings[objectno].producetime) {
								buildings[objectno].time = 0;
								commanderdata.ore += buildings[objectno].ore;
							}
						}
						
						if (buildings[objectno].buildingtype == 'Gas Refinery') {
							buildings[objectno].time++;
							if (buildings[objectno].time > buildings[objectno].producetime) {
								buildings[objectno].time = 0;
								commanderdata.gas += buildings[objectno].gas;
							}
						}
						
						if (buildings[objectno].buildingtype == 'Crystal Refinery') {
							buildings[objectno].time++;
							if (buildings[objectno].time > buildings[objectno].producetime) {
								buildings[objectno].time = 0;
								commanderdata.crystal += buildings[objectno].crystal;
							}
						}
						
					}
				}
				
				//totalpowercost += buildings[objectno].poweruse;
				//totalpower += buildings[objectno].powerlevel;
			}
			
			commanderdata.powerlevel = totalpower;
			commanderdata.poweruse = totalpowercost;
			//textresource.text = '';
			var unitselectedno:Number = 0;
			
			for (var unitno:int = 0; unitno < unit.length;unitno++ ) {
				unit[unitno].update();
				var weapon:Vector.<SWeapon> = unit[unitno].weapon;
				
				for (var weaponno:int = 0; weaponno < weapon.length; weaponno++) {
					weapon[weaponno].update();
					if (weapon[weaponno].BFIRE) {
						//trace('Fire');
						//var buildprojectile:Projectile = weapon[weaponno].projectilefire;
						var buildprojectile:SProjectile = new SProjectileBullet();
						buildprojectile.setposition(unit[unitno].point());
						buildprojectile.targetangle(unit[unitno].targetangle);
						//buildprojectile
						g.addChild(buildprojectile.mesh);
						projectile.push(buildprojectile);
						weapon[weaponno].BFIRE = false;
					}
				}
				
				
				if (unit[unitno].bselected) {
					unitselectedno++;
				}
			}
			
			for (var projectileno:int = 0; projectileno < projectile.length;projectileno++ ) {
				projectile[projectileno].update();
				
				//remove from scene and delete class
				if (projectile[projectileno].balive == false) {
					g.removeChildByName(projectile[projectileno].mesh.name);
					projectile.splice(projectileno,1);
				}
			}
			
			//textresource.text = 'pow:' + (commanderdata.powerlevel - commanderdata.poweruse) + '/' + commanderdata.powerlevel + ' ore:' + commanderdata.ore +' units:' + unitselectedno + '[]' + unit.length;
			
			customtextset(resource_power, 'Power:' + (commanderdata.powerlevel - commanderdata.poweruse) + '/' + commanderdata.powerlevel);
			customtextset(resource_credit, 'credit: '+commanderdata.credits);
			customtextset(resource_gas, 'Gas: '+commanderdata.gas);
			customtextset(resource_ore, 'Ore: '+commanderdata.ore);
			customtextset(resource_crystal, 'Crystal: ' + commanderdata.crystal);
			var totalowner:int = 0;
			for (var unitownerno:int = 0; unitownerno < unit.length;unitownerno++ ) {
				if (unit[unitownerno].ownerid == playername) {
					totalowner++;
				}
			}
			customtextset(resource_unit,'Unit:'+unitselectedno + '/' + totalowner);
			//commanderdata
		}
		
		//{ build default buttonhandlder
		
		//button build for space craft
		public function spacebuttonsetting():void {
			//need full name will be later use to check
			iconfedcarrier.addEventListener(MouseEvent.CLICK, clickbuild_fedcarrier);
			function clickbuild_fedcarrier(event:Event):void {
				//unitid = '';
				unitbuildname = 'FedCarrier';
				//trace('fedcarrier');
				unitbuildspacecraft();
			}
			iconfedfighter.addEventListener(MouseEvent.CLICK, clickbuild_fedfighter);
			function clickbuild_fedfighter(event:Event):void {
				//trace('fedfighter');
				//unitid = '';
				unitbuildname = 'FedFighter';
				unitbuildspacecraft();
			}
		}
		
		//build space craft with the name
		public function unitbuildspacecraft():void {
			trace('build...');
			for (var u:int = 0; u < unit.length;u++ ) {
				if (unit[u].mesh.name == unitid) {
					//unitbuildname
					//created a class to return value class else null
					var ship:SStructureUnit = new SSpacecraftDesign().ShipName(unitbuildname);
					trace(ship);
					if (ship != null) {
						//add to query build
						unit[u].queryunit.push(ship);
					}
					break;
				}
			}
		}
		
		//}
		
		
		//{ START HUD
		
		public function showgroundunithud():void {
			//ground unit building
			unitmeshbuilding();//init... functions
			addChild(topbarpanel);
			resourcedisplay();
			//buttonbuilding
			buttonbuilding.x = 387;
			buttonbuilding.y = 456;
			buttonbuilding.addEventListener(MouseEvent.CLICK,Buildingicon);
			
			barpanel.y = 454;
			addChild(barpanel);
			
			barpanel.y = 454;
			addChild(barpanel);
			statusbar();
			
			BuildBasicIcon();
			Buildingicon();
			actionorderdisplay();
			mappanel.addChild(mapunitpanel);
			addChild(buttonbuilding);
			iconbuttonevents();
		}
		
		
		public function iconbuttonevents():void {
			iconsoldier.addEventListener(SUnitEvent.CHECK, unit_build);
			iconengineer.addEventListener(SUnitEvent.CHECK,unit_build);
		}
		
		//RENDER MAP AND UNIT POSITION
		public function DrawMapUnit():void {
			
			maprendertime++;
			if (maprendertime > maprendertimemax) {
				mapunitpanel.graphics.clear();
				for (var unitno:int = 0; unitno < unit.length; unitno++ ) {
					mapunitpanel.graphics.beginFill(0xadff2f);
					mapunitpanel.graphics.drawRect(((unit[unitno].x/2) +64), ((unit[unitno].z/2) -64 )*-1,2,2);
				}
				mapunitpanel.graphics.endFill();
			}
		}
		
		public function statusbar():void {
			topbarpanel.graphics.clear();
			topbarpanel.graphics.beginFill(0x999999);
			topbarpanel.graphics.drawRect(0, 0, 800, 14);
			topbarpanel.graphics.endFill();
			
			barpanel.graphics.clear();
			barpanel.graphics.beginFill(0x999999);
			barpanel.graphics.drawRect(0, 0, 800, 146);
			barpanel.graphics.endFill();
			
			mappanel.y = 16;
			mappanel.graphics.clear();
			mappanel.graphics.beginFill(0x363430);
			mappanel.graphics.drawRect(0, 0, 128, 128);
			mappanel.graphics.endFill();
			barpanel.addChild(mappanel);
			
			unitinfopanel.y = 16;
			unitinfopanel.x = 129;
			unitinfopanel.graphics.clear();
			unitinfopanel.graphics.beginFill(0x363430);
			unitinfopanel.graphics.drawRect(0, 0, 128, 128);
			unitinfopanel.graphics.endFill();
			barpanel.addChild(unitinfopanel);
			
			unitactionpanel.y = 16;
			unitactionpanel.x = 387;
			unitactionpanel.graphics.clear();
			unitactionpanel.graphics.beginFill(0x363430);
			unitactionpanel.graphics.drawRect(0, 0,282, 128 );
			unitactionpanel.graphics.endFill();
			barpanel.addChild(unitactionpanel);
			
			unitquerypanel.y = 16;
			unitquerypanel.x = 258;
			unitquerypanel.graphics.clear();
			unitquerypanel.graphics.beginFill(0x363430);
			unitquerypanel.graphics.drawRect(0, 0, 128, 128);
			unitquerypanel.graphics.endFill();
			barpanel.addChild(unitquerypanel);
			
			unitactionorderpanel.y = 16;
			unitactionorderpanel.x = 671;
			unitactionorderpanel.graphics.clear();
			unitactionorderpanel.graphics.beginFill(0x363430);
			unitactionorderpanel.graphics.drawRect(0, 0, 128, 128);
			unitactionorderpanel.graphics.endFill();
			barpanel.addChild(unitactionorderpanel);
		}
		
		//Resource
		public function resourcedisplay():void {
			//resource_power = customtext('Power');
			resource_power.x = 210 + (116 * 0);
			customtextset(resource_power, 'Power:' + '000000/000000');
			resource_credit.x = 210 + (116 * 1);
			customtextset(resource_credit, 'credit: 0000000000');
			resource_gas.x = 210 + (116 * 2);
			customtextset(resource_gas, 'Gas: 0000000000');
			resource_ore.x = 210 + (116 * 3);
			customtextset(resource_ore, 'Ore: 0000000000');
			resource_crystal.x = 210 + (116 * 4);
			customtextset(resource_crystal, 'Crystal: 0000000000');
			resource_unit.x = 210 + (116 * 4);
			resource_unit.y = 14;
			customtextset(resource_unit,'Unit:0/0');
			
			topbarpanel.addChild(resource_power);
			topbarpanel.addChild(resource_credit);
			topbarpanel.addChild(resource_gas);
			topbarpanel.addChild(resource_ore);
			topbarpanel.addChild(resource_crystal);	
			topbarpanel.addChild(resource_unit);
			
		}
		
		public function BuildBasicIcon():void {
			
			//iconconstructionyard.addEventListener();
			iconconstructionyard.addEventListener(MouseEvent.CLICK, clickbuildconstructionyard);
			function clickbuildconstructionyard(event:Event):void {
				removepreviewunitbuilding();
				buildingname = 'Constuction Yard';
				trace(buildingname);
				bottom.addEventListener(MouseEvent.CLICK, placeunitbuilding);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, unitbuildingover);
			}
			
			iconpowerplant.addEventListener(MouseEvent.CLICK, clickbuildpowerplant);
			function clickbuildpowerplant(event:Event):void {
				removepreviewunitbuilding();
				buildingname = 'Power plant';
				trace(buildingname);
				bottom.addEventListener(MouseEvent.CLICK, placeunitbuilding);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, unitbuildingover);
			}
			
			iconorerefiney.addEventListener(MouseEvent.CLICK, clickbuildorerefiney);
			function clickbuildorerefiney(event:Event):void {
				removepreviewunitbuilding();
				buildingname = 'Ore Refiney';
				trace(buildingname);
				bottom.addEventListener(MouseEvent.CLICK, placeunitbuilding);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, unitbuildingover);
			}
			
			//icongasrefinery
			
			//iconcrystalrefinery
			
			iconbarracks.addEventListener(MouseEvent.CLICK, clickbuildbarracks);
			function clickbuildbarracks(event:Event):void {
				removepreviewunitbuilding();
				buildingname = 'Barracks';
				trace(buildingname);
				bottom.addEventListener(MouseEvent.CLICK, placeunitbuilding);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, unitbuildingover);
			}
			
			iconmechfactory.addEventListener(MouseEvent.CLICK, clickbuildmechfactory);
			function clickbuildmechfactory(event:Event):void {
				removepreviewunitbuilding();
				buildingname = 'Mech Factory';
				trace(buildingname);
				bottom.addEventListener(MouseEvent.CLICK, placeunitbuilding);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, unitbuildingover);
			}
			
			//iconairport
			
			//iconseaport
			
		}
		
		public function Buildingicon(event:Event = null):void {
			clearsprite(unitactionpanel);
			iconconstructionyard.y = 1+32*0;
			iconconstructionyard.x = 1+32*0;
			unitactionpanel.addChild(iconconstructionyard);
			
			iconpowerplant.y = 1+32*0;
			iconpowerplant.x = 1+32*1;
			unitactionpanel.addChild(iconpowerplant);
			
			iconorerefiney.y = 1+32*0;
			iconorerefiney.x = 1+32*2;
			unitactionpanel.addChild(iconorerefiney);
			
			icongasrefinery.y = 1+32*0;
			icongasrefinery.x = 1+32*3;
			unitactionpanel.addChild(icongasrefinery);
			
			iconcrystalrefinery.y = 1+32*0;
			iconcrystalrefinery.x = 1+32*4;
			unitactionpanel.addChild(iconcrystalrefinery);
			
			iconbarracks.y = 1+32*0;
			iconbarracks.x = 1+32*5;
			unitactionpanel.addChild(iconbarracks);
			
			iconmechfactory.y = 1+32*1;
			iconmechfactory.x = 1+32*0;
			unitactionpanel.addChild(iconmechfactory);
			
			iconairport.y = 1+32*1;
			iconairport.x = 1+32*1;
			unitactionpanel.addChild(iconairport);
			
			iconseaport.y = 1+32*1;
			iconseaport.x = 1+32*2;
			unitactionpanel.addChild(iconseaport);
		}
		
		public function ActionorederBasicIcon():void {
			
		}
		
		public function actionorderdisplay():void {
			clearsprite(unitactionorderpanel);
			iconattack.y = 1+32*0;
			iconattack.x = 1+32*0;
			unitactionorderpanel.addChild(iconattack);
			iconcancel.y = 1+32*0;
			iconcancel.x = 1+32*1;
			unitactionorderpanel.addChild(iconcancel)
			iconguard.y = 1+32*0;
			iconguard.x = 1+32*2;
			unitactionorderpanel.addChild(iconguard)
			iconmove.y = 1+32*1;
			iconmove.x = 1+32*0;
			unitactionorderpanel.addChild(iconmove)
			iconpatrol.y = 1+32*1;
			iconpatrol.x = 1+32*1;
			unitactionorderpanel.addChild(iconpatrol)
		}
		
		
		//} END HUD
		
		//{ MATH CODE AND OTHERS
		
		//CLEAR SPRITE
		public function clearsprite(sprite:Sprite):void {
			while (sprite.numChildren) {
				for (var panelno:int = 0; panelno < sprite.numChildren ; panelno++ ) {
					sprite.removeChildAt(panelno);
				}
			}
		}
		
		//CAM AND SCREEN 2d TO 3D POSITION
		public function S2W(sx:Number, sy:Number):Point3D {
			var Mcmm:Matrix4 = camera.modelMatrix;
			
			var NEAR:Number = 1;
			var FAR:Number = 15;
			/*
			var z1:Number = NEAR;
			var x1:Number = (sx - WIDTH/2) * z1 / camera.focalLength;
			var y1:Number = ((HEIGHT / 2 - sy) * z1 / camera.focalLength);
			
			var z2:Number = FAR;
			var x2:Number = (sx - WIDTH/2) * z2 / camera.focalLength;
			var y2:Number = ((HEIGHT / 2 - sy) * z2 / camera.focalLength);
			*/
			var z1:Number = NEAR;
			var x1:Number = (sx - scene.camera.viewport.width/2) * z1 / camera.focalLength;
			var y1:Number = ((scene.camera.viewport.height / 2 - sy) * z1 / camera.focalLength);
			
			var z2:Number = FAR;
			var x2:Number = (sx - scene.camera.viewport.width/2) * z2 / camera.focalLength;
			var y2:Number = ((scene.camera.viewport.height/ 2 - sy) * z2 / camera.focalLength);
			
			var p1:Point3D = new Point3D(x1,y1,z1);
			var p2:Point3D = new Point3D(x2,y2,z2);
			
			var rp1:Point3D = Matrix4Math.transform(Mcmm,p1);
			var rp2:Point3D = Matrix4Math.transform(Mcmm,p2);
			
			var t:Number = rp2.y / (rp2.y - rp1.y);
            var Px:Number = (rp1.x-rp2.x)*t+rp2.x;
            var Pz:Number = (rp1.z - rp2.z) * t + rp2.z;
			
			return new Point3D(Px,0,Pz);
		}
		
		//TEXTFIELD FORMAT
		public function customtext(name:String):TextField {
			var text_label:TextField = new TextField();
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0xF5F5F5;
			
			text_label.autoSize = TextFieldAutoSize.LEFT;
			text_label.selectable = false;
			text_label.alwaysShowSelection = false;
			text_label.text = String(name);
			text_label.setTextFormat(format);
			//Width = text_label.width + Space;
			return text_label;
		}
		
		//TEXTFEILD AND SET TEXT
		public function customtextset(textpro:TextField,name:String):void {
			var format:TextFormat = new TextFormat();
			format.size = 10;
			format.font = "OCR A Extended";
			format.color = 0x404040;
			
			textpro.autoSize = TextFieldAutoSize.LEFT;
			textpro.selectable = false;
			textpro.alwaysShowSelection = false;
			textpro.text = String(name);
			textpro.setTextFormat(format);
		}
		
		//}
	}
	
}
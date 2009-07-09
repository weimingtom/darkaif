package 
{
	//{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import gearunits.models.PPlane;
	import gearunits.papervision3d.display.PUnitIconButton;
	import gearunits.papervision3d.entity.*;
	import gearunits.papervision3d.entity.building.*
	import gearunits.papervision3d.entity.infantry.*;
	import gearunits.papervision3d.entity.projectile.*;
	import gearunits.papervision3d.entity.spacecraft.*
	import gearunits.papervision3d.node.PNodePoint3D;
	import org.jloa.display.ResourceMonitor;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.math.Plane3D;
	import org.papervision3d.core.proto.CameraObject3D;
	import org.papervision3d.core.utils.Mouse3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.view.BasicView;
	import org.papervision3d.view.Viewport3D;
	//}
	
	/**
	 * @author Darknet
	 * 
	 * Information:
	 * 
	 * Note: This is being port from away3d and sandy.
	 * 
	 */
	[SWF(width="800", height="600", backgroundColor="#FFFFFF", frameRate="30")]
	public class Papervision3DGearUnits extends BasicView
	{
		//{
		//{ Embed FILES
		[Embed(source = "system/icon/spacecraft_fedcarrier_icon32.jpg")]
		private var image32fedcarrier:Class;
		public var icon32fedcarrier:PUnitIconButton = new PUnitIconButton(new image32fedcarrier());
		
		[Embed(source = "system/icon/spacecraft_fedfighter_icon32.jpg")]
		private var image32fedfighter:Class;
		public var icon32fedfighter:PUnitIconButton = new PUnitIconButton(new image32fedfighter());
		
		[Embed(source = "system/icon/load_icon32.jpg")]
		private var image32load:Class;
		public var icon32load:PUnitIconButton = new PUnitIconButton(new image32load());
		
		[Embed(source = "system/icon/unload_icon32.jpg")]
		private var image32unload:Class;
		public var icon32unload:PUnitIconButton = new PUnitIconButton(new image32unload());
		
		[Embed(source = "system/icon/constructionyard_rts_icon32.jpg")]
		private var image32constructionyard:Class;
		public var icon32constructionyard:PUnitIconButton = new PUnitIconButton(new image32constructionyard());
		
		[Embed(source = "system/icon/powerplant_rts_icon32.jpg")]
		private var image32powerplant:Class;
		public var icon32powerplant:PUnitIconButton = new PUnitIconButton(new image32powerplant());
		
		[Embed(source = "system/icon/orerefinery_rts_icon32.jpg")]
		private var image32orerefinery:Class;
		public var icon32orerefinery:PUnitIconButton = new PUnitIconButton(new image32orerefinery());
		
		[Embed(source = "system/icon/gasrefinery_rts_icon32.jpg")]
		private var image32gasrefinery:Class;
		public var icon32gasrefinery:PUnitIconButton = new PUnitIconButton(new image32gasrefinery());
		
		[Embed(source = "system/icon/crystalrefinery_rts_icon32.jpg")]
		private var image32crystalrefinery:Class;
		public var icon32crystalrefinery:PUnitIconButton = new PUnitIconButton(new image32crystalrefinery());
		
		[Embed(source = "system/icon/barracks_rts_icon32.jpg")]
		private var image32barrack:Class;
		public var icon32barrack:PUnitIconButton = new PUnitIconButton(new image32barrack());
		
		[Embed(source = "system/icon/mechfactory_rts_icon32.jpg")]
		private var image32mechfactory:Class;
		public var icon32mechfactory:PUnitIconButton = new PUnitIconButton(new image32mechfactory());
		
		[Embed(source = "system/icon/airport_rts_icon32.jpg")]
		private var image32airport:Class;
		public var icon32airport:PUnitIconButton = new PUnitIconButton(new image32airport());
		
		[Embed(source = "system/icon/seaport_rts_icon32.jpg")]
		private var image32seaport:Class;
		public var icon32seaport:PUnitIconButton = new PUnitIconButton(new image32seaport());
		
		[Embed(source = "system/icon/soldier_rts_icon32.jpg")]
		private var image32soldier:Class;
		public var icon32soldier:PUnitIconButton = new PUnitIconButton(new image32soldier());
		
		[Embed(source = "system/icon/engineer_rts_icon32.jpg")]
		private var image32engineer:Class;
		public var icon32engineer:PUnitIconButton = new PUnitIconButton(new image32engineer());
		//}
		
		//{
		//PAPERVISION
		private var mouse3D:Mouse3D;
		private var pivotPoint:DisplayObject3D = new DisplayObject3D();
		public var plane:Plane = new Plane(null, 512, 512, 32, 32);
		
		//GAME DATA
		public var unitbot:PStructureUnit = new PUnitBlock();
		public var unit:Vector.<PStructureUnit> = new Vector.<PStructureUnit>();
		
		public var center:DisplayObject3D = new DisplayObject3D();
		
		public var building:Vector.<PStructureUnit> = new Vector.<PStructureUnit>();
		public var projectile:Vector.<PProjectile> = new Vector.<PProjectile>();
		
		public var unitid:String = '';
		public var unitbuildid:String = '';
		public var bunload:Boolean = false;
		
		public var startpoint:Number3D = new Number3D();
		public var endpoint:Number3D = new Number3D();
		//public var selectbox:Plane = new Plane( { name:'selectbox', width:64, height:64} );
		public var selectbox:PPlane = new PPlane(new ColorMaterial(0x0FFFF00));
		public var bunitselected:Boolean = false;
		public var bselectmode:Boolean = false;
		public var bunitmenu:Boolean = false;
		public var bunitmainmenu:Boolean = false;
		
		
		public var HUD_UNITSHORTCUT:Sprite = new Sprite(); //unit build commands
		public var HUD_UNIT:Sprite = new Sprite(); //unit panel for actions basic actions
		public var HUD_USER:Sprite = new Sprite();
		public var HUD:Sprite = new Sprite();
		
		public var playername:String = 'guest';
		//}
		
		//{ MESH TMP BUILD CLASS
		
		public var meshplacement:TriangleMesh3D;
		
		public var bbarrack:PBuildingBarrack = new PBuildingBarrack();
		public var bconstructionyard:PBuildingConstructionYard = new PBuildingConstructionYard();
		public var bmechfactory:PBuildingMechFactory = new PBuildingMechFactory();
		public var bpowerplant:PBuildingPowerPlant = new PBuildingPowerPlant();
		public var borerefinery:PBuildingOreRefinery = new PBuildingOreRefinery();
		public var bgasrefinery:PBuildingGasRefinery = new PBuildingGasRefinery();
		
		
		//}
		
		//{ KEYBOARD
		public var SHIFT:Boolean = false;
		public var CTRL:Boolean = false;
		public var KEY_A:Boolean = false;
		public var KEY_B:Boolean = false;
		public var KEY_C:Boolean = false;
		public var KEY_D:Boolean = false;
		public var KEY_E:Boolean = false;
		public var KEY_F:Boolean = false;
		public var KEY_G:Boolean = false;
		public var KEY_H:Boolean = false;
		public var KEY_I:Boolean = false;
		public var KEY_J:Boolean = false;
		public var KEY_K:Boolean = false;
		public var KEY_L:Boolean = false;
		public var KEY_M:Boolean = false;
		public var KEY_N:Boolean = false;
		public var KEY_O:Boolean = false;
		public var KEY_P:Boolean = false;
		public var KEY_Q:Boolean = false;
		public var KEY_R:Boolean = false;
		public var KEY_S:Boolean = false;
		public var KEY_T:Boolean = false;
		public var KEY_U:Boolean = false;
		public var KEY_V:Boolean = false;
		public var KEY_W:Boolean = false;
		public var KEY_X:Boolean = false;
		public var KEY_Y:Boolean = false;
		public var KEY_Z:Boolean = false;
		//}
		//}
		
		public function Papervision3DGearUnits() {
			var monitor:ResourceMonitor = new ResourceMonitor(true, true);
			monitor.x = 718;
			monitor.y = 14;
			addChild(monitor);
			monitor.monitor();
			
			Mouse3D.enabled = true;
			viewport.interactive = true;
			mouse3D = viewport.interactiveSceneManager.mouse3D;
			camera.z = -200;
			camera.y = 200;
			
			camera.target = center;
			camera.rotationX = 45;
			camera.target = null;
			
			PStructureUnit.scene = scene;
			PStructureUnit.units = unit;
			PStructureUnit.projectile = projectile;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypressdown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyupevent);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, selectboxdown );
			stage.addEventListener(MouseEvent.MOUSE_UP, selectboxup );
			
			//buildspaceunit();
			buildgroundunit();
			buildterrain();
			startRendering();
			init_selectbox3d();
			init_setuphud();
			buttonbuildunit();
		}
		
		//{ KEY BOARD FUNCTIONS
		public function keypressdown(key:KeyboardEvent):void {
			//camera.lookAt(center);
			//trace('key press');
			
			//camera.target = center;
			if (key.keyCode == 16) {
				SHIFT = true;
			}
			
			if (key.keyCode == 17) {
				CTRL = true;
			}
			
			if (key.keyCode == 37) {//left
				camera.x -= 10;
				center.x -= 10;
				cameraAsCamera3D.x -= 10;
				//viewport.x -= 10;
			}
			if (key.keyCode == 39) {//right
				camera.x += 10;
				center.x += 10;
				cameraAsCamera3D.x += 10;
				//viewport.x += 10;
			}
			if (key.keyCode == 40) {//down
				camera.z -= 10;
				center.z -= 10;
				cameraAsCamera3D.z -= 10;
				//viewport.z -= 10;
			}
			if (key.keyCode == 38) {//up
				camera.z += 10;
				center.z += 10;
				//cameraAsCamera3D.z += 10;
				//viewport.z += 10;
				//camera.lookAt(0, 0, 0);
			}
			
			if (key.keyCode == 90) {
				KEY_Z =  true;
			}
			
			if (key.keyCode == 88) {
				KEY_X =  true;
			}
			
			unitshortcutpanel();
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
			
		}
		//}
		
		
		//{ //Set up scene game objects
		
		public function init_selectbox3d():void {
			//selectbox.name = 'selectbox';
			var matcolor:ColorMaterial = new ColorMaterial(0x999999);
			matcolor.fillAlpha = 0.5;
			//matcolor.interactive = true;
			selectbox.material = matcolor;
			//selectbox.alpha = 0.5;
			
			
			scene.addChild(selectbox);
			scene.removeChild(selectbox);
		}
		
		public function init_setuphud():void {
			HUD.addChild(HUD_UNITSHORTCUT);
			HUD.addChild(HUD_UNIT);
			HUD.addChild(HUD_USER);
			addChild(HUD);
		}
		
		public function buildterrain():void {
			var matcolor:ColorMaterial = new ColorMaterial(0x555500);
			var matwire:WireframeMaterial = new WireframeMaterial(0x000000);
			var compost:CompositeMaterial = new CompositeMaterial();
			compost.addMaterial(matcolor);
			compost.addMaterial(matwire);
			compost.interactive = true;
			plane.material = compost;
			plane.rotationX = 90;
			plane.rotationY = 0;
			plane.rotationZ = 0;
			//plane.useOwnContainer = true;
			plane.useClipping = true;
			plane.y = 0;
			plane.culled = true;
			//plane.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS, pointmove);
			scene.addChild(plane);
		}
		
		public function buildspaceunit():void {
			var buildunit:PStructureUnit;
			
			buildunit = new PSpacestationFedShipyard();
			buildunit.ownerid = playername;
			buildunit.x = 0;
			buildunit.y = 0;
			buildunit.z = 0;
			unitfun(buildunit);
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
			buildunit = new PSpaceshipFedFighter();
			buildunit.ownerid = playername;
			buildunit.x = 0;
			buildunit.y = 0;
			buildunit.z = 0;
			unitfun(buildunit);
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
		}
		
		public function buildgroundunit():void {
			var buildunit:PStructureUnit;
			
			unitbot.ownerid = playername;
			unitbot.y = 16;
			unitfun(unitbot);
			unit.push(unitbot);
			scene.addChild(unitbot.mesh);
			//unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			//buildunit.ownerid = playername;
			buildunit.x = 64;
			buildunit.y = 16;
			buildunit.z = 64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			buildunit.x = -64;
			buildunit.y = 16;
			buildunit.z = 64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			buildunit.x = 64;
			buildunit.y = 16;
			buildunit.z = -64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
			buildunit = new PBuildingWall();
			buildunit.x = -64;
			buildunit.y = 16;
			buildunit.z = -64;
			scene.addChild(buildunit.mesh);
			unit.push(buildunit);
			
		}
		
		//}
		
		override protected function onRenderTick(event:Event = null):void {
			
			for (var p:int = 0; p < projectile.length;p++ ) {
				projectile[p].update();
			}
			
			for (var i:int = 0; i < unit.length;i++ ) {
				unit[i].update();
			}
			unitbot.update();
			
			super.onRenderTick(event);
		}
		
		//=========================================================================================
		//units
		//=========================================================================================
		
		public function unitfun(su:PStructureUnit):void {
			//su.mesh.ownCanvas = true;//note this will over lap each other
			//su.mesh.addEventListener(InteractiveScene3DEvent.OBJECT_PRESS,singleunitselectdown);
			su.mesh.addEventListener(InteractiveScene3DEvent.OBJECT_RELEASE,singleunitselectup);
		}
		
		public function singleunitselectdown(event:InteractiveScene3DEvent):void {
			//trace('unit select down');
		}
		
		public function singleunitselectup(event:InteractiveScene3DEvent):void {
			//event.object
			//trace('unit select up');
			for (var i:int = 0; i < unit.length;i++ ) {
				if (unit[i].mesh == event.displayObject3D) {//if object matches class mesh
					unitid = String(unit[i].id);
					unittype();
					if (unit[i].ownerid == playername) {
						//trace('found...'+unit[i].name);
						if (SHIFT == true) {
							unit[i].bselected = false;
							//trace('found ds :' + unit[i].name);
							bunitselected = true
							break;
						}
						if (CTRL == true) {
							unit[i].bselected = true;
							//trace('found s : ' + unit[i].name);
							bunitselected = true
							break;
						}
						if ((CTRL == false) && (SHIFT == false) ) {
							//trace('helloooll');
							unit[i].bselected = true;
							bunitselected = true;//this deal with not moving while object is selected
						}
					}else {
						//unit[i].bselected = false;
					}
					//trace('found : '+unit[i].name);
				}else {
					if((CTRL == false)&&(SHIFT == false)){
						unit[i].bselected = false;
					}
				}
			}
			/*
			var selectcount:int = 0;
			for (var ds:int = 0; ds < unit.length; ds++ ) {
				if ((unit[ds].ownerid == playername)&&(unit[ds].bselected == true)) {
					selectcount++;
				}
			}
			trace('selectcount:' + selectcount);
			*/
			
		}
		
		public function selectunitcheck():void {
			var minpoint:Number3D = new Number3D();
			var maxpoint:Number3D = new Number3D();
			
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
			//trace('======');
			if ((startpoint.x != endpoint.x) && (startpoint.z != endpoint.z)) {
				//trace('selected..'+startpoint+'[]'+endpoint);
				for (var unitno:int = 0; unitno < unit.length; unitno++) {
					//unit[unitno].x
					if ((unit[unitno].x > minpoint.x) && (unit[unitno].x < maxpoint.x)&&
						(unit[unitno].z > minpoint.z)&&(unit[unitno].z < maxpoint.z)) {
						//trace('select');
						if((unit[unitno].ownerid == playername)&&(unit[unitno].bsingleselect == false) ){//this make sure it not over lap the other select
							unit[unitno].bselected = true;
							if(SHIFT){
								unit[unitno].bselected = false;
							}
						}
					}else {
						//trace('not found');
						unit[unitno].bselected = false;
					}
				}
			}else{
				if(bunitselected == false){//if object is selected first
					var groupselectedunit:Vector.<PStructureUnit> = new Vector.<PStructureUnit>();
					
					for (var unitselectno:int = 0; unitselectno < unit.length; unitselectno++ ) {
						if (unit[unitselectno].bselected == true) {
							groupselectedunit.push(unit[unitselectno]);//class
						}
					}
					var groupunitgrid:int = 1;
					//this deal with group-  unit-> selected length < loop(x)x^2 
					for (var groupunitno:int = 0;  groupunitno < groupselectedunit.length ;groupunitno++ ) {
						if (groupselectedunit.length  <= (groupunitno * groupunitno)) {
							groupunitgrid = groupunitno;
							break;
						}
					}
					//trace('grid cell:'+groupunitgrid);
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
							var posgrouppoint:Number3D = new Number3D();
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
			//if single object is not selected turn it off
			bunitselected = false;
		}
		
		public function unitupdate():void {
			
			for (var li:int = 0; li < unit.length ; li++ ) {
				//type for function execute code
				for (var t:int = 0; t < unit[li].type.length; t++ ) {
					//building ships
					/*  //build in class
					if (unit[li].type[t].name == 'shipyard') {
						if (unit[li].queryunit.length) {
							unit[li].queryunit[0].time++;
							if (unit[li].queryunit[0].time > unit[li].queryunit[0].spawntime) {
								unit[li].queryunit[0].time = 0;
								//check point to exit
								for (var i:int = 0; i < unit[li].entityPoint.length;i++ ) {
									unit[li].queryunit[0].x = unit[li].x + unit[li].entityPoint[i].x;
									unit[li].queryunit[0].y = unit[li].y + unit[li].entityPoint[i].y;
									unit[li].queryunit[0].z = unit[li].x + unit[li].entityPoint[i].z;
								}
								unitfun(unit[li].queryunit[0]);//build function
								view.scene.addChild(unit[li].queryunit[0].mesh);
								unit.push(unit[li].queryunit[0]);
								unit[li].queryunit.splice(0,1);
							}
						}
					}
					*/
					
					if (unit[li].type[t].name == 'deployablespaceship') {
						unit[li].type[t].bdeploy = bunload; //test function //execute code
						
						/* //build in class
						if(unit[li].type[t].bdeploy == true){
							if (unit[li].unit.length) {
								unit[li].unit[0].time++;
								if (unit[li].unit[0].time > unit[li].unit[0].launchtime) {
									unit[li].unit[0].time = 0;
									//check point to exit
									for (var ii:int = 0; ii < unit[li].entityPoint.length;ii++ ) {
										unit[li].unit[0].x = unit[li].x + unit[li].entityPoint[ii].x;
										unit[li].unit[0].y = unit[li].y + unit[li].entityPoint[ii].y;
										unit[li].unit[0].z = unit[li].x + unit[li].entityPoint[ii].z;
									}
									//unitfun(unit[li].unit[0]);//build function
									view.scene.addChild(unit[li].unit[0].mesh);
									unit.push(unit[li].unit[0]);
									unit[li].unit.splice(0,1);
								}
							}else {
								unit[li].type[t].bdeploy = false;
							}
						}
						*/
					}
				}
			}
		}
		
		//=========================================================================================
		//units building
		//=========================================================================================
		//this deal with basic actions
		public function unittype():void {
			//trace('class build...');
			//this will go throught menu build using object and keyboard event
			bunitmenu = false;//make sure this menu is close
			var su:PStructureUnit;
			for (var ii:int = 0; ii < unit.length;ii++ ) {
				if (String(unit[ii].id) == unitid) {
					trace('found...');
					su = unit[ii];
					break;
				}
			}
			
			if (su != null) {
				//unitid = String(su.id);
				clearsprite(HUD_UNIT);
				trace('spacecraft:'+su.name);
				for (var i:int = 0; i < su.type.length; i++ ) {
					//trace(':-'+su.type[i].name)
					//deployable spaceship
					if (su.type[i].name == 'deployablespaceship') {
						HUD_UNIT.addChild(icon32load);
						icon32unload.x = 32;
						HUD_UNIT.addChild(icon32unload);
					}
					//BUILD SHIPS BUTTONS
					if (su.type[i].name == 'shipyard') {
						//trace('==shipyard');
						//need to loop stuff check level tree
						//HUD_UNIT.addChild(icon32fedfighter);
						//icon32fedcarrier.x = 32;
						//HUD_UNIT.addChild(icon32fedcarrier);
					}
					
				}
			}
			unitshortcutpanel();
		}
		//this deal with build commands
		//need to sort out the icon incase it over lap some reason
		public function unitshortcutaction():void {
			//trace('class build...');
			//this will go throught menu build using object and keyboard event
			var su:PStructureUnit;
			for (var ii:int = 0; ii < unit.length;ii++ ) {
				if (String(unit[ii].id) == unitid) {
					//trace('found...');
					su = unit[ii];
					break;
				}
			}
			
			if (su != null) {
				//unitid = String(su.id);
				clearsprite(HUD_UNITSHORTCUT);
				
				HUD_UNITSHORTCUT.x = 100;
				HUD_UNITSHORTCUT.y = 100;
				//HUD_UNITSHORTCUT.graphics.clear();
				//HUD_UNITSHORTCUT.graphics.beginFill(0x999999);
				//HUD_UNITSHORTCUT.graphics.drawRect(0, 0, 100, 100);
				//HUD_UNITSHORTCUT.graphics.endFill();
				
				trace('spacecraft:'+su.name);
				for (var i:int = 0; i < su.type.length; i++ ) {
					//trace(':-'+su.type[i].name)
					//deployable spaceship
					if (su.type[i].name == 'deployablespaceship') {
						HUD_UNITSHORTCUT.addChild(icon32load);
						icon32unload.x = 32;
						HUD_UNITSHORTCUT.addChild(icon32unload);
					}
					//BUILD SHIPS BUTTONS
					if (su.type[i].name == 'shipyard') {
						trace('==shipyard');
						//need to loop stuff check level tree
						HUD_UNITSHORTCUT.addChild(icon32fedfighter);
						icon32fedcarrier.x = 32;
						HUD_UNITSHORTCUT.addChild(icon32fedcarrier);
					}
					
					if (su.type[i].name == 'Infantry') {
						//trace('==shipyard');
						//need to loop stuff check level tree
						icon32soldier.x = 32*0;
						icon32soldier.y = 32*0;
						HUD_UNITSHORTCUT.addChild(icon32soldier);
						
						icon32engineer.x = 32*1;
						icon32engineer.y = 32*0;
						HUD_UNITSHORTCUT.addChild(icon32engineer);
						
					}
				}
			}
		}
		
		//this is the building code for ground unit and others
		public function unitmainaction():void {
			clearsprite(HUD_UNITSHORTCUT);
			icon32constructionyard.x = 32*0;
			icon32constructionyard.y = 32*0;
			HUD_UNITSHORTCUT.addChild(icon32barrack);
			
			icon32powerplant.x = 32*1;
			icon32powerplant.y = 32*0;
			HUD_UNITSHORTCUT.addChild(icon32powerplant);
			icon32gasrefinery.x = 32*2;
			icon32gasrefinery.y = 32*0;
			HUD_UNITSHORTCUT.addChild(icon32gasrefinery);
			icon32orerefinery.x = 32*3;
			icon32orerefinery.y = 32*0;
			HUD_UNITSHORTCUT.addChild(icon32orerefinery);
			icon32barrack.x = 32*4;
			icon32barrack.y = 32*0;
			HUD_UNITSHORTCUT.addChild(icon32barrack);
			icon32mechfactory.x = 32*5;
			icon32mechfactory.y = 32*0;
			HUD_UNITSHORTCUT.addChild(icon32mechfactory);
			//icon.x = 32*;
			//icon32barrack.y = 32*1;
			//HUD_UNITSHORTCUT.addChild(icon32barrack);
		}
		
		//=========================================================================================
		//
		//=========================================================================================
		
		//{ select box function
		public function pointposition(event:Event):void {
			//var pos:Number3D = point2dto3d();
			var pos:Number3D = getIntersection(viewport, camera, [0, 1, 0]);
			//box.x = pos.x;
			//box.z = pos.z;
		}
		
		public function selectboxdown(event:Event):void {
			//note this bit different from sandy and away3d
			//This deal with fast add and remove objects
			selectbox.geometry.vertices[0].x = 0;
			selectbox.geometry.vertices[0].z = 0;
			selectbox.geometry.vertices[1].x = 0;
			selectbox.geometry.vertices[1].z = 0;
			selectbox.geometry.vertices[2].x = 0;
			selectbox.geometry.vertices[2].z = 0;
			selectbox.geometry.vertices[3].x = 0;
			selectbox.geometry.vertices[3].z = 0;
			
			startpoint = getIntersection(viewport, camera, [0, 1, 0]);
			scene.addChild(selectbox);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, selectboxmove );
			
		}
		
		public function selectboxmove(event:Event):void {
			//endpoint = point2dto3d();
			endpoint = getIntersection(viewport, camera, [0, 1, 0]);
			var minpoint:Number3D = new Number3D();
			var maxpoint:Number3D = new Number3D();
			
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
			
			selectbox.geometry.vertices[0].x = maxpoint.x;
			selectbox.geometry.vertices[0].z = maxpoint.z;
			selectbox.geometry.vertices[1].x = maxpoint.x;
			selectbox.geometry.vertices[1].z = minpoint.z;
			selectbox.geometry.vertices[2].x = minpoint.x;
			selectbox.geometry.vertices[2].z = minpoint.z;
			selectbox.geometry.vertices[3].x = minpoint.x;
			selectbox.geometry.vertices[3].z = maxpoint.z;
			//selectbox.alpha = 0.1;
			
		}
		
		public function selectboxup(event:Event):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, selectboxmove );
			endpoint = getIntersection(viewport, camera, [0, 1, 0]);
			scene.removeChild(selectbox);
			selectunitcheck();
			
		}
		//} select function
		
		//=========================================================================================
		// HUDS / FUNCTIONS
		//=========================================================================================
		//UNIT MENU BUILDS POP UP CONTROL
		public function unitshortcutpanel():void {
			if (KEY_Z == true) {
				var oldunit:Boolean = bunitmenu;
				if(oldunit == true){
					bunitmenu = false;
				}else {
					bunitmenu = true;
				}
			}
			
			if (KEY_X == true) {
				var oldmainunit:Boolean = bunitmainmenu;
				if(oldmainunit == true){
					bunitmainmenu = false;
				}else {
					bunitmainmenu = true;
				}
			}
			
			if (bunitmenu == true) {
				trace('Hello');
				unitshortcutaction();
			}else if (bunitmainmenu == true) {
				trace('Hello');
				unitmainaction();
			}else {
				clearsprite(HUD_UNITSHORTCUT);
				HUD_UNITSHORTCUT.graphics.clear();
			}
		}
		
		public function unit_menupanel():void {
			
			
		}
		
		//ALL UNIT BUTTONS FUNCTIONS
		public function buttonbuildunit():void {
			trace('init... buttons...');
			//{ space craft builder
			icon32fedfighter.addEventListener(MouseEvent.CLICK,clickbuild_fedfighter);
			function clickbuild_fedfighter(event:Event):void {
				//unitbuildid = 'FedFighter';
				unitbuildid = PSpaceshipFedFighter.NAME;
				trace(unitbuildid +'===');
				unitbuild();
			}
			
			icon32fedcarrier.addEventListener(MouseEvent.CLICK,clickbuild_fedcarrier);
			function clickbuild_fedcarrier(event:Event):void {
				//unitbuildid = 'FedCarrier';
				unitbuildid = PSpaceshipFedCarrier.NAME;
				trace(unitbuildid +'===');
				unitbuild();
			}
			
			icon32unload.addEventListener(MouseEvent.CLICK,clickbuild_unload);
			function clickbuild_unload(event:Event):void {
				unitbuildid = '';
				bunload = true;
				unitbuild();
			}
			
			icon32load.addEventListener(MouseEvent.CLICK,clickbuild_load);
			function clickbuild_load(event:Event):void {
				unitbuildid = '';
				bunload = false;
				unitbuild();
			}
			//}
			
			//{ //unit building code
			icon32constructionyard.addEventListener(MouseEvent.CLICK,showbuilding_constructionyard);
			function showbuilding_constructionyard(event:Event):void {
				trace('bconstructionyard...');
				meshplacement = bconstructionyard.mesh;
				unitbuildid = PBuildingConstructionYard.NAME;
				addplacemeshterrain();
			}
			
			icon32powerplant.addEventListener(MouseEvent.CLICK,showbuilding_powerplant);
			function showbuilding_powerplant(event:Event):void {
				trace('bpowerplant...');
				meshplacement = bpowerplant.mesh;
				unitbuildid = PBuildingPowerPlant.NAME;
				addplacemeshterrain();
			}
			
			icon32orerefinery.addEventListener(MouseEvent.CLICK,showbuilding_orerefinery);
			function showbuilding_orerefinery(event:Event):void {
				trace('borerefinery...');
				meshplacement = borerefinery.mesh;
				unitbuildid = PBuildingOreRefinery.NAME;
				addplacemeshterrain();
			}
			
			icon32gasrefinery.addEventListener(MouseEvent.CLICK,showbuilding_gasrefinery);
			function showbuilding_gasrefinery(event:Event):void {
				trace('bgasrefinery...');
				meshplacement = bgasrefinery.mesh;
				unitbuildid = PBuildingGasRefinery.NAME;
				addplacemeshterrain();
			}
			
			icon32barrack.addEventListener(MouseEvent.CLICK,showbuilding_barrack);
			function showbuilding_barrack(event:Event):void {
				trace('bbarracks...');
				meshplacement = bbarrack.mesh;
				unitbuildid = PBuildingBarrack.NAME;
				addplacemeshterrain();
			}
			
			icon32mechfactory.addEventListener(MouseEvent.CLICK,showbuilding_mechfactory);
			function showbuilding_mechfactory(event:Event):void {
				trace('mechfactory...');
				meshplacement = bmechfactory.mesh;
				unitbuildid = PBuildingMechFactory.NAME;
				addplacemeshterrain();
			}
			
			icon32airport.addEventListener(MouseEvent.CLICK,showbuilding_airport);
			function showbuilding_airport(event:Event):void {
				trace('mechfactory...');
				//bbarrack.mesh.ownCanvas = true;
				//bbarrack.mesh.alpha = 0.5;
				meshplacement = bbarrack.mesh;
				unitbuildid = PBuildingMechFactory.NAME;
				addplacemeshterrain();
			}
			//}
			
			//{ Infantry Class
			icon32soldier.addEventListener(MouseEvent.CLICK,clickbuild_soldier);
			function clickbuild_soldier(event:Event):void {
				unitbuildid = PInfantrySoldier.NAME;
				unitbuild();
			}
			
			icon32engineer.addEventListener(MouseEvent.CLICK,clickbuild_engineer);
			function clickbuild_engineer(event:Event):void {
				unitbuildid = PInfantryEngineer.NAME;
				unitbuild();
			}
			//}
		}
		
		//This will remove the mesh that is last currently use.
		public function removeunitmesh():void {
			scene.removeChild(bconstructionyard.mesh);
			scene.removeChild(bpowerplant.mesh);
			scene.removeChild(bgasrefinery.mesh);
			scene.removeChild(borerefinery.mesh);
			scene.removeChild(bbarrack.mesh);
			scene.removeChild(bmechfactory.mesh);
		}
		
		//add controler to place unit building or unit
		public function addplacemeshterrain():void {
			removeunitmesh();
			scene.addChild(meshplacement);
			//add terrain listener
			plane.addEventListener(InteractiveScene3DEvent.OBJECT_MOVE, updateunitmeshplacement);
			//add current object that is being place upon
			meshplacement.addEventListener(InteractiveScene3DEvent.OBJECT_RELEASE, placeunitspace);
		}
		
		//update mouse positon of the terrain
		public function updateunitmeshplacement(event:InteractiveScene3DEvent):void {
			if (meshplacement != null) {
				//meshplacement.x = event.sceneX;
				//meshplacement.y = event.sceneY;
				//meshplacement.z = event.sceneZ;
				meshplacement.x = mouse3D.x;
				meshplacement.y = mouse3D.y;
				meshplacement.z = mouse3D.z;
			}
			//trace('...update mesh x:' + event.sceneX + ' y:' + event.sceneY + ' z:' +event.sceneZ);
		}
		
		//place object once click and remove listener from terrain
		public function placeunitspace(event:InteractiveScene3DEvent):void {
			trace('PLACE x:' + meshplacement.x + ' y:' + meshplacement.y + ' z:' + meshplacement.z);
			removeunitmesh();
			endpoint.x = meshplacement.x;
			endpoint.y = meshplacement.y;
			endpoint.z = meshplacement.z;
			buildunitbuilding();
			//need to remove Listener one the object is place for the game
			plane.removeEventListener(InteractiveScene3DEvent.OBJECT_MOVE, updateunitmeshplacement);
		}
		
		public function buildunitbuilding():void {
			trace(unitbuildid + '->');
			
			var builtunit:PStructureUnit = new PUnitClass().CheckName(unitbuildid);
			if(builtunit != null){//this make sure if the class is not there that will give error
				builtunit.x = endpoint.x;
				builtunit.y = endpoint.y;
				builtunit.z = endpoint.z;
				trace(endpoint + ';;;;');
				unitfun(builtunit);//add functions and listener here
				scene.addChild(builtunit.mesh);
				unit.push(builtunit);
			}
		}
		
		//build units and push unit:vector<array>();
		public function unitbuild():void {
			for (var i:int = 0; i < unit.length;i++ ) {
				if (String(unit[i].id) == String(unitid)) {
					var buildunit:PStructureUnit = new PUnitClass().CheckName(unitbuildid);
					if (buildunit != null) {
						trace(buildunit.name);
						buildunit.ownerid = playername;
						unitfun(buildunit);
						unit[i].queryunit.push(buildunit);
					}
					//trace(unit[i].name + ' > No. query:' + unit[i].queryunit.length);
					break;
				}
			}
		}
		
		//=========================================================================================
		// OTHER FUNCTIONS
		//=========================================================================================
		
		//RAY CASTING
		public function getIntersection(viewport:Viewport3D, camera:CameraObject3D, normal:Array):Number3D {
            var plane3D:Plane3D = new Plane3D(new Number3D(normal[0], normal[1], normal[2]), new Number3D(0, 0, 0));
            var cameraPosition:Number3D = new Number3D(camera.x, camera.y, camera.z);
            var ray:Number3D = camera.unproject(viewport.containerSprite.mouseX, viewport.containerSprite.mouseY);
            ray = Number3D.add(ray, cameraPosition);
            var intersect:Number3D = plane3D.getIntersectionLineNumbers(cameraPosition, ray);
            return intersect;
        }
		
		//CLEAR SPRITE
		public function clearsprite(sprite:Sprite):void {
			while (sprite.numChildren) {
				for (var panelno:int = 0; panelno < sprite.numChildren ; panelno++ ) {
					sprite.removeChildAt(panelno);
				}
			}
		}
		
	}
	
}
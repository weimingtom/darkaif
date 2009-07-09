package  
{
	//{
	import gearunits.away3d.entity.building.*;
	import gearunits.away3d.entity.infantry.*;
	import gearunits.sandy3d.entity.spacecraft.*;
	import gearunits.away3d.display.AUnitIconButton;
	import gearunits.away3d.entity.AStructureUnit;
	import gearunits.away3d.entity.AUnitClass;
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.spacecraft.*;
	import gearunits.models.*;
	import away3d.materials.WireColorMaterial;
    import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.core.geom.Plane3D;
	import away3d.core.math.Number3D;
	import away3d.events.MouseEvent3D;
	import away3d.events.Object3DEvent;
	import away3d.materials.ColorMaterial;
	import away3d.materials.MovieMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Plane;
    import away3d.primitives.Sphere;
    import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.system.System;
	import org.jloa.display.ResourceMonitor;
	//}
	
    [SWF(width="800", height="600", backgroundColor="#FFFFFF", frameRate="30")]
	/**
	 * ...
	 * @author Darknet
	 * 
	 * Licenses:Creative Commons
	 * 
	 * Information: Space and Ground Battles Game Modes.
	 * 
	 * Note: This is Port from sandy code. This 
	 * 
	 * Combat System:
	 * -Not yet work on yet. Working on the basic functions.
	 * -vechiles
	 * -colision detection
	 * 
	 * Unit system:
	 * -Working on reducing loop functions.
	 * -group formations.
	 * -work on bot control and flow fighting.
	 * -work on unit spawning line up code.
	 * -work on fire system and colision detection.
	 * 
	 * 
	 */
	public class Away3DGearUnits extends Sprite
	{
		//{
		
		//{ Embed FILES
		[Embed(source = "system/icon/spacecraft_fedcarrier_icon32.jpg")]
		private var image32fedcarrier:Class;
		public var icon32fedcarrier:AUnitIconButton = new AUnitIconButton(new image32fedcarrier());
		
		[Embed(source = "system/icon/spacecraft_fedfighter_icon32.jpg")]
		private var image32fedfighter:Class;
		public var icon32fedfighter:AUnitIconButton = new AUnitIconButton(new image32fedfighter());
		
		[Embed(source = "system/icon/load_icon32.jpg")]
		private var image32load:Class;
		public var icon32load:AUnitIconButton = new AUnitIconButton(new image32load());
		
		[Embed(source = "system/icon/unload_icon32.jpg")]
		private var image32unload:Class;
		public var icon32unload:AUnitIconButton = new AUnitIconButton(new image32unload());
		
		[Embed(source = "system/icon/constructionyard_rts_icon32.jpg")]
		private var image32constructionyard:Class;
		public var icon32constructionyard:AUnitIconButton = new AUnitIconButton(new image32constructionyard());
		
		[Embed(source = "system/icon/powerplant_rts_icon32.jpg")]
		private var image32powerplant:Class;
		public var icon32powerplant:AUnitIconButton = new AUnitIconButton(new image32powerplant());
		
		[Embed(source = "system/icon/orerefinery_rts_icon32.jpg")]
		private var image32orerefinery:Class;
		public var icon32orerefinery:AUnitIconButton = new AUnitIconButton(new image32orerefinery());
		
		[Embed(source = "system/icon/gasrefinery_rts_icon32.jpg")]
		private var image32gasrefinery:Class;
		public var icon32gasrefinery:AUnitIconButton = new AUnitIconButton(new image32gasrefinery());
		
		[Embed(source = "system/icon/crystalrefinery_rts_icon32.jpg")]
		private var image32crystalrefinery:Class;
		public var icon32crystalrefinery:AUnitIconButton = new AUnitIconButton(new image32crystalrefinery());
		
		[Embed(source = "system/icon/barracks_rts_icon32.jpg")]
		private var image32barrack:Class;
		public var icon32barrack:AUnitIconButton = new AUnitIconButton(new image32barrack());
		
		[Embed(source = "system/icon/mechfactory_rts_icon32.jpg")]
		private var image32mechfactory:Class;
		public var icon32mechfactory:AUnitIconButton = new AUnitIconButton(new image32mechfactory());
		
		[Embed(source = "system/icon/airport_rts_icon32.jpg")]
		private var image32airport:Class;
		public var icon32airport:AUnitIconButton = new AUnitIconButton(new image32airport());
		
		[Embed(source = "system/icon/seaport_rts_icon32.jpg")]
		private var image32seaport:Class;
		public var icon32seaport:AUnitIconButton = new AUnitIconButton(new image32seaport());
		
		[Embed(source = "system/icon/soldier_rts_icon32.jpg")]
		private var image32soldier:Class;
		public var icon32soldier:AUnitIconButton = new AUnitIconButton(new image32soldier());
		
		[Embed(source = "system/icon/engineer_rts_icon32.jpg")]
		private var image32engineer:Class;
		public var icon32engineer:AUnitIconButton = new AUnitIconButton(new image32engineer());
		//}
		
		//{ //VARS
		public var HEIGHT:Number = 600;
		public var WIDTH:Number = 800;
		public var plane:Plane = new Plane();
		// create a viewport
		public var view:View3D = new View3D( { x:320, y:240 } );
		public var cube:Cube = new Cube( { width:75, height:75, depth:75 ,alpha:0.1} );
		public var box:Cube = new Cube( { width:75, height:75, depth:75 , alpha:0.1 } );
		public var plane3d:Plane = new Plane( { name:'plane',material:"white#black", width:512, height:512, alpha:1 } );
		
		public var building:Vector.<AStructureUnit> = new Vector.<AStructureUnit>();
		public var unit:Vector.<AStructureUnit> = new Vector.<AStructureUnit>();
		public var projectile:Vector.<AProjectile> = new Vector.<AProjectile>();
		
		public var unitid:String = '';
		public var unitbuildid:String = '';
		public var bunload:Boolean = false;
		
		public var startpoint:Number3D = new Number3D();
		public var endpoint:Number3D = new Number3D();
		public var selectbox:Plane = new Plane( { name:'selectbox', width:64, height:64} );
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
		
		public var meshplacement:Object3D;
		
		public var bbarracks:ABuildingBarrack = new ABuildingBarrack();
		public var bconstructionyard:ABuildingConstructionYard = new ABuildingConstructionYard();
		public var bmechfactory:ABuildingMechFactory = new ABuildingMechFactory();
		public var bpowerplant:ABuildingPowerPlant = new ABuildingPowerPlant();
		public var borerefinery:ABuildingOreRefinery = new ABuildingOreRefinery();
		public var bgasrefinery:ABuildingGasRefinery = new ABuildingGasRefinery();
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
		
		public function Away3DGearUnits() {
            addChild(view);
			//space code
			//view.camera.y = 800;
			//view.camera.x = 0;
			//view.camera.lookAt(new Number3D(0, 0, 0));
			//view.camera.y = 1000;
			//view.camera.x = -30;
			
			//ground cam
			view.camera.x = 0;
			view.camera.y = 500;
			view.camera.z = -500;
			view.camera.lookAt(new Number3D(0, 0, 0));
			view.camera.y = 500;
			view.camera.x = -50;
			
			//GLOBAL VARS
			AStructureUnit.view = view;
			AStructureUnit.units = unit;
			AStructureUnit.projectile = projectile;
			
			stage.addEventListener(MouseEvent.MOUSE_MOVE, pointposition );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keypressdown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyupevent);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, selectboxdown );
			stage.addEventListener(MouseEvent.MOUSE_UP, selectboxup );
			
			init_selectboxfun();
			
			//spacetest();
			groundtest();
			
			addEventListener(Event.ENTER_FRAME, render);
			
			init_setuphud();
			buttonbuildunit();
			
			var monitor:ResourceMonitor = new ResourceMonitor(true, true);
			monitor.x = 718;
			addChild(monitor);
			monitor.monitor();
		}
		
		public function init_selectboxfun():void {
			var material:ColorMaterial = new ColorMaterial(0x4682b4);
			//material.alpha = 100;
			selectbox.material = material;
			selectbox.ownCanvas = true;
			selectbox.screenZOffset = -500;
			selectbox.alpha = 0.5;
		}
		
		public function init_setuphud():void {
			HUD.addChild(HUD_UNITSHORTCUT);
			HUD.addChild(HUD_UNIT);
			HUD.addChild(HUD_USER);
			addChild(HUD);
		}
		
		//RENDER
		public function render(event:Event):void {
			//trace(projectile.length)
			for (var p:int = 0; p < projectile.length;p++ ) {
				projectile[p].update();
			}
			
			for (var u:int = 0; u < unit.length; u++ ) {
				unit[u].update();
			}
			
			unitupdate();
			
			view.render();
			//System.gc();
		}
		
		public function spacetest():void {
			var structureunit:AStructureUnit;
			var structureunit2:AStructureUnit;
			
			//in the carrier test
			structureunit2 = new ASpaceshipFedFighter();
			structureunit2.ownerid = playername;
			unitfun(structureunit2);
			
			structureunit = new ASpaceshipFedCarrier();
			unitfun(structureunit);
			structureunit.ownerid = playername;
			structureunit.unit.push(structureunit2);
			structureunit.x = 64;
			view.scene.addChild(structureunit.mesh);
			unit.push(structureunit);
			//trace(structureunit.id);
			
			
			//trace(ASpaceshipFedCarrier.NAME);
			//trace(ASpaceshipFedFighter.NAME);
			//trace(ASpaceshipFedFighter.NAME);
			
			structureunit = new ASpacestationFedShipyard();
			structureunit.ownerid = playername;
			structureunit.x = 0;
			unitfun(structureunit);
			view.scene.addChild(structureunit.mesh);
			unit.push(structureunit);
			
			structureunit = new ASpaceshipFedFighter();
			structureunit.ownerid = playername;
			structureunit.x = -32;
			view.scene.addChild(structureunit.mesh);
			unitfun(structureunit);
			unit.push(structureunit);
			
			structureunit = new ASpaceshipFedFighter();
			structureunit.ownerid = playername;
			structureunit.x = 32;
			view.scene.addChild(structureunit.mesh);
			unitfun(structureunit);
			unit.push(structureunit);
		}
		
		public function groundtest():void {
			var mat:WireColorMaterial = new WireColorMaterial();
			mat.color = 0x008000;
			mat.wirecolor = 0x000000;
			plane3d.x = 0;
			plane3d.y = 0;
			plane3d.z = 0;
			plane3d.screenZOffset = 1000;
			plane3d.ownCanvas = true;
			plane3d.material = mat;
			plane3d.segmentsH = 16;
			plane3d.segmentsW = 16;
			view.scene.addChild(plane3d);
			
		}
		
		//{ KEY BOARD FUNCTIONS
		public function keypressdown(key:KeyboardEvent):void {
			//trace('key press');
			if (key.keyCode == 16) {
				SHIFT = true;
			}
			
			if (key.keyCode == 17) {
				CTRL = true;
			}
			
			if (key.keyCode == 37) {//left
				view.camera.x -= 10;
			}
			if (key.keyCode == 39) {//right
				view.camera.x += 10;
			}
			if (key.keyCode == 40) {//down
				view.camera.z -= 10;
			}
			if (key.keyCode == 38) {//up
				view.camera.z += 10;
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
				SHIFT = false;
			}
			
			if (key.keyCode == 17) {
				CTRL = false;
			}
			
			if (key.keyCode == 90) {
				KEY_Z =  false;
			}
			
			if (key.keyCode == 88) {
				KEY_X =  false;
			}
			
		}
		//}
		
		//=========================================================================================
		//units
		//=========================================================================================
		
		public function unitfun(su:AStructureUnit):void {
			//su.mesh.ownCanvas = true;//note this will over lap each other
			su.mesh.screenZOffset = 1;
			su.mesh.addEventListener(MouseEvent3D.MOUSE_UP,singleunitselectup);
		}
		
		public function singleunitselectup(event:MouseEvent3D):void {
			//event.object
			//trace('unit select up');
			for (var i:int = 0; i < unit.length;i++ ) {
				if (unit[i].mesh == event.object) {//if object matches class mesh
					unitid = String(unit[i].id);
					unittype();
					if (unit[i].ownerid == playername) {
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
					var groupselectedunit:Vector.<AStructureUnit> = new Vector.<AStructureUnit>();
					
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
			var su:AStructureUnit;
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
			trace('class build...');
			//this will go throught menu build using object and keyboard event
			var su:AStructureUnit;
			for (var ii:int = 0; ii < unit.length;ii++ ) {
				if (String(unit[ii].id) == unitid) {
					trace('found...');
					su = unit[ii];
					break;
				}
			}
			
			if (su != null) {
				//unitid = String(su.id);
				clearsprite(HUD_UNITSHORTCUT);
				
				HUD_UNITSHORTCUT.x = 100;
				HUD_UNITSHORTCUT.y = 100;
				HUD_UNITSHORTCUT.graphics.clear();
				HUD_UNITSHORTCUT.graphics.beginFill(0x999999);
				HUD_UNITSHORTCUT.graphics.drawRect(0, 0, 100, 100);
				HUD_UNITSHORTCUT.graphics.endFill();
				
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
						//trace('==shipyard');
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
			var pos:Number3D = point2dto3d();
			box.x = pos.x;
			box.z = pos.z;
		}
		
		public function selectboxdown(event:Event):void {
			startpoint = point2dto3d();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, selectboxmove );
		}
		
		public function selectboxmove(event:Event):void {
			endpoint = point2dto3d();
			view.scene.addChild(selectbox);
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
			
			selectbox.geometry.vertices[0].x = minpoint.x;
			selectbox.geometry.vertices[0].z = minpoint.z;
			selectbox.geometry.vertices[1].x = maxpoint.x;
			selectbox.geometry.vertices[1].z = minpoint.z;
			selectbox.geometry.vertices[2].x = minpoint.x;
			selectbox.geometry.vertices[2].z = maxpoint.z;
			selectbox.geometry.vertices[3].x = maxpoint.x;
			selectbox.geometry.vertices[3].z = maxpoint.z;
			//selectbox.alpha = 0.1;
			
		}
		
		public function selectboxup(event:Event):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, selectboxmove );
			view.scene.removeChild(selectbox);
			endpoint = point2dto3d();
			//view.scene.removeChildByName(selectbox.name);
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
					bunitmainmenu = false;
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
					bunitmenu = false;
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
				unitbuildid = ASpaceshipFedFighter.NAME;
				trace(unitbuildid +'===');
				unitbuild();
			}
			
			icon32fedcarrier.addEventListener(MouseEvent.CLICK,clickbuild_fedcarrier);
			function clickbuild_fedcarrier(event:Event):void {
				//unitbuildid = 'FedCarrier';
				unitbuildid = ASpaceshipFedCarrier.NAME;
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
				unitbuildid = ABuildingConstructionYard.NAME;
				addplacemeshterrain();
			}
			
			icon32powerplant.addEventListener(MouseEvent.CLICK,showbuilding_powerplant);
			function showbuilding_powerplant(event:Event):void {
				trace('bpowerplant...');
				meshplacement = bpowerplant.mesh;
				unitbuildid = ABuildingPowerPlant.NAME;
				addplacemeshterrain();
			}
			
			icon32orerefinery.addEventListener(MouseEvent.CLICK,showbuilding_orerefinery);
			function showbuilding_orerefinery(event:Event):void {
				trace('borerefinery...');
				meshplacement = borerefinery.mesh;
				unitbuildid = ABuildingOreRefinery.NAME;
				addplacemeshterrain();
			}
			
			icon32gasrefinery.addEventListener(MouseEvent.CLICK,showbuilding_gasrefinery);
			function showbuilding_gasrefinery(event:Event):void {
				trace('bgasrefinery...');
				meshplacement = bgasrefinery.mesh;
				unitbuildid = ABuildingGasRefinery.NAME;
				addplacemeshterrain();
			}
			
			icon32barrack.addEventListener(MouseEvent.CLICK,showbuilding_barrack);
			function showbuilding_barrack(event:Event):void {
				trace('bbarracks...');
				meshplacement = bbarracks.mesh;
				unitbuildid = ABuildingBarrack.NAME;
				addplacemeshterrain();
			}
			
			icon32mechfactory.addEventListener(MouseEvent.CLICK,showbuilding_mechfactory);
			function showbuilding_mechfactory(event:Event):void {
				trace('mechfactory...');
				meshplacement = bmechfactory.mesh;
				unitbuildid = ABuildingMechFactory.NAME;
				addplacemeshterrain();
			}
			
			icon32airport.addEventListener(MouseEvent.CLICK,showbuilding_airport);
			function showbuilding_airport(event:Event):void {
				trace('mechfactory...');
				bbarracks.mesh.ownCanvas = true;
				bbarracks.mesh.alpha = 0.5;
				meshplacement = bbarracks.mesh;
				unitbuildid = ABuildingMechFactory.NAME;
				addplacemeshterrain();
			}
			//}
			
			//{ Infantry Class
			icon32soldier.addEventListener(MouseEvent.CLICK,clickbuild_soldier);
			function clickbuild_soldier(event:Event):void {
				unitbuildid = AInfantrySoldier.NAME;
				unitbuild();
			}
			
			icon32engineer.addEventListener(MouseEvent.CLICK,clickbuild_engineer);
			function clickbuild_engineer(event:Event):void {
				unitbuildid = AInfantryEngineer.NAME;
				unitbuild();
			}
			//}
		}
		
		//This will remove the mesh that is last currently use.
		public function removeunitmesh():void {
			view.scene.removeChild(bconstructionyard.mesh);
			view.scene.removeChild(bpowerplant.mesh);
			view.scene.removeChild(bgasrefinery.mesh);
			view.scene.removeChild(borerefinery.mesh);
			view.scene.removeChild(bbarracks.mesh);
			view.scene.removeChild(bmechfactory.mesh);
		}
		
		//add controler to place unit building or unit
		public function addplacemeshterrain():void {
			removeunitmesh();
			view.scene.addChild(meshplacement);
			//add terrain listener
			plane3d.addEventListener(MouseEvent3D.MOUSE_MOVE, updateunitmeshplacement);
			//add current object that is being place upon
			meshplacement.addEventListener(MouseEvent3D.MOUSE_UP, placeunitspace);
		}
		
		//update mouse positon of the terrain
		public function updateunitmeshplacement(event:MouseEvent3D):void {
			if (meshplacement != null) {
				//meshplacement.alpha = 50;
				meshplacement.x = event.sceneX;
				meshplacement.y = event.sceneY;
				meshplacement.z = event.sceneZ;
				//meshplacement.ownCanvas = true;
				//meshplacement.alpha = 0.8;
			}
			trace('...update mesh x:' + event.sceneX + ' y:' + event.sceneY + ' z:' +event.sceneZ);
		}
		
		//place object once click and remove listener from terrain
		public function placeunitspace(event:MouseEvent3D):void {
			trace('PLACE x:' + meshplacement.x + ' y:' + meshplacement.y + ' z:' + meshplacement.z);
			removeunitmesh();
			endpoint.x = meshplacement.x;
			endpoint.y = meshplacement.y;
			endpoint.z = meshplacement.z;
			buildunitbuilding();
			//need to remove Listener one the object is place for the game
			plane3d.removeEventListener(MouseEvent3D.MOUSE_MOVE, updateunitmeshplacement);
		}
		
		public function buildunitbuilding():void {
			trace(unitbuildid + '->');
			
			var builtunit:AStructureUnit = new AUnitClass().CheckName(unitbuildid);
			if(builtunit != null){//this make sure if the class is not there that will give error
				builtunit.x = endpoint.x;
				builtunit.y = endpoint.y;
				builtunit.z = endpoint.z;
				trace(endpoint + ';;;;');
				unitfun(builtunit);//add functions and listener here
				view.scene.addChild(builtunit.mesh);
				unit.push(builtunit);
			}
		}
		
		//build units and push unit:vector<array>();
		public function unitbuild():void {
			for (var i:int = 0; i < unit.length;i++ ) {
				if (String(unit[i].id) == String(unitid)) {
					var buildunit:AStructureUnit = new AUnitClass().CheckName(unitbuildid);
					if (buildunit != null) {
						trace(buildunit.name);
						buildunit.ownerid = playername;
						unitfun(buildunit);
						unit[i].queryunit.push(buildunit);
					}
					trace(unit[i].name + ' > No. query:' + unit[i].queryunit.length);
					break;
				}
			}
		}
		
		//=========================================================================================
		// OTHER FUNCTIONS
		//=========================================================================================
		
		//{ OTHER FUNCTIONS
		
		//RAY CASTING
		public function point2dto3d():Number3D {
			//get the ray shooting from the camera through the mouse position
			var ray:Number3D = view.camera.unproject(view.mouseX*1.1 , view.mouseY*1.1);//default
			//var ray:Number3D = view.camera.unproject((view.mouseX*500/view.camera.focus ) ,( view.mouseY*500/view.camera.focus ));//default
			//var ray:Number3D = view.camera.unproject((mouseX - (WIDTH/2))*500/view.camera.focus,((HEIGHT/2) - mouseY)*500/view.camera.focus);//will not work
			//make our camera position accessible
			var cameraPosition:Number3D = new Number3D(view.camera.x, view.camera.y, view.camera.z);
			//get the world position of our ray
			ray.add(ray, cameraPosition);
			//create a plane3D object
			var p:Plane3D = new Plane3D();
			//define the plane by a normal and a point.  In this case, we want the plane to be going through (0, 0, 0) - with its normal going (0, 1, 0).  This will make the plane an XZ plane, facing upwards.
			p.fromNormalAndPoint(new Number3D(0, 1, 0),new Number3D(0, 0, 0));
			//find where the plane intersects.  this function takes 2 points to define a line - we will define it with our ray and camera.
			var intersect:Number3D = p.getIntersectionLineNumbers(cameraPosition, ray);
			//set object position based on results
			//trace(intersect);
			//box.x = intersect.x;
			//box.z = intersect.y;
			//box.z = intersect.z;
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
		
		//}
	}
	
}
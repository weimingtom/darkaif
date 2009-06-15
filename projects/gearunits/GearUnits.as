package  
{
	//{
	import adobe.utils.CustomActions;
	import darkaif.frame.Panel;
	import darknet.core.display.Button;
	import darknet.core.display.DialogBox;
	import darknet.core.display.GameButton;
	import darknet.core.event.GameButtonEvent;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import gearunits.entity.building.*;
	import gearunits.entity.Commander;
	import gearunits.entity.infantry.Infantry;
	import gearunits.entity.infantry.InfantryClass;
	import gearunits.entity.infantry.Solider;
	import gearunits.entity.StructureUnit;
	import gearunits.entity.UnitClass;
	import gearunits.entity.vehicle.*;
	import gearunits.entity.weapon.Projectile;
	import gearunits.entity.weapon.ProjectileBullet;
	import gearunits.entity.weapon.Weapon;
	import gearunits.models.*;
	import flash.events.*;
	import flash.ui.*;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
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
	
	public class GearUnits extends Sprite
	{
		//{
		public var scene:Scene3D;
		public var camera:Camera3D;
		public var g:Group = new Group('group');
		public var bottom:Shape3D = new Plane3D('bottom', 256, 256, 10, 10, Plane3D.ZX_ALIGNED, 'quad');
		public var tmpbox:Box = new Box('tmpbox');
		
		public var buildings:Vector.<Building> = new Vector.<Building>();
		public var vehicles:Vector.<Vehicle> = new Vector.<Vehicle>();
		public var turret:Vector.<Turret> = new Vector.<Turret>();
		
		//weapon bullet
		public var projectile:Vector.<Projectile> = new Vector.<Projectile>();
		
		public var unit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		public var selectunit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		
		public var buildingname:String = '';
		public var buildingid:String = '';
		public var selectbuilding:String = '';
		public var objectid:String = '';
		public var playername:String = 'guest';
		
		public var startpoint:Point3D = new Point3D();
		public var endpoint:Point3D = new Point3D();
		public var selectbox:Point = new Point(); //select point of the screen
		public var selectboxframe:Sprite = new Sprite(); 
		
		//tmp object for preview
		public var meshconstructionyard:MeshConstructionYard = new MeshConstructionYard();
		public var meshpowerplant:MeshPowerPlant = new MeshPowerPlant();
		public var meshorerefinery:MeshOreRefinery = new MeshOreRefinery();
		public var meshbarracks:MeshBarracks = new MeshBarracks();
		public var meshmechfactory:MeshMechFactory = new MeshMechFactory();
		
		public var commander:Vector.<Commander> = new Vector.<Commander>();
		public var textresource:TextField = new TextField();
		public var menupanel:Sprite = new Sprite();
		public var unitpanel:DialogBox = new DialogBox();
		
		//{ CONTROL KEY EVENT
		
		public var CTRL:Boolean = false;
		public var SHIFT:Boolean = false;
		
		//}
		
		//}
		
		public function GearUnits() {
			var commanderdata:Commander = new Commander();
			commanderdata.name = playername;
			commander.push(commanderdata);
			
			textresource.text = 'pow:' + ' ore:';
			textresource.x = 92;
			textresource.height = 20;
			textresource.width = 256;
			textresource.selectable = false;
			
			// We create the camera
			camera = new Camera3D( 300, 300 );
			camera.z = -200;
			camera.y = 200;
			//camera.x = 300;
			camera.lookAt(0, 0, 0);
			camera.near = 0;
			
			// We create the "group" that is the tree of all the visible objects
			var root:Group = g;
		 
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, g );
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydownevent);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyupevent);
			
			stage.addEventListener(MouseEvent.MOUSE_DOWN, selectboxunit_down);
			stage.addEventListener(MouseEvent.MOUSE_UP, selectboxunit_out);
			
			//menupanel.x = 500;
			
			terrainbuild();
			BuildMainMenu();
			addChild(textresource);
			buildtest();
			objectpositionmesh();
			addChild(menupanel);
			addChild(selectboxframe);
			
			unitpanel.x = 500;
			addChild(unitpanel);
		}
		
		public function keydownevent(key:KeyboardEvent):void {
			//trace(key.keyCode);
			if (key.keyCode == 16) {
				SHIFT = true;
			}
			
			if (key.keyCode == 17) {
				CTRL = true;
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
			objectupdate();
			
			scene.render();
		}
		
		//ADD FUNCTIONS TO LISTENER PREVIEW OBJECTS
		public function objectpositionmesh():void {
			meshconstructionyard.enableEvents = true;
			meshconstructionyard.enableInteractivity = true;
			meshconstructionyard.addEventListener(MouseEvent.CLICK, placeobject);
			
			meshpowerplant.enableEvents = true;
			meshpowerplant.enableInteractivity = true;
			meshpowerplant.addEventListener(MouseEvent.CLICK, placeobject);
			
			
			meshorerefinery.enableEvents = true;
			meshorerefinery.enableInteractivity = true;
			meshorerefinery.addEventListener(MouseEvent.CLICK, placeobject);
			
			
			meshbarracks.enableEvents = true;
			meshbarracks.enableInteractivity = true;
			meshbarracks.addEventListener(MouseEvent.CLICK, placeobject);
			
			meshmechfactory.enableEvents = true;
			meshmechfactory.enableInteractivity = true;
			meshmechfactory.addEventListener(MouseEvent.CLICK, placeobject);
		}
		
		//BUILDING TEST FOR UPDATE TEST
		public function buildtest():void {
			var build:Building;
			//build = new BuildingConstructionYard();
			//selectbuilding = 'Constuction Yard';
			//assignbuilding(build);
			//g.addChild(build.mesh);
			//build.ownerid = playername;
			//buildings.push(build);
			
			
			build = new BuildingBarracks();
			//selectbuilding = 'Constuction Yard';
			//build = assignbuilding(build);
			g.addChild(build.mesh);
			build.mesh.enableEvents = true;
			build.mesh.addEventListener(MouseEvent.CLICK, selectbuildmenu);
			
			build.ownerid = playername;
			buildings.push(build);
			
			
			build = new BuildingMechFactory();
			build.x = 64;
			g.addChild(build.mesh);
			//selectbuilding = 'Constuction Yard';
			//build = assignbuilding(build);
			build.mesh.enableEvents = true;
			build.mesh.addEventListener(MouseEvent.CLICK, selectbuildmenu);
			build.ownerid = playername;
			buildings.push(build);
			
			//units / functions
			
			
			var solider:Solider = new Solider();
			solider.x = 32;
			solider.z = 32;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			/*
			solider = new Solider();
			solider.x = -32;
			solider.z = 32;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			
			solider = new Solider();
			solider.x = 32;
			solider.z = -64;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			
			solider = new Solider();
			solider.x = 92;
			solider.z = -53;
			solider.ownerid = playername;
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			
			solider = new Solider();
			solider.x = -32;
			solider.z = -64;
			solider.ownerid = '1';
			singleunit_assign(solider);
			g.addChild(solider.mesh);
			unit.push(solider);
			*/
		}
		
		//main building that build stuff
		public function BuildMainMenu():void {
			var buttonbuildconstructionyard:Button = new Button('Cons Yard');
			buttonbuildconstructionyard.addEventListener(MouseEvent.CLICK, clickbuildconstructionyard);
			function clickbuildconstructionyard(event:Event):void {
				removepreviewobject();
				buildingname = 'Constuction Yard';
				trace(buildingname);
				//addbuildmouse();
				bottom.addEventListener(MouseEvent.CLICK, placeobject);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			}
			var buttonbuildpowerplant:Button = new Button('Power Plant');
			buttonbuildpowerplant.y = 14 * 1;
			buttonbuildpowerplant.addEventListener(MouseEvent.CLICK, clickbuildpowerplant);
			function clickbuildpowerplant(event:Event):void {
				removepreviewobject();
				buildingname = 'Power plant';
				trace(buildingname);
				//addbuildmouse();
				bottom.addEventListener(MouseEvent.CLICK, placeobject);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			}
			var buttonbuildorerefiney:Button = new Button('Ore Refiney');
			buttonbuildorerefiney.addEventListener(MouseEvent.CLICK, clickbuildorerefiney);
			function clickbuildorerefiney(event:Event):void {
				removepreviewobject();
				buildingname = 'Ore Refiney';
				trace(buildingname);
				//addbuildmouse();
				bottom.addEventListener(MouseEvent.CLICK, placeobject);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			}
			buttonbuildorerefiney.y = 14 * 2;
			var buttonbuildbarracks:Button = new Button('Barracks');
			buttonbuildbarracks.addEventListener(MouseEvent.CLICK, clickbuildbarracks);
			function clickbuildbarracks(event:Event):void {
				removepreviewobject();
				buildingname = 'Barracks';
				trace(buildingname);
				//addbuildmouse();
				bottom.addEventListener(MouseEvent.CLICK, placeobject);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			}
			buttonbuildbarracks.y = 14 * 3;
			var buttonbuildmechfactory:Button = new Button('Mech Factory');
			buttonbuildmechfactory.addEventListener(MouseEvent.CLICK, clickbuildmechfactory);
			function clickbuildmechfactory(event:Event):void {
				removepreviewobject();
				buildingname = 'Mech Factory';
				trace(buildingname);
				//addbuildmouse();
				bottom.addEventListener(MouseEvent.CLICK, placeobject);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			}
			buttonbuildmechfactory.y = 14 * 4;
			var buttonbuildairport:Button = new Button('Air Port');
			var buttonbuildseaport:Button = new Button('Sea Port');
			
			
			function addbuildmouse():void {
				removepreviewobject();
				bottom.addEventListener(MouseEvent.CLICK, placeobject);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			}
			addChild(buttonbuildconstructionyard);
			addChild(buttonbuildpowerplant);
			addChild(buttonbuildorerefiney);
			addChild(buttonbuildbarracks);
			addChild(buttonbuildmechfactory);
		}
		
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
			
			//bottom.addEventListener(MouseEvent.CLICK, placeobject);
			//bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			//bottom.addEventListener(MouseEvent.MOUSE_OUT, updateobjectout);
			bottom.enableBackFaceCulling = false;
			bottom.enableClipping = false;
			bottom.useSingleContainer = false;
			
			bottom.addEventListener(MouseEvent.MOUSE_DOWN, selectunit_down);
			bottom.addEventListener(MouseEvent.MOUSE_UP, selectunit_up);
			
			//bottom.addEventListener();
			
			bottom.appearance = app01;
			g.addChild(bottom);
		}
		
		//{ // MOUSE EVENT
		//REOMVE OBJECT PREVIEW FROM SCENE
		public function removepreviewobject():void {
			g.removeChildByName(meshconstructionyard.name);
			g.removeChildByName(meshpowerplant.name);
			g.removeChildByName(meshorerefinery.name);
			g.removeChildByName(meshbarracks.name);
			g.removeChildByName(meshmechfactory.name);
		}
		
		//place terrain position
		public function placeobject(objectevent:Shape3DEvent):void {
			removepreviewobject();
			trace('press and place:'+buildingname);
			buildbuilding(objectevent.point);
			bottom.removeEventListener(MouseEvent.CLICK, placeobject);
			bottom.removeEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			bottom.removeEventListener(MouseEvent.MOUSE_MOVE, updateobjectposition);
		}
		
		//if terrain is there added preview objects
		public function updateobjectover(objectevent:Shape3DEvent):void {
			bottom.addEventListener(MouseEvent.MOUSE_MOVE, updateobjectposition);
			//g.addChild(tmpbox);
			if (buildingname == 'Constuction Yard') {
				g.addChild(meshconstructionyard);
			}
			
			if (buildingname == 'Power plant') {
				g.addChild(meshpowerplant);
			}
			
			if (buildingname == 'Ore Refiney') {
				g.addChild(meshorerefinery);
			}
			
			if (buildingname == 'Barracks') {
				g.addChild(meshbarracks);
			}
			
			if (buildingname == 'Mech Factory') {
				g.addChild(meshmechfactory);
			}
		}
		
		//update object position of the preview mesh
		public function updateobjectposition(objectevent:Shape3DEvent):void {
			//trace('over');
			var v:Point3D = objectevent.point;
			tmpbox.x = v.x;
			tmpbox.y = v.y+8;
			tmpbox.z = v.z;
			//trace('added...'+"x:"+v.x+"y:"+v.y+"z:"+v.z);
			if (buildingname == 'Constuction Yard') {
				meshconstructionyard.x = v.x;
				meshconstructionyard.y = v.y;
				meshconstructionyard.z = v.z;
			}
			
			if (buildingname == 'Power plant') {
				meshpowerplant.x = v.x;
				meshpowerplant.y = v.y;
				meshpowerplant.z = v.z;
			}
			
			if (buildingname == 'Ore Refiney') {
				meshorerefinery.x = v.x;
				meshorerefinery.y = v.y;
				meshorerefinery.z = v.z;
			}
			
			if (buildingname == 'Barracks') {
				meshbarracks.x = v.x;
				meshbarracks.y = v.y;
				meshbarracks.z = v.z;
			}
			
			if (buildingname == 'Mech Factory') {
				meshmechfactory.x = v.x;
				meshmechfactory.y = v.y;
				meshmechfactory.z = v.z;
			}
		}
		
		//remove preview objects if terrain out bounds
		public function updateobjectout(objectevent:Shape3DEvent):void {
			bottom.removeEventListener(MouseEvent.MOUSE_MOVE, updateobjectposition);
			removepreviewobject();
			//g.removeChildByName(tmpbox.name);
			/*
			if (buildingname == 'Constuction Yard') {
				g.removeChildByName(meshconstructionyard.name);
			}
			
			if (buildingname == 'Power plant') {
				g.removeChildByName(meshpowerplant.name);
			}
			
			if (buildingname == 'Ore Refiney') {
				g.removeChildByName(meshorerefinery.name);
			}
			
			if (buildingname == 'Barracks') {
				g.removeChildByName(meshbarracks.name);
			}
			
			if (buildingname == 'Mech Factory') {
				g.removeChildByName(meshmechfactory.name);
			}
			*/
		}
		
		//} //END MOUSE EVENT
		
		//{ // START BUILDING/SELECTING FUNCTIONS
		//place the building where it is place of the mouse and terrain positon
		public function buildbuilding(point:Point3D):void {
			var build:Building;
			
			if (buildingname == 'Constuction Yard') {
				build = new BuildingConstructionYard();
				selectbuilding = 'Constuction Yard';
				assignbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Power plant') {
				build = new BuildingPowerPlant();
				selectbuilding = 'Power plant';
				assignbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Ore Refiney') {
				build = new BuildingOreRefinery();
				selectbuilding = 'Ore Refiney';
				assignbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Barracks') {
				build = new BuildingBarracks();
				selectbuilding = 'Barracks';
				assignbuilding(build);
				g.addChild(build.mesh);
				build.ownerid = playername;
				build.x = point.x;
				build.y = point.y;
				build.z = point.z;
				buildings.push(build);
				trace('building added...');
			}
			
			if (buildingname == 'Mech Factory') {
				build = new BuildingMechFactory();
				selectbuilding = 'Mech Factory';
				assignbuilding(build);
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
		
		//multi units
		public function selectunit_down(event:Shape3DEvent):void {
			startpoint = event.point
			//trace('down point:' + startpoint);
		}
		
		public function selectunit_up(event:Shape3DEvent):void {
			endpoint = event.point;
			//trace('up point:' + endpoint);
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
			
			//if mouse position is the same as first and last point, do not deselect objects
			if((startpoint.x != endpoint.x)&&(startpoint.z != endpoint.z)){
				//if CTRL and SHIFT are not use deselect objects
				if((CTRL == false)&&(SHIFT == false)){
					for (var unitno:int = 0; unitno < unit.length; unitno++) {
						unit[unitno].bselected = false;
					}
					trace('deselected...'+CTRL+':'+SHIFT);
				}
				
				for (unitno = 0; unitno < unit.length; unitno++) {
					//unit[unitno].x
					if ((unit[unitno].x > minpoint.x) && (unit[unitno].x < maxpoint.x)&&
						(unit[unitno].z > minpoint.z)&&(unit[unitno].z < maxpoint.z)) {
						trace('found');
						if(unit[unitno].ownerid == playername){//this make sure it not over lap the other select
							unit[unitno].bselected = true;
							if(SHIFT){
								unit[unitno].bselected = false;
							}
						}
					}else {
						trace('not found');
					}
				}
			}else 
			{
				
				var groupselectedunit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
				//rework the group squad type
				var groupunitgrid:int = 0;
				//this deal with selecting and grouping
				for (var unitselectno:int = 0; unitselectno < unit.length; unitselectno++ ) {
					if (unit[unitselectno].bselected == true) {
						groupselectedunit.push(unit[unitselectno]);//class
					}
				}
				
				trace('number of units:' + groupselectedunit.length);
				//this deal with group-  unit-> selected length < loop(x)x2 
				for (var groupunitno:int = 0;  groupunitno < groupselectedunit.length ;groupunitno++ ) {
					if (groupselectedunit.length  <= (groupunitno * 2)) {
						groupunitgrid = groupunitno;
						break;
					}else {
						groupunitgrid = 1;
					}
				}
				trace('grid size:' + groupunitgrid);
				
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
						posgrouppoint.x = event.point.x + (9 * unitcolno);
						posgrouppoint.y = event.point.y;
						posgrouppoint.z = event.point.z + (9 * unitrowno);
						//trace('ID:'+unitcolno+' move point'+posgrouppoint);
						groupselectedunit[countunit].pointmove(posgrouppoint);
						countunit++;
					}
				}
			}
		}
		
		public function selectunit_updateposition(event:Shape3DEvent):void {
			//startpoint
			
			graphics.clear();
			graphics.beginFill(0x999999);
			//graphics.drawRect()
		}
		
		//2D selection screen not 3D yet, working on it.
		public function selectboxunit_down(event:Event):void {
			//startpoint
			selectbox.x = mouseX;
			selectbox.y = mouseY;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, selectboxunit_over);
		}
		
		public function selectboxunit_over(event:Event):void {
			selectboxframe.graphics.clear();
			selectboxframe.graphics.lineStyle(1)
			selectboxframe.graphics.drawRect(selectbox.x, selectbox.y, mouseX - selectbox.x + 1, mouseY - selectbox.y + 1);//offeset conflict over lap layers
		}
		
		public function selectboxunit_out(event:Event):void {
			selectboxframe.graphics.clear();
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, selectboxunit_over);
		}
		
		//single unit
		
		//need to get object menu build
		//select function and other functions
		//attack function if not match
		public function singleunit_click(event:Shape3DEvent):void {
			trace('ID:' + event.shape.name);
			//select function 
			//{
			for (var unitno:int = 0; unitno < unit.length; unitno++) {
				if (unit[unitno].mesh.name == event.shape.name) {
					trace('found! unit:' + unit[unitno].mesh.name + ' ownerid:' + unit[unitno].ownerid);
					if (unit[unitno].ownerid == playername) {//do not attack
						if (CTRL == true) {
							unit[unitno].bselected = true;
						}
						if (SHIFT == true) {
							unit[unitno].bselected = false;
						}
					}else {//attack object
						
					}
					break;
				}
			}
			//}
			
			var bemeny:Boolean = false;
			//attack function
			for (var unitcheckno:int = 0; unitcheckno < unit.length;unitcheckno++ ) {
				if (unit[unitcheckno].mesh.name == event.shape.name) {
					//trace('------');
					if (unit[unitcheckno].ownerid != playername) {
						trace('attack point');
						bemeny = true;
					}else {
						trace('friendly point');
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
		}
		
		public function singleunit_assign(su:StructureUnit):void {
			su.mesh.enableEvents = true;
			su.mesh.addEventListener(MouseEvent.CLICK, singleunit_click);
			trace('unit click...');
		}
		
		//} //END BUILDING/SELECTING FUNCTIONS
		
		//buildings functions and update
		public function objectupdate():void {
			var commanderdata:Commander;
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
					
					buildings[objectno].queryunit[0].time++;
					if (buildings[objectno].queryunit[0].time > buildings[objectno].queryunit[0].spawntime ) {
						buildings[objectno].queryunit[0].time = 0;
						trace('unit finish build...');
						
						//solider.ownerid = playername;
						//singleunit_assign(solider);
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
				var weapon:Vector.<Weapon> = unit[unitno].weapon;
				
				for (var weaponno:int = 0; weaponno < weapon.length; weaponno++) {
					weapon[weaponno].update();
					if (weapon[weaponno].BFIRE) {
						//trace('Fire');
						//var buildprojectile:Projectile = weapon[weaponno].projectilefire;
						var buildprojectile:Projectile = new ProjectileBullet();
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
			
			textresource.text = 'pow:'+ (commanderdata.powerlevel-commanderdata.poweruse)+'/'+commanderdata.powerlevel + ' ore:'+commanderdata.ore +' units:'+unitselectedno+'[]'+unit.length;
			//commanderdata
			
		}
		
		//SELECT FUNCTION
		public function assignbuilding(buiding:Building):Building {
			buiding.mesh.enableEvents = true;
			buiding.mesh.addEventListener(MouseEvent.CLICK, selectbuildmenu);
			return buiding;
		}
		
		//{ MENU CONTROLS AREA
		//Mesh id to select frame build
		public function selectbuildmenu(event:Shape3DEvent):void {
			trace(event.shape.name);
			buildingid = event.shape.name;
			buildingidaction(event.shape.name);
		}
		
		public function buildingidaction(id:String):void {
			//trace('ID' + id);
			for (var buildingno:int = 0; buildingno < buildings.length ;buildingno++ ) {
				if (buildings[buildingno].mesh.name == id) {
					trace('BUILDING:' + buildings[buildingno].name + 'Mesh ID:' + buildings[buildingno].mesh.name);
					unitbuildingmenu(buildings[buildingno]);
					break;
				}
			}
		}
		
		public function unitbuildingmenu(building:Building):void {
			trace('BUILDING:' + building.name);
			//this make sure there is no error
			if (building != null) {
				var button_build:GameButton;
				//barracks code class test
				if (building.name == 'Barracks') {
					cleanmenupanel();
					trace('Unit list:');
					for (var unitinfanno:int = 0; unitinfanno < building.unit.length;unitinfanno++ ) {
						trace('unit class:' + building.unit[unitinfanno].name);
						button_build = new GameButton(building.unit[unitinfanno].name);
						button_build._width = 64;
						//button_build.tag = 'Hel';
						button_build.tag = building.unit[unitinfanno].classtype;
						button_build.addEventListener(GameButtonEvent.TAG,unit_build);
						//button_build.
						button_build.y = 14 * unitinfanno;
						menupanel.addChild(button_build);
					}
					
					//query build
					//for () {
					///}
					
					unitpanel.content(menupanel);
					//unitpanel.x = 14;
				}
				
				if (building.name == 'Mech Factory') {
					//trace('Mech Factory');
					cleanmenupanel();
					
					for (var unitvehno:int = 0; unitvehno < building.unit.length;unitvehno++ ) {
						trace('unit class:' + building.unit[unitvehno].name);
						button_build = new GameButton(building.unit[unitvehno].name);
						button_build.tag = building.unit[unitvehno].classtype;
						//button_build.addEventListener(MouseEvent.CLICK,unit_build);
						button_build.y = 14 * unitvehno;
						button_build._width = 64;
						menupanel.addChild(button_build);
					}
					unitpanel.content(menupanel);
				}
			}
		}
		
		public function unit_build(event:GameButtonEvent):void {
			trace('test:' + event.tagname);
			//buildingid
			var classjob:StructureUnit = new UnitClass().unitload(event.tagname);
			trace('check class:' + classjob.classtype);
			
			for (var buildingno:int = 0; buildingno < buildings.length; buildingno++) {
				if (buildings[buildingno].mesh.name == buildingid) {
					buildings[buildingno].queryunit.push(classjob);
					trace('found and adding query build...'+buildings[buildingno].queryunit.length);
					break;
				}
			}
		}
		
		public function unit_holdbuild():void {
			
		}
		
		public function unit_cancelbuild():void {
			
		}
		
		public function cleanmenupanel():void {
			while (menupanel.numChildren) {
				for (var panelno:int = 0; panelno < menupanel.numChildren ;panelno++ ) {
					menupanel.removeChildAt(panelno);
				}
			}
		}
		
		//need to sort out into gourp for order to attack.
		public function unitmenu():void {
			
		}
		
		//}
	}
	
}
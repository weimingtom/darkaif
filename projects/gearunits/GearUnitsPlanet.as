package  
{
	//{
	import darknet.core.display.Button;
	import flash.display.Sprite;
	import flash.text.TextField;
	import gearunits.entity.building.*;
	import gearunits.entity.Commander;
	import gearunits.entity.vehicle.*;
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
		
		public var buildingname:String = '';
		public var playername:String = 'guest';
		
		//tmp object for preview
		public var meshconstructionyard:MeshConstructionYard = new MeshConstructionYard();
		public var meshpowerplant:MeshPowerPlant = new MeshPowerPlant();
		public var meshorerefinery:MeshOreRefinery = new MeshOreRefinery();
		public var meshbarracks:MeshBarracks = new MeshBarracks();
		public var meshmechfactory:MeshMechFactory = new MeshMechFactory();
		
		public var commander:Vector.<Commander> = new Vector.<Commander>();
		public var textresource:TextField = new TextField();
		
		//}
		
		public function GearUnits() {
			var commanderdata:Commander = new Commander();
			commanderdata.name = playername;
			commander.push(commanderdata);
			
			textresource.text = 'pow:' + ' ore:';
			textresource.x = 92;
			textresource.height = 20;
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
			
			terrainbuild();
			BuildMainMenu();
			addChild(textresource);
			buildtest();
		}
		
		public function buildtest():void {
			var build:Building;
			build = new BuildingConstructionYard();
			g.addChild(build.mesh);
			build.ownerid = playername;
			buildings.push(build);
		}
		
		//main building that build stuff
		public function BuildMainMenu():void {
			var buttonbuildconstructionyard:Button = new Button('Cons Yard');
			buttonbuildconstructionyard.addEventListener(MouseEvent.CLICK, clickbuildconstructionyard);
			function clickbuildconstructionyard(event:Event):void {
				buildingname = 'Constuction Yard';
				trace(buildingname);
				addbuildmouse();
			}
			var buttonbuildpowerplant:Button = new Button('Power Plant');
			buttonbuildpowerplant.y = 14 * 1;
			buttonbuildpowerplant.addEventListener(MouseEvent.CLICK, clickbuildpowerplant);
			function clickbuildpowerplant(event:Event):void {
				buildingname = 'Power plant';
				trace(buildingname);
				addbuildmouse();
			}
			var buttonbuildorerefiney:Button = new Button('Ore Refiney');
			buttonbuildorerefiney.addEventListener(MouseEvent.CLICK, clickbuildorerefiney);
			function clickbuildorerefiney(event:Event):void {
				buildingname = 'Ore Refiney';
				trace(buildingname);
				addbuildmouse();
			}
			buttonbuildorerefiney.y = 14 * 2;
			var buttonbuildbarracks:Button = new Button('Barracks');
			buttonbuildbarracks.addEventListener(MouseEvent.CLICK, clickbuildbarracks);
			function clickbuildbarracks(event:Event):void {
				buildingname = 'Barracks';
				trace(buildingname);
				addbuildmouse();
			}
			buttonbuildbarracks.y = 14 * 3;
			var buttonbuildmechfactory:Button = new Button('Mech Factory');
			buttonbuildmechfactory.addEventListener(MouseEvent.CLICK, clickbuildmechfactory);
			function clickbuildmechfactory(event:Event):void {
				buildingname = 'Mech Factory';
				trace(buildingname);
				addbuildmouse();
			}
			buttonbuildmechfactory.y = 14 * 4;
			var buttonbuildairport:Button = new Button('Air Port');
			var buttonbuildseaport:Button = new Button('Sea Port');
			
			
			function addbuildmouse():void {
				bottom.addEventListener(MouseEvent.CLICK, placeobject);
				bottom.addEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			}
			addChild(buttonbuildconstructionyard);
			addChild(buttonbuildpowerplant);
			addChild(buttonbuildorerefiney);
			addChild(buttonbuildbarracks);
			addChild(buttonbuildmechfactory);
		}
		
		//branch off menu for tech tree
		public function BuildSubMenu():void {
			
		}
		
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
			
			//bottom.addEventListener();
			
			bottom.appearance = app01;
			g.addChild(bottom);
		}
		
		public function placeobject(objectevent:Shape3DEvent):void {
			buildbuilding(objectevent.point);
		}
		
		public function buildbuilding(point:Point3D):void {
			bottom.removeEventListener(MouseEvent.CLICK, placeobject);
			bottom.removeEventListener(MouseEvent.MOUSE_OVER, updateobjectover);
			bottom.removeEventListener(MouseEvent.MOUSE_MOVE, updateobjectposition);
			
			var build:Building;
			
			if (buildingname == 'Constuction Yard') {
				build = new BuildingConstructionYard();
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
		
		public function updateobjectout(objectevent:Shape3DEvent):void {
			bottom.removeEventListener(MouseEvent.MOUSE_MOVE, updateobjectposition);
			//g.removeChildByName(tmpbox.name);
			
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
		}
		
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
			textresource.text = 'pow:'+ (commanderdata.powerlevel-commanderdata.poweruse)+'/'+commanderdata.powerlevel + ' ore:'+commanderdata.ore;
			//commanderdata
			
		}
		
		private function enterFrameHandler(event:Event) : void {
			objectupdate();
			
			scene.render();
		}
	}
	
}
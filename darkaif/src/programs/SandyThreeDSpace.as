/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  programs
{
	/*
	 * Information: This stage will devolpe the game.
	 * sandy and collision bound box
	 * 3.0.1
	 * Required Support: Sandy
	 * 
	*/
	
	//{PACKAGES
	//import darkaif.core.model.platform_map_default;
	import flash.display.Sprite;
	import flash.events.*;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.parser.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	//import org.flashdevelop.utils.FlashConnect;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	//import sandy.core.data.Vector;
	
	//}PACKAGES
	public class SandyThreeDSpace extends Sprite 
	{
		//{VARIABLE START
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var pot:Shape3D;
		private var map:Shape3D;
		private var entity:Shape3D;
		private var player_model:Shape3D;
		public var g:Group = new Group("myGroup");
		public var movex:Number = 0;
		public var movey:Number = 0;
		public var movez:Number = 0;
		public var oldmovex:Number = 0;
		public var oldmovey:Number = 0;
		public var oldmovez:Number = 0;
		public var numberobjects:int = 0;
		
		//player info
		public var Playername:String = 'player';
		public var playerasign:Boolean = false;
		
		//objects
		public var DataObjects:Array = new Array();
		public var ObjectID:int = 0;
		public var ID:int = 0;
		public var objectarry:Array = new Array();
		
		public var move_left:Boolean = false;
		public var move_right:Boolean = false;
		public var move_up:Boolean = false;
		public var move_down:Boolean = false;
		public var move_forward:Boolean = false;
		public var move_backward:Boolean = false;
		public var keysDown:Array = new Array();
		
		public var gametick:Timer = new Timer(25);
		
		//}VARIABLE END
		public function SandyThreeDSpace() 
		{
			camera = new Camera3D(300, 300);
			//camera.y = 224; //d
			camera.y = 150;
			camera.z = -256;
			camera.rotateX = 20;
			camera.near = 0;
			//FlashConnect.trace(String(camera.far));
		 
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
		 
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
		 
			// Listen to the heart beat and render the scene
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			
			//game timer for keyboard
			gametick.start();
			gametick.addEventListener(TimerEvent.TIMER, tick, false, 0, true);
			
			//keyboard events
			stage.addEventListener(KeyboardEvent.KEY_DOWN, addKey, false, 0, true);
			stage.addEventListener(KeyboardEvent.KEY_UP, removeKey, false, 0, true);
		}
		
		//{ KEYBOARD START
		public function addKey(e:KeyboardEvent):void {
			keysDown[e.keyCode] = true;	
			//FlashConnect.trace(String(e.keyCode));
		}
		public function removeKey(e:KeyboardEvent):void {
			keysDown[e.keyCode] = false;
		}
		//} KEYBOARD END
		
		//{GAME TIME START
		private function tick(e:TimerEvent):void {
			PlayerMove();
			PlayerCollisionCheck();
		}
		//}GAME TIME END
		
		//{GAME CONTROLS START
		private function PlayerMove():void
		{
			//player controls
			if (keysDown[Keyboard.SPACE])
			{
				//FlashConnect.trace("Space key");
				player_model.z = 0;
				player_model.x = 0;
				player_model.y = 18;
				camera.x = 0;
				camera.y = 100;
				camera.z = -200;
			}
			
			if (keysDown[Keyboard.HOME])
			{
				//FlashConnect.trace("LIST:");
				for (var o:int = 0; o < scene.root.children.length; o++)
				{
					//FlashConnect.trace( ">" + o + ":" + String(scene.root.children[o].name));
					//FlashConnect.trace(String(scene.root.children[g].name));
				}
				var objectslist:Array = g.children
				for (var i:int = 0; i < objectslist.length; i++) {
				//	// Do what you want with objects[i];
					//FlashConnect.trace("Gourp:" + i +":"+objectslist[i].name);
				}
			}
			
			if (keysDown[Keyboard.SHIFT])
			{ //hold Shif key to move up and down
				//FlashConnect.trace("Shift key");
				if (keysDown[Keyboard.UP]){move_up = true;}else{move_up = false;}
				if (keysDown[Keyboard.DOWN]){move_down = true;}else{move_down = false;}
			}
			else
			{
				if (keysDown[Keyboard.UP]){move_forward = true;}else{move_forward = false;}
				if (keysDown[Keyboard.DOWN]){move_backward = true;}else{move_backward = false;}
			}
			
			if (keysDown[Keyboard.LEFT]){move_left = true; } else{move_left = false; }
			if (keysDown[Keyboard.RIGHT]){move_right = true;}else{move_right = false;}
		}
		
		private function PlayerCollisionCheck():void
		{
			//this section has the timer loop from "private function tick(e:TimerEvent):void"
			var bcollisionx:Boolean = false;
			var bcollisiony:Boolean = false;
			var bcollisionz:Boolean = false;
			
			if (move_forward){movez = 2;}else if (move_backward){movez = -2;}else{movez = 0;}
			
			if (move_up){movey = 2;}else if (move_down){movey = -2;}else{movey = 0;}
			
			if (move_left){movex = -2;}else if (move_right){movex = 2;}else{movex = 0;}
			
			var objectmove:Array = g.children //get objects.
			//This is the loop collision
			//if there is collision break loop
			for (var c:int = 0; c < objectmove.length; c++) {
				if (( objectmove[c] != objectmove[ObjectID]) && ("1" != objectmove[c].name)) //1 number one -this is cam
				{
					if (!Shape3DCollision(movex, 0, 0, objectmove[ObjectID], objectmove[c]))
					{
						//objectmove[ObjectID].x += movex; 
						bcollisionx = false;
					}
					else
					{
						bcollisionx = true;
						//objectmove[ObjectID].x -= movex;
						//break;
					}
					
					if (!Shape3DCollision(0, movey, 0, objectmove[ObjectID], objectmove[c]))
					{
						bcollisiony = false;
						//objectmove[ObjectID].y += movey; 
					}
					else
					{
						//objectmove[ObjectID].y -= movey;
						//FlashConnect.trace("y");
						bcollisiony = true;
						//break;
					}
					
					if (!Shape3DCollision(0, 0, movez, objectmove[ObjectID], objectmove[c]))
					{
						//objectmove[ObjectID].z += movez; 
						bcollisionz = false;
					}
					else
					{
						//objectmove[ObjectID].z -= movez;
						bcollisionz = true;
						//break; //break loop if collision is there
					}
					if ((bcollisionx == true) || (bcollisiony == true) ||(bcollisionz == true))
					{
						break;
					}
				}
			}
			//if collision is there put it here
			if (bcollisionx != true)
			{
				objectmove[ObjectID].x += movex;
			}
			else
			{
				objectmove[ObjectID].x -= movex;
			}
			if (bcollisiony != true)
			{
				objectmove[ObjectID].y += movey; 
			}else
			{
				objectmove[ObjectID].y -= movey; 
			}
			if (bcollisionz != true)
			{
				objectmove[ObjectID].z += movez; 
			}
			else
			{
				objectmove[ObjectID].z -= movey; 
			}
			
		}
		
		//}GAME CONTROLS END
		private function keyPressedHandler(event:flash.events.KeyboardEvent):void 
		{
			if (event.keyCode == Keyboard.TAB)
			{
				ID++;
				var objects:Array = g.children
				
				if (ID >= (objects.length - 1))//remove cam that stuff
				{
					ID = 0;
				}
				ObjectID = ID;
				//FlashConnect.trace("OBJECT:" + String(ObjectID)+":"+objects[ObjectID].name);
			}
		}
		
		//{ Collision Start
		private function Shape3DCollision(bx:Number,by:Number,bz:Number,box1:Shape3D, box2:Shape3D):Boolean
		{
			var tmp1:Shape3D;
			//trace(box1.boundingBox.max.x);
			var tmp2:Shape3D;
			tmp1 = box1;
			tmp2 = box2;
			//tmp1.x = tmp1.x + 1; //This will update the current object that it will return to the owner
			//max is + from center
			//min is - from center
			
			if (((tmp1.z + bz) + tmp1.boundingBox.max.z >= (tmp2.z + tmp2.boundingBox.min.z)) &&
				((tmp1.z + bz) + tmp1.boundingBox.min.z <= (tmp2.z + tmp2.boundingBox.max.z)) &&
				((tmp1.y + by) + tmp1.boundingBox.max.y >= (tmp2.y + tmp2.boundingBox.min.y)) &&
				((tmp1.y + by) + tmp1.boundingBox.min.y <= (tmp2.y + tmp2.boundingBox.max.y)) &&
				((tmp1.x + bx) + tmp1.boundingBox.max.x >= (tmp2.x + tmp2.boundingBox.min.x)) && 
				((tmp1.x + bx) + tmp1.boundingBox.min.x <= (tmp2.x + tmp2.boundingBox.max.x))
				){
				//FlashConnect.trace("Collision");				
				return true; //there is colision
			}
			else
			{
				//FlashConnect.trace("No Collision");
				return false;// there is no collision
			}
			
			//return false;
		}
		//} Collision End
		
		// Create the scene graph based on the root Group of the scene
		private function createScene():Group
		{
			//var g:Group = new Group("myGroup");
			
			var createobject:Shape3D;
			var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
			var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
			var app:Appearance = new Appearance( material);
			
			//object data for creating
			objectarry.push({ name:'player', x:0, y:0, z:0, height:16, width:16, length:16, color:0x008000 });
			objectarry.push({  name:'vehicle_test0', x:0, y:0, z:92, height:16, width:16, length:16 , color:0xadff2f });//light green
			objectarry.push({  name:'npc_test1', x:0, y:0, z:-64, height:16, width:16, length:16, color:0xffff00 });//yellow
			objectarry.push({  name:'monster_test2', x:0, y:0, z:32, height:16, width:16, length:16, color:0xff0000 });//red
			objectarry.push( {  name:'building_test3', x: -64, y:0, z:0, height:16, width:16, length:16, color:0x808080 } );//gray
			objectarry.push( {  name:'building_test4', x: -32, y:0, z:0, height:16, width:16, length:16, color:0x808080 } );//gray
			objectarry.push({  name:'building_test4', x:-45, y:0, z:0, height:16, width:16, length:16, color:0x808080 });//gray
			
			for (var o:int = 0; o < objectarry.length; o++)
			{
				//FlashConnect.trace(objectarry[o].name);
				createobject = new Box(objectarry[o].name, objectarry[o].height, objectarry[o].width, objectarry[o].length);
				createobject.x = objectarry[o].x;
				createobject.y = objectarry[o].y;
				createobject.z = objectarry[o].z;
				material = new ColorMaterial( objectarry[o].color, 0.9, materialAttr);
				material.lightingEnable = true;
				app = new Appearance( material);
				
				createobject.useSingleContainer = false;
				createobject.enableBackFaceCulling = false;
				createobject.enableClipping = true;
				createobject.appearance = app;
				
				g.addChild(createobject);
			}
			// We need to add the objects to the group 
			return g;
		}
		
		// The Event.ENTER_FRAME event handler tells the world to render
		private function enterFrameHandler( event : Event ) : void{
			scene.render();
		}
	}
}
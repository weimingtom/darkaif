/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package  
{
	/*
	 * Information: This stage will devolpe the game.
	 * 
	 * Required Support: Sandy
	 * 
	*/
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
	import org.flashdevelop.utils.FlashConnect;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import sandy.core.data.Vector;

	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	*/
	public class ThreeDSpace extends Sprite 
	{
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var pot:Shape3D;
		private var player_model:Shape3D;
		
		public var move_left:Boolean = false;
		public var move_right:Boolean = false;
		public var move_up:Boolean = false;
		public var move_down:Boolean = false;
		public var move_forward:Boolean = false;
		public var move_backward:Boolean = false;
		public var keysDown:Array = new Array();
		
		public var gametick:Timer = new Timer(25);
		
		public function ThreeDSpace() 
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
		
		public function addKey(e:KeyboardEvent):void {
			keysDown[e.keyCode] = true;	
			//FlashConnect.trace(String(e.keyCode));
		}
		public function removeKey(e:KeyboardEvent):void {
			keysDown[e.keyCode] = false;
		}
		
		private function tick(e:TimerEvent):void {
			if (keysDown[Keyboard.SPACE]){
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
				FlashConnect.trace("LIST:");
				for (var g:int = 0; g < scene.root.children.length; g++)
				{
					FlashConnect.trace(String(scene.root.children[g].name));
				}
				
			}
			if (keysDown[Keyboard.END])
			{
				FlashConnect.trace("LIST:");
				for (var b:int = 0; b < scene.root.children.length; b++)
				{
					FlashConnect.trace(String(scene.root.children[b].name));
					//if (scene.root.children[b].name == 'box' )
					//{
						scene.root.removeChildByName( "box" );
					//}
				}
				
			}
			if (keysDown[Keyboard.SHIFT]){ //hold Shif key to move up and down
				//FlashConnect.trace("Shift key");
				if (keysDown[Keyboard.UP]){
					move_up = true;
					//FlashConnect.trace("forward");
				}else{
					move_up = false;
				}
				if (keysDown[Keyboard.DOWN]){
					move_down = true;
				}else{
					move_down = false;
				}
				
			}
			else
			{
				if (keysDown[Keyboard.UP]){
					move_forward = true;
					//FlashConnect.trace("forward");
				}else{
					move_forward = false;
				}
				if (keysDown[Keyboard.DOWN]){
					move_backward = true;
				}else{
					move_backward = false;
				}
			}
			
			
			if (keysDown[Keyboard.LEFT]){
				move_left = true;
			}
			else
			{
				move_left = false;
			}
			if (keysDown[Keyboard.RIGHT])
			{
				move_right = true;
			}
			else
			{
				move_right = false;
			}
			if ((move_forward)&& (!Shape3DCollision(0, 0, 1, player_model, pot)))
			{
				player_model.z += 2;
				//camera.y -= 5;
				//FlashConnect.trace("forward");
			}
			else if ((move_backward)&& (!Shape3DCollision(0, 0, -1, player_model, pot)))
			{
				player_model.z -= 2;
				//camera.y += 5;
			}
			if ((move_up)&& (!Shape3DCollision(0, 1, 0, player_model, pot)))
			{
				player_model.y += 2;
				//camera.y -= 5;
			}
			else if ((move_down)&& (!Shape3DCollision(0, -1, 0, player_model, pot)))
			{
				player_model.y -= 2;
				//camera.y += 5;
			}
			if ((move_left)&& (!Shape3DCollision(-1, 0, 0, player_model, pot)))
			{
				player_model.x -= 2;
				//camera.x += 5;
			}
			else if (move_right && (!Shape3DCollision(+1, 0, 0, player_model, pot)))
			{
				player_model.x += 2;
				//camera.x -= 5;
			}
		}
		
		private function keyPressedHandler(event:flash.events.KeyboardEvent):void {
		
		}
		
		private function Shape3DCollision(bx:Number,by:Number,bz:Number,box1:Shape3D, box2:Shape3D):Boolean
		{
			var tmp1:Shape3D;
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
			}else{
				//FlashConnect.trace("No Collision");
				return false;// there is no collision
				
			}
		}
		
		// Create the scene graph based on the root Group of the scene
		private function createScene():Group
		{
			// Create the root Group
			var g:Group = new Group("myGroup");
		 
			var materialAttr:MaterialAttributes = new MaterialAttributes(new LightAttributes( true, 0.2 ) );
			var material:Material = new ColorMaterial( 0xE0F87E, 0.9, materialAttr);
			material.lightingEnable = true;
			var app:Appearance = new Appearance( material);
			
			pot = new Box("box", 16, 16, 16);
			pot.z = 64;
			pot.y = 0;
			pot.appearance = app;
			player_model = new Box("player_box", 16, 16, 16);
			
			player_model.y = 0;
			material = new ColorMaterial( 0xadd8e6, 0.9, materialAttr);
			material.lightingEnable = true;
			app = new Appearance( material);
			player_model.useSingleContainer = false;
			player_model.enableBackFaceCulling = false;
			player_model.enableClipping = true;
			player_model.appearance = app;
			
			pot.enableBackFaceCulling = false;
			pot.enableClipping = true;
			g.addChild( pot );
			g.addChild(player_model);
		 
			// We need to add the pot to the group 
			return g;
		}
		
      // The Event.ENTER_FRAME event handler tells the world to render
		private function enterFrameHandler( event : Event ) : void{
			scene.render();
		}
	}
}
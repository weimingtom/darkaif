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
	//import darkaif.core.model.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import org.flashdevelop.utils.FlashConnect;

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
		
		public var move_left:Boolean = true;
		public var move_right:Boolean = true;
		public var move_up:Boolean = true;
		public var move_down:Boolean = true;
		
		
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
		}
		
		private function keyPressedHandler(event:flash.events.KeyboardEvent):void {
			//FlashConnect.trace(String(player_model.boundingBox));
			//FlashConnect.trace("Player");
			//FlashConnect.trace(String("[" + player_model.x + "]:[" + player_model.y+ "]:[" + player_model.z+"]"));
			//FlashConnect.trace(String(player_model.y));
			//FlashConnect.trace("POT");
			//FlashConnect.trace(String("["+ pot.x + "]:[" + pot.y+ "]:[" + pot.z+"]"));
			//FlashConnect.trace(String(pot.y));
			//FlashConnect.trace(String(pot.y));
			
			//FlashConnect.trace(String(player_model.boundingBox.transform(player_model.viewMatrix)));
			//FlashConnect.trace("out:" + player_model.out.cross(pot.side) + " side:" + player_model.side + " up:" + player_model.up);
			//FlashConnect.trace("Center:" + player_model.geometryCenter);
			/*
			if ((player_model.z + 8 >= (pot.z - 8)) && //z
				(player_model.z - 8 <= (pot.z + 8)) &&
				(player_model.x + 8 >= (pot.x - 8)) && 
				(player_model.x - 8 <= (pot.x + 8))
				){
				//move_up = false;
			}else{
				//move_up = true;
			}
			
			if ((player_model.x + 8 >= (pot.x - 8)) && //x
				(player_model.x - 8 <= (pot.x + 8)) &&
				(player_model.z + 8 >= (pot.z - 8)) && 
				(player_model.z - 8 <= (pot.z + 8))
				){
				//move_left = false;
			}else{
				//move_left = true;
				
			}
			
			if ((player_model.y + 8 >= (pot.y - 8)) && //y
				(player_model.y - 8 <= (pot.y + 8)) &&
				(player_model.x + 8 >= (pot.x - 8)) && 
				(player_model.x - 8 <= (pot.x + 8))
				){
				//move_down = false;
			}else{
				//move_down = true;
				
			}
			*/
			//FlashConnect.trace(String(player_model.side));
			//FlashConnect.trace(String(player_model.up));
			//FlashConnect.trace(String(player_model.out));
			switch(event.keyCode) {
				case Keyboard.SPACE:
					FlashConnect.trace("Space key");
					player_model.z = 0;
					player_model.x = 0;
					player_model.y = 18;
					camera.x = 0;
					camera.y = 100;
					camera.z = -200;
					break;
				case Keyboard.UP:
					if (!Shape3DCollision(0,-5,0,player_model,pot)){
					player_model.y -= 5;
					camera.y -= 5;
					}else
					{
						player_model.y += 5;
					camera.y += 5;
					}
					break;
				case Keyboard.DOWN:
					if (!Shape3DCollision(0,5,0,player_model,pot)){
					player_model.y += 5;
					camera.y += 5;
					}else
					{
						player_model.y -= 5;
						camera.y -= 5;
					}
					break;
				case Keyboard.LEFT:
					if (!Shape3DCollision(5,0,0,player_model,pot)){
					player_model.x += 5;
					camera.x += 5;
					}else
					{
						player_model.x -= 5;
						camera.x -= 5;
					}
					break;
				case Keyboard.RIGHT:
					if (!Shape3DCollision(-5,0,0,player_model,pot)){
					player_model.x -= 5;
					camera.x -= 5;
					}else
					{
						player_model.x += 5;
						camera.x += 5;
					}
					break;
			}
		}
		
		private function Shape3DCollision(bx:Number,by:Number,bz:Number,box1:Shape3D, box2:Shape3D):Boolean
		{
			var tmp1:Shape3D;
			var tmp2:Shape3D;
			tmp1 = box1;
			tmp2 = box2;
			/*
			if (bx != 0)
			{
				tmp1.x = tmp1.x + bx;
				FlashConnect.trace("There is no zero:x");
			}
			if (by != 0)
			{
				tmp1.y = tmp1.y + by;
				FlashConnect.trace("There is no zero:y");
			}
			if (bz != 0)
			{
				tmp1.z = tmp1.z + bz;
				FlashConnect.trace("There is no zero:z");
			}
			*/
			FlashConnect.trace("Hello");
			//FlashConnect.trace(String(box1.y));
			//FlashConnect.trace(String(box2.y));
			if ((box1.z + 8 >= (box2.z - 8)) &&
				(box1.z - 8 <= (box2.z + 8)) &&
				(box1.y + 8 >= (box2.y - 8)) &&
				(box1.y - 8 <= (box2.y + 8)) &&
				(box1.x + 8 >= (box2.x - 8)) && 
				(box1.x - 8 <= (box2.x + 8))
				){
				FlashConnect.trace("Collision");	
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
			
			pot = new Box("player_box", 16, 16, 16);
			//pot.z = 64;
			pot.y = 64;
			pot.appearance = app;
			player_model = new Box("player_box", 16, 16, 16);
			
			player_model.y = 32;
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
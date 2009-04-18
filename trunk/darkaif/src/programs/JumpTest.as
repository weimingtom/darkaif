package programs
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class JumpTest extends Sprite
	{
		public var mcMain:Sprite = new Sprite();
		
		public var leftKeyDown:Boolean = false;
		public var upKeyDown:Boolean = false;
		public var rightKeyDown:Boolean = false;
		public var downKeyDown:Boolean = false;
		//the main character's speed
		public var mainSpeed:Number = 7;
		//whether or not the main guy is jumping
		public var mainJumping:Boolean = false;
		//how quickly should the jump start off
		public var jumpSpeedLimit:int = 15;
		//the current speed of the jump;
		public var jumpSpeed:Number = jumpSpeedLimit;
		
		public function JumpTest() {
			
			mcMain.graphics.beginFill(0x999999);
			mcMain.graphics.drawRect(0, 0, 16, 16);
			addChild(mcMain);
			
			stage.addEventListener(Event.ENTER_FRAME, moveChar);
			function moveChar(event:Event):void{
				//if certain keys are down then move the character
				if(leftKeyDown){
					mcMain.x -= mainSpeed;
				}
				if(rightKeyDown){
					mcMain.x += mainSpeed;
					trace('move');
				}
				if(upKeyDown || mainJumping){
					mainJump();
				}
			}
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkKeysDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, checkKeysUp);
			
		}
		
		public function mainJump():void{
			//if main isn't already jumping
			if(!mainJumping){
				//then start jumping
				mainJumping = true;
				jumpSpeed = jumpSpeedLimit*-1;
				mcMain.y += jumpSpeed;
			} else {
				//then continue jumping if already in the air
				//crazy math that I won't explain
				if(jumpSpeed < 0){
				jumpSpeed *= 1 - jumpSpeedLimit/75;
					if(jumpSpeed > -jumpSpeedLimit/5){
						jumpSpeed *= -1;
					}
				}
				if(jumpSpeed > 0 && jumpSpeed <= jumpSpeedLimit){
					jumpSpeed *= 1 + jumpSpeedLimit/50;
				}
				mcMain.y += jumpSpeed;
				//if main hits the floor, then stop jumping
				//of course, we'll change this once we create the level
				if(mcMain.y >= stage.stageHeight - mcMain.height){
					mainJumping = false;
					mcMain.y = stage.stageHeight - mcMain.height;
				}
			}
		}
		
		public function checkKeysDown(event:KeyboardEvent):void{
			//making the booleans true based on the keycode
			//WASD Keys or arrow keys
			if(event.keyCode == 37 || event.keyCode == 65){
				leftKeyDown = true;
			}
			if(event.keyCode == 38 || event.keyCode == 87){
				upKeyDown = true;
			}
			if(event.keyCode == 39 || event.keyCode == 68){
				rightKeyDown = true;
			}
			if(event.keyCode == 40 || event.keyCode == 83){
				downKeyDown = true;
			}
		}
		
		public function checkKeysUp(event:KeyboardEvent):void{
			//making the booleans false based on the keycode
			if(event.keyCode == 37 || event.keyCode == 65){
				leftKeyDown = false;
			}
			if(event.keyCode == 38 || event.keyCode == 87){
				upKeyDown = false;
			}
			if(event.keyCode == 39 || event.keyCode == 68){
				rightKeyDown = false;
			}
			if(event.keyCode == 40 || event.keyCode == 83){
				downKeyDown = false;
			}
		}
		
	}
	
}
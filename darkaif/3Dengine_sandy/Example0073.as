package{
   import flash.display.*; 
   import flash.events.*;
   import flash.ui.*;
   import flash.net.URLRequest;
   
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

   public class Example0073 extends Sprite 
   {
      private var scene:Scene3D;
	  private var camera:Camera3D;
	  private var tg:TransformGroup;
	  private var tg2:TransformGroup;
	  private var car:Shape3D;
	  private var wheelLF:Shape3D;
	  private var wheelRF:Shape3D;
	  private var wheelLR:Shape3D;
	  private var wheelRR:Shape3D;
	  private var queue:LoaderQueue;
      private var parserStack:ParserStack;
	  private var speed:Number = 0;
	  private var angle:Number = 0;
	  
      public function Example0073()
      { 
		var parser:IParser = Parser.create("data/models/ASE/car.ASE",Parser.ASE );
		var parserLF:IParser = Parser.create("data/models/ASE/wheel_Front_L.ASE",Parser.ASE );
	    var parserRF:IParser = Parser.create("data/models/ASE/wheel_Front_R.ASE",Parser.ASE );
	    var parserLR:IParser = Parser.create("data/models/ASE/wheel_Rear_L.ASE",Parser.ASE );
	    var parserRR:IParser = Parser.create("data/models/ASE/wheel_Rear_R.ASE",Parser.ASE );
	    
		parserStack = new ParserStack();
		parserStack.add("carParser",parser);
		parserStack.add("wheelLFParser",parserLF);
		parserStack.add("wheelRFParser",parserRF);
		parserStack.add("wheelLRParser",parserLR);
		parserStack.add("wheelRRParser",parserRR);
		parserStack.addEventListener(ParserStack.COMPLETE, parserComplete );
		parserStack.start();
		
	  }
	  
	  private function parserComplete(pEvt:Event ):void
      {
		car = parserStack.getGroupByName("carParser").children[0] as Shape3D;
		wheelLF = parserStack.getGroupByName("wheelLFParser").children[0] as Shape3D;
	    wheelRF = parserStack.getGroupByName("wheelRFParser").children[0] as Shape3D;
		wheelLR = parserStack.getGroupByName("wheelLRParser").children[0] as Shape3D;
		wheelRR = parserStack.getGroupByName("wheelRRParser").children[0] as Shape3D;
		loadSkins();
	  }
	  
	  
	  private function loadSkins():void{
	   queue = new LoaderQueue();
       queue.add( "carSkin", new URLRequest("data/textures/car.jpg") );
	   queue.add( "wheels", new URLRequest("data/textures/wheel.jpg") );
	   
	   queue.addEventListener(SandyEvent.QUEUE_COMPLETE, loadComplete );
       queue.start();
	  }
      
	  // Create the scene graph based on the root Group of the scene
      private function loadComplete(event:QueueEvent): void
      {
         camera = new Camera3D( 700, 370 );
		 camera.y = 50;
		 camera.z = -100;
		 camera.near = 10;
		 camera.viewport = new ViewPort(700,200);
		 var root:Group = createScene();
		 scene = new Scene3D( "scene", this, camera, root );
		 
		 // Listen to the heart beat and render the scene
         addEventListener( Event.ENTER_FRAME, enterFrameHandler );
		 stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
      }
	  
	  private function createScene():Group
      {
         // Create the root Group
         var g:Group = new Group();
		 
		 // We need to create a transformGroup that will group the chassis and the wheels
		 tg = new TransformGroup('myGroup');
		 
		 // we need a second transformGroup to be able to rotate the car other than its center
		 tg2 = new TransformGroup();
		  
		 var material:BitmapMaterial = new BitmapMaterial( queue.data["carSkin"].bitmapData );
		 var app:Appearance = new Appearance( material );
		 car.appearance = app;
		 
		 var materialW:BitmapMaterial = new BitmapMaterial( queue.data["wheels"].bitmapData );
		 var appW:Appearance = new Appearance( materialW );
		 wheelLF.appearance = appW;
		 wheelRF.appearance = appW;
		 wheelLR.appearance = appW;
		 wheelRR.appearance = appW;
		 
		 // use single container = False
		 car.useSingleContainer = false;
		 wheelLF.useSingleContainer = false;
		 wheelRF.useSingleContainer = false;
		 wheelLR.useSingleContainer = false;
		 wheelRR.useSingleContainer = false;
		 
		 // change  geometry center for wheels
		 wheelRF.geometryCenter = new Vector(-24,-11.5,-48.5);
		 wheelRF.x += 24;
		 wheelRF.y += 11.5;
		 wheelRF.z += 48.5;
		 
		 wheelLF.geometryCenter = new Vector(24.5,-11.5,-48.5);
		 wheelLF.x -= 24.5;
		 wheelLF.y += 11.5;
		 wheelLF.z += 48.5;
		 
		 wheelRR.geometryCenter = new Vector(-24,-11.5,+41);
		 wheelRR.x += 24;
		 wheelRR.y += 11.5;
		 wheelRR.z -= 41;
		 
		 wheelLR.geometryCenter = new Vector(24.5,-11.5,+41);
		 wheelLR.x -= 24.5;
		 wheelLR.y += 11.5;
		 wheelLR.z -= 41;
		 
		 car.geometryCenter = new Vector(0,0,+41);
		 car.z -= 41;
		 
		 tg.addChild( wheelRF );
		 tg.addChild( wheelLF );
		 tg.addChild( wheelRR );
		 tg.addChild( wheelLR );
		 tg.addChild( car );
		 
		 // set the offset
		 tg.z += 50;
		 tg2.addChild(tg);
		 
		 tg2.x = -50;
		 tg2.y = 0;
		 tg2.z = 150;
		 
		 tg2.rotateY = -130;
		 
		 g.addChild( tg2 );
		 return g;
      }

	  private function keyPressedHandler(event:flash.events.KeyboardEvent):void 
	  {
	   switch(event.keyCode) {
		case Keyboard.SPACE:
			tg2.x = -50;
			tg2.y = 0;
			tg2.z = 150;
			break;
		case Keyboard.UP:
			if (speed < 6)
			 speed += 1;
			break;
		case Keyboard.DOWN:
			if (speed > -4)
			 speed -= 1;
			break;
		case Keyboard.LEFT:
		    if(wheelLF.pan>=-40){
			 wheelLF.tilt =0;
			 wheelRF.tilt =0;
			 wheelLF.pan -=4;
			 wheelRF.pan -=4;
			}
			break;
		case Keyboard.RIGHT:
		    if(wheelLF.pan<=40){
		     wheelLF.tilt =0;
			 wheelRF.tilt =0;
			 wheelLF.pan +=4;
			 wheelRF.pan +=4;
			}
			break;
		}
	  }
       // The Event.ENTER_FRAME event handler tells the world to render
      private function enterFrameHandler( event : Event ) : void
      {
		
		tg2.moveForward(speed);
		wheelLF.tilt +=4*speed;
	    wheelRF.tilt +=4*speed;
		wheelRR.tilt +=4*speed;
		wheelLR.tilt +=4*speed;
		if (speed>0)
		 tg2.pan +=wheelLF.pan/20;
		else if (speed < 0)
		 tg2.pan -=wheelLF.pan/20;
		
		//if(tg2.z < -100){
		//  tg2.visible = false;
		//} else if (tg2.z > -100) {
		//  tg2.visible = true;
		//}
		scene.render();
      }
   }
}

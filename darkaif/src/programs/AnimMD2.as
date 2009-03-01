package  programs
{
	import flash.display.*; 
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	import flash.ui.*;
	import flash.text.*;
	
	import sandy.util.*;
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;
	import sandy.events.*;
	/**
	 * ...
	 * @author 
	 * 
	 * fixed but cut out for animatino test area.
	 */
	public class AnimMD2 extends Sprite
	{
		private var queue:LoaderQueue;
		private var scene:Scene3D;
		public var camera:Camera3D;
		private var arrayDemon:Array = new Array();
		private var demonTest:MD2;
		private var demondie:MD2;
		private var gun:Cylinder = new Cylinder( "gun", 3, 50, 13, 6 );
		private var bt:Array = new Array();
		private var bullet:Sphere = new Sphere( "bullet", 3);
		private var fire:Boolean = false;
		private var directionBall:Number = 0;
		private var idInterval:Number = 0;
		private var myText:TextField = new TextField();
		private var myFormat:TextFormat = new TextFormat();
		private var score:Number = 0;
		
		public function AnimMD2() 
		{
			queue = new LoaderQueue();
			//boxanimation.md2
			queue.add( "demon", new URLRequest("data/models/tris.md2"), "BIN" );
			//queue.add( "demon", new URLRequest("data/models/boxanimation.md2"), "BIN" );
			//queue.add( "demon", new URLRequest("data/models/Demon.md2"), "BIN" );
			queue.add( "demondie", new URLRequest("data/models/Demondie.md2"), "BIN" );
			queue.add( "demonSkin", new URLRequest("data/models/Skindemon.jpg"), "IMG" );
	        queue.add( "demondieSkin", new URLRequest("data/models/Skindemondie.jpg"), "IMG" ); 
			queue.addEventListener(SandyEvent.QUEUE_COMPLETE, loadMD2Complete );
            queue.start();
		}
		
		private function loadMD2Complete(event:Event):void 
		{
			
			// We create the "group" that is the tree of all the visible objects
            var root:Group = createScene();
		 
		    camera = new Camera3D( 600, 450 );
		    camera.z = -400;
			camera.y = 100;
			
		    camera.lookAt(0, 0, 0);
			
			// We create a Scene and we add the camera and the objects tree 
	        scene = new Scene3D( "scene", this, camera, root );
			
			//stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMovedHandler);
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
		}
		
		private function createScene():Group
        {
			// Create the root Group
			var g:Group = new Group();
		  
			// the normal demon
			arrayDemon[0]  = new MD2 ( "default", queue.data["demon"], 0.5 );
			arrayDemon[0].appearance = new Appearance (new BitmapMaterial( queue.data["demonSkin"].bitmapData ));
			arrayDemon[0].z = (Math.random()-0.5)*1000 + 500;
			arrayDemon[0].x = (Math.random()-0.5)*600;
			arrayDemon[0].pan = 90;
			g.addChild( arrayDemon[0]);
			
			for (var i:Number = 1; i < 7; i++)
			{
				arrayDemon[i] = arrayDemon[0].clone("dem");  
				arrayDemon[i].pan = 90;
				arrayDemon[i].z = (Math.random()-0.5)*1000 + 500;
				arrayDemon[i].x = (Math.random()-0.5)*600;
				g.addChild( arrayDemon[i] );
			}
		  
			// the demondie
			arrayDemon[7] = new MD2 ("demdie", queue.data["demondie"], 0.5);
			arrayDemon[7].appearance = new Appearance (new BitmapMaterial( queue.data["demondieSkin"].bitmapData ));
			arrayDemon[7].pan = 90;
			arrayDemon[7].visible = false;
			g.addChild( arrayDemon[7]);
		  
			// let's concentrate on gun and bullets now:
		  
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
			new LightAttributes( true, 0.1)
            );
 
			var material:Material = new ColorMaterial( 0x666666, 1, materialAttr );
			material.lightingEnable = true;
			var app:Appearance = new Appearance( material );
			bullet.appearance = app;
			gun.appearance = app;

			bullet.visible = false;
			g.addChild(bullet);
			g.addChild(gun);
			return g;
		}
		
		private function enterFrameHandler( event : Event ) : void 
		{
			
		    // let's make the monster walking
			for (var j:Number=0; j<7; j++) {
				if (arrayDemon[j] != null) {
					//arrayDemon[j].frame += 0.3;
					arrayDemon[j].frame += 0.5;
					arrayDemon[j].z -= 1;
				if (arrayDemon[j].z < -100) { 
					arrayDemon[j].x = (Math.random()-0.5)*600;
					arrayDemon[j].z = 500;;
				}
				}
			}
			// let's fire the bullet
			if(fire && bullet.z < 1000) {
				bullet.z +=25;
				bullet.x -=directionBall/2;
		    } 
			else 
			{
				bullet.visible = false;
			}
			
			// let's check for hitting monster:
			for (var k:Number=0; k<7; k++) {
				if (arrayDemon[k] != null) {
					var x1:Number = arrayDemon[k].x - bullet.x;
					var x2:Number = arrayDemon[k].y - bullet.y;
					var x3:Number = arrayDemon[k].z - bullet.z;
					var dist:Number = Math.sqrt(x1*x1+x2*x2+x3*x3);
					if (dist < 60) {
						arrayDemon[7].x = arrayDemon[k].x;
						arrayDemon[7].y = arrayDemon[k].y;
						arrayDemon[7].z = arrayDemon[k].z;
						arrayDemon[k].visible = false;
						arrayDemon[7].frame = 0;
						arrayDemon[7].visible = true;
						idInterval = setInterval( dieMonster, 100, k );
						bullet.z = 1100;
						score += 10; 
						myText.text = new String(score);
						myText.setTextFormat(myFormat);
						myText.textColor = 0xFFFFFF;
					}
				}
			}
			 
			 // let's clear interval now if any 
			if(idInterval > 0 && arrayDemon[7].frame>5){
				clearInterval(idInterval);
				idInterval = 0;
			}
			scene.render();
		}
		
		private function dieMonster(h:Number):void{
			arrayDemon[7].frame += 0.3
			if (arrayDemon[7].frame > 5)
			{
				arrayDemon[7].visible = false;
				arrayDemon[h].x = (Math.random()-0.5)*600;
				arrayDemon[h].z = 500;;
				arrayDemon[h].visible = true;
			}
		}
		
	}
	
}
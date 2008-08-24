package 
{
	import flash.utils.*;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.ui.*;

	//wow engine    
	import fr.seraf.wow.primitive.*;
	import fr.seraf.wow.core.WOWEngine;
	import fr.seraf.wow.core.data.WVector;

	// Sandy 
	import sandy.core.Scene3D;
	import sandy.core.data.*;
	import sandy.core.scenegraph.*;
	import sandy.materials.*;
	import sandy.materials.attributes.*;
	import sandy.primitive.*;


	public class Example031 extends Sprite
	{
		private var wow:WOWEngine;
		private var sphere01:WSphere;
		private var plane01:WOWPlane;
		private var plane02:WOWPlane;
		private var plane03:WOWPlane;
		private var plane04:WOWPlane;
		private var plane05:WOWPlane;
		
		private var bound:WBoundArea;

		private var sphereS:Sphere;
		private var cube:Box;
		private var plane:Plane3D;
		private var right:Plane3D;
		private var left:Plane3D;
		private var back:Plane3D;
		
		private var scene:Scene3D;
		private var camera:Camera3D;

		public function Example031()
		{
			//create an instance of the physic engine    
			wow=new WOWEngine();
			// SELECTIVE is better for dealing with lots of little particles colliding,    
			wow.collisionResponseMode = wow.SELECTIVE;
			// gravity -- particles of varying masses are affected the same    
			wow.addMasslessForce (new WVector(0,2,0));
			//create a sphere    
			sphere01 = new WSphere(0,0,0,20,false,0.005,0.95,0);
			sphere01.py=-200;
			wow.addParticle (sphere01);

			plane01 = new WOWPlane();
			plane01.setPosition (0,95,0);
			plane01.setRotation (0,0,0);
			plane01.elasticity=0.8;
			plane01.friction=0.0;
			wow.addParticle (plane01);

			plane02 = new WOWPlane();
			plane02.setPosition (0,0,170);
			plane02.setRotation (90,0,0);
			plane02.elasticity=0.8;
			plane02.friction=0.0;
			wow.addParticle (plane02);
			
			plane03 = new WOWPlane();
			plane03.setPosition (-165,0,0);
			plane03.setRotation (0,0,90);
			plane03.elasticity=0.8;
			plane03.friction=0.0;
			wow.addParticle (plane03);
			
			
			plane04 = new WOWPlane();
			plane04.setPosition (165,0,0);
			plane04.setRotation (0,0,-90);
			plane04.elasticity=0.8;
			plane04.friction=0.0;
			wow.addParticle (plane04);
			
			plane05 = new WOWPlane();
			plane05.setPosition (0,0,-200);
			plane05.setRotation (-90,0,0);
			plane05.elasticity=0.8;
			plane05.friction=0.0;
			wow.addParticle (plane05);
			
			
			// Sandy code
			camera = new Camera3D( 600, 600 );
			camera.z = -500;
			camera.y = 200;
			camera.lookAt (0,0,0);
			var root:Group = createScene();
			scene = new Scene3D( "scene", this, camera, root );

			stage.addEventListener (KeyboardEvent.KEY_DOWN, keyPressedHandler);
			stage.addEventListener (MouseEvent.MOUSE_MOVE, mouseMovedHandler);
			addEventListener ( Event.ENTER_FRAME, enterFrameHandler );
		}
		
		private function createScene ():Group
		{
			// Create the root Group
			var g:Group = new Group();

			// Create a cube so we have something to show
			sphereS = new Sphere( "theSphere", 20,10,10);
			
			var a:PhongAttributes = new PhongAttributes (true, 0.2, 15);
            a.diffuse = 0.5;
            a.specular = 1;
            a.gloss = 5;
			
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
			    new LightAttributes( true, 0.4)
			    );
			var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			material.lightingEnable = true;
			
			var materialAttr2:MaterialAttributes = new MaterialAttributes( 
			    new LightAttributes( true, 0.9)
			    );
			var material2:Material = new ColorMaterial( 0x9999FF, 2, materialAttr2 );
			material2.lightingEnable = true;
			
			var materialAttr3:MaterialAttributes = new MaterialAttributes(
				a,
				new LineAttributes (1,0xCC3333,1));
			var material3:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr3 );
			material3.lightingEnable = true;
			
			var app:Appearance = new Appearance( material );
			var app2:Appearance = new  Appearance (material2);
			var app3:Appearance = new  Appearance (material3);
			
			sphereS.appearance = app3;
			sphereS.useSingleContainer = false;

			sphereS.x = 0;
			sphereS.y = 200;
			sphereS.z = 0;

			// bottom plane
			plane = new Plane3D( "thePlane", 310, 310, 5, 5, Plane3D.ZX_ALIGNED );
			plane.y = -100;
			plane.rotateY = 0;
			
			plane.useSingleContainer = false;
			plane.enableBackFaceCulling = false;
			plane.appearance = app;
			
			back = new Plane3D( "back", 200, 350, 5, 5, Plane3D.XY_ALIGNED );
			back.z = 180;
			back.rotateY = 0;
			
			back.useSingleContainer = false;
			back.enableBackFaceCulling = false;
			back.appearance = app;
			
			right = new Plane3D( "right", 350, 200, 5, 5, Plane3D.YZ_ALIGNED );
			right.x = 170;
			right.rotateY = 0;
			
			right.useSingleContainer = false;
			right.enableBackFaceCulling = false;
			right.appearance = app2;
			
			
			left = new Plane3D( "left", 350, 200, 5, 5, Plane3D.YZ_ALIGNED );
			left.x = -170;
			left.rotateY = 0;
			
			left.useSingleContainer = false;
			left.enableBackFaceCulling = false;
			left.appearance = app2;
			
			// We need to add the cube to the group
			g.addChild ( sphereS );
			g.addChild (plane);
			g.addChild (back);
			g.addChild (right);
			g.addChild (left);

			return g;
		}
		
		private function mouseMovedHandler (event:MouseEvent):void
		{
			plane.rotateZ=(600/2-event.stageX)/25;
			plane.rotateX=(600/2-event.stageY)/25;
			plane01.setRotation (-(600/2-event.stageY)/25,0,-(600/2-event.stageX)/25);
		}
		
		private function keyPressedHandler (event:KeyboardEvent):void
		{
			switch (event.keyCode)
			{
				case Keyboard.SPACE :
					sphereS.x = 0;
					sphereS.y = 200;
					sphereS.z = 0;
					sphere01.px = 0;
					sphere01.py = -200;
					sphere01.pz = 0;
					break;
				case Keyboard.RIGHT :
					camera.x+=2;
					break;
				case Keyboard.LEFT :
					camera.x-=2;
					break;
				case Keyboard.UP :
					camera.y+=2;
					break;
				case Keyboard.DOWN :
					camera.y-=2;
					break;
				case Keyboard.PAGE_DOWN :
					camera.z-=2;
					break;
				case Keyboard.PAGE_UP :
					camera.z+=2;
					break;	
					
			}
		}
		
		private function enterFrameHandler ( event : Event ):void
		{
			//run the engine once  
			wow.step ();
			//get the position 
			sphereS.x = sphere01.px;
			sphereS.y = -sphere01.py;
			sphereS.z = sphere01.pz;
			sphereS.roll += 4;
			sphereS.pan += 4;
			sphereS.tilt += 4;
			scene.render ();
		}
	}
}

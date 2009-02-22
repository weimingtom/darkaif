package {  
    
	//flash engine 
	import flash.utils.*;  
	import flash.display.Sprite;  
    import flash.events.*;
	import flash.ui.*;
   
    //wow engine    
    import fr.seraf.wow.primitive.*; 
    import fr.seraf.wow.core.WOWEngine;  
    import fr.seraf.wow.core.data.WVector;  
        
	//sandy engine	 
    import sandy.core.Scene3D;
    import sandy.core.data.*;
    import sandy.core.scenegraph.*;
    import sandy.materials.*;
    import sandy.materials.attributes.*;
    import sandy.primitive.*;
		
		
		public class Example030 extends Sprite {  
        private var wow:WOWEngine;  
		private var sphere01:WSphere;
		private var bound:WBoundArea;
		
		private var sphereS:Sphere;
		private var cube:Box;
		private var scene:Scene3D;
	    private var camera:Camera3D;
	  
           public function Example030() {  
     
               //create an instance of the physic engine    
               wow=new WOWEngine();  
               // SELECTIVE is better for dealing with lots of little particles colliding,    
               wow.collisionResponseMode = wow.SELECTIVE;  
               // gravity -- particles of varying masses are affected the same    
               wow.addMasslessForce(new WVector(0,2,0));  
               //create a sphere    
               sphere01 = new WSphere(0,0,0,25,false,1,1,1);   
               sphere01.elasticity=1;  
			   sphere01.friction=0; 
			   sphere01.py = -150;
			   wow.addParticle(sphere01); 
			   
			   bound = new WBoundArea(190,200,190);  
			   bound.setPosition(0,0,0);  
			   bound.elasticity=1;  
			   bound.friction=0;  
			   wow.setBoundArea(bound);  
			   
			   // Sandy code
			   camera = new Camera3D( 600, 600 );
		       camera.z = -400;
			   var root:Group = createScene();
			   scene = new Scene3D( "scene", this, camera, root );
			  
			  stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressedHandler);
			  stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMovedHandler);
			  addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			  
           }  
		   
		  private function createScene():Group
          {
          // Create the root Group
          var g:Group = new Group();
		 
          // Create a cube so we have something to show
          sphereS = new Sphere( "theSphere", 25,10,10);
		  var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
				)
		  var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
		  material.lightingEnable = true;
		  var app:Appearance = new Appearance( material );
		  sphereS.appearance = app;
		  sphereS.useSingleContainer = false;
		  
		  sphereS.x = 0;
		  sphereS.y = 150;
		  sphereS.z = 0;
		 
		  // the box
		  cube = new Box( "theBox", 200, 200, 180, PrimitiveMode.QUAD, 1 );
		  cube.enableBackFaceCulling = false;
		  cube.useSingleContainer = false;
		  
		   // We need to add the cube to the group
		   g.addChild( sphereS );
		   g.addChild(cube);
          
		   return g;
          }
		   
		  
		private function mouseMovedHandler(event:MouseEvent):void {
           cube.rotateZ=(600/2-event.stageX)/15;
		   cube.rotateX=(600/2-event.stageY)/15;
		   bound.setRotation (-(600/2-event.stageY)/15,0,-(600/2-event.stageX)/15);
        }	
		  
		  private function keyPressedHandler(event:KeyboardEvent):void {
            switch(event.keyCode) {
				case Keyboard.SPACE:
				 sphereS.x = 0;
		         sphereS.y = 150;
		         sphereS.z = 0;
				 sphere01.px = 0;
				 sphere01.py = -150;
				 sphere01.pz = 0;
			     break;
			}
		  }
		  
		  private function enterFrameHandler( event : Event ):void {  
             //run the engine once  
             wow.step()
			 //get the position 
			 sphereS.x = sphere01.px;
			 sphereS.y = -sphere01.py;
			 sphereS.z = sphere01.pz;
			 scene.render();
         }  
		   
		   
       }  
   }  

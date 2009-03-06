package
{
	//{ pacakges
	import darkaif.core.collision.CollisionBox;
	import darkaif.core.node.NodePoint3DVertex;
	import darkaif.entities.ObjectBot;
	import darkaif.entities.Objectmesh;
	import flash.display.Sprite; 
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
	
	public class SandyPlanePositionPath extends Sprite {
		
		//{variables
		private var scene:Scene3D;
		private var camera:Camera3D;
		private var tg:TransformGroup;
		public var g:Group = new Group();
		public var box:Box = new Box("boxshape", 16, 16, 16);
		public var movex:Number = 0;
		public var movey:Number = 0;
		public var movez:Number = 0;
		public var numberobjects:int = 10;
		public var objectmodel:Array = new Array();
		public var player:ObjectBot = new ObjectBot();
		public var pathcounter:int = 0;
		
		//}
		
		/**
		 * @author Darknet
		 * 
		 * Information: positon off set need to fixed. For path.
		 */
		
		public function SandyPlanePositionPath() { 
			// We create the camera
			camera = new Camera3D( 300, 300 );
			camera.z = -400;
			camera.y = 300;
			camera.lookAt(0, 0, 0);
			camera.near = 0;
			
			player.model = new Box("boxshape", 16, 16, 16);
			var collisiomesh:CollisionBox = new CollisionBox();
			player.boxcollision.push(collisiomesh);
			g.addChild(player.model);
		 
			// We create the "group" that is the tree of all the visible objects
			var root:Group = createScene();
		 
			// We create a Scene and we add the camera and the objects tree 
			scene = new Scene3D( "scene", this, camera, root );
			
			// Listen to the heart beat and render the scene
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			buildobjectmesh();
		 
		}
		
		public function buildobjectmesh():void {
			for (var objectno:int = 0; objectno < numberobjects; objectno++) {
				var mesh:Objectmesh = new Objectmesh();
				var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
				);
				var material01:Material = new ColorMaterial( 0x00CC3F, 1, materialAttr );
				material01.lightingEnable = false;
				var app01:Appearance = new Appearance( material01 );
				
				mesh.model = new Box("collisionbox", 16, 16, 16);
				mesh.model.x = 100 - Math.floor(Math.random() * 200);
				mesh.model.z = 100 - Math.floor(Math.random() * 200);
				mesh.model.appearance = app01;
				var collisiomesh:CollisionBox = new CollisionBox();
				mesh.boxcollision.push(collisiomesh);
				mesh.model.useSingleContainer = false;
				//trace(Math.floor(Math.random() * -200  + Math.random() * 200));
				//trace(">" + Math.floor(Math.random() * 2  ));
				g.addChild(mesh.model);
				objectmodel.push(mesh);
			}
		}
		
		public function collisionupdate():void {
			//trace("--");
			for (var objectmeshno:int = 0; objectmeshno < objectmodel.length;objectmeshno++ ) {
				if (player.objectbox(objectmodel[objectmeshno])) {
					player.bpathcollision = true;
					//break;
					//trace("collision");
					//trace(player.bcollision + "::");
				}else {
					player.bpathcollision = false;
				}
			}
		}
		
		// Create the scene graph based on the root Group of the scene
		private function createScene():Group{
			// We need to create a transformGroup
			tg = new TransformGroup('myGroup');
		 
			var bottom:Shape3D = new Plane3D('bottom', 300, 300, 10, 10,Plane3D.ZX_ALIGNED,'quad');
			//bottom.moveForward(50);
			//bottom.moveUpwards(-50);
		 
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
				new LineAttributes( 0.5, 0x2111BB, 0.4 ),
				new LightAttributes( true, 0.1)
			);
			
			var material01:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			material01.lightingEnable = false;
			var app01:Appearance = new Appearance( material01 );
			bottom.enableBackFaceCulling = false;
			bottom.appearance = app01;
	     
			bottom.useSingleContainer = false;
			box.useSingleContainer = false;
			box.enableBackFaceCulling = false;
			//g.addChild(box);
		 
			// let's enable events
			bottom.enableEvents = true;
			bottom.addEventListener( MouseEvent.CLICK, onClickOne );
			//bottom.roll = -5;
			//bottom.tilt = -5;
			//bottom.pan = 5;
			
			tg.addChild(bottom);
			// we now add all the object to the root group:
			g.addChild(tg);
			
			return g;
		}
		
		// CallBack function fot the cube
		private function onClickOne( p_eEvent:Shape3DEvent ):void{
            var v:Point3D = p_eEvent.point;
			//var top:Point3D = p_eEvent.polygon.normal.getPoint3D().clone();
			//top.scale( 20 );
            //top.add( v );
			//trace(v.x + "[-]" + v.y + "[-]" + v.z);
			//movex = v.x;
			//movey = v.y;
			//movez = v.z;
			pathcounter++;
			//player.targetposition.point(v.x, v.y, v.z);
			
			//var newpath:NodePoint3DVertex = new NodePoint3DVertex();
			//newpath.id = pathcounter;
			//newpath.parentid = 0;
			//newpath.x = v.x;
			//newpath.y = v.y;
			//newpath.z = v.z;
			
			player.nodepoint.setstart(player.posx, player.posy, player.posz);//set current object position
			player.nodepoint.setend(v.x,v.y,v.z);//set position in the plane position to set it.
			//player.nodepoint.setstart(0, 0, -64);
			//player.nodepoint.setend(64,0,128);
			//player.nodepoint.endx = v.x;
			//player.nodepoint.endy = v.y;
			//player.nodepoint.endz = v.z;
			
			//player.nodepoint.startx = player.posx
			
			//path.push(newpath);
			//player.path.push(newpath); //execute move point array     
			trace("click to move...");
        }
		
		// The Event.ENTER_FRAME event handler tells the world to render
		private function enterFrameHandler( event : Event ) : void{
			scene.render();
			collisionupdate();
			player.update();
		}
		
		// controls basic
		private function keyPressed(event:KeyboardEvent):void {
            switch(event.keyCode) {
				case Keyboard.UP:
					tg.tilt +=2;
					break;
				case Keyboard.DOWN:
					tg.tilt -=2;
					break;
				case Keyboard.RIGHT:
					tg.pan +=2;
					break;
				case Keyboard.LEFT:
					tg.pan -=2;
					break;
			}
        }
	}
}

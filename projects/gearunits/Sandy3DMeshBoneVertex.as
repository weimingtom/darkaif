﻿package  
{
	//{
	import darknet.core.display.DropBoxList;
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.DropBoxEvent;
	import darknet.core.event.NumericUpDownEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import sandy.core.data.Matrix4;
	import sandy.core.data.Point3D;
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Camera3D;
	import sandy.core.scenegraph.Group;
	import sandy.core.scenegraph.Shape3D;
	import sandy.materials.Appearance;
	import sandy.materials.attributes.LightAttributes;
	import sandy.materials.attributes.LineAttributes;
	import sandy.materials.attributes.MaterialAttributes;
	import sandy.materials.ColorMaterial;
	import sandy.materials.Material;
	import sandy.math.Matrix4Math;
	import sandy.primitive.Box;
	//}
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	[SWF(width="300", height="300", backgroundColor="#FFFFFF", frameRate="30")]
	public class Sandy3DMeshBoneVertex extends Sprite{
		//{
		//sandy engine
		public var scene:Scene3D; // just one scene or the world
		public var camera:Camera3D; //basic one cam
		public var g:Group = new Group("myGroup");
		public var bonetest:Sandy3DBoneVertexTest = new Sandy3DBoneVertexTest();
		
		public var bonelistpanel:DropBoxList = new DropBoxList();
		public var bonename:String = '';
		
		public var buttonrotx:NumericUpDown = new NumericUpDown();
		public var buttonroty:NumericUpDown = new NumericUpDown();
		public var buttonrotz:NumericUpDown = new NumericUpDown();
		
		public var bone1:Box = new Box('bone1',1,1,1);
		public var bone2:Box = new Box('bone2',1,1,1);
		
		//}
		
		public function Sandy3DMeshBoneVertex() {
			//{
			camera = new Camera3D(300,300);
			camera.y = 20;
			camera.z = -20;
			camera.lookAt(0, 0, 0);
			camera.near = 0;
			var root:Group = g;
			scene = new Scene3D( "scene", this, camera, root );
			
			addEventListener( Event.ENTER_FRAME, enterFrameHandler );
			
			var materialAttr:MaterialAttributes = new MaterialAttributes( 
            new LineAttributes( 0.5, 0x2111BB, 0.4 ),
            new LightAttributes( true, 0.1)
            );
			
			var material:Material = new ColorMaterial( 0xFFCC33, 1, materialAttr );
			//trace(material.attributes);
			material.lightingEnable = true;
			var app:Appearance = new Appearance( material );
			
			g.addChild(bonetest); 
			//}
			
			
			
			bonemenu();
			//bonetest.appearance = app;
			
			var bonearray:Array = bonetest.bonelist();
			bone1.x = bonearray[0].x;
			bone1.y = bonearray[0].y;
			bone1.z = bonearray[0].z;
			
			bone2.x = bonearray[1].x;
			bone2.y = bonearray[1].y;
			bone2.z = bonearray[1].z;
			
			
			g.addChild(bone1);
			g.addChild(bone2);
		}
		
		public function bonemenu():void {
			bonelistpanel.addlist({name:'bone1',id:'bone1'});
			bonelistpanel.addlist( { name:'bone2', id:'bone2' } );
			
			bonelistpanel.addEventListener(DropBoxEvent.SELECT, selectbone);
			
			function selectbone(event:DropBoxEvent):void {
				bonename = event.selectname;
				
				var rpoint:Point3D = bonetest.bonerotation(bonename);
				//set rotation
				buttonrotx.valuenumber = rpoint.x;
				buttonroty.valuenumber = rpoint.y;
				buttonrotz.valuenumber = rpoint.z;
				trace(bonename);
			}
			
			buttonrotx.x = 0;
			buttonrotx.y = 14;
			buttonrotx.addEventListener(NumericUpDownEvent.VALUE, rotx);
			buttonrotx.addEventListener(NumericUpDownEvent.ENTER, rotx);
			function rotx(event:NumericUpDownEvent):void {
				//trace('rotx'+event.numberchange);
				bonetest._bone( { name:bonename,rotx:event.numberchange} );
			}
			
			buttonroty.x = 0;
			buttonroty.y = 14*2;
			buttonroty.addEventListener(NumericUpDownEvent.VALUE, roty);
			buttonroty.addEventListener(NumericUpDownEvent.ENTER, roty);
			function roty(event:NumericUpDownEvent):void {
				//trace('roty'+event.numberchange);
				bonetest._bone( { name:bonename,roty:event.numberchange} );
			}
			
			buttonrotz.x = 0;
			buttonrotz.y = 14*3;
			buttonrotz.addEventListener(NumericUpDownEvent.VALUE, rotz);
			buttonrotz.addEventListener(NumericUpDownEvent.ENTER, rotz);
			function rotz(event:NumericUpDownEvent):void {
				//trace('rotz'+event.numberchange);
				bonetest._bone( { name:bonename,rotz:event.numberchange} );
			}
			
			addChild(buttonrotx);
			addChild(buttonroty);
			addChild(buttonrotz);
			addChild(bonelistpanel);
		}
		
		// This update the code and the function when every frame is pass
		private function enterFrameHandler( event : Event ) : void {
			/*
			bonetest.x += 0.1;
			if (bonetest.x >= 10) {
				bonetest.x = -10;
			}
			*/
			
			var bonearray:Array = bonetest.bonelist();
			bone1.x = bonearray[0].x;
			bone1.y = bonearray[0].y;
			bone1.z = bonearray[0].z;
			
			bone2.x = bonearray[1].x;
			bone2.y = bonearray[1].y;
			bone2.z = bonearray[1].z;
			
			scene.render();
		}
	}
}
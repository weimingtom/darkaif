package 
{
	//{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import gearunits.models.PPlane;
	import org.jloa.display.ResourceMonitor;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.math.Number3D;
	import org.papervision3d.core.math.Plane3D;
	import org.papervision3d.core.proto.CameraObject3D;
	import org.papervision3d.core.utils.Mouse3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.view.BasicView;
	import org.papervision3d.view.Viewport3D;
	
	import darknet.core.display.DropBoxList;
	import darknet.core.display.NumericUpDown;
	import darknet.core.event.DropBoxEvent;
	import darknet.core.event.NumericUpDownEvent;
	//}
	
	/**
	 * @author Darknet
	 * 
	 * Information:
	 * 
	 * Note: This is being port from away3d and sandy.
	 * 
	 */
	[SWF(width="800", height="600", backgroundColor="#FFFFFF", frameRate="30")]
	public class Papervision3DMeshBoneVertex extends BasicView
	{
		//{
		//PAPERVISION
		private var mouse3D:Mouse3D;
		private var pivotPoint:DisplayObject3D = new DisplayObject3D();
		
		public var bonetest:Papervision3DBoneVertexTest;
		
		public var bonelistpanel:DropBoxList = new DropBoxList();
		public var bonename:String = '';
		
		public var buttonrotx:NumericUpDown = new NumericUpDown();
		public var buttonroty:NumericUpDown = new NumericUpDown();
		public var buttonrotz:NumericUpDown = new NumericUpDown();
		//}
		
		public function Papervision3DMeshBoneVertex() {
			Mouse3D.enabled = true;
			viewport.interactive = true;
			mouse3D = viewport.interactiveSceneManager.mouse3D;
			camera.z = -30;
			camera.y = 30;
			
			init_objects();
			bonemenu();
			startRendering();
		}
		
		public function init_objects():void {
			var wireMaterial:WireframeMaterial = new WireframeMaterial(0x999999);
			var matlib:MaterialsList = new MaterialsList( { all:wireMaterial } );
			
			bonetest = new Papervision3DBoneVertexTest(wireMaterial);
			scene.addChild(bonetest);
		}
		
		public function bonemenu():void {
			bonelistpanel.addlist({name:'bone1',id:'bone1'});
			bonelistpanel.addlist( { name:'bone2', id:'bone2' } );
			
			bonelistpanel.addEventListener(DropBoxEvent.SELECT, selectbone);
			
			function selectbone(event:DropBoxEvent):void {
				bonename = event.selectname;
				
				var rpoint:Number3D = bonetest.bonerotation(bonename);
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
		
		//{ KEY BOARD FUNCTIONS
		public function keypressdown(key:KeyboardEvent):void {
			
			if (key.keyCode == 37) {//left
				camera.x -= 10;
			}
			if (key.keyCode == 39) {//right
				camera.x += 10;
			}
			if (key.keyCode == 40) {//down
				camera.z -= 10;
			}
			if (key.keyCode == 38) {//up
				camera.z += 10;
			}
			
		}
		
		public function keyupevent(key:KeyboardEvent):void {
			
		}
		//}
		
		override protected function onRenderTick(event:Event = null):void {
			super.onRenderTick(event);
		}
	}
}
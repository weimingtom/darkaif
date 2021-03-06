﻿package
{
	import flash.events.Event;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.objects.parsers.Ase;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.objects.parsers.Max3DS;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Clone not working
	 * papervision3d 2.0
	 */
 
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class Papervision3DMesh3DSClone extends BasicView
	{
		public var triangleMesh3d:Max3DS;
		
		public function Papervision3DMesh3DSClone()
		{
			//var material:ColorMaterial = new ColorMaterial(0xcc0000);
			//material.doubleSided = true;
			triangleMesh3d = new Max3DS();
			triangleMesh3d.load("data/models/cubestar.3ds");
			triangleMesh3d.scale = 100;
			triangleMesh3d.addEventListener(FileLoadEvent.LOAD_COMPLETE, fileloaded);
			scene.addChild(triangleMesh3d);
			
			function fileloaded(event:FileLoadEvent):void {
				trace('loaded...');
				var triangleMesh3d2:TriangleMesh3D = triangleMesh3d.clone() as TriangleMesh3D;
				triangleMesh3d2.x = 32;
				//triangleMesh3d2.scale = 100;
				scene.addChild(triangleMesh3d2);
			}
			
			startRendering();
		}
		
		override protected function onRenderTick(event:Event=null):void
		{
			triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}
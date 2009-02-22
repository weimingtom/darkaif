﻿package
{
	import flash.events.Event;
	import org.papervision3d.objects.parsers.DAE;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
	
	/*
	 * Works
	 */
 
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class DAEMesh extends BasicView
	{
		public var triangleMesh3d:DAE = new DAE(false,"mesh", false);
		public function DAEMesh()
		{	
			triangleMesh3d.load("cubeobj.dae");
			triangleMesh3d.scale = 100;
			
			scene.addChild(triangleMesh3d);
			startRendering();
		}
 
		override protected function onRenderTick(event:Event=null):void
		{
			triangleMesh3d.rotationY = -viewport.containerSprite.mouseX / 2;
			super.onRenderTick(event);
		}
	}
}
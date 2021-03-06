﻿package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.objects.primitives.Plane;
 
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.core.geom.renderables.Triangle3D;
	import org.papervision3d.core.geom.renderables.Vertex3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.view.BasicView;
 
	[SWF(width="640", height="480", backgroundColor="#000000", frameRate="60")]
	public class Papervision3DPlaneTextureLoader extends BasicView
	{
		private var triangleMesh3d:TriangleMesh3D;
 
		public function Papervision3DPlaneTextureLoader()
		{
			triangleMesh3d = new Plane(null, 1000, 1000);
			
			
			var request:URLRequest = new URLRequest();
			request.url = "http://localhost/darkaif/data/images/color16x16.jpg";
			
			var loader:Loader = new Loader();
			loader.load(request);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageloaded);
			
			function imageloaded(event:Event):void {
				var bitmap:Bitmap = event.target.content as Bitmap;
				var bitmaterial:BitmapMaterial = new BitmapMaterial(bitmap.bitmapData);
				bitmaterial.doubleSided = true;
				bitmaterial.precise = true;
				triangleMesh3d.material = bitmaterial;
			}
			
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
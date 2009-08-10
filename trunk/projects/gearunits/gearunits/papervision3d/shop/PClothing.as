package gearunits.papervision3d.shop 
{
	import adobe.utils.CustomActions;
	import away3d.containers.View3D;
	import away3d.core.base.Mesh;
	import away3d.core.base.Object3D;
	import away3d.core.math.Number3D;
	import away3d.events.Loader3DEvent;
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.events.FileLoadEvent;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.scenes.Scene3D;
	//import away3d.events.LoaderEvent;
	import away3d.loaders.Ase;
	import away3d.loaders.Loader3D;
	//import away3d.loaders.Object3DLoader;//3.3
	import away3d.materials.ColorMaterial;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PClothing 
	{
		public static var scene:Scene3D;
		
		public static var ID:int = 0;
		public var id:int = 0;
		public var bodyid:int = 0;
		public var name:String = "";
		public var bloaded:Boolean = false;
		public var btextureloaded:Boolean = false;
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var weartype:String = "";
		public var type:String = "";
		
		public var rotate:Number3D = new Number3D();
		public var offset:Number3D = new Number3D();
		
		public var mesh:DisplayObject3D;
		public var meshloader:TriangleMesh3D;
		
		public var texture:Vector.<PTexture> = new Vector.<PTexture>();
		
		public function PClothing() {
			ID++;
			id = ID;
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
		}
		
		public function load(shapemesh:TriangleMesh3D):void {
			meshloader = shapemesh;
			meshloader.addEventListener(FileLoadEvent.LOAD_COMPLETE,finishload);
			//scene.addChild(meshloader);
		}
		
		public function finishload(event:FileLoadEvent):void {
			trace('Mesh load finish');
			bloaded = true;
		}
		
	}
}
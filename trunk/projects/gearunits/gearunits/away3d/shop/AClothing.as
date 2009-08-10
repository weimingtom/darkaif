package gearunits.away3d.shop 
{
	import adobe.utils.CustomActions;
	import away3d.containers.View3D;
	import away3d.core.base.Mesh;
	import away3d.core.base.Object3D;
	import away3d.core.math.Number3D;
	import away3d.events.Loader3DEvent;
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
	public class AClothing 
	{
		public static var view:View3D;
		
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
		
		public var mesh:Object3D;
		public var meshloader:Loader3D;
		
		public var texture:Vector.<ATexture> = new Vector.<ATexture>();
		
		public function AClothing() {
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
		
		public function load(shapemesh:Loader3D):void {
			meshloader = shapemesh;
			//view.scene.addChild(meshloader);
			meshloader.scale(0.01);
			meshloader.addEventListener(Loader3DEvent.LOAD_SUCCESS, objOnSuccess);
			trace(meshloader.url)
		}
		
		public function objOnSuccess(e:Loader3DEvent):void {
			bloaded = true;
			//meshloader.handle
			trace("Mesh loaded");
		}
		
	}
	
}
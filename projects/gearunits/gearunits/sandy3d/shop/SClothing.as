package gearunits.sandy3d.shop 
{
	import flash.events.Event;
	import sandy.core.data.Point3D;
	import sandy.core.Scene3D;
	import sandy.core.scenegraph.Shape3D;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SClothing 
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
		
		public var rotate:Point3D = new Point3D();
		public var offset:Point3D = new Point3D();
		
		public var mesh:Shape3D;
		public var meshloader:Shape3D;
		
		public var texture:Vector.<STexture> = new Vector.<STexture>();
		
		public function SClothing() {
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
		
		public function load(shapemesh:Shape3D):void {
			meshloader = shapemesh;
			//meshloader.addEventListener(FileLoadEvent.LOAD_COMPLETE,finishload);
			//scene.addChild(meshloader);
		}
		
		/*
		public function finishload(event:FileLoadEvent):void {
			trace('Mesh load finish');
			bloaded = true;
		}
		*/
		
	}
}
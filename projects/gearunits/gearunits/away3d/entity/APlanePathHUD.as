package gearunits.away3d.entity 
{
	import away3d.containers.View3D;
	import away3d.core.base.Object3D;
	import away3d.loaders.utils.MaterialLibrary;
	import away3d.materials.MovieMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Plane;
	import gearunits.core.display.NodePathHUD;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class APlanePathHUD
	{
		public static var view:View3D; //global var class
		public var mesh:Plane = new Plane({height:32,width:32,depth:32});
		public var pathhud:NodePathHUD = new NodePathHUD();
		public var bused:Boolean = false;
		
		public function APlanePathHUD() 
		{
			var mat:MovieMaterial = new  MovieMaterial(pathhud);
			//var matlib:MaterialLibrary = new MaterialLibrary();
			//matlib.addMaterial(mat);
			mesh.material = mat;
		}
		
		public function update():void {
			/*
			if (mesh != null) {
				mesh.x = 
			}
			*/
		}
		
	}
	
}
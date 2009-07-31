package {
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class PUnitBlock {
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		public var mesh:TriangleMesh3D;
		public var onlineid:String = '';
		
		public function PUnitBlock() {
			
			var matcolor:ColorMaterial =  new ColorMaterial(0x00CC00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			var matlist:MaterialsList = new MaterialsList( { all:compMat } );
			mesh = new Cube(matlist, 32, 32, 32);
		}
		
		public function update():void {
			if (mesh != null) {
				mesh.x = x;
				mesh.y = y;
				mesh.z = z;
			}
		}
	}
}
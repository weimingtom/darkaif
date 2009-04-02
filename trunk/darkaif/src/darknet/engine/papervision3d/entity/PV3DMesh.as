package darknet.engine.papervision3d.entity 
{
	
	import org.papervision3d.core.geom.TriangleMesh3D;
	import org.papervision3d.objects.parsers.Ase;
	import org.papervision3d.objects.parsers.MD2;
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class PV3DMesh extends PV3DEntity
	{
		
		public var modelase:Ase = null; //just mesh
		public var modelmd2:MD2 = null; //animation mesh
		public var model:TriangleMesh3D = null;
		
		public function PV3DMesh() 
		{
			
		}
		
		public function objectxml():XML {
			var xml:XML = <mesh/>;
			
			return xml;
		}
		
	}
	
}
package gearunits.papervision3d.entity.projectile 
{
	import gearunits.models.PPlane;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PProjectileBullet extends PProjectile
	{
		public static const NAME:String = 'PProjectileBullet';
		
		public function PProjectileBullet() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFFFF);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			name = 'Bullet';
			mesh = new PPlane(compMat);
			speed = 1;
			maxdistance = 100;
		}
		
	}
	
}
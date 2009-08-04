package gearunits.papervision3d.entity.weapon 
{
	import gearunits.models.PMeshBaseLauncher;
	import gearunits.papervision3d.entity.projectile.PProjectile;
	import gearunits.papervision3d.entity.projectile.PProjectileBullet;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PWeaponBaseRocket extends PWeaponBaseLauncher
	{
		
		public function PWeaponBaseRocket() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			mesh = new PMeshBaseLauncher(compMat);
			
			name = 'PWeaponBaseRocket';
			timemax = 10;
			detectrange = 128;
			//TurnSpeed = 5;
			
			var projetileammo:PProjectile;
			projetileammo = new PProjectileBullet();
			projetileammo.damage = 10;
			projetileammo.speed = 3;
			
			//firepoint.z = 18;
			offsetlengthfire = 32;
			projectile.push(projetileammo);
		}
		
	}
	
}
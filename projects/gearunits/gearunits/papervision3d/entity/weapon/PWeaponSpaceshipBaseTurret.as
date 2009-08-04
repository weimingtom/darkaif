package gearunits.papervision3d.entity.weapon 
{
	import gearunits.models.PMeshBaseTurret;
	import gearunits.papervision3d.entity.projectile.PProjectile;
	import gearunits.papervision3d.entity.projectile.PProjectileBullet;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PWeaponSpaceshipBaseTurret extends PWeaponTurret
	{
		
		public function PWeaponSpaceshipBaseTurret() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			mesh = new PMeshBaseTurret(compMat);
			
			name = 'PWeaponSpaceshipBaseTurret';
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
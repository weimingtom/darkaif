package gearunits.away3d.entity.weapon 
{
	import gearunits.away3d.entity.projectile.AProjectile;
	import gearunits.away3d.entity.projectile.AProjectileBullet;
	import gearunits.models.AMeshPanelLauncher;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AWeaponPanelRocket extends AWeaponPanelLauncher
	{
		
		public function AWeaponPanelRocket() 
		{
			mesh = new AMeshPanelLauncher();
			
			name = 'AWeaponPanelRocket';
			timemax = 10;
			detectrange = 128;
			//TurnSpeed = 5;
			
			var projetileammo:AProjectile;
			projetileammo = new AProjectileBullet();
			projetileammo.damage = 10;
			projetileammo.speed = 3;
			
			//firepoint.z = 18;
			offsetlengthfire = 32;
			projectile.push(projetileammo);
		}
		
		override public function update():void {
			super.update();
			if (mesh != null) {
				mesh.rotationY = objectangle.y + rotation.y;
			}
		}
		
	}
	
}
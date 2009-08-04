package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacecraftFedFighter;
	import gearunits.models.PMeshSpacecraftFedFighter_Box;
	import gearunits.papervision3d.entity.weapon.PWeapon;
	import gearunits.papervision3d.entity.weapon.PWeaponSpaceshipGun;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedFighter extends PSpaceshipFighter
	{
		public static const NAME:String = 'PSpaceshipFedFighter';
		
		public function PSpaceshipFedFighter() 
		{
			name = 'PSpaceshipFedFighter';
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			
			
			mesh = new PMeshSpacecraftFedFighter(compMat);
			collisionmesh = new PMeshSpacecraftFedFighter_Box(compMat);
			
			setbox(32, 32, 32);
			
			movespeed = 2;
			TurnSpeed = 5;
			spawntime = 10;
			
			
			var weap:PWeapon;
			weap = new PWeaponSpaceshipGun();
			//weap.z = 16;
			weap.offsetlengthfire = 16;
			weapon.push(weap);
		}
		
	}
	
}
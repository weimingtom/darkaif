package gearunits.papervision3d.entity.spacecraft 
{
	import gearunits.models.PMeshSpacecraftFedBattleship;
	import gearunits.models.PMeshSpacecraftFedBattleship_Box;
	import gearunits.models.PMeshSpacecraftFedCarrier;
	import gearunits.papervision3d.entity.PEntityPoint3D;
	import gearunits.papervision3d.entity.weapon.PWeapon;
	import gearunits.papervision3d.entity.weapon.PWeaponBaseRocket;
	import gearunits.papervision3d.entity.weapon.PWeaponPanelRocket;
	import gearunits.papervision3d.entity.weapon.PWeaponSpaceshipBaseTurret;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedBattleship extends PSpaceshipBattleship
	{
		public static const NAME:String = 'PSpaceshipFedCarrier';
		
		public function PSpaceshipFedBattleship() 
		{
			var matcolor:ColorMaterial =  new ColorMaterial(0x0FFFF00);
			var matwirecolor:WireframeMaterial = new WireframeMaterial(0x000000);
			var compMat:CompositeMaterial = new CompositeMaterial();
			compMat.addMaterial(matcolor);
			compMat.addMaterial(matwirecolor);
			compMat.interactive = true;
			mesh = new PMeshSpacecraftFedBattleship(compMat);
			
			collisionmesh = new PMeshSpacecraftFedBattleship_Box(compMat);
			setbox(50,150,150);//set bounding box
			movespeed = 2;
			spawntime = 10;
			
			detectrange = 128;
			
			var weap:PWeapon;
			
			weap = new PWeaponSpaceshipBaseTurret();
			weap.y = 42;
			weap.z = 96;
			weap.bbot = true;
			weap.bturret = true;
			scene.addChild(weap.mesh);
			weapon.push(weap);
			
			/*
			weap = new AWeaponSpaceshipBaseTurret();
			weap.y = 64;
			weap.z = 0;
			weap.bbot = true;
			weap.rotation.y = 270;
			view.scene.addChild(weap.mesh);
			weapon.push(weap);
			*/
			
			weap = new PWeaponBaseRocket();
			weap.y = 32;
			weap.z = 0;
			weap.bbot = true;
			weap.rotation.y = 270;
			scene.addChild(weap.mesh);
			weapon.push(weap);
			
			weap = new PWeaponPanelRocket();
			weap.x = -42;
			weap.y = 0;
			weap.z = 0;
			weap.bbot = true;
			weap.rotation.y = 270;
			scene.addChild(weap.mesh);
			weapon.push(weap);
		}
	}
}
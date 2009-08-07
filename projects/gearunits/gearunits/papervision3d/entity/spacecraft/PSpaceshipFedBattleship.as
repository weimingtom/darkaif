package gearunits.papervision3d.entity.spacecraft 
{
	import flash.display.Bitmap;
	import gearunits.models.PMeshSpacecraftFedBattleship;
	import gearunits.models.PMeshSpacecraftFedBattleship_Box;
	import gearunits.models.PMeshSpacecraftFedCarrier;
	import gearunits.papervision3d.entity.PEntityPoint3D;
	import gearunits.papervision3d.entity.weapon.PWeapon;
	import gearunits.papervision3d.entity.weapon.PWeaponBaseRocket;
	import gearunits.papervision3d.entity.weapon.PWeaponPanelRocket;
	import gearunits.papervision3d.entity.weapon.PWeaponSpaceshipBaseTurret;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedBattleship extends PSpaceshipBattleship
	{
		[Embed(source = "../../../models/textures/SpaceshipFedBattleship01.png")]
		private var textskin:Class;
		public var BitTextSkin:Bitmap = new textskin();
		public static const NAME:String = 'PSpaceshipFedCarrier';
		
		public function PSpaceshipFedBattleship() 
		{
			MatTextOut = new BitmapMaterial(BitTextSkin.bitmapData);
			TexCom.addMaterial(MatTextOut);
			mesh = new PMeshSpacecraftFedBattleship(TexCom);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OVER, UnitObject_Over);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OUT, UnitObject_Out);
			
			collisionmesh = new PMeshSpacecraftFedBattleship_Box(TexCom);
			
			
			
			
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
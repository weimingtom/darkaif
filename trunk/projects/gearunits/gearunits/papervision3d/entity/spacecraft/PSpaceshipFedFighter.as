package gearunits.papervision3d.entity.spacecraft 
{
	import flash.display.Bitmap;
	import gearunits.models.PMeshSpacecraftFedFighter;
	import gearunits.models.PMeshSpacecraftFedFighter_Box;
	import gearunits.papervision3d.entity.weapon.PWeapon;
	import gearunits.papervision3d.entity.weapon.PWeaponSpaceshipGun;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedFighter extends PSpaceshipFighter
	{
		[Embed(source = "../../../models/textures/SpacecraftFedFighter01.png")]
		private var textskin:Class;
		public var BitTextSkin:Bitmap = new textskin();
		
		public static const NAME:String = 'PSpaceshipFedFighter';
		
		public function PSpaceshipFedFighter() 
		{
			name = 'PSpaceshipFedFighter';
			//skin texture
			MatTextOut = new BitmapMaterial(BitTextSkin.bitmapData);
			TexCom.addMaterial(MatTextOut);
			mesh = new PMeshSpacecraftFedFighter(TexCom);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OVER, UnitObject_Over);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OUT, UnitObject_Out);
			
			collisionmesh = new PMeshSpacecraftFedFighter_Box(TexCom);
			
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
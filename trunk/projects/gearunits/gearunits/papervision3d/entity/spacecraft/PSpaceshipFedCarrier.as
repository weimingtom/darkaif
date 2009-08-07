package gearunits.papervision3d.entity.spacecraft 
{
	import flash.display.Bitmap;
	import gearunits.models.PMeshSpacecraftFedBattleship;
	import gearunits.models.PMeshSpacecraftFedBattleship_Box;
	import gearunits.models.PMeshSpacecraftFedCarrier;
	import gearunits.models.PMeshSpacecraftFedCarrier_Box;
	import gearunits.papervision3d.entity.PEntityPoint3D;
	import org.papervision3d.events.InteractiveScene3DEvent;
	import org.papervision3d.materials.BitmapMaterial;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.special.CompositeMaterial;
	import org.papervision3d.materials.WireframeMaterial;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceshipFedCarrier extends PSpaceshipCarrier
	{
		[Embed(source = "../../../models/textures/SpaceshipFedCarrier01.png")]
		private var textskin:Class;
		public var BitTextSkin:Bitmap = new textskin();
		public static const NAME:String = 'PSpaceshipFedCarrier';
		
		public function PSpaceshipFedCarrier() 
		{
			/*
			MatTextOut = new BitmapMaterial(BitTextSkin.bitmapData);
			TexCom.addMaterial(MatTextOut);
			mesh = new PMeshSpacecraftFedBattleship(TexCom);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OVER, UnitObject_Over);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OUT, UnitObject_Out);
			
			collisionmesh = new PMeshSpacecraftFedBattleship_Box(TexCom);
			*/
			MatTextOut = new BitmapMaterial(BitTextSkin.bitmapData);
			TexCom.addMaterial(MatTextOut);
			mesh = new PMeshSpacecraftFedCarrier(TexCom);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OVER, UnitObject_Over);
			mesh.addEventListener(InteractiveScene3DEvent.OBJECT_OUT, UnitObject_Out);
			
			collisionmesh = new PMeshSpacecraftFedCarrier_Box(TexCom);
			
			
			movespeed = 2;
			spawntime = 10;
			
			/*
			var pointentity:PEntityPoint3D;
			pointentity = new PEntityPoint3D();
			pointentity.bexit = true;
			pointentity.z = 160;
			entityPoint.push(pointentity);
			*/
		}
		
	}
	
}
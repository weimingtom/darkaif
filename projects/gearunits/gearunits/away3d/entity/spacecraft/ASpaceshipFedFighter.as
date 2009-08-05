package gearunits.away3d.entity.spacecraft 
{
	import away3d.events.MouseEvent3D;
	import away3d.materials.BitmapMaterial;
	import away3d.materials.ColorMaterial;
	import away3d.materials.CompositeMaterial;
	import away3d.materials.ILayerMaterial;
	import away3d.materials.IMaterial;
	import flash.display.BitmapData;
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.entity.weapon.AWeaponSpaceshipGun;
	import gearunits.models.AMeshSpacecraftFedFighter;
	import gearunits.models.AMeshSpacecraftFedFighter_Box;
	import away3d.sprites.MovieClipSprite;
	import gearunits.away3d.display.AUnitIconHUD;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceshipFedFighter extends ASpaceshipFighter
	{
		
		public static const NAME:String = 'FedFighter';
		public static const TYPE:String = 'Spaceship';
		public var uniticon:AUnitIconHUD = new AUnitIconHUD();
		
		//public var colorData:BitmapData = new BitmapData(10, 10, false, 0xCC6699);
		//public var colorMat:ILayerMaterial = new BitmapMaterial(colorData, { alpha:0.5 } );
		
		public var BitTextOver:BitmapData = new BitmapData(10, 10, false, 0x363430);
		public var MatTextOver:ILayerMaterial = new BitmapMaterial(BitTextOver, { alpha:0.2 } );
		public var BitTextOut:BitmapData = new BitmapData(10, 10, false, 0xadff2f);
		public var MatTextOut:ILayerMaterial = new BitmapMaterial(BitTextOut, { alpha:1} );
		public var BitTextSelected:BitmapData = new BitmapData(10, 10, false, 0x363430);
		public var MatTextSelected:ILayerMaterial = new BitmapMaterial(BitTextSelected, { alpha:0.5 } );
		
		//public var Tex_Over:ColorMaterial = new ColorMaterial(0xbfbfbf);
		//public var Tex_Selected:ColorMaterial = new ColorMaterial(0x808080);
		//public var Tex_Out:ColorMaterial = new ColorMaterial(0x363430);
		//public var Tex:ColorMaterial = new ColorMaterial(0x008000);
		public var TexCom:CompositeMaterial = new CompositeMaterial();
		
		public function ASpaceshipFedFighter() {
			
			name = 'FedFighter';
			mesh = new AMeshSpacecraftFedFighter();
			mesh.name = name + '_' + id;
			collisionmesh = new AMeshSpacecraftFedFighter_Box();
			mesh.debugBoundingBox;
			mesh.addEventListener(MouseEvent3D.MOUSE_OVER, UnitObject_Over);
			mesh.addEventListener(MouseEvent3D.MOUSE_OUT, UnitObject_Out);
			movespeed = 4;
			TurnSpeed = 5;
			spawntime = 30;
			detectrange = 128;
			
			//mesh.debugbb = true;
			
			//trace(mesh.debugBoundingBox);
			
			setbox(32, 32, 32);
			/*
			min.x = -16;
			min.y = -16;
			min.z = -16;
			
			max.x = 16;
			max.y = 16;
			max.z = 16;
			*/
			
			var weap:AWeapon;
			weap = new AWeaponSpaceshipGun();
			//weap.z = 16;
			weap.offsetlengthfire = 16;
			weapon.push(weap);
			
			uniticon.text = name;
			uniticon.setbar(6, 32);
			iconhud = new MovieClipSprite(uniticon);
			iconhud.name = 'iconhud' + '_' + id;
		}
		
		override public function update():void {
			super.update();
			//update position and health
			if (iconhud != null) {
				uniticon.percent = health / healthmax;
				iconhud.y = y - 32;
			}
		}
		
		public function UnitObject_Over(event:MouseEvent3D):void {
			TexCom.addMaterial(MatTextOut);
			TexCom.addMaterial(MatTextOver);
			TexCom.removeMaterial(MatTextSelected);
			mesh.material = TexCom;
		}
		
		public function UnitObject_Out(event:MouseEvent3D = null):void {
			//TexCom.removeMaterial(MatTextOver);
			if (bselected == false) {
				TexCom.removeMaterial(MatTextSelected);
				TexCom.removeMaterial(MatTextOver);
				TexCom.addMaterial(MatTextOut);
				mesh.material = MatTextOut;
			}else {
				UnitObject_Selected();
			}
		}
		
		public function UnitObject_Selected(event:MouseEvent3D = null):void {
			TexCom.removeMaterial(MatTextOver);
			TexCom.addMaterial(MatTextOut);
			TexCom.addMaterial(MatTextSelected);
			//mesh.material = Tex_Out;
		}
	}
	
}
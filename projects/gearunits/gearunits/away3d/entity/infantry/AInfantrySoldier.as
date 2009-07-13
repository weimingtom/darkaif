package gearunits.away3d.entity.infantry 
{
	import away3d.primitives.Cube;
	import away3d.sprites.MovieClipSprite;
	import gearunits.away3d.display.AUnitIconHUD;
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.entity.weapon.AWeaponAssaultRifle;
	import gearunits.models.AMeshCharacterChbibi;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AInfantrySoldier extends AInfantry
	{
		public static const NAME:String = 'AInfantrySoldier';
		public static const TYPE:String = 'Infantry';
		public var uniticon:AUnitIconHUD = new AUnitIconHUD();
		
		public function AInfantrySoldier() 
		{
			name = 'Soldier';
			mesh = new Cube( { height:16, width:16, depth:16 } );
			//mesh  = new AMeshCharacterChbibi();
			spawntime = 10;
			movespeed = 2;
			
			var weap:AWeapon;
			weap = new AWeaponAssaultRifle();
			weapon.push(weap);
			
			//HUD
			//offset.y = 16;
			uniticon.text = name;
			uniticon.setbar(6, 32);
			iconhud = new MovieClipSprite(uniticon);
			
		}
		
		override public function update():void {
			super.update();
			
			if (iconhud != null) {
				uniticon.percent = health / healthmax;
				iconhud.y = y + 32;
			}
			
		}	
	}
}
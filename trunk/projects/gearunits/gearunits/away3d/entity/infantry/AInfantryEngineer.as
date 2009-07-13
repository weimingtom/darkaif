package gearunits.away3d.entity.infantry 
{
	import away3d.primitives.Cube;
	import away3d.sprites.MovieClipSprite;
	import gearunits.away3d.display.AUnitIconHUD;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class AInfantryEngineer extends AInfantry
	{
		public static const NAME:String = 'AInfantryEngineer';
		public static const TYPE:String = 'Infantry';
		public var uniticon:AUnitIconHUD = new AUnitIconHUD();
		
		public function AInfantryEngineer() 
		{
			name = 'Engineer';
			mesh = new Cube( { height:16, width:16, depth:16 } );
			spawntime = 10;
			movespeed = 2;
			
			uniticon.text = name;
			uniticon.setbar(6, 32);
			iconhud = new MovieClipSprite(uniticon);
		}
		
		override public function update():void {
			super.update();
			
			
			if (iconhud != null) {
				uniticon.percent = health / healthmax;
			}
			
			
			
		}	
		
	}
	
}
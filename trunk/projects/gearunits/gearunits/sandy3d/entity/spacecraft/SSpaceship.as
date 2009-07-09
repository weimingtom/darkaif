package gearunits.sandy3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SSpaceship extends SSpacecraft
	{
		/*
		 * main branch for ships
		 * 
		 * turrets
		 * missile
		 * tropedo
		 * laser cannaon
		 * 
		 */ 
		public function SSpaceship() 
		{
			bmovable = true;
			unittype.push({name:'spaceship'});
		}
		
		override public function update():void 
		{
			super.update();
			//trace('hello');
			mesh.rotateY = -angle;
		}
		
	}
	
}
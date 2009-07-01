package gearunits.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Spaceship extends Spacecraft
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
		public function Spaceship() 
		{
			unittype.push({name:'Spaceship'});
		}
		
		override public function update():void 
		{
			super.update();
			//trace('hello');
			mesh.rotateY = -angle;
		}
		
	}
	
}
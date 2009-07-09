package gearunits.away3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceshipFighter extends ASpaceship
	{
		
		public static const NAME:String = 'ASpaceshipFighter';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceshipFighter() 
		{
			type.push({name:'fighter'});
		}
		/*
		override public function update():void {
			super.update();
			//this make sure if the mesh doesn't give error
			if (mesh != null) {
				mesh.rotationY = angle;
			}
		}
		*/
		
	}
	
}
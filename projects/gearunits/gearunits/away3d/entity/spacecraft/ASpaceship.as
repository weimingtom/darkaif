package gearunits.away3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceship extends ASpacecraft
	{
		public static const NAME:String = 'ASpaceship';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceship() 
		{
			type.push({name:'spaceship'});
		}
		
		override public function update():void {
			super.update();
			//this make sure if the mesh doesn't give error
			if (mesh != null) {
				mesh.rotationY = angle;
			}
		}
	}
	
}
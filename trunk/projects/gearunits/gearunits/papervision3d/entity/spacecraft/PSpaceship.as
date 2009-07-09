package gearunits.papervision3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpaceship extends PSpacecraft
	{
		public static const NAME:String = 'PSpaceship';
		
		public function PSpaceship() 
		{
			type.push({name:'spaceship'});
		}
		
		override public function update():void {
			super.update();
			//trace(order+':'+x);
			
			//this make sure if the mesh doesn't give error
			if (mesh != null) {
				mesh.rotationY = angle;
			}
			
			//AI BUILD TEST
			if (order == 'move') {
				velocity.x = movespeed * Math.sin(angle* Math.PI / 180);
				velocity.z = movespeed * Math.cos(angle * Math.PI / 180);
				
				x += velocity.x;
				y += velocity.y;
				z += velocity.z;
				
				if ((x > movepoint.x-6) && (x < movepoint.x+6)&&(z > movepoint.z-6) && (z < movepoint.z+6) &&(distance < 15)) {
					order = 'none';
					//trace('finish move point');
				}else if ((x == movepoint.x)&&(y == movepoint.y)&&(z == movepoint.z)){
					order = 'none';
					//trace('hellloooo');
				}else{
					//angle = rotationpoint(movepoint);
				}
			}
		}
		
	}
	
}
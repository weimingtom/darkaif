package darknet.engine.sandy.entity 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SMonster extends SBot
	{
		
		public function SMonster() 
		{
			
		}
		
		//mosnter and position
		public function savemonstermap():XML {
			var objectxml:XML = <monster/>;
			
			var objectname:XML = <name/>;
			objectname.appendChild(name);
			objectxml.appendChild(objectname);
			
			var objectidhash:XML = <idhash/>;
			objectidhash.appendChild(idhash);
			objectxml.appendChild(objectidhash);
			
			var objectposition:XML = <position/>;
			var objectx:XML = <x/>;
			objectx.appendChild(x);
			objectposition.appendChild(objectx);
			var objecty:XML = <y/>;
			objecty.appendChild(y);
			objectposition.appendChild(objecty);
			var objectz:XML = <z/>;
			objectz.appendChild(z);
			objectposition.appendChild(objectz);
			objectxml.appendChild(objectposition);
			
			
			var objectrotation:XML = <rotation/>;
			var objectrotx:XML = <x/>;
			objectrotx.appendChild(rotation.x);
			objectrotation.appendChild(objectrotx);
			var objectroty:XML = <y/>;
			objectroty.appendChild(rotation.y);
			objectrotation.appendChild(objectroty);
			var objectrotz:XML = <z/>;
			objectrotz.appendChild(rotation.z);
			objectrotation.appendChild(objectrotz);
			objectxml.appendChild(objectrotation);
			
			return objectxml;
		}
		
	}
	
}
package darknet.core.collision 
{
	import darknet.core.geometry.Rotation;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class CollisionBox {
		
		public var height:Number = 0;
		public var length:Number = 0;
		public var width:Number = 0;
		
		public var y:Number = 0;
		public var x:Number = 0;
		public var z:Number = 0;
		
		public var scale:Number = 1;
		public var scalex:Number = 1;
		public var scaley:Number = 1;
		public var scalez:Number = 1;
		
		public var rotation:Rotation = new Rotation();
		
		public function CollisionBox() {
			
		}
		
		public function get minx():Number {
			return -(width / 2);
		}
		
		public function get miny():Number {
			return -(height / 2);
		}
		
		public function get minz():Number {
			return -(length / 2);
		}
		
		public function get maxx():Number {
			return (width / 2);
		}
		
		public function get maxy():Number {
			return (height / 2);
		}
		
		public function get maxz():Number {
			return (length / 2);
		}
		
		public function xmlconvertvar(xmldata:XML):void {
			scale = xmldata.scale;
			scalex = xmldata.scalex;
			scaley = xmldata.scaley;
			scalez = xmldata.scalez;
			
			height = xmldata.height;
			length = xmldata.length;
			width = xmldata.width;
			
			x = xmldata.position.x;
			y = xmldata.position.y;
			z = xmldata.position.z;
			
			rotation.x = xmldata.rotation.x;
			rotation.y = xmldata.rotation.y;
			rotation.z = xmldata.rotation.z;
		}
		
	}
	
}
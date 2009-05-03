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
		
		public function dataconvertxml():XML
		{
			var meshbox:XML = <box/>;
			//scale
			var meshscale:XML = <scale/>;
			meshscale.appendChild(scale);
			meshbox.appendChild(meshscale);
			var meshscalex:XML = <scalex/>;
			meshscalex.appendChild(scalex)
			meshbox.appendChild(meshscalex);
			var meshscaley:XML = <scaley/>;
			meshscaley.appendChild(scaley)
			meshbox.appendChild(meshscaley);
			var meshscalez:XML = <scalez/>;
			meshscalez.appendChild(scalez)
			meshbox.appendChild(meshscalez);
			
			//box size
			var meshheight:XML = <height/>;
			meshheight.appendChild(height)
			meshbox.appendChild(meshheight);
			var meshlength:XML = <length/>;
			meshlength.appendChild(length)
			meshbox.appendChild(meshlength);
			var meshwidth:XML = <width/>;
			meshwidth.appendChild(width)
			meshbox.appendChild(meshwidth);
			
			//position
			var meshposition:XML = <position/>;
			var meshposx:XML = <x/>;
			meshposx.appendChild(x)
			meshposition.appendChild(meshposx);
			var meshposy:XML = <y/>;
			meshposy.appendChild(y)
			meshposition.appendChild(meshposy);
			var meshposz:XML = <z/>;
			meshposz.appendChild(z)
			meshposition.appendChild(meshposz);
			meshbox.appendChild(meshposition);
			//rotation
			var meshrotation:XML = <rotation/>;
			var meshrotx:XML = <x/>;
			meshrotx.appendChild(rotation.x);
			meshrotation.appendChild(meshrotx);
			var meshroty:XML = <y/>;
			meshroty.appendChild(rotation.y);
			meshrotation.appendChild(meshroty);
			var meshrotz:XML = <z/>;
			meshrotz.appendChild(rotation.z);
			meshrotation.appendChild(meshrotz);
			meshbox.appendChild(meshrotation);
				
			return meshbox;
		}
		
	}
	
}
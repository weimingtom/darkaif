package darkaif.core.entity 
{
	
	/**
	 * ...
	 * @author @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	 */
	public class GameObject extends Entity
	{
		//{
		public var charactername:String = "";
		public var playername:String = ""; //player name and id
		
		public var status:Status = new Status();
		public var diffx:Number = 0;//it depend where it direction		
		public var diffy:Number = 0;//it depend where it direction
		public var diffz:Number = 0;//it depend where it direction
		
		public var olddirx:Number = 0; //
		public var olddiry:Number = 0; //
		public var olddirz:Number = 0; //
		
		public var dirx:Number = 0; //direction set follow
		public var diry:Number = 0; //direction set follow
		public var dirz:Number = 0; //direction set follow
		
		public var bclosecombat:Boolean = false; //close combar
		public var branagecombat:Boolean = false; //long combat
		
		//start where to spawn
		public var spawnposx:Number = 0; //spawn where last set from map data
		public var spawnposy:Number = 0; //spawn where last set from map data
		public var spawnposz:Number = 0; //spawn where last set from map data
		
		public var bcollision:Boolean = false; //to be able collision
		public var bcollisionx:Boolean = false;
		public var bcollisiony:Boolean = false;
		public var bcollisionz:Boolean = false;
		public var bdetectcollision:Boolean = false;
		
		public var bxmax:Boolean = false;
		public var bxmin:Boolean = false;
		public var bymax:Boolean = false;
		public var bymin:Boolean = false;
		public var bzmax:Boolean = false;
		public var bzmin:Boolean = false;
		
		public var bgroundcollision:Boolean = false;
		
		//JUMP Variables
		public var jumptime:Number = 0;
		public var jumptimemax:Number = 15;
		public var jumpcountmax:Number = 1;
		public var jumpcount:Number = 0;
		public var bfall:Boolean = false;
		public var falltime:Number = 0;
		public var falltimemax:Number = 15;
		
		public var bkeyjump:Boolean = false;
		public var bjump:Boolean = false;
		public var bground:Boolean = false;
		
		//control object attack
		public var attacktime:Number = 0;
		public var attacktimemax:Number = 10;
		public var attackdelaytime:Number = 0;
		public var attackdelaytimemax:Number = 10;
		public var battackstart:Boolean = false;
		public var battackend:Boolean = false;
		
		public var bstartdamage:Boolean = false;
		//}
		public function GameObject() 
		{
			
		}
		
		public override function update():void {
			super.update();
			
			if ((bkeyjump == true)&&(bjump == false)&&(bfall == false)) {
				bjump = true;
			}
			
			if (bjump) {
				//trace("jump")
				jumptime++;
				diry = 5;
				if (jumptime > jumptimemax) {
					jumptime = 0;
					bjump = false;
					bfall = true;
				}
			}
			
			if (bfall) {
				//trace("fall");
				falltime++;
				diry = 0;
				if(falltime > falltimemax){
					falltime = 0;
					bfall = false;
				}
			}
			
			//objectpositionupdate();
		}
		
		
		//{ set position 
		public function set setx(px:Number):void {
			spawnposx = px;
			posx = px;
		}
		
		public function set sety(py:Number):void {
			spawnposy = py;
			posy = py;
		}
		
		public function set setz(pz:Number):void {
			spawnposz = pz;
			posz = pz;
		}
		
		public function setpos(px:Number, py:Number, pz:Number):void {
			spawnposx = px;
			posx = px;
			spawnposy = py;
			posy = py;
			spawnposz = pz;
			posz = pz;
		}
		//}
			
	}
	
}
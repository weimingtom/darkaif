/**
* @mxmlc -source-path=C:\\Program Files\\FlashDevelop\\FirstRun\\Library\\AS3\\classes\\
*/
package darkaif.classes {
	/**
	* ...
	* @author Darknet
	* Copy Rights (c) http://darkaif.googlecode.com
	* 
	* Information: This will hold all the player, npc, monster and other character relation stats and arburte.
	*/
	//{
	import org.flashdevelop.utils.FlashConnect
	//}
	
	public class Character {
		public var ID:int = 0;
		public var IDHASH:String = '';
		public var name:String = 'Char_Name';
		public var gender:String = 'gender';
		public var job:String = '';
		public var level:int = 0;
		public var experiencepoint:Number = 0;
		public var body:Array = new Array();
		//player postion
		public var map_name:Number = 0;
		public var map_x:Number = 0;
		public var map_y:Number = 0;
		public var map_z:Number = 0;
		
		public function set Job(Num:String):void {
			this.job= Num;
		}
		public function get Job():String {
			return this.job;
		}
		
		public function set Level(Num:Number):void {
			this.level = Num;
		}
		public function get Level():Number {
			return this.level;
		}
		
		public function set Experiencepoint(Num:Number):void {
			this.experiencepoint = Num;
		}
		public function get Experiencepoint():Number {
			return this.experiencepoint;
		}
		
		public function set Map_name(Num:Number):void {
			this.map_name = Num;
		}
		public function get Map_name():Number {
			return this.map_name;
		}
		
		public function set Map_x(Num:Number):void {
			this.map_x = Num;
		}
		public function get Map_x():Number {
			return this.map_x;
		}
		
		public function set Map_y(Num:Number):void {
			this.map_y = Num;
		}
		public function get Map_y():Number {
			return this.map_y;
		}
		
		public function set Map_z(Num:Number):void {
			this.map_z = Num;
		}
		public function get Map_z():Number {
			return this.map_z;
		}

		//screen player status
		public var health:Number = 0;
		public var magic:Number = 0;
		public var stamina:Number = 0;
		
		public function set Health(Num:Number):void {
			this.health = Num;
		}
		public function get Health():Number {
			return this.health;
		}
		
		public function set Magic(Num:Number):void {
			this.magic = Num;
		}
		public function get Magic():Number {
			return this.magic;
		}
		
		public function set Stamina(Num:Number):void {
			this.stamina = Num;
		}
		public function get Stamina():Number {
			return this.stamina;
		}
		
		public var attack:Number = 0;
		public var defence:Number = 0;
		public var magic_attack:Number = 0;
		public var magic_defence:Number = 0;
		
		public function set Attack(Num:Number):void {
			this.attack = Num;
		}
		public function get Attack():Number {
			return this.attack;
		}
		
		public function set Defence(Num:Number):void {
			this.defence = Num;
		}
		public function get Defence():Number {
			return this.defence;
		}
		
		public function set Magic_attack(Num:Number):void {
			this.magic_attack = Num;
		}
		public function get Magic_attack():Number {
			return this.magic_attack;
		}
		
		public function set Magic_defence(Num:Number):void {
			this.magic_defence = Num;
		}
		public function get Magic_defence():Number {
			return this.magic_defence;
		}
		
		
		//{
		//screen player basic stats
		public var strength:Number = 0;
		public var dexterity:Number = 0;
		public var intelligence:Number = 0;
		public var agility:Number = 0;
		public var vitality:Number = 0;
		//public var stamina:Number = 0;
		//}
		
		public function set Strength(Num:Number):void {
			this.strength = Num;
		}
		public function get Strength():Number {
			return this.strength;
		}
		
		public function set Dexterity(Num:Number):void {
			this.dexterity = Num;
		}
		public function get Dexterity():Number {
			return this.dexterity;
		}
		
		public function set Intelligence(Num:Number):void {
			this.intelligence= Num;
		}
		public function get Intelligence():Number {
			return this.intelligence;
		}
		
		public function set Agility(Num:Number):void {
			this.agility = Num;
		}
		public function get Agility():Number {
			return this.agility;
		}
		
		public function set Vitality(Num:Number):void {
			this.vitality = Num;
		}
		public function get Vitality():Number {
			return this.vitality;
		}
		
		/*
		public var stats:Array = new Array(
		{'strength':'0' },
		{'dexterity':'0' },
		{'intelligence':'0' },
		{'agility':'0' },
		{'vitality':'0' }
		);

		public var status:Array = new Array(
		{'health':'0' },
		{'magic':'0' },
		{'stamina':'0' },
		{'attack':'0' },
		{'defence':'0' },
		{'magic_attack':'0' },
		{'magic_defence':'0' },
		{'condtion':'0' }
		);
		*/
		
		/**
		 * Health Point
		 * Magic Point
		 * Stamina Point
		 * Tactical Point
		 * Spirit Point
		 * 
		 * strength
		 * dexterity
		 * intelligence
		 * agility
		 * vitality
		 * 
		 * constitution
		 * Luck
		 * Spirit
		 * stamina
		 * 
		 */
		
		public function Character() {
			this.ID++;
		}
		
		public function set Name(Name:String):void {
			this.name = Name;
		}
		
		public function get Name():String {
			return this.name;
		}
		
		
	}
	
}

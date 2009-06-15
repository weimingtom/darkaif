﻿package gearunits.entity 
{
	import gearunits.entity.infantry.Infantry;
	import gearunits.entity.vehicle.Vehicle;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class Commander 
	{
		public var ranage:Number = 500;
		public var ownerid:String = 'none';
		public var name:String = 'none';
		public var bbot:Boolean = false;
		
		public var unit:Vector.<StructureUnit> = new Vector.<StructureUnit>();
		//public var vehicle:Vector.<Vehicle> = new Vector.<Vehicle>();
		
		public var allies:Vector.<Commander> = new Vector.<Commander>();
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		
		//{ //resource
		public var credits:Number = 0;
		public var money:Number = 0;
		public var cost:Number = 0;
		
		public var fuel:Number = 0;
		public var metal:Number = 0;
		public var crystal:Number = 0;
		
		public var gas:Number = 0;
		public var ore:Number = 0;
		
		public var commandpoint:Number = 0;
		public var commandpointmax:Number = 10;
		
		public var powerlevel:Number = 0;
		public var poweruse:Number = 0;
		public var powertotal:Number = 0;
		
		
		//}
		public function Commander() 
		{
			
		}
		
	}
	
}
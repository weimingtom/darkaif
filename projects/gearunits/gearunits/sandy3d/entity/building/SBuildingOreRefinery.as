﻿package gearunits.sandy3d.entity.building 
{
	import gearunits.models.SMeshBuildingOreRefinery;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class SBuildingOreRefinery extends SBuilding
	{
		//[Embed(source = "../../../system/icon/orerefinery_rts_icon32.jpg")]
		//private var buildingimage:Class;
		
		public function SBuildingOreRefinery() 
		{
			//buildingicon = new buildingimage();
			name = 'Ore Refinery';
			buildingtype = 'Ore Refinery';
			buildtime = 120;
			producetime = 100;
			mesh = new SMeshBuildingOreRefinery();
			poweruse = 2;
			//metal = 10;
			ore = 10
		}
		
	}
	
}
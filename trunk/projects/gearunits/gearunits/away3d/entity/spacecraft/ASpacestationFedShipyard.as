package gearunits.away3d.entity.spacecraft 
{
	import gearunits.away3d.entity.AEntityPoint3D;
	import gearunits.away3d.technologytree.ATechnologyTree;
	import gearunits.away3d.technologytree.ATechTreeFedCarrier;
	import gearunits.away3d.technologytree.ATechTreeFedFighter;
	import gearunits.models.AMeshSpacestationFedShipYard;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpacestationFedShipyard extends ASpacestationShipyard
	{
		public static const NAME:String = 'FedShipyard';
		public static const TYPE:String = 'Spacestation';
		
		public function ASpacestationFedShipyard() 
		{
			name = 'FedShipyard';
			mesh = new AMeshSpacestationFedShipYard();
			bsingleselect = true;
			
			var techbase:ATechnologyTree;
			techbase = new ATechTreeFedFighter();
			tech.push(techbase);
			techbase = new ATechTreeFedCarrier();
			tech.push(techbase);
			
			var pointentity:AEntityPoint3D;
			pointentity = new AEntityPoint3D();
			pointentity.bexit = true;
			entityPoint.push(pointentity);
		}
		
	}
	
}
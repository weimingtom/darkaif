package gearunits.papervision3d.entity.spacecraft 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class PSpacestationShipyard extends PSpacestation
	{
		public static const NAME:String = 'PSpacestationShipyard';
		
		public function PSpacestationShipyard() 
		{
			type.push( { name:'shipyard' } );
		}
		
	}
	
}
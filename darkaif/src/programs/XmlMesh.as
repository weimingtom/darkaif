package programs 
{
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class XmlMesh 
	{
		
		public function XmlMesh() 
		{
			var xml:XML = <data />;
			var objectlist:XML = '<object>';
			
			xml.appendChild(objectlist);
			trace(xml);
			
			
			
		}
		
	}
	
}
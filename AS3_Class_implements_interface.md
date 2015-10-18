IClass.as
```
package  
{
	public interface IClass 
	{
		function gethealth():Number;
	}
}
```

CObject.as
```
package  
{

	public class CObject implements IClass
	{
		public var health:Number = 100;
		public function gethealth():Number { return health; }
		
		public function CObject() 
		{
			
		}
	}
}
```

```
package 
{
	import flash.display.Sprite;
	
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			var myobject:CObject = new CObject();
			trace(myobject.gethealth());
		}
	}
}
```
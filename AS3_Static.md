
```
package  
{
	public class StaticTest 
	{
		public static var x:Number = 0;
		public function StaticTest() 
		{
			x++;
		}
		
		public function set gx(px:Number):void {
			x = px;
		}
		
		public function get gx():Number {
			return x;
		}
		
	}
	
}
```

```
var tmps:StaticTest  = new StaticTest();
trace(tmps.gx);
tmps  = new StaticTest();
trace(tmps.gx);
var tmps1:StaticTest  = new StaticTest();
trace(tmps1.gx);
```
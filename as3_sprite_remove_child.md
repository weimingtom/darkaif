# Information: #
> This depends on the methods. This method help clean up some menu reuse code for sprite.

```
package  
{
	import flash.display.Sprite;
	
	public class spritechild extends Sprite
	{
		public var bodypanel:Sprite = new Sprite();
		
		public function spritechild() 
		{
			var tmpsprite:Sprite = new Sprite();
			bodypanel.addChild(tmpsprite);
			
			trace(bodypanel.numChildren); //show number of sprite added //1
			while(bodypanel.numChildren){//make sure it all clean
			   for (var i:int = 0; i < bodypanel.numChildren; i++) {
				bodypanel.removeChildAt(i);
			   }
                        }
			
			trace(bodypanel.numChildren); //show number of sprite when remove //0
			
		}
		
	}
	
}

```
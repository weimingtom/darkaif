# Methods: #
> This it the basic way to remove the objects from the scene. That it all remove them all but you need to double buff a bit it some time skip them. But you need the camera to stay there. There are different methods removing the objects.

```
public var scene:Scene3D;
public var camera:Camera3D;
public var g:Group = new Group("myGroup");

var objectmesh:Array = g.children
for (var c:int = 0; c < objectmesh.length; c++) {
   //default there should be a camera (It should be number one (1) and not a letter l ='L')
   if (objectmove[c].name != '1') {)
      g.removeChildByName(objectmove[c].name);
   }
}
```

This type of code is for game stuff style for making maps and clearing the map from the scene. Since it objects are created in clone from loaded objects it increase by counter number and name as that. That all depends on the coding.
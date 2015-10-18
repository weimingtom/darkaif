# Artificial Intelligence #
Currently working on AI build test.

Following actions for AI think and do work:(may not be in order)
  * Check objects
  * If enemy attack conditions [random, AI will attack automatic, line of sight,etc]
  * If objects are collision recalculate the new point.
  * Follow and attack or give support.
  * Check query actions. Check do list that is important.
  * Check path is has path else error on give no action and check query.

Query Array:
  * Move to point
  * Attack Object(hate level)
  * Search pattern (look around attack if true)
  * Support other objects(jobs and duties)
  * Call help (help this object)

# AI Path: #
> Build a simple real time path. Class build self and add on to object and build collision.

Stage 01:
&lt;wiki:gadget url="http://darkaif.googlecode.com/svn/trunk/apps/SandyPointClickMoveDemo.xml" width="830" height="630" /&gt;

> Build a point and click move to point.

Stage 02:
&lt;wiki:gadget url="http://darkaif.googlecode.com/svn/trunk/apps/SandyFollowPathArray.xml" width="830" height="630" /&gt;

> Building the path with array to make follow in order. Testing out the sandy object if the path is correct it.

example:
```
			newpath = new NodePoint3DVertex();
			newpath.id = 0;
			newpath.parentid = 0;
			newpath.x = 100;
			newpath.y = 0;
			newpath.z = 100;
			path.push(newpath);
			
			newpath = new NodePoint3DVertex();
			newpath.id = 5;
			newpath.parentid = 0;
			newpath.x = -70;
			newpath.y = 0;
			newpath.z = -100;
			path.push(newpath);
			
			newpath = new NodePoint3DVertex();
			newpath.id = 2;
			newpath.parentid = 0;
			newpath.x = 100;
			newpath.y = 0;
			newpath.z = -50;
			path.push(newpath);
```

Stage 03:
&lt;wiki:gadget url="http://darkaif.googlecode.com/svn/trunk/apps/SandyPointClickMoveArray.xml" width="830" height="630" /&gt;

> This is point and click move array. The object will follow the path assign when user click on the plane mesh. This will help what ever the path is following correctly.

Stage 04:
&lt;wiki:gadget url="http://darkaif.googlecode.com/svn/trunk/apps/SandyPathClickMoveArrayOrder.xml" width="830" height="630" /&gt;

> Currently working on the star path and array path. It will follow the path in the array. It goes my square units. 32x32.
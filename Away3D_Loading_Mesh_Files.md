Object files:
> You can replace the name files. It should work.

  * http://darkaif.googlecode.com/svn/trunk/darkaif/engine3d/away3d/Away3DMeshASE.as -ASE
  * http://darkaif.googlecode.com/svn/trunk/darkaif/engine3d/away3d/Away3DMeshDAE.as -DAE
  * http://darkaif.googlecode.com/svn/trunk/darkaif/engine3d/away3d/Away3DMeshOBJ.as -OBJ
    * -- It required two files from .obj, .mtl.
  * http://darkaif.googlecode.com/svn/trunk/darkaif/engine3d/away3d/Away3DMesh3DS.as -3DS
  * http://darkaif.googlecode.com/svn/trunk/darkaif/engine3d/away3d/Away3DMeshKMZ.as -KMZ
  * http://darkaif.googlecode.com/svn/trunk/darkaif/engine3d/away3d/Away3DMeshMD2.as -MD2


Clone Mesh:
  * http://code.google.com/p/darkaif/source/browse/trunk/darkaif/engine3d/away3d/Away3DMesh3DSClone.as 3DS (Working)
  * http://code.google.com/p/darkaif/source/browse/trunk/darkaif/engine3d/away3d/Away3DMeshASEClone.as ASE (working)
  * http://code.google.com/p/darkaif/source/browse/trunk/darkaif/engine3d/away3d/Away3DMeshDAEClone.as KMZ (Working)
  * http://code.google.com/p/darkaif/source/browse/trunk/darkaif/engine3d/away3d/Away3DMeshMD2Clone.as MD2 (working)
  * http://code.google.com/p/darkaif/source/browse/trunk/darkaif/engine3d/away3d/Away3DMeshOBJClone.as OBJ (Working)

> You need event trigger when the object finish loading to able to clone them. There are two methods. There are always different in loading them into the scene.

Method 1:
```
var objfile:Object3DLoader;
objfile = Obj.load();
objfile.addOnSuccess(objOnSuccess);
view.scene.addChild(objfile);
			
function objOnSuccess(e:Event):void {
   trace("SUCCESS");
   var objectmesh:Object3D = objfile.handle.clone() as Object3D;
   objectmesh.x = -3;
   view.scene.addChild(objectmesh);
}
```
This works on few object files. The listener doesn't work most the time.

Method 2:
```
var objfile:Object3DLoader;
objfile = Obj.load();
objfile.addEventListener(LoaderEvent.LOAD_SUCCESS, objOnSuccess);
view.scene.addChild(objfile);
			
function objOnSuccess(e:Event):void {
   trace("SUCCESS");
   var objectmesh:Object3D = objfile.handle.clone() as Object3D;
   objectmesh.x = -3;
   view.scene.addChild(objectmesh);
}
```
This is more stable. For listener to able to know when the file is loaded and then clone.


&lt;wiki:gadget url="http://darkaif.googlecode.com/svn/trunk/apps/meshobjectloadfile/Away3DXmlObject.xml" width="830" height="630" /&gt;

This load multiples mesh file type for preview one object at the time in the scene.
  * http://code.google.com/p/darkaif/source/browse/trunk/darkaif/src/programs/Away3DXmlObject.as
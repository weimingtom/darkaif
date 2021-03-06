﻿package darknet.engine.away3d.entity 
{
	import away3d.core.base.Object3D;
	import away3d.events.LoaderEvent;
	import away3d.loaders.Object3DLoader;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class A3DMesh extends A3DEntity
	{
		public var mesh:Object3DLoader;
		public var model:Object3D;
		
		public function A3DMesh() 
		{
			//mesh.addEventListener(LoaderEvent.LOAD_SUCCESS,objOnSuccess);
		}
		
		public function loadmesh(shapemesh:Object3DLoader):void {
			mesh = shapemesh;
			mesh.addEventListener(LoaderEvent.LOAD_SUCCESS,objOnSuccess);
		}
		
		public function objOnSuccess(e:LoaderEvent):void {
			meshloaded = true;
            trace("SUCCESS IN CLASS");
        }
		
	}
	
}
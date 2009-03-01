package darkaif.entities 
{
	
	//{ packages
	import darkaif.core.math.Vertex3DPoint;
	import darkaif.core.node.NodePoint3DVertex;
	import darkaif.core.node.PointNode;
	import sandy.core.scenegraph.Shape3D;
	import darkaif.core.collision.CollisionBox;
	//}
	/**
	 * ...
	 * @author Darknet
	 * Copy Rights (c) http://darkaif.googlecode.com
	 */
	
	public class ObjectBot extends SandyGameObject
	{
		//{ variables
		public var bpathcollision:Boolean = false;
		public var model:Shape3D = null;
		public var meshname:String = "";
		public var meshid:String = "";
		public var targetposition:Vertex3DPoint = new Vertex3DPoint();
		//public var boxcollision:Array = new Array();
		
		public var nodepoint:PointNode = new PointNode();
		
		public var path:Array = new Array();
		public var pathid:Array = new Array();
		public var nodepointid:int = 0;
		
		//public var bmovex:Boolean = false;
		
		//}
		
		public function ObjectBot() {
			/*
			var newpath:NodePoint3DVertex = new NodePoint3DVertex();
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
			*/
		}
		
		
		public override function update():void {
			super.update();
			model.x = posx;
			model.y = posy;
			model.z = posz;
			
			movepath();
			
			
			//trace(bpathcollision + "--");
			/*
			if (posx < Math.floor(targetposition.x)) {
				posx ++;
			}else if (posx > Math.floor(targetposition.x)) {
				posx --;
			}else {
				
			}
			
			if (posy < Math.floor(targetposition.y)) {
				posy ++;
			}else if (posy > targetposition.y) {
				posy --;
			}else {
				//trace("hello y");
			}
			
			if (posz < Math.floor(targetposition.z)) {
				posz ++;
			}else if (posz > Math.floor(targetposition.z)) {
				posz --;
			}else {
				//trace("hello z");
			}
			*/
			
		}
		
		public function movepath():void {
			
			//pathid = new Array();
			//for (var pathidno:int = 0; pathidno < path.length ; pathidno++){
			//	trace("id path:" + path[pathidno].id);
			//	pathid.push(path[pathidno].id);
			//}
			
			//pathid.sort();
			
			path.sortOn("id", Array.NUMERIC );
			//var numberpath:int = path.length-1;
			if (path.length > 0){
				//nodepointid = path[path.length - 1].id; //high number
				nodepointid = path[0].id; //low number
			}
			//trace("Hight:"+high);
			for (var pathno:int = 0; pathno < path.length ; pathno++){
				//trace("id path:" + path[pathno].id);
				if (path[pathno].id == nodepointid) {
					
					if (posx < Math.floor(path[pathno].x)) {
						posx ++;
					}else if (posx > Math.floor(path[pathno].x)) {
						posx --;
					}else {
						
					}
					
					if (posy < Math.floor(path[pathno].y)) {
						posy ++;
					}else if (posy > path[pathno].y) {
						posy --;
					}else {
						//trace("hello y");
					}		
					
					if (posz < Math.floor(path[pathno].z)) {
						posz ++;
					}else if (posz > Math.floor(path[pathno].z)) {
						posz --;
					}else {
						//trace("hello z");
					}
					
					if ((posx == Math.floor(path[pathno].x)) &&(posy == Math.floor(path[pathno].y)) &&(posz == Math.floor(path[pathno].z))){
						//trace("finish this node point"+ pathno);
						path.splice(pathno, 1);
					}
				}
			}
		}
		
	}
	
}
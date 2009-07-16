package gearunits.away3d.entity.spacecraft 
{
	import away3d.materials.WireframeMaterial;
	import away3d.primitives.Cube;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import gearunits.away3d.entity.AEntityPoint3D;
	import gearunits.models.AMeshSpacecraftFedCarrier;
	import gearunits.models.AMeshSpacecraftFedCarrier_Box;
	import gearunits.models.AMeshSpacecraftFedMedCarrier;
	
	/**
	 * ...
	 * @author Darknet
	 */
	public class ASpaceshipFedCarrier extends ASpaceshipCarrier
	{
		public static const NAME:String = 'FedCarrier';
		public static const TYPE:String = 'Spaceship';
		public var cube:Cube = new Cube({height:32,width:32,depth:32})
		
		public function ASpaceshipFedCarrier() 
		{
			
			name = 'FedCarrier';
			var matwire:WireframeMaterial = new WireframeMaterial(0x999999);
			mesh = new AMeshSpacecraftFedCarrier();
			//mesh.material = matwire;
			//mesh = new AMeshSpacecraftFedMedCarrier();
			collisionmesh = new AMeshSpacecraftFedCarrier_Box();
			
			cube.x = collisionmesh.vertices[0].x;
			cube.y = collisionmesh.vertices[0].y;
			cube.z = collisionmesh.vertices[0].z;
			
			view.scene.addChild(cube);
			//view.scene.addChild(collisionmesh);
			
			//trace(mesh.maxX + ':' + mesh.maxZ);
			setbox(50,150,150);
			TurnSpeed = 5;
			movespeed = 5;
			spawntime = 60;
			
			var pointentity:AEntityPoint3D;
			pointentity = new AEntityPoint3D();
			pointentity.bexit = true;
			pointentity.z = 160;
			entityPoint.push(pointentity);
			
			//mesh.debugbb = true;
			//trace(mesh.debugBoundingBox);
		}
		
		override public function update():void {
			super.update();
			//trace(angle);
			/*
			if (mesh != null) {
				collisionmesh.rotationY = angle;
			}
			
			var m:Matrix3D = new Matrix3D();
			m.position = new Vector3D(collisionmesh.vertices[0].x, collisionmesh.vertices[0].y, collisionmesh.vertices[0].z);
			m.appendRotation(angle, new Vector3D(0, 1, 0));
			cube.x = x + m.position.x;
			cube.y = y + m.position.y;
			cube.z = z + m.position.z;
			*/
			
			//cube.x = x + entityPoint[0].x;
			//cube.y = y + entityPoint[0].y;
			//cube.z = z + entityPoint[0].z;
			
			if(entityPoint.length){
				for (var ep:int = 0; ep < entityPoint.length; ep++ ) {
					var m:Matrix3D = new Matrix3D();
					m.position = new Vector3D(entityPoint[ep].x, entityPoint[ep].y,entityPoint[ep].z)
					//m.appendTranslation(x, y, z);
					m.appendRotation(angle, new Vector3D(0, 1, 0));
					//m.appendTranslation(-(x), -(y), -(z));
					cube.x =x+ m.position.x;
					cube.y =y+ m.position.y;
					cube.z =z+ m.position.z;
				}
			}
		}
		
	}
	
}
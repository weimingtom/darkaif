package gearunits.away3d.entity.spacecraft 
{
	//{
	import away3d.materials.WireframeMaterial;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import gearunits.away3d.entity.AEntityPoint3D;
	import gearunits.away3d.entity.weapon.AWeapon;
	import gearunits.away3d.entity.weapon.AWeaponBaseRocket;
	import gearunits.away3d.entity.weapon.AWeaponPanelRocket;
	import gearunits.away3d.entity.weapon.AWeaponSpaceshipBaseTurret;
	import gearunits.models.AMeshSpacecraftFedBattleship;
	import gearunits.models.AMeshSpacecraftFedBattleship_Box;
	import gearunits.models.AMeshSpacecraftFedMedCarrier;
	//}
	
	
	/**
	 * ...
	 * @author Darknet
	 */
	
	public class ASpaceshipFedBattleship extends ASpaceshipBattleship
	{
		public static const NAME:String = 'FedBattleship';
		public static const TYPE:String = 'Spaceship';
		
		public function ASpaceshipFedBattleship() 
		{
			
			name = 'FedCarrier';
			var matwire:WireframeMaterial = new WireframeMaterial(0x999999);
			mesh = new AMeshSpacecraftFedBattleship();
			mesh.name = name + '_' + id;
			detectrange = 128;
			//mesh.material = matwire;
			//mesh = new AMeshSpacecraftFedMedCarrier();
			collisionmesh = new AMeshSpacecraftFedBattleship_Box();
			
			//view.scene.addChild(collisionmesh);
			
			//trace(mesh.maxX + ':' + mesh.maxZ);
			setbox(50,150,150);//set bounding box
			TurnSpeed = 5;//set ship turn speed
			movespeed = 5;//set ship speed
			spawntime = 60;//set spawn time
			
			var weap:AWeapon;
			weap = new AWeaponSpaceshipBaseTurret();
			weap.y = 64;
			weap.z = 96;
			weap.bbot = true;
			weap.bturret = true;
			view.scene.addChild(weap.mesh);
			weapon.push(weap);
			
			/*
			weap = new AWeaponSpaceshipBaseTurret();
			weap.y = 64;
			weap.z = 0;
			weap.bbot = true;
			weap.rotation.y = 270;
			view.scene.addChild(weap.mesh);
			weapon.push(weap);
			*/
			
			weap = new AWeaponBaseRocket();
			weap.y = 64;
			weap.z = 0;
			weap.bbot = true;
			weap.rotation.y = 270;
			view.scene.addChild(weap.mesh);
			weapon.push(weap);
			
			weap = new AWeaponPanelRocket();
			weap.x = -42;
			weap.y = 0;
			weap.z = 0;
			weap.bbot = true;
			weap.rotation.y = 270;
			view.scene.addChild(weap.mesh);
			weapon.push(weap);
		}
		
		override public function update():void {
			super.update();
			
		}
		
	}
	
}
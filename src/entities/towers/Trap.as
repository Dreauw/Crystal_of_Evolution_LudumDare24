package entities.towers {
	import entities.enemies.EnemyBase;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import utils.Resource;

	public class Trap extends TowerBase {
		public static var price:uint = 50;
		public function Trap(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.TRAP_2);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			power = 50;
			reloadTime = 6;
			shootDistance = 20;
		}
		
		override public function update():void {
			super.update();
			if (!canFire) {
				world.remove(this);
			}
		}
		
		static public function getMask():Hitbox {
			return new Hitbox(19, 8, 0, 40);
		}
		
		static public function getDescription():String {
			return "Huge dammage but only one use\nPrice : "+Trap.price.toString()+"PO";
		}
		
	}

}
package entities.towers {
	import entities.enemies.EnemyBase;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.masks.Masklist;
	import utils.Resource;

	public class SlowTower3 extends TowerBase {
		public static var price:uint = 70;
		public function SlowTower3(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.SLOW_TOWER_3);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			reloadTime = 0.4;
			power = 3;
			speedBoost = -30;
			shootDistance = 30;
		}
		
		static public function getMask():Hitbox {
			return new Hitbox(20, 41, 0, 0);
		}
		
		static public function getDescription():String {
			return "Slow ennemies\nPrice : "+SlowTower3.price.toString()+"PO";
		}
	}
}
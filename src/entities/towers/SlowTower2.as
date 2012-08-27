package entities.towers {
	import entities.enemies.EnemyBase;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.masks.Masklist;
	import utils.Resource;

	public class SlowTower2 extends TowerBase {
		public static var price:uint = 50;
		public function SlowTower2(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.SLOW_TOWER_2);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			reloadTime = 0.5;
			power = 1;
			speedBoost = -30;
			shootDistance = 25;
		}
		
		static public function getMask():Hitbox {
			return new Hitbox(22, 46, 0, 0);
		}
		
		static public function getDescription():String {
			return "Slow ennemies\nPrice : "+SlowTower2.price.toString()+"PO";
		}
	}
}
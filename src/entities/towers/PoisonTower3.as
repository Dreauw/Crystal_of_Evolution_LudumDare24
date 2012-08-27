package entities.towers {
	import entities.enemies.EnemyBase;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.masks.Masklist;
	import utils.Resource;

	public class PoisonTower3 extends TowerBase {
		public static var price:uint = 100;
		public function PoisonTower3(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.POISON_TOWER_3);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			reloadTime = 1;
			poisonPower = 30;
			effectDuration = 2;
			shootDistance = 30;
		}
		
		static public function getMask():Hitbox {
			return new Hitbox(22, 45, 0, 0);
		}
		
		static public function getDescription():String {
			return "Poison ennemy\nPrice : "+PoisonTower3.price.toString()+"PO";
		}
	}
}
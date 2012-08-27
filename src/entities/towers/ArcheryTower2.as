package entities.towers {
	import entities.enemies.EnemyBase;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Hitbox;
	import net.flashpunk.masks.Masklist;
	import utils.Resource;

	public class ArcheryTower2 extends TowerBase {
		public static var price:uint = 30;
		public function ArcheryTower2(x:Number, y:Number) {
			super(x, y);
			graphic = new Image(Resource.ARCHERY_TOWER_2);
			mask = getMask();
			orealX = (graphic as Image).width / 2;
			orealY = (graphic as Image).height / 2;
			reloadTime = 0.3;
			power = 2;
			shootDistance = 30;
		}
		
		static public function getMask():Hitbox {
			return new Hitbox(22, 41, 0, 0);
		}
		
		static public function getDescription():String {
			return "Fast but low dammage\nPrice : "+ArcheryTower2.price.toString()+"PO";
		}
	}
}